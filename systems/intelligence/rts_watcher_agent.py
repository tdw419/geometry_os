#!/usr/bin/env python3
"""
RtsWatcherAgent - RTS Snapshot Ingestion Agent

Watches a directory for .rts.png files, parses metadata, and ingests
snapshots into WordPress via the Geometry OS API.

Phase 1: Core functionality with heartbeat support
Phase 2: Improved error handling with proper logging
"""

import argparse
import os
import sys
import json
import signal
import time
import logging
import requests
import glob
from datetime import datetime
from pathlib import Path
from typing import Optional, List, Dict, Any

__version__ = "1.0.1"

# Configure logging with severity levels
logging.basicConfig(
    level=logging.INFO,
    format='[%(levelname)s] %(asctime)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger(__name__)


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
        heartbeat_path: Optional[str] = None,
        log_level: str = "INFO"
    ):
        self.wp_url = wp_url or self.WP_URL
        self.api_endpoint = f"{self.wp_url}/invoke"
        self.watch_dir = watch_dir
        self.poll_interval = poll_interval or self.POLL_INTERVAL

        # Heartbeat tracking
        self.heartbeat_path = heartbeat_path or ".geometry/rts_watcher_heartbeat.json"
        self._start_time: Optional[datetime] = None
        self._files_ingested: int = 0
        self._files_skipped: int = 0
        self._errors: int = 0
        self._running: bool = False

        # Configure log level
        self._set_log_level(log_level)

    def _set_log_level(self, level: str) -> None:
        """Set logging level from string."""
        level_map = {
            "DEBUG": logging.DEBUG,
            "INFO": logging.INFO,
            "WARNING": logging.WARNING,
            "ERROR": logging.ERROR,
        }
        logger.setLevel(level_map.get(level.upper(), logging.INFO))

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
            "files_skipped": self._files_skipped,
            "errors": self._errors,
            "watch_dir": self.watch_dir,
            "wp_url": self.wp_url,
        }

        try:
            path = Path(self.heartbeat_path)
            path.parent.mkdir(parents=True, exist_ok=True)
            with open(path, 'w') as f:
                json.dump(heartbeat_data, f, indent=2)
            logger.debug(f"Heartbeat written to {self.heartbeat_path}")
        except (IOError, OSError) as e:
            logger.error(f"Failed to write heartbeat: {e}")

    def scan_and_ingest(self, directory: str = "rts_files") -> int:
        """
        Scan directory for RTS files and ingest them.

        Args:
            directory: Directory to scan for .rts.png files

        Returns:
            Number of files successfully ingested
        """
        logger.info(f"Scanning {directory} for RTS snapshots...")

        # Check if directory exists
        if not os.path.exists(directory):
            logger.warning(f"Watch directory does not exist: {directory}")
            return 0

        if not os.path.isdir(directory):
            logger.error(f"Watch path is not a directory: {directory}")
            return 0

        # Find RTS files
        try:
            rts_files = glob.glob(os.path.join(directory, "*.rts.png"))
        except Exception as e:
            logger.error(f"Error scanning directory {directory}: {e}")
            self._errors += 1
            return 0

        if not rts_files:
            logger.debug(f"No RTS files found in {directory}")
            return 0

        logger.info(f"Found {len(rts_files)} RTS file(s)")
        ingested = 0

        for rts_path in rts_files:
            try:
                result = self._ingest_file(rts_path)
                if result:
                    ingested += 1
            except Exception as e:
                logger.error(f"Unexpected error processing {rts_path}: {e}")
                self._errors += 1
                continue

        return ingested

    def _ingest_file(self, rts_path: str) -> bool:
        """
        Ingest a single RTS file.

        Args:
            rts_path: Path to the .rts.png file

        Returns:
            True if successfully ingested, False otherwise
        """
        meta_path = rts_path.replace(".rts.png", ".rts.meta.json")

        # Check for metadata file
        if not os.path.exists(meta_path):
            logger.warning(f"Metadata missing for {rts_path}, skipping")
            self._files_skipped += 1
            return False

        # Read and parse metadata
        try:
            with open(meta_path, 'r', encoding='utf-8') as f:
                meta_json = json.load(f)
        except json.JSONDecodeError as e:
            logger.error(f"Invalid JSON in metadata file {meta_path}: {e}")
            self._files_skipped += 1
            self._errors += 1
            return False
        except (IOError, OSError) as e:
            logger.error(f"Cannot read metadata file {meta_path}: {e}")
            self._files_skipped += 1
            self._errors += 1
            return False
        except UnicodeDecodeError as e:
            logger.error(f"Encoding error in metadata file {meta_path}: {e}")
            self._files_skipped += 1
            self._errors += 1
            return False

        # Generate title from filename
        title = os.path.basename(rts_path).replace(".rts.png", "").replace("_", " ").title()
        logger.info(f"Ingesting {title}...")

        # Prepare API payload
        payload = {
            "tool": "createSnapshot",
            "arguments": {
                "title": title,
                "image_path": os.path.abspath(rts_path),
                "meta_json": meta_json,
                "status": "publish"
            }
        }

        # Call WordPress API
        try:
            response = requests.post(
                self.api_endpoint,
                json=payload,
                timeout=30  # Increased timeout for file uploads
            )
            response.raise_for_status()
            result = response.json()

            if result.get("success"):
                post_id = result.get('post_id', 'unknown')
                logger.info(f"Successfully ingested: {title} (Post ID: {post_id})")
                self._files_ingested += 1
                return True
            else:
                error_msg = result.get('error', 'Unknown error')
                logger.error(f"Failed to ingest {title}: {error_msg}")
                self._files_skipped += 1
                return False

        except requests.exceptions.Timeout:
            logger.error(f"Timeout calling WordPress API for {title}")
            self._errors += 1
            return False
        except requests.exceptions.ConnectionError as e:
            logger.error(f"Connection error calling WordPress API for {title}: {e}")
            self._errors += 1
            return False
        except requests.exceptions.HTTPError as e:
            logger.error(f"HTTP error calling WordPress API for {title}: {e}")
            self._errors += 1
            return False
        except requests.exceptions.RequestException as e:
            logger.error(f"Request error calling WordPress API for {title}: {e}")
            self._errors += 1
            return False
        except json.JSONDecodeError as e:
            logger.error(f"Invalid JSON response from WordPress API for {title}: {e}")
            self._errors += 1
            return False

    def process_one_cycle(self) -> int:
        """
        Process one scanning cycle.

        Returns:
            Number of files successfully ingested
        """
        # Initialize start time on first cycle
        if self._start_time is None:
            self._start_time = datetime.utcnow()

        logger.info(f"Starting scanning cycle (watch_dir={self.watch_dir})")

        # Scan and ingest
        ingested = self.scan_and_ingest(self.watch_dir)

        # Write heartbeat
        self.write_heartbeat()

        logger.info(
            f"Cycle complete. Ingested: {ingested}, "
            f"Total: {self._files_ingested}, "
            f"Skipped: {self._files_skipped}, "
            f"Errors: {self._errors}"
        )
        return self._files_ingested

    def _handle_sigterm(self, signum, frame):
        """Handle SIGTERM signal for graceful shutdown."""
        logger.info("Received SIGTERM, shutting down gracefully...")
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

        logger.info(f"Starting RtsWatcherAgent (polling every {self.poll_interval}s)")
        logger.info(f"Watching directory: {self.watch_dir}")
        logger.info(f"WordPress API: {self.wp_url}")

        # Write initial heartbeat
        self.write_heartbeat()

        while self._running:
            try:
                self.process_one_cycle()
            except Exception as e:
                logger.error(f"Cycle error: {e}")
                self._errors += 1

            # Sleep in small increments to check for shutdown
            for _ in range(self.poll_interval):
                if not self._running:
                    break
                time.sleep(1)

        logger.info("RtsWatcherAgent stopped")
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
        "--log-level",
        choices=["DEBUG", "INFO", "WARNING", "ERROR"],
        default="INFO",
        help="Logging level (default: INFO)"
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
        poll_interval=args.poll_interval,
        heartbeat_path=heartbeat_path,
        log_level=args.log_level
    )

    if args.once:
        agent.process_one_cycle()
        sys.exit(0)
    else:
        agent.run_forever()


if __name__ == "__main__":
    main()
