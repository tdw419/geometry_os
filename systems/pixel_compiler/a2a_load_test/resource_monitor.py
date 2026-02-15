# systems/pixel_compiler/a2a_load_test/resource_monitor.py
"""Resource monitoring for scale testing."""
import asyncio
import time
from dataclasses import dataclass, field
from typing import List, Optional

try:
    import psutil
    HAS_PSUTIL = True
except ImportError:
    HAS_PSUTIL = False


@dataclass
class ResourceSnapshot:
    """Point-in-time resource measurement."""
    timestamp: float
    cpu_percent: float
    memory_mb: float
    connections: int
    messages_sent: int = 0
    messages_received: int = 0


@dataclass
class ResourceStats:
    """Aggregated resource statistics."""
    cpu_avg: float
    cpu_max: float
    cpu_min: float
    memory_avg_mb: float
    memory_max_mb: float
    memory_min_mb: float
    peak_connections: int
    total_messages_sent: int
    total_messages_received: int
    duration_sec: float
    snapshots_count: int


class ResourceMonitor:
    """Monitors system resources during load tests."""

    def __init__(self, interval_ms: int = 100):
        self.interval_ms = interval_ms
        self.snapshots: List[ResourceSnapshot] = []
        self._running = False
        self._task: Optional[asyncio.Task] = None
        self._process = psutil.Process() if HAS_PSUTIL else None

    async def start(self):
        """Start monitoring."""
        self._running = True
        self.snapshots = []
        self._task = asyncio.create_task(self._monitor_loop())

    async def stop(self):
        """Stop monitoring."""
        self._running = False
        if self._task:
            self._task.cancel()
            try:
                await self._task
            except asyncio.CancelledError:
                pass

    async def _monitor_loop(self):
        """Collect snapshots at regular intervals."""
        while self._running:
            snapshot = self._take_snapshot()
            self.snapshots.append(snapshot)
            await asyncio.sleep(self.interval_ms / 1000.0)

    def _take_snapshot(self) -> ResourceSnapshot:
        """Take a resource snapshot."""
        if HAS_PSUTIL and self._process:
            cpu = self._process.cpu_percent()
            memory = self._process.memory_info().rss / (1024 * 1024)
        else:
            cpu = 0.0
            memory = 0.0

        return ResourceSnapshot(
            timestamp=time.time(),
            cpu_percent=cpu,
            memory_mb=memory,
            connections=0  # Set externally
        )

    def get_stats(self) -> ResourceStats:
        """Compute statistics from collected snapshots."""
        if not self.snapshots:
            return ResourceStats(
                cpu_avg=0.0, cpu_max=0.0, cpu_min=0.0,
                memory_avg_mb=0.0, memory_max_mb=0.0, memory_min_mb=0.0,
                peak_connections=0, total_messages_sent=0, total_messages_received=0,
                duration_sec=0.0, snapshots_count=0
            )

        cpus = [s.cpu_percent for s in self.snapshots]
        memories = [s.memory_mb for s in self.snapshots]
        connections = [s.connections for s in self.snapshots]
        sent = sum(s.messages_sent for s in self.snapshots)
        received = sum(s.messages_received for s in self.snapshots)

        return ResourceStats(
            cpu_avg=sum(cpus) / len(cpus),
            cpu_max=max(cpus),
            cpu_min=min(cpus),
            memory_avg_mb=sum(memories) / len(memories),
            memory_max_mb=max(memories),
            memory_min_mb=min(memories),
            peak_connections=max(connections),
            total_messages_sent=sent,
            total_messages_received=received,
            duration_sec=self.snapshots[-1].timestamp - self.snapshots[0].timestamp,
            snapshots_count=len(self.snapshots)
        )
