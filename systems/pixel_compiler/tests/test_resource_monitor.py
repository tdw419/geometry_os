# systems/pixel_compiler/tests/test_resource_monitor.py
import pytest
import asyncio
from systems.pixel_compiler.a2a_load_test.resource_monitor import (
    ResourceMonitor,
    ResourceSnapshot,
    ResourceStats
)


class TestResourceSnapshot:
    """Tests for resource snapshots."""

    def test_snapshot_creation(self):
        """Can create a resource snapshot."""
        snapshot = ResourceSnapshot(
            timestamp=0.0,
            cpu_percent=50.0,
            memory_mb=100.0,
            connections=10
        )

        assert snapshot.cpu_percent == 50.0
        assert snapshot.memory_mb == 100.0
        assert snapshot.connections == 10


class TestResourceMonitor:
    """Tests for resource monitoring."""

    @pytest.mark.asyncio
    async def test_monitor_start_stop(self):
        """Monitor can start and stop."""
        monitor = ResourceMonitor(interval_ms=100)

        await monitor.start()
        assert monitor._running is True

        await monitor.stop()
        assert monitor._running is False

    @pytest.mark.asyncio
    async def test_monitor_collects_snapshots(self):
        """Monitor collects snapshots."""
        monitor = ResourceMonitor(interval_ms=50)

        await monitor.start()
        await asyncio.sleep(0.2)  # Collect a few snapshots
        await monitor.stop()

        assert len(monitor.snapshots) >= 2

    def test_get_stats_empty(self):
        """Get stats on empty snapshots returns zeros."""
        monitor = ResourceMonitor()

        stats = monitor.get_stats()

        assert stats.cpu_avg == 0.0
        assert stats.memory_avg_mb == 0.0

    def test_get_stats(self):
        """Can compute statistics from snapshots."""
        monitor = ResourceMonitor()

        # Add some snapshots manually
        monitor.snapshots = [
            ResourceSnapshot(0.0, 10.0, 100.0, 5, 10, 10),
            ResourceSnapshot(0.1, 20.0, 110.0, 10, 20, 20),
            ResourceSnapshot(0.2, 30.0, 120.0, 15, 30, 30),
        ]

        stats = monitor.get_stats()

        assert stats.cpu_avg == 20.0
        assert stats.cpu_max == 30.0
        assert stats.memory_avg_mb == 110.0
        assert stats.memory_max_mb == 120.0
        assert stats.peak_connections == 15
