"""HTTP Clipboard Server with history endpoints and CORS support."""

import json
import os
import re
import socketserver
from http.server import BaseHTTPRequestHandler, HTTPServer
from typing import Optional, Dict, Any
from urllib.parse import urlparse

from systems.clipboard.history import ClipboardHistory, ClipboardEntry


class ClipboardHandler(BaseHTTPRequestHandler):
    """HTTP request handler for clipboard operations."""

    # Class-level history shared across all requests
    history: ClipboardHistory = None
    persistence_path: str = "/tmp/geometry_os/clipboard/history.json"

    def log_message(self, format, *args):
        """Override to suppress default logging (or customize)."""
        pass  # Silent by default

    def _send_json(self, data: Dict[str, Any], status: int = 200):
        """Send JSON response with CORS headers."""
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, DELETE, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()
        self.wfile.write(json.dumps(data).encode())

    def _parse_path(self) -> tuple:
        """Parse URL path into components."""
        parsed = urlparse(self.path)
        path = parsed.path.rstrip("/")
        return path

    def _load_history(self):
        """Load history from persistence file."""
        if ClipboardHandler.history is not None:
            return

        ClipboardHandler.history = ClipboardHistory()

        if os.path.exists(self.persistence_path):
            try:
                with open(self.persistence_path, "r") as f:
                    json_str = f.read()
                    if json_str.strip():
                        ClipboardHandler.history = ClipboardHistory.from_json(json_str)
            except Exception:
                # If load fails, start with empty history
                ClipboardHandler.history = ClipboardHistory()

    def _persist(self):
        """Save history to persistence file."""
        os.makedirs(os.path.dirname(self.persistence_path), exist_ok=True)
        with open(self.persistence_path, "w") as f:
            f.write(ClipboardHandler.history.to_json())

    def do_OPTIONS(self):
        """Handle CORS preflight requests."""
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, DELETE, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_GET(self):
        """Handle GET requests."""
        self._load_history()
        path = self._parse_path()

        # GET /clipboard - latest entry
        if path == "/clipboard":
            latest = self.history.get_latest()
            if latest:
                self._send_json({
                    "status": "ok",
                    "entry": latest.to_dict()
                })
            else:
                self._send_json({
                    "status": "empty",
                    "entry": None
                })
            return

        # GET /clipboard/history - all entries
        if path == "/clipboard/history":
            entries = self.history.get_all()
            self._send_json({
                "status": "ok",
                "entries": [e.to_dict() for e in entries],
                "count": len(entries)
            })
            return

        # GET /clipboard/history/N - last N entries
        match = re.match(r"^/clipboard/history/(\d+)$", path)
        if match:
            limit = int(match.group(1))
            entries = self.history.get_all()
            limited = entries[-limit:] if limit < len(entries) else entries
            self._send_json({
                "status": "ok",
                "entries": [e.to_dict() for e in limited],
                "count": len(limited)
            })
            return

        # GET /clipboard/since/<id>
        match = re.match(r"^/clipboard/since/([a-f0-9]+)$", path)
        if match:
            entry_id = match.group(1)
            entries = self.history.get_since(entry_id)
            self._send_json({
                "status": "ok",
                "entries": [e.to_dict() for e in entries],
                "count": len(entries)
            })
            return

        # GET /clipboard/entry/<id>
        match = re.match(r"^/clipboard/entry/([a-f0-9]+)$", path)
        if match:
            entry_id = match.group(1)
            entry = self.history.get_by_id(entry_id)
            if entry:
                self._send_json({
                    "status": "ok",
                    "entry": entry.to_dict()
                })
            else:
                self._send_json({
                    "status": "not_found",
                    "entry": None
                })
            return

        # Unknown path
        self._send_json({"status": "error", "message": "Not found"}, 404)

    def do_POST(self):
        """Handle POST requests."""
        self._load_history()
        path = self._parse_path()

        # POST /clipboard - add new entry
        if path == "/clipboard":
            try:
                content_length = int(self.headers.get("Content-Length", 0))
                body = self.rfile.read(content_length).decode()
                data = json.loads(body)

                content = data.get("content", "")
                source = data.get("source", "unknown")
                source_ip = data.get("source_ip", self.client_address[0])

                entry = self.history.add(content, source, source_ip)
                self._persist()

                self._send_json({
                    "status": "ok",
                    "id": entry.id,
                    "entry": entry.to_dict()
                })
            except json.JSONDecodeError:
                self._send_json({"status": "error", "message": "Invalid JSON"}, 400)
            except Exception as e:
                self._send_json({"status": "error", "message": str(e)}, 500)
            return

        # Unknown path
        self._send_json({"status": "error", "message": "Not found"}, 404)

    def do_DELETE(self):
        """Handle DELETE requests."""
        self._load_history()
        path = self._parse_path()

        # DELETE /clipboard/<id>
        match = re.match(r"^/clipboard/([a-f0-9]+)$", path)
        if match:
            entry_id = match.group(1)
            if self.history.delete(entry_id):
                self._persist()
                self._send_json({"status": "deleted", "id": entry_id})
            else:
                self._send_json({"status": "not_found", "id": entry_id}, 404)
            return

        # Unknown path
        self._send_json({"status": "error", "message": "Not found"}, 404)


class ClipboardServer:
    """HTTP server for clipboard operations."""

    def __init__(self, host: str = "0.0.0.0", port: int = 8767,
                 persistence_path: str = "/tmp/geometry_os/clipboard/history.json"):
        """Initialize clipboard server.

        Args:
            host: Host address to bind to
            port: Port to listen on
            persistence_path: Path to persist clipboard history
        """
        self.host = host
        self.port = port
        self.persistence_path = persistence_path
        self._server: Optional[HTTPServer] = None

        # Configure handler with persistence path
        ClipboardHandler.persistence_path = persistence_path

    def serve_forever(self):
        """Start the server and serve requests."""
        self._server = HTTPServer((self.host, self.port), ClipboardHandler)
        self._server.serve_forever()

    def shutdown(self):
        """Shutdown the server."""
        if self._server:
            self._server.shutdown()
            self._server = None

    @property
    def server_address(self):
        """Return server address tuple."""
        return (self.host, self.port)


def main():
    """Run clipboard server as standalone."""
    import argparse

    parser = argparse.ArgumentParser(description="Clipboard HTTP Server")
    parser.add_argument("--host", default="0.0.0.0", help="Host to bind to")
    parser.add_argument("--port", type=int, default=8767, help="Port to listen on")
    parser.add_argument("--persistence", default="/tmp/geometry_os/clipboard/history.json",
                        help="Path to persist history")
    args = parser.parse_args()

    server = ClipboardServer(
        host=args.host,
        port=args.port,
        persistence_path=args.persistence
    )

    print(f"Clipboard server running on http://{args.host}:{args.port}")
    print(f"Persistence: {args.persistence}")

    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\nShutting down...")
        server.shutdown()


if __name__ == "__main__":
    main()
