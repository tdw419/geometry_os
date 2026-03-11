"""
Saccade Controller: Manages the "Mind's Eye" attention queue.

Listen for TECTONIC_RIPPLE events and queues camera saccades to focus
on energetic regions of the map.
"""

import logging
import threading
import time
from dataclasses import dataclass
from typing import Any

logger = logging.getLogger(__name__)

@dataclass
class SaccadeTarget:
    x: float
    y: float
    z: float
    energy: float
    timestamp: float

class SaccadeController:
    """
    Orchestrates camera movements to follow physical events.
    
    Uses a FIFO queue to sequence focus shifts, ensuring smooth
    transitions when multiple files change.
    """

    def __init__(self, visual_bridge: Any | None = None):
        self.visual_bridge = visual_bridge
        self.queue: list[SaccadeTarget] = []
        self.max_queue_size = 5
        self._lock = threading.Lock()

        # Saccade Parameters
        self.min_energy_threshold = 1000.0
        self.saccade_cooldown = 2.0 # Seconds between focus shifts
        self.last_saccade_time = 0.0

    def request_saccade(self, x: float, y: float, z: float, force: float):
        """
        Request a focus shift to a specific location.
        """
        energy = abs(force)

        if energy < self.min_energy_threshold:
            return

        with self._lock:
            # Check if target already in queue (avoid duplicate ripples)
            for target in self.queue:
                dist_sq = (target.x - x)**2 + (target.y - y)**2
                if dist_sq < 100 and target.energy >= energy:
                    return # Already focusing near here

            target = SaccadeTarget(x, y, z, energy, time.time())
            self.queue.append(target)

            # Trim queue if too large
            if len(self.queue) > self.max_queue_size:
                self.queue.pop(0)

            logger.info(f"🎯 Saccade queued: ({x:.1f}, {y:.1f}) energy={energy:.1f}")

    def update(self):
        """
        Process the saccade queue and emit camera commands.
        """
        now = time.time()

        if now - self.last_saccade_time < self.saccade_cooldown:
            return

        with self._lock:
            if not self.queue:
                return

            # Take the most energetic target from the queue
            self.queue.sort(key=lambda t: t.energy, reverse=True)
            target = self.queue.pop(0)

            self.last_saccade_time = now

            if self.visual_bridge:
                logger.info(f"👁️  Executing Saccade to ({target.x:.1f}, {target.y:.1f})")
                self.visual_bridge.emit_camera_saccade(
                    target.x, target.y, target.z,
                    duration_ms=1000 # 1 second smooth glide
                )

    def clear(self):
        """Clear the saccade queue."""
        with self._lock:
            self.queue.clear()
