import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(home: WebViewExample()));

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  WebViewController _myController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView example'),
      ),
      body: WebView(
        initialUrl: "https://www.google.com/",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
          _myController = webViewController;
//            _myController.evaluateJavascript("document.getElementsByClassName(\"zGVn2e\")[0].style.display='none';");
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
          _myController.evaluateJavascript(
              "document.getElementsByClassName(\"zGVn2e\")[0].style.display='none';");
        },
      ),
    );
  }
}
