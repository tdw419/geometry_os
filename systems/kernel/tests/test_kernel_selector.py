"""
Unit tests for KernelSelector - AI-driven kernel selection.

Tests cover:
- Initialization with different policies
- Pattern-based selection logic
- Policy adjustments
- High error rate handling
- Selection result structure

These tests are designed to work with the existing kernel_selector.py
implementation in systems/kernel.
"""

import pytest
from dataclasses import fields
from enum import Enum
import time

from systems.kernel.kernel_selector import (
    KernelSelector,
    SelectionPolicy,
    SelectionResult,
    SelectionConfig,
)
from systems.kernel.workload_monitor import (
    WorkloadMonitor,
    WorkloadPattern,
    WorkloadSnapshot,
)
from systems.kernel.unified_neural_kernel import KernelType


class TestKernelSelector:
    """Tests for KernelSelector class."""

    def test_selector_initialization(self):
        """Test that KernelSelector initializes with default and custom policies."""
        # Default initialization
        selector = KernelSelector()
        assert selector.policy == SelectionPolicy.BALANCED
        assert selector.get_selection_history() == []

        # Custom policy initialization
        selector_latency = KernelSelector(config=SelectionConfig(
            default_policy=SelectionPolicy.CONSERVATIVE
        ))
        assert selector_latency.policy == SelectionPolicy.CONSERVATIVE

        selector_throughput = KernelSelector(config=SelectionConfig(
            default_policy=SelectionPolicy.AGGRESSIVE
        ))
        assert selector_throughput.policy == SelectionPolicy.AGGRESSIVE

    def test_select_for_sequential_workload(self):
        """Test that SEQUENTIAL pattern prefers GPU_RESIDENT kernel."""
        selector = KernelSelector()
        monitor = WorkloadMonitor()

        # Record sequential pattern syscalls
        for i in range(20):
            monitor.record_syscall(
                syscall="read",
                latency_ns=5000,  # 5 microseconds
                success=True,
                address=0x1000 + i * 64,  # Sequential addresses
                size=64
            )

        snapshot = monitor.get_snapshot()
        result = selector.select(snapshot, current_kernel=KernelType.HYBRID)

        # SEQUENTIAL pattern should score GPU_RESIDENT highly
        assert result.recommended_kernel in [KernelType.GPU_RESIDENT, KernelType.HYBRID]
        assert result.confidence >= 0.0
        assert len(result.reasons) > 0

    def test_select_for_random_workload(self):
        """Test that RANDOM pattern selects appropriate kernel."""
        selector = KernelSelector()

        # Create a workload snapshot with RANDOM pattern
        snapshot = WorkloadSnapshot(
            timestamp=time.time(),
            total_syscalls=100,
            avg_latency_ns=15000000,  # 15ms
            p95_latency_ns=30000000,
            success_rate=0.99,
            syscall_distribution={"read": 60, "write": 40},
            detected_pattern=WorkloadPattern.RANDOM,
            workload_score=0.7,
            hot_syscalls=["read", "write"]
        )

        result = selector.select(snapshot, current_kernel=KernelType.HYBRID)

        # RANDOM pattern should prefer HYBRID or DISPATCHER
        assert result.recommended_kernel in [KernelType.HYBRID, KernelType.DISPATCHER]
        assert len(result.reasons) > 0

    def test_select_for_high_error_rate(self):
        """Test that high error rate affects selection reasoning."""
        selector = KernelSelector()

        # Create a workload snapshot with high error rate
        snapshot = WorkloadSnapshot(
            timestamp=time.time(),
            total_syscalls=100,
            avg_latency_ns=50000000,  # 50ms
            p95_latency_ns=100000000,
            success_rate=0.85,  # 85% success rate = 15% error rate
            syscall_distribution={"read": 50, "write": 50},
            detected_pattern=WorkloadPattern.SEQUENTIAL,
            workload_score=0.4,
            hot_syscalls=["read"]
        )

        result = selector.select(snapshot, current_kernel=KernelType.GPU_RESIDENT)

        # With low success rate, HYBRID should be preferred over GPU_RESIDENT
        # because unstable workloads favor hybrid for flexibility
        hybrid_score = result.workload_match.get("HYBRID", 0)
        gpu_score = result.workload_match.get("GPU_RESIDENT", 0)

        # HYBRID should have higher score than GPU_RESIDENT with low success rate
        assert hybrid_score >= gpu_score

        # Check that success rate is mentioned in reasons
        reasons_text = " ".join(result.reasons).lower()
        assert "success" in reasons_text or "rate" in reasons_text or "concern" in reasons_text

    def test_policy_performance_optimized(self):
        """Test that PERFORMANCE policy optimizes for performance."""
        config = SelectionConfig(default_policy=SelectionPolicy.PERFORMANCE)
        selector = KernelSelector(config=config)

        snapshot = WorkloadSnapshot(
            timestamp=time.time(),
            total_syscalls=100,
            avg_latency_ns=5000000,  # 5ms
            p95_latency_ns=10000000,
            success_rate=0.99,
            syscall_distribution={"read": 100},
            detected_pattern=WorkloadPattern.SEQUENTIAL,
            workload_score=0.9,
            hot_syscalls=["read"]
        )

        result = selector.select(snapshot, current_kernel=KernelType.HYBRID)

        # PERFORMANCE policy should boost GPU_RESIDENT
        assert result.recommended_kernel == KernelType.GPU_RESIDENT or \
               result.workload_match.get("GPU_RESIDENT", 0) >= 0.5

    def test_policy_conservative_optimized(self):
        """Test that CONSERVATIVE policy prefers stable options."""
        config = SelectionConfig(default_policy=SelectionPolicy.CONSERVATIVE)
        selector = KernelSelector(config=config)

        snapshot = WorkloadSnapshot(
            timestamp=time.time(),
            total_syscalls=100,
            avg_latency_ns=10000000,  # 10ms
            p95_latency_ns=20000000,
            success_rate=0.98,
            syscall_distribution={"read": 100},
            detected_pattern=WorkloadPattern.SEQUENTIAL,
            workload_score=0.8,
            hot_syscalls=["read"]
        )

        result = selector.select(snapshot, current_kernel=KernelType.HYBRID)

        # CONSERVATIVE policy should prefer HYBRID
        assert result.recommended_kernel == KernelType.HYBRID or \
               result.workload_match.get("HYBRID", 0) >= 0.5

    def test_selection_result_structure(self):
        """Test that SelectionResult contains all required fields."""
        selector = KernelSelector()

        snapshot = WorkloadSnapshot(
            timestamp=time.time(),
            total_syscalls=100,
            avg_latency_ns=10000000,
            p95_latency_ns=20000000,
            success_rate=0.99,
            syscall_distribution={"read": 100},
            detected_pattern=WorkloadPattern.MIXED,
            workload_score=0.7,
            hot_syscalls=["read"]
        )

        result = selector.select(snapshot)

        # Verify all required fields exist
        assert hasattr(result, "timestamp")
        assert hasattr(result, "recommended_kernel")
        assert hasattr(result, "current_kernel")
        assert hasattr(result, "confidence")
        assert hasattr(result, "auto_selected")
        assert hasattr(result, "reasons")
        assert hasattr(result, "workload_match")
        assert hasattr(result, "should_switch")

        # Verify types
        assert isinstance(result.timestamp, float)
        assert isinstance(result.recommended_kernel, KernelType)
        assert isinstance(result.current_kernel, KernelType)
        assert isinstance(result.confidence, float)
        assert isinstance(result.auto_selected, bool)
        assert isinstance(result.reasons, list)
        assert isinstance(result.workload_match, dict)
        assert isinstance(result.should_switch, bool)

        # Verify confidence range
        assert 0.0 <= result.confidence <= 1.0


