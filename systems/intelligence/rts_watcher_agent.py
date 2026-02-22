#!/usr/bin/env python3
"""
RtsWatcherAgent - RTS Snapshot Ingestion Agent

Watches a directory for .rts.png files, parses metadata, and ingests
snapshots into WordPress via the Geometry OS API.

Phase 1: Core functionality with heartbeat support
"""

import argparse
import os
import sys
import json
import signal
import time
import requests
import glob
from datetime import datetime
from pathlib import Path
from typing import Optional

__version__ = "1.0.0"


class RtsWatcherAgent:
    """
    Agent that watches for RTS snapshots and ingests them into WordPress.
    """

    WP_URL: str = "http://localhost:8080/index.php?rest_route=/geometry-os/v1"
    POLL_INTERVAL: int = 30

    def __init__(
        self,
        wp_url: Optional[str] = None,
        watch_dir: str = "rts_files",
        poll_interval: Optional[int] = None,
        heartbeat_path: Optional[str] = None
    ):
        self.wp_url = wp_url or self.WP_URL
        self.api_endpoint = f"{self.wp_url}/invoke"
        self.watch_dir = watch_dir
        self.poll_interval = poll_interval or self.POLL_INTERVAL

        # Heartbeat tracking
        self.heartbeat_path = heartbeat_path or ".geometry/rts_watcher_heartbeat.json"
        self._start_time: Optional[datetime] = None
        self._files_ingested: int = 0
        self._running: bool = False

    def write_heartbeat(self) -> None:
        """
        Write heartbeat file for external monitoring.

        Writes JSON with: timestamp, pid, running, uptime_seconds, files_ingested.
        """
        uptime = 0.0
        if self._start_time:
            uptime = (datetime.utcnow() - self._start_time).total_seconds()

        heartbeat_data = {
            "timestamp": datetime.utcnow().isoformat() + "Z",
            "pid": os.getpid(),
            "running": self._start_time is not None,
            "uptime_seconds": uptime,
            "files_ingested": self._files_ingested,
        }

        try:
            path = Path(self.heartbeat_path)
            path.parent.mkdir(parents=True, exist_ok=True)
            with open(path, 'w') as f:
                json.dump(heartbeat_data, f, indent=2)
        except (IOError, OSError) as e:
            print(f"[x] Failed to write heartbeat: {e}")

    def scan_and_ingest(self, directory="rts_files"):
        print(f"[*] Scanning {directory} for RTS snapshots...")
        rts_files = glob.glob(os.path.join(directory, "*.rts.png"))
        
        for rts_path in rts_files:
            meta_path = rts_path.replace(".rts.png", ".rts.meta.json")
            if not os.path.exists(meta_path):
                print(f"[!] Metadata missing for {rts_path}, skipping.")
                continue
                
            with open(meta_path, 'r') as f:
                meta_json = json.load(f)
                
            title = os.path.basename(rts_path).replace(".rts.png", "").replace("_", " ").title()
            
            print(f"[*] Ingesting {title}...")
            
            payload = {
                "tool": "createSnapshot",
                "arguments": {
                    "title": title,
                    "image_path": os.path.abspath(rts_path),
                    "meta_json": meta_json,
                    "status": "publish"
                }
            }
            
            try:
                response = requests.post(self.api_endpoint, json=payload, timeout=10)
                result = response.json()

                if result.get("success"):
                    print(f"[+] Successfully ingested: {title} (Post ID: {result['post_id']})")
                    self._files_ingested += 1
                else:
                    print(f"[x] Failed to ingest {title}: {result.get('error')}")
            except Exception as e:
                print(f"[x] Error calling WordPress API: {e}")

    def process_one_cycle(self) -> int:
        """
        Process one scanning cycle.

        Returns:
            Number of files processed
        """
        # Initialize start time on first cycle
        if self._start_time is None:
            self._start_time = datetime.utcnow()

        print(f"[*] Starting scanning cycle (watch_dir={self.watch_dir})")

        # Scan and ingest
        self.scan_and_ingest(self.watch_dir)

        # Write heartbeat
        self.write_heartbeat()

        print(f"[*] Cycle complete. Total files ingested: {self._files_ingested}")
        return self._files_ingested

    def _handle_sigterm(self, signum, frame):
        """Handle SIGTERM signal for graceful shutdown."""
        print("[*] Received SIGTERM, shutting down gracefully...")
        self._running = False

    def run_forever(self) -> None:
        """
        Run agent in continuous polling loop.

        This method blocks forever until interrupted via SIGTERM or SIGINT.
        """
        # Set up signal handlers
        signal.signal(signal.SIGTERM, self._handle_sigterm)
        signal.signal(signal.SIGINT, self._handle_sigterm)

        self._running = True
        self._start_time = datetime.utcnow()

        print(f"[*] Starting RtsWatcherAgent (polling every {self.poll_interval}s)")
        print(f"[*] Watching directory: {self.watch_dir}")

        # Write initial heartbeat
        self.write_heartbeat()

        while self._running:
            try:
                self.process_one_cycle()
            except Exception as e:
                print(f"[x] Cycle error: {e}")

            # Sleep in small increments to check for shutdown
            for _ in range(self.poll_interval):
                if not self._running:
                    break
                time.sleep(1)

        print("[*] RtsWatcherAgent stopped")
        self.write_heartbeat()

def main():
    """Entry point for running RtsWatcherAgent with CLI arguments."""
    parser = argparse.ArgumentParser(
        description="RtsWatcherAgent - RTS Snapshot Ingestion Agent"
    )
    parser.add_argument(
        "--wp-url",
        default="http://localhost:8080/index.php?rest_route=/geometry-os/v1",
        help="WordPress API URL (default: http://localhost:8080/index.php?rest_route=/geometry-os/v1)"
    )
    parser.add_argument(
        "--watch-dir",
        default="rts_files",
        help="Directory to watch for .rts.png files (default: rts_files)"
    )
    parser.add_argument(
        "--poll-interval",
        type=int,
        default=30,
        help="Polling interval in seconds for continuous mode (default: 30)"
    )
    parser.add_argument(
        "--heartbeat",
        default="",
        help="Path to heartbeat file (default: .geometry/rts_watcher_heartbeat.json)"
    )
    parser.add_argument(
        "--once",
        action="store_true",
        help="Run one scan cycle and exit"
    )
    parser.add_argument(
        "--version",
        action="version",
        version=f"RtsWatcherAgent {__version__}"
    )

    args = parser.parse_args()

    # Use default heartbeat path if not specified
    heartbeat_path = args.heartbeat if args.heartbeat else None

    agent = RtsWatcherAgent(
        wp_url=args.wp_url,
        watch_dir=args.watch_dir,
        heartbeat_path=heartbeat_path
    )

    if args.once:
        agent.scan_and_ingest(args.watch_dir)
        agent.write_heartbeat()
        sys.exit(0)
    else:
        # Placeholder for continuous mode (Task 1.3)
        print("[*] Continuous mode not yet implemented. Use --once for single cycle.")
        sys.exit(1)


if __name__ == "__main__":
    main()
