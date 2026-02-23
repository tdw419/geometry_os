"""CLI tool for clipboard operations."""

import argparse
import json
import sys
import time
from datetime import datetime
from typing import Optional, Dict, Any, List

import urllib.request
import urllib.error


class ClipboardCLI:
    """Command-line interface for clipboard operations."""

    def __init__(self, base_url: str = "http://localhost:8767"):
        """Initialize CLI with server URL.

        Args:
            base_url: Base URL of the clipboard server
        """
        self.base_url = base_url.rstrip("/")

    def _request(self, method: str, path: str, data: Optional[Dict] = None) -> Dict[str, Any]:
        """Make HTTP request to server.

        Args:
            method: HTTP method (GET, POST, DELETE)
            path: API path
            data: Optional JSON data for POST

        Returns:
            Response JSON as dict
        """
        url = f"{self.base_url}{path}"
        headers = {"Content-Type": "application/json"}

        body = None
        if data:
            body = json.dumps(data).encode()

        req = urllib.request.Request(url, data=body, headers=headers, method=method)

        try:
            with urllib.request.urlopen(req, timeout=10) as response:
                return json.loads(response.read().decode())
        except urllib.error.HTTPError as e:
            return {"status": "error", "message": str(e), "code": e.code}
        except urllib.error.URLError as e:
            return {"status": "error", "message": f"Connection failed: {e.reason}"}
        except Exception as e:
            return {"status": "error", "message": str(e)}

    def format_output(self, entry: Optional[Dict[str, Any]]) -> str:
        """Format a clipboard entry for display.

        Args:
            entry: Entry dict or None

        Returns:
            Formatted string
        """
        if not entry:
            return "Clipboard is empty"

        timestamp = entry.get("timestamp", 0)
        dt = datetime.fromtimestamp(timestamp).strftime("%Y-%m-%d %H:%M:%S")

        lines = [
            f"ID: {entry.get('id', 'N/A')}",
            f"Source: {entry.get('source', 'unknown')} ({entry.get('source_ip', 'N/A')})",
            f"Time: {dt}",
            f"Content:",
            f"  {entry.get('content', '')}"
        ]
        return "\n".join(lines)

    def format_entries(self, entries: List[Dict[str, Any]]) -> str:
        """Format multiple entries for display.

        Args:
            entries: List of entry dicts

        Returns:
            Formatted string
        """
        if not entries:
            return "No entries found"

        lines = [f"Found {len(entries)} entries:", ""]
        for entry in entries:
            timestamp = entry.get("timestamp", 0)
            dt = datetime.fromtimestamp(timestamp).strftime("%Y-%m-%d %H:%M:%S")
            content_preview = entry.get("content", "")[:50]
            if len(entry.get("content", "")) > 50:
                content_preview += "..."

            lines.append(f"[{entry.get('id', 'N/A')}] {dt}")
            lines.append(f"  Source: {entry.get('source', 'unknown')}")
            lines.append(f"  Content: {content_preview}")
            lines.append("")

        return "\n".join(lines)

    def get(self) -> str:
        """Get the latest clipboard entry.

        Returns:
            Formatted entry string
        """
        result = self._request("GET", "/clipboard")

        if result.get("status") == "error":
            return f"Error: {result.get('message', 'Unknown error')}"

        entry = result.get("entry")
        return self.format_output(entry)

    def post(self, content: str, source: str = "cli") -> str:
        """Post content to clipboard.

        Args:
            content: Content to post
            source: Source identifier

        Returns:
            Result message
        """
        import socket
        hostname = socket.gethostname()

        result = self._request("POST", "/clipboard", {
            "content": content,
            "source": source,
            "source_ip": hostname  # CLI uses hostname as identifier
        })

        if result.get("status") == "error":
            return f"Error: {result.get('message', 'Unknown error')}"

        entry_id = result.get("id", "N/A")
        return f"Posted successfully (ID: {entry_id})"

    def history(self, limit: int = 10) -> str:
        """Show clipboard history.

        Args:
            limit: Maximum number of entries to show

        Returns:
            Formatted history string
        """
        if limit <= 0:
            path = "/clipboard/history"
        else:
            path = f"/clipboard/history/{limit}"

        result = self._request("GET", path)

        if result.get("status") == "error":
            return f"Error: {result.get('message', 'Unknown error')}"

        entries = result.get("entries", [])
        return self.format_entries(entries)

    def poll(self, since_id: Optional[str] = None, interval: float = 2.0,
             once: bool = False) -> str:
        """Poll for new clipboard entries.

        Args:
            since_id: Entry ID to start polling from (None = latest)
            interval: Polling interval in seconds
            once: If True, poll once and return; if False, poll continuously

        Returns:
            New entries (if once=True) or runs forever printing new entries
        """
        # If no since_id, get current latest
        if not since_id:
            result = self._request("GET", "/clipboard")
            if result.get("status") == "ok" and result.get("entry"):
                since_id = result["entry"]["id"]
                print(f"Watching from entry {since_id}...")
            else:
                since_id = "0"  # Will return all entries

        if once:
            # Single poll
            result = self._request("GET", f"/clipboard/since/{since_id}")
            if result.get("status") == "error":
                return f"Error: {result.get('message', 'Unknown error')}"

            entries = result.get("entries", [])
            if not entries:
                return "No new entries"

            return self.format_entries(entries)

        # Continuous polling
        print(f"Polling for new entries (Ctrl+C to stop)...")
        last_id = since_id

        try:
            while True:
                result = self._request("GET", f"/clipboard/since/{last_id}")

                if result.get("status") == "ok":
                    entries = result.get("entries", [])
                    for entry in entries:
                        print(self.format_output(entry))
                        print("-" * 40)
                        last_id = entry["id"]

                time.sleep(interval)
        except KeyboardInterrupt:
            return "\nPolling stopped"

    def delete(self, entry_id: str) -> str:
        """Delete an entry by ID.

        Args:
            entry_id: ID of entry to delete

        Returns:
            Result message
        """
        result = self._request("DELETE", f"/clipboard/{entry_id}")

        if result.get("status") == "error":
            return f"Error: {result.get('message', 'Unknown error')}"

        if result.get("status") == "not_found":
            return f"Entry {entry_id} not found"

        return f"Deleted entry {entry_id}"