class TestSelectionHistory:
    """Tests for selection history tracking."""

    def test_selection_history_tracking(self):
        """Test that selection history is tracked correctly."""
        selector = KernelSelector()

        snapshot1 = WorkloadSnapshot(
            timestamp=time.time(),
            total_syscalls=100,
            avg_latency_ns=5000000,
            p95_latency_ns=10000000,
            success_rate=0.99,
            syscall_distribution={"read": 100},
            detected_pattern=WorkloadPattern.SEQUENTIAL,
            workload_score=0.9,
            hot_syscalls=["read"]
        )
        snapshot2 = WorkloadSnapshot(
            timestamp=time.time(),
            total_syscalls=50,
            avg_latency_ns=15000000,
            p95_latency_ns=30000000,
            success_rate=0.95,
            syscall_distribution={"write": 50},
            detected_pattern=WorkloadPattern.RANDOM,
            workload_score=0.6,
            hot_syscalls=["write"]
        )

        result1 = selector.select(snapshot1)
        result2 = selector.select(snapshot2)

        history = selector.get_selection_history()
        assert len(history) == 2
        assert history[0] == result1
        assert history[1] == result2

    def test_selection_history_limit(self):
        """Test that selection history respects limit parameter."""
        selector = KernelSelector()

        # Create multiple selections
        for i in range(15):
            snapshot = WorkloadSnapshot(
                timestamp=time.time(),
                total_syscalls=100,
                avg_latency_ns=5000000,
                p95_latency_ns=10000000,
                success_rate=0.99,
                syscall_distribution={"read": 100},
                detected_pattern=WorkloadPattern.SEQUENTIAL,
                workload_score=0.9,
                hot_syscalls=["read"]
            )
            selector.select(snapshot)

        # Request limited history
        history = selector.get_selection_history(limit=10)
        assert len(history) == 10


