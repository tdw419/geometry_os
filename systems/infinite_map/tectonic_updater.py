"""
Tectonic Updater: Connects FileWatcher to GravityEngine.

End-to-end integration: file event → mass delta → gravity update.
Makes the Tectonic map "alive" - files drift toward you as you use them.
"""

import threading
import time
from typing import Optional
from pathlib import Path

from .gravity_engine import GravityEngine
from .file_watcher import FileWatcher, FileEvent
from .mass_integrator import MassIntegrator


class TectonicUpdater:
    """
    Connects file system events to gravity engine updates.

    Pipeline:
    1. FileWatcher detects file changes
    2. MassIntegrator converts events to mass deltas
    3. GravityEngine updates orb masses
    4. Files drift in real-time on the Glass Box
    """

    def __init__(
        self,
        gravity_engine: GravityEngine,
        watch_path: str,
        decay_interval: float = 5.0
    ):
        """
        Initialize the Tectonic updater.

        Args:
            gravity_engine: The GravityEngine to update
            watch_path: Directory path to watch for changes
            decay_interval: Seconds between mass decay cycles
        """
        self.gravity_engine = gravity_engine
        self.watch_path = watch_path
        self.decay_interval = decay_interval

        self._watcher = FileWatcher(watch_path)
        self._integrator = MassIntegrator()
        self._running = False
        self._decay_thread: Optional[threading.Thread] = None

    def _on_file_event(self, event: FileEvent):
        """Handle file events from the watcher."""
        # Process event to get mass delta
        delta = self._integrator.process_event(event)

        # Update gravity engine
        self.gravity_engine.update_mass(delta.file_path, delta.delta_mass)

    def _decay_loop(self):
        """Periodically apply mass decay."""
        while self._running:
            time.sleep(self.decay_interval)
            if self._running:
                self._integrator.apply_decay()
                # Sync masses to gravity engine
                for path, mass in self._integrator.get_all_masses().items():
                    self.gravity_engine.set_mass(path, mass)

    def start(self):
        """Start watching files and decay loop."""
        if self._running:
            return

        self._running = True
        self._watcher.set_callback(self._on_file_event)
        self._watcher.start()

        # Start decay thread
        self._decay_thread = threading.Thread(target=self._decay_loop, daemon=True)
        self._decay_thread.start()

    def stop(self):
        """Stop watching files and decay loop."""
        if not self._running:
            return

        self._running = False
        self._watcher.stop()

        if self._decay_thread:
            self._decay_thread.join(timeout=1.0)
            self._decay_thread = None

    def is_running(self) -> bool:
        """Check if the updater is running."""
        return self._running

    def __enter__(self):
        """Context manager entry."""
        self.start()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """Context manager exit."""
        self.stop()
        return False
