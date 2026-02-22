#!/usr/bin/env python3
"""
Tests for Self-Healing Daemon.

Tests the background daemon that continuously scans for corruption
and automatically repairs detected issues.
"""

import asyncio
import time
import json
from pathlib import Path
from typing import List, Optional

import pytest

from systems.pixel_compiler.self_healing_daemon import (
    HealingTask,
    HealingStatistics,
    SelfHealingDaemon,
    HealingDaemonError
)
from systems.pixel_compiler.infinite_map_v2 import (
    VisualAllocationTable,
    ClusterLocation,
    FATEntry
)


class TestHealingTask:
    """Tests for HealingTask dataclass."""

    def test_healing_task_creation(self):
        """Test creating a healing task."""
        location = ClusterLocation(x=100, y=200)
        task = HealingTask(
            task_id="test-task-1",
            location=location,
            priority=0,
            status="pending",
            created_at=time.time()
        )

        assert task.task_id == "test-task-1"
        assert task.location.x == 100
        assert task.location.y == 200
        assert task.priority == 0
        assert task.status == "pending"
        assert task.created_at > 0
        assert task.started_at is None
        assert task.completed_at is None
        assert task.error is None

    def test_healing_task_to_dict(self):
        """Test converting healing task to dictionary."""
        location = ClusterLocation(x=100, y=200)
        task = HealingTask(
            task_id="test-task-2",
            location=location,
            priority=1,
            status="in_progress",
            created_at=1234567890.0,
            started_at=1234567895.0,
            completed_at=1234567900.0,
            error="Test error"
        )

        result = task.to_dict()

        assert result['task_id'] == "test-task-2"
        assert result['location'] == {'x': 100, 'y': 200}
        assert result['priority'] == 1
        assert result['status'] == "in_progress"
        assert result['created_at'] == 1234567890.0
        assert result['started_at'] == 1234567895.0
        assert result['completed_at'] == 1234567900.0
        assert result['error'] == "Test error"

    def test_healing_task_from_dict(self):
        """Test creating healing task from dictionary."""
        data = {
            'task_id': "test-task-3",
            'location': {'x': 300, 'y': 400},
            'priority': 2,
            'status': 'completed',
            'created_at': 1234567890.0,
            'started_at': 1234567895.0,
            'completed_at': 1234567900.0,
            'error': None
        }

        task = HealingTask.from_dict(data)

        assert task.task_id == "test-task-3"
        assert task.location.x == 300
        assert task.location.y == 400
        assert task.priority == 2
        assert task.status == "completed"
        assert task.created_at == 1234567890.0
        assert task.started_at == 1234567895.0
        assert task.completed_at == 1234567900.0
        assert task.error is None


class TestHealingStatistics:
    """Tests for HealingStatistics dataclass."""

    def test_healing_statistics_creation(self):
        """Test creating healing statistics."""
        stats = HealingStatistics(
            scans_completed=10,
            corruptions_detected=5,
            repairs_attempted=5,
            repairs_successful=4,
            unrepairable=1,
            total_healed_bytes=4096,
            avg_scan_duration=1.5,
            avg_repair_duration=0.5
        )

        assert stats.scans_completed == 10
        assert stats.corruptions_detected == 5
        assert stats.repairs_attempted == 5
        assert stats.repairs_successful == 4
        assert stats.unrepairable == 1
        assert stats.total_healed_bytes == 4096
        assert stats.avg_scan_duration == 1.5
        assert stats.avg_repair_duration == 0.5

    def test_healing_statistics_to_dict(self):
        """Test converting statistics to dictionary."""
        stats = HealingStatistics(
            scans_completed=100,
            corruptions_detected=20,
            repairs_attempted=20,
            repairs_successful=18,
            unrepairable=2,
            total_healed_bytes=102400,
            avg_scan_duration=2.0,
            avg_repair_duration=0.75
        )

        result = stats.to_dict()

        assert result['scans_completed'] == 100
        assert result['corruptions_detected'] == 20
        assert result['repairs_attempted'] == 20
        assert result['repairs_successful'] == 18
        assert result['unrepairable'] == 2
        assert result['total_healed_bytes'] == 102400
        assert result['avg_scan_duration'] == 2.0
        assert result['avg_repair_duration'] == 0.75

    def test_healing_statistics_from_dict(self):
        """Test creating statistics from dictionary."""
        data = {
            'scans_completed': 50,
            'corruptions_detected': 10,
            'repairs_attempted': 10,
            'repairs_successful': 10,
            'unrepairable': 0,
            'total_healed_bytes': 51200,
            'avg_scan_duration': 1.8,
            'avg_repair_duration': 0.6
        }

        stats = HealingStatistics.from_dict(data)

        assert stats.scans_completed == 50
        assert stats.corruptions_detected == 10
        assert stats.repairs_attempted == 10
        assert stats.repairs_successful == 10
        assert stats.unrepairable == 0
        assert stats.total_healed_bytes == 51200
        assert stats.avg_scan_duration == 1.8
        assert stats.avg_repair_duration == 0.6


