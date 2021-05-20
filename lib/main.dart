import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Download'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Image.network(
            'https://bit.ly/3wdgLvc',
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.black.withAlpha(100),
                      offset: Offset.zero,
                    ),
                  ],
                ),
                child: child,
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              final totalBytes = loadingProgress?.expectedTotalBytes;
              final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
              if (totalBytes != null && bytesLoaded != null) {
                return LinearProgressIndicator(
                  value: bytesLoaded / totalBytes,
                );
              } else {
                return child;
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Could not load image'),
                  TextButton(
                    onPressed: () {
                      // TODO: empty for now
                    },
                    child: Text('Retry'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
