"""
Unit tests for WorkloadMonitor - Autonomous Kernel Operator component.

Tests follow TDD approach: Define expected behavior first.

Part of Phase L: Autonomous Kernel Operator
Task 1: WorkloadMonitor for detecting syscall patterns.
"""

import pytest
import time
from dataclasses import asdict

from systems.kernel.workload_monitor import (
    WorkloadMonitor,
    WorkloadPattern,
    SyscallRecord,
    WorkloadSnapshot,
)


class TestWorkloadMonitor:
    """Test suite for WorkloadMonitor class."""

    def test_monitor_initialization(self):
        """Test that WorkloadMonitor initializes correctly with default config."""
        monitor = WorkloadMonitor()

        assert monitor.sample_window == 100
        assert len(monitor._syscall_history) == 0
        assert monitor._start_time is not None

    def test_monitor_initialization_with_custom_window(self):
        """Test that WorkloadMonitor accepts custom sample window."""
        monitor = WorkloadMonitor(sample_window=50)

        assert monitor.sample_window == 50

    def test_record_syscall(self):
        """Test that record_syscall stores syscall data correctly."""
        monitor = WorkloadMonitor()

        monitor.record_syscall(
            syscall="read",
            latency_ns=1000,
            success=True,
            address=0x1000,
            size=4096
        )

        assert len(monitor._syscall_history) == 1

        record = monitor._syscall_history[0]
        assert record.syscall == "read"
        assert record.latency_ns == 1000
        assert record.success is True
        assert record.address == 0x1000
        assert record.size == 4096
        assert record.timestamp > 0

    def test_record_syscall_respects_window(self):
        """Test that record_syscall respects sample window limit."""
        monitor = WorkloadMonitor(sample_window=5)

        # Record 10 syscalls
        for i in range(10):
            monitor.record_syscall(syscall="read", latency_ns=100, success=True)

        # Should only keep last 5
        assert len(monitor._syscall_history) == 5

    def test_get_snapshot(self):
        """Test that get_snapshot returns correct WorkloadSnapshot."""
        monitor = WorkloadMonitor()

        # Record some syscalls
        monitor.record_syscall("read", 1000, True)
        monitor.record_syscall("write", 2000, True)
        monitor.record_syscall("read", 1500, False)  # One failure

        snapshot = monitor.get_snapshot()

        assert isinstance(snapshot, WorkloadSnapshot)
        assert snapshot.total_syscalls == 3
        assert snapshot.avg_latency_ns == pytest.approx(1500, rel=0.01)
        assert snapshot.success_rate == pytest.approx(2/3, rel=0.01)
        assert "read" in snapshot.syscall_distribution
        assert snapshot.syscall_distribution["read"] == 2
        assert snapshot.syscall_distribution["write"] == 1

    def test_get_snapshot_empty_history(self):
        """Test that get_snapshot handles empty history gracefully."""
        monitor = WorkloadMonitor()

        snapshot = monitor.get_snapshot()

        assert snapshot.total_syscalls == 0
        assert snapshot.avg_latency_ns == 0
        assert snapshot.p95_latency_ns == 0
        assert snapshot.success_rate == 1.0  # No failures = 100%
        assert snapshot.syscall_distribution == {}
        assert snapshot.detected_pattern == WorkloadPattern.UNKNOWN
        assert snapshot.workload_score == 0.0
        assert snapshot.hot_syscalls == []

    def test_detect_sequential_pattern(self):
        """Test detection of sequential address access pattern."""
        monitor = WorkloadMonitor()

        # Sequential access: addresses increase by fixed stride
        for i in range(20):
            monitor.record_syscall(
                syscall="read",
                latency_ns=100,
                success=True,
                address=0x1000 + (i * 0x1000)  # Sequential with stride 0x1000
            )

        pattern = monitor.detect_pattern()
        assert pattern == WorkloadPattern.SEQUENTIAL

    def test_detect_strided_pattern(self):
        """Test detection of strided access pattern."""
        monitor = WorkloadMonitor()

        # Strided access: fixed stride but not sequential
        for i in range(20):
            monitor.record_syscall(
                syscall="read",
                latency_ns=100,
                success=True,
                address=0x1000 + (i * 0x100)  # Smaller stride
            )

        pattern = monitor.detect_pattern()
        assert pattern in (WorkloadPattern.SEQUENTIAL, WorkloadPattern.STRIDED)

    def test_detect_random_pattern(self):
        """Test detection of random access pattern."""
        monitor = WorkloadMonitor()

        # Random-ish access: use various non-pattern addresses
        import random
        random.seed(42)
        addresses = [random.randint(0, 0xFFFFF) * 0x1000 for _ in range(20)]

        for addr in addresses:
            monitor.record_syscall(
                syscall="read",
                latency_ns=100,
                success=True,
                address=addr
            )

        pattern = monitor.detect_pattern()
        assert pattern == WorkloadPattern.RANDOM

    def test_detect_looping_pattern(self):
        """Test detection of looping address pattern."""
        monitor = WorkloadMonitor()

        # Looping: repeat same addresses
        loop_addresses = [0x1000, 0x2000, 0x3000, 0x4000]
        for _ in range(5):  # Loop 5 times
            for addr in loop_addresses:
                monitor.record_syscall(
                    syscall="read",
                    latency_ns=100,
                    success=True,
                    address=addr
                )

        pattern = monitor.detect_pattern()
        assert pattern == WorkloadPattern.LOOPING

    def test_detect_pattern_insufficient_data(self):
        """Test pattern detection with insufficient data returns UNKNOWN."""
        monitor = WorkloadMonitor()

        # Only 2 records - not enough for pattern detection
        monitor.record_syscall("read", 100, True, address=0x1000)
        monitor.record_syscall("read", 100, True, address=0x2000)

        pattern = monitor.detect_pattern()
        assert pattern == WorkloadPattern.UNKNOWN

    def test_calculate_workload_score(self):
        """Test workload score calculation."""
        monitor = WorkloadMonitor()

        # High frequency, low latency, high success = good score
        for _ in range(50):
            monitor.record_syscall("read", 100, True)

        score = monitor.calculate_workload_score()
        assert 0.0 <= score <= 1.0
        assert score > 0.5  # Should be good score

    def test_calculate_workload_score_with_failures(self):
        """Test workload score is lower with failures."""
        monitor = WorkloadMonitor()

        # High failure rate should lower score
        for i in range(100):
            monitor.record_syscall("read", 100, success=(i % 2 == 0))

        score = monitor.calculate_workload_score()
        assert 0.0 <= score <= 1.0
        # With 50% failure rate: success=0.2, latency=0.4, freq=0.2 = 0.8
        # This is lower than perfect score of 1.0
        assert score < 1.0  # Should be lower than perfect
        assert score < 0.9  # Definitely impacted by failures

    def test_calculate_workload_score_high_latency(self):
        """Test workload score is lower with high latency."""
        monitor = WorkloadMonitor()

        # High latency should lower score
        for _ in range(50):
            monitor.record_syscall("read", 1_000_000_000, True)  # 1 second in ns

        score = monitor.calculate_workload_score()
        assert 0.0 <= score <= 1.0
        # With 1s latency: success=0.4, latency=0.0, freq=0.1 = 0.5
        assert score <= 0.6  # Should be low due to high latency

    def test_get_hot_syscalls(self):
        """Test identification of hot (frequent) syscalls."""
        monitor = WorkloadMonitor()

        # read: 80%, write: 15%, open: 5%
        for _ in range(80):
            monitor.record_syscall("read", 100, True)
        for _ in range(15):
            monitor.record_syscall("write", 100, True)
        for _ in range(5):
            monitor.record_syscall("open", 100, True)

        # Default threshold is 10%
        hot = monitor.get_hot_syscalls(threshold=0.1)

        assert "read" in hot
        assert "write" in hot
        assert "open" not in hot

    def test_get_hot_syscalls_custom_threshold(self):
        """Test hot syscalls with custom threshold."""
        monitor = WorkloadMonitor()

        # read: 60%, write: 40%
        for _ in range(60):
            monitor.record_syscall("read", 100, True)
        for _ in range(40):
            monitor.record_syscall("write", 100, True)

        # 50% threshold
        hot = monitor.get_hot_syscalls(threshold=0.5)

        assert "read" in hot
        assert "write" not in hot

    def test_get_hot_syscalls_empty(self):
        """Test hot syscalls returns empty list when no data."""
        monitor = WorkloadMonitor()

        hot = monitor.get_hot_syscalls()

        assert hot == []

    def test_reset_clears_history(self):
        """Test that reset clears all history."""
        monitor = WorkloadMonitor()

        # Record some syscalls
        for i in range(10):
            monitor.record_syscall("read", 100, True)

        assert len(monitor._syscall_history) == 10

        monitor.reset()

        assert len(monitor._syscall_history) == 0
        assert monitor._start_time is not None  # Reset should update start time

    def test_snapshot_p95_latency(self):
        """Test that p95 latency is calculated correctly."""
        monitor = WorkloadMonitor()

        # Record 20 syscalls with varying latencies
        for i in range(1, 21):
            monitor.record_syscall("read", i * 100, True)  # 100 to 2000 ns

        snapshot = monitor.get_snapshot()

        # p95 of [100, 200, ..., 2000] should be around 1900-2000
        assert snapshot.p95_latency_ns >= 1800
        assert snapshot.p95_latency_ns <= 2100

    def test_snapshot_includes_detected_pattern(self):
        """Test that snapshot includes detected pattern."""
        monitor = WorkloadMonitor()

        # Record sequential access
        for i in range(20):
            monitor.record_syscall("read", 100, True, address=i * 0x1000)

        snapshot = monitor.get_snapshot()

        assert snapshot.detected_pattern == WorkloadPattern.SEQUENTIAL

    def test_snapshot_includes_hot_syscalls(self):
        """Test that snapshot includes hot syscalls."""
        monitor = WorkloadMonitor()

        for _ in range(90):
            monitor.record_syscall("read", 100, True)
        for _ in range(10):
            monitor.record_syscall("write", 100, True)

        snapshot = monitor.get_snapshot()

        assert "read" in snapshot.hot_syscalls

    def test_syscall_record_dataclass(self):
        """Test SyscallRecord dataclass functionality."""
        record = SyscallRecord(
            syscall="read",
            latency_ns=1000,
            success=True,
            timestamp=time.time(),
            address=0x1000,
            size=4096
        )

        assert record.syscall == "read"
        assert record.latency_ns == 1000
        assert record.success is True
        assert record.address == 0x1000
        assert record.size == 4096

        # Optional fields should default to None
        record2 = SyscallRecord(
            syscall="write",
            latency_ns=500,
            success=False,
            timestamp=time.time()
        )
        assert record2.address is None
        assert record2.size is None

    def test_workload_snapshot_dataclass(self):
        """Test WorkloadSnapshot dataclass functionality."""
        snapshot = WorkloadSnapshot(
            timestamp=time.time(),
            total_syscalls=100,
            avg_latency_ns=500.0,
            p95_latency_ns=1000.0,
            success_rate=0.99,
            syscall_distribution={"read": 60, "write": 40},
            detected_pattern=WorkloadPattern.SEQUENTIAL,
            workload_score=0.85,
            hot_syscalls=["read"]
        )

        assert snapshot.total_syscalls == 100
        assert snapshot.avg_latency_ns == 500.0
        assert snapshot.success_rate == 0.99
        assert snapshot.detected_pattern == WorkloadPattern.SEQUENTIAL

    def test_mixed_pattern_detection(self):
        """Test detection of mixed access patterns."""
        monitor = WorkloadMonitor()

        # Mix sequential and random access
        for i in range(10):
            monitor.record_syscall("read", 100, True, address=i * 0x1000)

        import random
        random.seed(42)
        for _ in range(10):
            monitor.record_syscall("read", 100, True,
                                   address=random.randint(0, 0xFFFF) * 0x1000)

        pattern = monitor.detect_pattern()
        assert pattern in (WorkloadPattern.MIXED, WorkloadPattern.RANDOM)

    def test_monitor_with_no_address_info(self):
        """Test monitor handles syscalls without address information."""
        monitor = WorkloadMonitor()

        # Record syscalls without address info
        for _ in range(20):
            monitor.record_syscall("read", 100, True)

        # Should not crash and should return UNKNOWN or appropriate pattern
        pattern = monitor.detect_pattern()
        assert pattern in (WorkloadPattern.UNKNOWN, WorkloadPattern.RANDOM)


class TestWorkloadPattern:
    """Test suite for WorkloadPattern enum."""

    def test_pattern_values(self):
        """Test that WorkloadPattern has expected values."""
        assert hasattr(WorkloadPattern, 'SEQUENTIAL')
        assert hasattr(WorkloadPattern, 'STRIDED')
        assert hasattr(WorkloadPattern, 'RANDOM')
        assert hasattr(WorkloadPattern, 'LOOPING')
        assert hasattr(WorkloadPattern, 'MIXED')
        assert hasattr(WorkloadPattern, 'UNKNOWN')

    def test_pattern_auto_values(self):
        """Test that pattern values are unique."""
        patterns = [
            WorkloadPattern.SEQUENTIAL,
            WorkloadPattern.STRIDED,
            WorkloadPattern.RANDOM,
            WorkloadPattern.LOOPING,
            WorkloadPattern.MIXED,
            WorkloadPattern.UNKNOWN,
        ]
        values = [p.value for p in patterns]
        assert len(set(values)) == len(values)  # All unique