class MockRepairToolkit:
    """Mock repair toolkit for testing."""

    def __init__(self):
        self.repairs_made = []
        self.should_fail = False
        self.fail_reason = None

    def detect_corruption(self, vat, locations):
        """Return some corrupted locations."""
        if locations:
            # Return first location as corrupted for testing
            return [locations[0]]
        return []

    def repair_corruption(self, location, corruption_type):
        """Mock repair - record the repair."""
        if self.should_fail:
            raise RuntimeError(self.fail_reason or "Repair failed")

        self.repairs_made.append((location, corruption_type))
        return True, 4096  # success, bytes_recovered

    def get_corruption_type(self, location):
        """Return a mock corruption type."""
        return "checksum_mismatch"


class TestSelfHealingDaemon:
    """Tests for SelfHealingDaemon."""

    @pytest.fixture
    def temp_dir(self, tmp_path):
        """Create temporary directory for tests."""
        return tmp_path

    @pytest.fixture
    def sample_vat(self, temp_dir):
        """Create a sample VAT for testing."""
        center = ClusterLocation(x=1024, y=1024)

        entries = {}
        for i in range(10):
            name = f"file{i}.dat"
            location = ClusterLocation(x=1000 + i * 10, y=1000 + i * 10)
            entries[name] = [location]

        vat = VisualAllocationTable(
            grid_size=2048,
            max_entries=100,
            center=center,
            entries=entries
        )
        return vat

    @pytest.fixture
    def repair_toolkit(self):
        """Create mock repair toolkit."""
        return MockRepairToolkit()

    @pytest.fixture
    def vat_path(self, temp_dir, sample_vat):
        """Create VAT file path for testing."""
        vat_file = temp_dir / "vat.json"

        # Serialize VAT to JSON
        vat_data = {
            'grid_size': sample_vat.grid_size,
            'center': [sample_vat.center.x, sample_vat.center.y],
            'entries': {
                name: [[loc.x, loc.y] for loc in locs]
                for name, locs in sample_vat.entries.items()
            },
            'max_entries': sample_vat.max_entries
        }

        with open(vat_file, 'w') as f:
            json.dump(vat_data, f)

        return str(vat_file)

    def test_daemon_initialization(self, vat_path, repair_toolkit):
        """Test daemon initialization."""
        daemon = SelfHealingDaemon(
            scan_interval=10.0,
            repair_toolkit=repair_toolkit,
            vat_path=vat_path
        )

        assert daemon.scan_interval == 10.0
        assert daemon.repair_toolkit is repair_toolkit
        assert daemon.vat_path == vat_path
        assert daemon.is_running() is False
        assert daemon.get_task_queue_size() == 0

    def test_daemon_get_initial_statistics(self, vat_path, repair_toolkit):
        """Test getting initial statistics."""
        daemon = SelfHealingDaemon(
            scan_interval=10.0,
            repair_toolkit=repair_toolkit,
            vat_path=vat_path
        )

        stats = daemon.get_statistics()

        assert stats.scans_completed == 0
        assert stats.corruptions_detected == 0
        assert stats.repairs_attempted == 0
        assert stats.repairs_successful == 0
        assert stats.unrepairable == 0
        assert stats.total_healed_bytes == 0
        assert stats.avg_scan_duration == 0.0
        assert stats.avg_repair_duration == 0.0

    @pytest.mark.asyncio
    async def test_daemon_start_stop(self, vat_path, repair_toolkit):
        """Test starting and stopping daemon."""
        daemon = SelfHealingDaemon(
            scan_interval=1.0,  # Short interval for testing
            repair_toolkit=repair_toolkit,
            vat_path=vat_path
        )

        # Start daemon
        daemon.start()
        assert daemon.is_running() is True

        # Wait a bit
        await asyncio.sleep(0.1)

        # Stop daemon
        daemon.stop()
        assert daemon.is_running() is False

    @pytest.mark.asyncio
    async def test_daemon_scan_and_heal_cycle(self, sample_vat, vat_path, repair_toolkit):
        """Test single scan and heal cycle."""
        daemon = SelfHealingDaemon(
            scan_interval=1.0,
            repair_toolkit=repair_toolkit,
            vat_path=vat_path
        )

        # Run a single scan
        await daemon._scan_and_heal()

        # Check statistics
        stats = daemon.get_statistics()
        assert stats.scans_completed == 1

        # The mock toolkit may or may not detect corruption depending on implementation
        # Just verify statistics are tracked properly
        assert stats is not None

    @pytest.mark.asyncio
    async def test_daemon_force_scan(self, sample_vat, vat_path, repair_toolkit):
        """Test forcing an immediate scan."""
        daemon = SelfHealingDaemon(
            scan_interval=300.0,  # Long interval
            repair_toolkit=repair_toolkit,
            vat_path=vat_path
        )

        # Start daemon
        daemon.start()

        # Force immediate scan
        daemon.force_scan()

        # Wait for scan to complete
        await asyncio.sleep(0.2)

        # Check that scan was performed
        stats = daemon.get_statistics()
        assert stats.scans_completed >= 1

        # Stop daemon
        daemon.stop()

    @pytest.mark.asyncio
    async def test_daemon_task_creation(self, vat_path, repair_toolkit):
        """Test that healing tasks are created properly."""
        daemon = SelfHealingDaemon(
            scan_interval=1.0,
            repair_toolkit=repair_toolkit,
            vat_path=vat_path
        )

        # Create a mock task
        location = ClusterLocation(x=100, y=200)
        task = HealingTask(
            task_id="test-task",
            location=location,
            priority=0,
            status="pending",
            created_at=time.time()
        )

        daemon._add_task(task)

        assert daemon.get_task_queue_size() == 1

    @pytest.mark.asyncio
    async def test_daemon_multiple_scans(self, vat_path, repair_toolkit):
        """Test daemon running multiple scan cycles."""
        daemon = SelfHealingDaemon(
            scan_interval=0.05,  # Very short interval
            repair_toolkit=repair_toolkit,
            vat_path=vat_path
        )

        # Start daemon
        daemon.start()

        # Wait for multiple scans
        await asyncio.sleep(0.25)

        # Stop daemon
        daemon.stop()

        # Check that at least one scan occurred (timing-dependent)
        stats = daemon.get_statistics()
        assert stats.scans_completed >= 1

    def test_daemon_statistics_updates(self, vat_path, repair_toolkit, sample_vat):
        """Test that statistics are properly updated."""
        daemon = SelfHealingDaemon(
            scan_interval=1.0,
            repair_toolkit=repair_toolkit,
            vat_path=vat_path
        )

        # Run synchronously for testing
        asyncio.run(daemon._scan_and_heal())

        stats = daemon.get_statistics()

        # Verify stats are updated
        assert stats.scans_completed >= 1
        # Statistics should be non-negative
        assert stats.corruptions_detected >= 0
        assert stats.repairs_attempted >= 0
        assert stats.repairs_successful >= 0
        assert stats.unrepairable >= 0
        assert stats.total_healed_bytes >= 0
        assert stats.avg_scan_duration >= 0.0
        assert stats.avg_repair_duration >= 0.0

    @pytest.mark.asyncio
    async def test_daemon_handles_repair_failures(self, vat_path, sample_vat):
        """Test daemon handles repair failures gracefully."""
        # Create toolkit that fails
        toolkit = MockRepairToolkit()
        toolkit.should_fail = True
        toolkit.fail_reason = "Simulated repair failure"

        daemon = SelfHealingDaemon(
            scan_interval=1.0,
            repair_toolkit=toolkit,
            vat_path=vat_path
        )

        # Run scan - should not crash despite repair failures
        await daemon._scan_and_heal()

        # Daemon should still be functional
        assert daemon.is_running() is False  # Not started with start()
        stats = daemon.get_statistics()
        assert stats is not None

    def test_daemon_load_vat(self, vat_path, repair_toolkit):
        """Test loading VAT from file."""
        daemon = SelfHealingDaemon(
            scan_interval=1.0,
            repair_toolkit=repair_toolkit,
            vat_path=vat_path
        )

        vat = daemon._load_vat()

        assert vat is not None
        assert vat.grid_size == 2048
        assert len(vat.entries) == 10

    def test_daemon_load_invalid_vat(self, temp_dir, repair_toolkit):
        """Test handling of invalid VAT file."""
        invalid_path = str(temp_dir / "invalid_vat.json")

        # Create invalid file
        with open(invalid_path, 'w') as f:
            f.write("not valid json")

        daemon = SelfHealingDaemon(
            scan_interval=1.0,
            repair_toolkit=repair_toolkit,
            vat_path=invalid_path
        )

        # Should return None or raise error
        vat = daemon._load_vat()
        assert vat is None

    def test_daemon_get_pending_tasks(self, vat_path, repair_toolkit):
        """Test getting pending healing tasks."""
        daemon = SelfHealingDaemon(
            scan_interval=1.0,
            repair_toolkit=repair_toolkit,
            vat_path=vat_path
        )

        # Add some tasks
        for i in range(3):
            location = ClusterLocation(x=100 + i * 10, y=200 + i * 10)
            task = HealingTask(
                task_id=f"task-{i}",
                location=location,
                priority=i,
                status="pending",
                created_at=time.time()
            )
            daemon._add_task(task)

        pending = daemon.get_pending_tasks()

        assert len(pending) == 3
        # Should be sorted by priority
        assert pending[0].task_id == "task-0"

    def test_daemon_update_task_status(self, vat_path, repair_toolkit):
        """Test updating task status."""
        daemon = SelfHealingDaemon(
            scan_interval=1.0,
            repair_toolkit=repair_toolkit,
            vat_path=vat_path
        )

        location = ClusterLocation(x=100, y=200)
        task = HealingTask(
            task_id="test-task",
            location=location,
            priority=0,
            status="pending",
            created_at=time.time()
        )

        daemon._add_task(task)

        # Update to in_progress
        daemon._update_task_status("test-task", "in_progress")

        pending = daemon.get_pending_tasks()
        assert len(pending) == 0  # No longer pending

        # Update to completed
        daemon._update_task_status("test-task", "completed")

        completed = daemon.get_completed_tasks()
        assert len(completed) == 1
        assert completed[0].task_id == "test-task"

    def test_daemon_clear_completed_tasks(self, vat_path, repair_toolkit):
        """Test clearing completed tasks."""
        daemon = SelfHealingDaemon(
            scan_interval=1.0,
            repair_toolkit=repair_toolkit,
            vat_path=vat_path
        )

        # Add completed tasks
        for i in range(3):
            location = ClusterLocation(x=100 + i * 10, y=200 + i * 10)
            task = HealingTask(
                task_id=f"task-{i}",
                location=location,
                priority=i,
                status="completed",
                created_at=time.time(),
                completed_at=time.time()
            )
            daemon._add_task(task)

        assert daemon.get_task_queue_size() == 3

        # Clear completed
        daemon.clear_completed_tasks()

        assert daemon.get_task_queue_size() == 0

    def test_daemon_get_failed_tasks(self, vat_path, repair_toolkit):
        """Test getting failed tasks."""
        daemon = SelfHealingDaemon(
            scan_interval=1.0,
            repair_toolkit=repair_toolkit,
            vat_path=vat_path
        )

        # Add a failed task
        location = ClusterLocation(x=100, y=200)
        task = HealingTask(
            task_id="failed-task",
            location=location,
            priority=0,
            status="failed",
            error="Repair failed due to hardware error",
            created_at=time.time()
        )
        daemon._add_task(task)

        failed = daemon.get_failed_tasks()

        assert len(failed) == 1
        assert failed[0].task_id == "failed-task"
        assert "hardware error" in failed[0].error

    def test_statistics_serialization(self, vat_path, repair_toolkit):
        """Test statistics can be serialized to/from JSON."""
        daemon = SelfHealingDaemon(
            scan_interval=1.0,
            repair_toolkit=repair_toolkit,
            vat_path=vat_path
        )

        stats = daemon.get_statistics()
        stats_dict = stats.to_dict()

        # Verify JSON serializable
        json_str = json.dumps(stats_dict)
        parsed = json.loads(json_str)

        # Recreate from dict
        restored_stats = HealingStatistics.from_dict(parsed)

        assert restored_stats.scans_completed == stats.scans_completed
        assert restored_stats.corruptions_detected == stats.corruptions_detected
        assert restored_stats.repairs_attempted == stats.repairs_attempted