def main():
    """Main entry point for CLI."""
    parser = argparse.ArgumentParser(
        prog="geo-clip",
        description="Clipboard history CLI tool"
    )
    parser.add_argument(
        "--url", "-u",
        default="http://localhost:8767",
        help="Clipboard server URL (default: http://localhost:8767)"
    )

    subparsers = parser.add_subparsers(dest="command", help="Commands")

    # get command
    get_parser = subparsers.add_parser("get", help="Get latest clipboard entry")
    get_parser.set_defaults(func=lambda args: ClipboardCLI(args.url).get())

    # post command
    post_parser = subparsers.add_parser("post", help="Post content to clipboard")
    post_parser.add_argument("content", help="Content to post")
    post_parser.add_argument("--source", "-s", default="cli", help="Source identifier")
    post_parser.set_defaults(func=lambda args: ClipboardCLI(args.url).post(
        args.content, args.source
    ))

    # history command
    history_parser = subparsers.add_parser("history", help="Show clipboard history")
    history_parser.add_argument("-n", "--count", type=int, default=10,
                                help="Number of entries to show (default: 10)")
    history_parser.set_defaults(func=lambda args: ClipboardCLI(args.url).history(
        args.count
    ))

    # poll command
    poll_parser = subparsers.add_parser("poll", help="Poll for new entries")
    poll_parser.add_argument("--since", "-s", help="Entry ID to start from")
    poll_parser.add_argument("--interval", "-i", type=float, default=2.0,
                             help="Polling interval in seconds (default: 2.0)")
    poll_parser.add_argument("--once", action="store_true",
                             help="Poll once and exit")
    poll_parser.set_defaults(func=lambda args: ClipboardCLI(args.url).poll(
        since_id=args.since,
        interval=args.interval,
        once=args.once
    ))

    # delete command
    delete_parser = subparsers.add_parser("delete", help="Delete an entry")
    delete_parser.add_argument("id", help="Entry ID to delete")
    delete_parser.set_defaults(func=lambda args: ClipboardCLI(args.url).delete(args.id))

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        sys.exit(1)

    result = args.func(args)
    print(result)


if __name__ == "__main__":
    main()