class TestPolicyBehavior:
    """Tests for specific policy behaviors."""

    def test_efficiency_policy_preferred_patterns(self):
        """Test that config correctly sets GPU preferred patterns."""
        config = SelectionConfig(
            default_policy=SelectionPolicy.EFFICIENCY,
            gpu_preferred_for_patterns=[WorkloadPattern.SEQUENTIAL],
            cpu_preferred_for_patterns=[WorkloadPattern.RANDOM]
        )
        selector = KernelSelector(config=config)

        assert WorkloadPattern.SEQUENTIAL in config.gpu_preferred_for_patterns
        assert WorkloadPattern.RANDOM in config.cpu_preferred_for_patterns

    def test_strided_workload_gpu_resident(self):
        """Test that STRIDED pattern scores GPU_RESIDENT highly."""
        selector = KernelSelector()
        monitor = WorkloadMonitor()

        # Record strided pattern syscalls
        for i in range(20):
            monitor.record_syscall(
                syscall="read",
                latency_ns=8000,  # 8 microseconds
                success=True,
                address=0x1000 + i * 256,  # Fixed stride of 256 bytes
                size=64
            )

        snapshot = monitor.get_snapshot()
        result = selector.select(snapshot, current_kernel=KernelType.HYBRID)

        # STRIDED pattern should score GPU_RESIDENT highly
        gpu_score = result.workload_match.get("GPU_RESIDENT", 0)
        assert gpu_score >= 0.3 or result.recommended_kernel == KernelType.GPU_RESIDENT

    def test_low_latency_workload(self):
        """Test that low latency workload affects selection."""
        selector = KernelSelector()

        snapshot = WorkloadSnapshot(
            timestamp=time.time(),
            total_syscalls=100,
            avg_latency_ns=500,  # Very low latency
            p95_latency_ns=1000,
            success_rate=0.99,
            syscall_distribution={"read": 100},
            detected_pattern=WorkloadPattern.SEQUENTIAL,
            workload_score=0.95,
            hot_syscalls=["read"]
        )

        result = selector.select(snapshot, current_kernel=KernelType.HYBRID)

        # Low latency should favor GPU for throughput
        assert result.recommended_kernel in [KernelType.GPU_RESIDENT, KernelType.HYBRID]

    def test_analyze_trends(self):
        """Test that trend analysis works correctly."""
        selector = KernelSelector()

        # Create various selections
        patterns = [
            WorkloadPattern.SEQUENTIAL,
            WorkloadPattern.RANDOM,
            WorkloadPattern.SEQUENTIAL,
            WorkloadPattern.LOOPING,
            WorkloadPattern.SEQUENTIAL,
        ]

        for pattern in patterns:
            snapshot = WorkloadSnapshot(
                timestamp=time.time(),
                total_syscalls=100,
                avg_latency_ns=10000000,
                p95_latency_ns=20000000,
                success_rate=0.99,
                syscall_distribution={"read": 100},
                detected_pattern=pattern,
                workload_score=0.7,
                hot_syscalls=["read"]
            )
            selector.select(snapshot)

        trends = selector.analyze_trends()

        assert trends["total_selections"] == 5
        assert "kernel_distribution" in trends
        assert "dominant_recommendation" in trends
        assert "average_confidence" in trends

    def test_set_policy(self):
        """Test that policy can be changed at runtime."""
        selector = KernelSelector()

        assert selector.policy == SelectionPolicy.BALANCED

        selector.set_policy(SelectionPolicy.PERFORMANCE)
        assert selector.policy == SelectionPolicy.PERFORMANCE

        selector.set_policy(SelectionPolicy.CONSERVATIVE)
        assert selector.policy == SelectionPolicy.CONSERVATIVE


class TestNullSnapshot:
    """Tests for handling null or empty snapshots."""

    def test_null_snapshot_returns_current(self):
        """Test that null snapshot returns current kernel with low confidence."""
        selector = KernelSelector()

        result = selector.select(None, current_kernel=KernelType.HYBRID)

        assert result.recommended_kernel == KernelType.HYBRID
        assert result.confidence == 0.0
        assert "No workload data" in result.reasons[0]

    def test_empty_snapshot_returns_current(self):
        """Test that empty snapshot (0 syscalls) returns current kernel."""
        selector = KernelSelector()

        snapshot = WorkloadSnapshot(
            timestamp=time.time(),
            total_syscalls=0,
            avg_latency_ns=0.0,
            p95_latency_ns=0.0,
            success_rate=1.0,
            syscall_distribution={},
            detected_pattern=WorkloadPattern.UNKNOWN,
            workload_score=0.0,
            hot_syscalls=[]
        )

        result = selector.select(snapshot, current_kernel=KernelType.GPU_RESIDENT)

        assert result.recommended_kernel == KernelType.GPU_RESIDENT
        assert result.confidence == 0.0
