"""
File Watcher: Real-time file access monitoring using watchdog.

Emits FileEvent objects when files are accessed, modified, or created.
These events drive the Tectonic Gravity Engine's semantic mass updates.
"""

import threading
from collections.abc import Callable
from dataclasses import dataclass

from watchdog.events import FileSystemEvent, FileSystemEventHandler
from watchdog.observers import Observer


@dataclass
class FileEvent:
    """Represents a file system event."""
    file_path: str
    event_type: str  # "created", "modified", "accessed", "deleted"


class FileWatcher(FileSystemEventHandler):
    """
    Watches a directory for file system events.

    Uses watchdog library for cross-platform file monitoring.
    Emits FileEvent objects via callback when files change.
    """

    def __init__(self, watch_path: str):
        """
        Initialize the file watcher.

        Args:
            watch_path: Directory path to watch for changes
        """
        self.watch_path = watch_path
        self._observer: Observer | None = None
        self._running = False
        self._callback: Callable[[FileEvent], None] | None = None
        self._lock = threading.Lock()

    def set_callback(self, callback: Callable[[FileEvent], None]):
        """Set the callback function for file events."""
        with self._lock:
            self._callback = callback

    def on_modified(self, event: FileSystemEvent):
        """Handle file modification events."""
        if not event.is_directory:
            self._emit_event(event.src_path, "modified")

    def on_created(self, event: FileSystemEvent):
        """Handle file creation events."""
        if not event.is_directory:
            self._emit_event(event.src_path, "created")

    def on_deleted(self, event: FileSystemEvent):
        """Handle file deletion events."""
        if not event.is_directory:
            self._emit_event(event.src_path, "deleted")

    def _emit_event(self, file_path: str, event_type: str):
        """Emit a FileEvent to the callback."""
        with self._lock:
            if self._callback:
                event = FileEvent(file_path=file_path, event_type=event_type)
                self._callback(event)

    def start(self):
        """Start watching the directory."""
        if self._running:
            return

        self._observer = Observer()
        self._observer.schedule(self, self.watch_path, recursive=True)
        self._observer.start()
        self._running = True

    def stop(self):
        """Stop watching the directory."""
        if not self._running:
            return

        if self._observer:
            self._observer.stop()
            self._observer.join(timeout=2.0)
            self._observer = None
        self._running = False

    def __enter__(self):
        """Context manager entry - start watching."""
        self.start()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """Context manager exit - stop watching."""
        self.stop()
        return False
