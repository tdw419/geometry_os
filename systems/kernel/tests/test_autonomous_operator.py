"""
Unit tests for Autonomous Kernel Operator (Task 3 - Phase L)

Tests for the AutonomousOperator class that orchestrates:
- Workload monitoring
- Kernel selection
- Parameter tuning
- Error recovery
"""

import pytest
import time
from unittest.mock import Mock, patch, MagicMock
from dataclasses import asdict

from systems.kernel.autonomous_operator import (
    AutonomousOperator,
    OperatorState,
    OperatorConfig,
    TickResult,
)
from systems.kernel import HybridKernel, KernelConfig, SysCall
from systems.kernel.workload_monitor import WorkloadMonitor, WorkloadSnapshot
from systems.kernel.kernel_selector import KernelSelector, SelectionPolicy


class TestOperatorInitialization:
    """Test 1: test_operator_initialization"""

    def test_creates_operator_with_default_config(self):
        """Operator should initialize with default configuration."""
        kernel = HybridKernel()
        kernel.initialize()

        operator = AutonomousOperator(kernel)

        assert operator.state == OperatorState.IDLE
        assert operator.config.auto_select is False
        assert operator.config.auto_tune is False
        assert operator.config.auto_recover is True
        assert operator.config.sample_window == 100
        assert operator.config.tick_interval == 1.0
        assert operator.config.error_threshold == 0.1

    def test_creates_operator_with_custom_config(self):
        """Operator should accept custom configuration."""
        kernel = HybridKernel()
        kernel.initialize()

        config = OperatorConfig(
            auto_select=True,
            auto_tune=True,
            sample_window=50,
            tick_interval=0.5,
        )
        operator = AutonomousOperator(kernel, config)

        assert operator.config.auto_select is True
        assert operator.config.auto_tune is True
        assert operator.config.sample_window == 50
        assert operator.config.tick_interval == 0.5

    def test_initializes_with_monitor_and_selector(self):
        """Operator should initialize internal monitor and selector."""
        kernel = HybridKernel()
        kernel.initialize()

        operator = AutonomousOperator(kernel)

        assert operator.monitor is not None
        assert operator.selector is not None
        assert isinstance(operator.monitor, WorkloadMonitor)
        assert isinstance(operator.selector, KernelSelector)


class TestStartMonitoring:
    """Test 2: test_start_monitoring"""

    def test_transitions_to_monitoring_state(self):
        """start_monitoring should transition state to MONITORING."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)

        operator.start_monitoring()

        assert operator.state == OperatorState.MONITORING

    def test_can_start_monitoring_from_idle(self):
        """Should be able to start monitoring from IDLE state."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)

        assert operator.state == OperatorState.IDLE
        operator.start_monitoring()
        assert operator.state == OperatorState.MONITORING

    def test_monitoring_can_be_stopped(self):
        """stop should transition to STOPPED state."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)

        operator.start_monitoring()
        operator.stop()

        assert operator.state == OperatorState.STOPPED


class TestRecordAndAnalyze:
    """Test 3: test_record_and_analyze"""

    def test_records_syscall_data(self):
        """record_syscall should store syscall metrics."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)
        operator.start_monitoring()

        # Record some syscalls
        operator.record_syscall(SysCall.READ, 1000, True, address=0x1000)
        operator.record_syscall(SysCall.WRITE, 1500, True, address=0x2000)
        operator.record_syscall(SysCall.ALLOC, 500, True, address=0x3000)

        snapshot = operator.analyze()

        assert snapshot is not None
        assert snapshot.total_syscalls == 3

    def test_analyze_returns_workload_snapshot(self):
        """analyze should return a WorkloadSnapshot with metrics."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)
        operator.start_monitoring()

        # Record syscalls with various latencies
        for _ in range(10):
            operator.record_syscall(SysCall.READ, 1000, True)
        for _ in range(5):
            operator.record_syscall(SysCall.WRITE, 2000, True)

        snapshot = operator.analyze()

        assert snapshot is not None
        # avg_latency_ns should be approximately (10*1000 + 5*2000) / 15 = 1333
        assert snapshot.avg_latency_ns >= 1000
        # success_rate should be 1.0 (all successful)
        assert snapshot.success_rate == 1.0

    def test_tracks_error_rate(self):
        """analyze should calculate error rate from failed syscalls."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)
        operator.start_monitoring()

        # Record mix of successful and failed syscalls
        for _ in range(8):
            operator.record_syscall(SysCall.READ, 1000, True)
        for _ in range(2):
            operator.record_syscall(SysCall.READ, 5000, False)

        snapshot = operator.analyze()

        assert snapshot is not None
        # success_rate should be 0.8 (8/10 = 80%)
        assert snapshot.success_rate == 0.8


class TestAutonomousSelectionDisabled:
    """Test 4: test_autonomous_selection_disabled"""

    def test_no_automatic_selection_when_disabled(self):
        """When auto_select is False, tick should not change kernel."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel, OperatorConfig(auto_select=False))
        operator.start_monitoring()

        # Record enough syscalls to trigger analysis
        for i in range(100):
            operator.record_syscall(SysCall.READ, 1000 + i, True)

        result = operator.tick()

        assert result.action_taken in ["monitoring", "no_change"]
        # Should not have auto-selected
        if result.recommendations:
            assert result.recommendations.auto_selected is False

    def test_no_automatic_tuning_when_disabled(self):
        """When auto_tune is False, tick should not modify parameters."""
        kernel = HybridKernel()
        kernel.initialize()
        original_mutation_rate = kernel.config.mutation_rate

        operator = AutonomousOperator(kernel, OperatorConfig(auto_tune=False))
        operator.start_monitoring()

        for i in range(100):
            operator.record_syscall(SysCall.READ, 1000 + i, True)

        result = operator.tick()

        # Kernel config should remain unchanged
        assert kernel.config.mutation_rate == original_mutation_rate


class TestGetRecommendations:
    """Test 5: test_get_recommendations"""

    def test_returns_recommendations_dict(self):
        """get_recommendations should return a dictionary with analysis."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)
        operator.start_monitoring()

        # Record some workload
        for _ in range(50):
            operator.record_syscall(SysCall.READ, 1000, True)

        recommendations = operator.get_recommendations()

        assert isinstance(recommendations, dict)
        assert "current_kernel" in recommendations
        assert "recommended_kernel" in recommendations
        assert "confidence" in recommendations

    def test_recommendations_include_selection_result(self):
        """Recommendations should include kernel selection analysis."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)
        operator.start_monitoring()

        for _ in range(50):
            operator.record_syscall(SysCall.READ, 1000, True)

        recommendations = operator.get_recommendations()

        assert "selection_analysis" in recommendations
        # workload_type should be present
        assert "workload_type" in recommendations["selection_analysis"]

    def test_recommendations_empty_without_data(self):
        """Recommendations should handle case with no recorded data."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)

        recommendations = operator.get_recommendations()

        assert isinstance(recommendations, dict)
        # Should have default/empty recommendations
        assert recommendations.get("confidence", 0) >= 0


class TestOperatorStateTransitions:
    """Test 6: test_operator_state_transitions"""

    def test_idle_to_monitoring_transition(self):
        """Should transition from IDLE to MONITORING on start."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)

        assert operator.state == OperatorState.IDLE
        operator.start_monitoring()
        assert operator.state == OperatorState.MONITORING

    def test_monitoring_to_analyzing_on_tick(self):
        """Should transition to ANALYZING during tick with data."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)
        operator.start_monitoring()

        # Record data
        for _ in range(50):
            operator.record_syscall(SysCall.READ, 1000, True)

        # During tick, state may briefly be ANALYZING
        # After tick, should return to MONITORING
        result = operator.tick()
        assert operator.state in [OperatorState.MONITORING, OperatorState.ANALYZING]

    def test_transition_to_recovering_on_high_errors(self):
        """Should transition to RECOVERING when error rate exceeds threshold."""
        kernel = HybridKernel()
        kernel.initialize()

        config = OperatorConfig(
            auto_recover=True,
            error_threshold=0.1,  # 10% error threshold
        )
        operator = AutonomousOperator(kernel, config)
        operator.start_monitoring()

        # Record high error rate (20%)
        for _ in range(80):
            operator.record_syscall(SysCall.READ, 1000, True)
        for _ in range(20):
            operator.record_syscall(SysCall.READ, 5000, False)

        result = operator.tick()

        # Should either be in recovering state or have taken recovery action
        assert operator.state == OperatorState.RECOVERING or "recover" in result.action_taken.lower()

    def test_stop_from_any_state(self):
        """stop should work from any state."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)

        operator.start_monitoring()
        assert operator.state == OperatorState.MONITORING

        operator.stop()
        assert operator.state == OperatorState.STOPPED


class TestHealthCheck:
    """Test 7: test_health_check"""

    def test_returns_health_status_dict(self):
        """health_check should return a dictionary with status."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)

        health = operator.health_check()

        assert isinstance(health, dict)
        assert "state" in health
        assert "kernel_health" in health
        assert "samples_collected" in health

    def test_includes_kernel_health(self):
        """health_check should include the underlying kernel's health."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)

        health = operator.health_check()

        assert "kernel_health" in health
        kernel_health = health["kernel_health"]
        assert "state" in kernel_health
        assert "metrics" in kernel_health

    def test_includes_operator_metrics(self):
        """health_check should include operator-specific metrics."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)
        operator.start_monitoring()

        # Record some data
        for _ in range(10):
            operator.record_syscall(SysCall.READ, 1000, True)

        health = operator.health_check()

        assert "samples_collected" in health
        assert health["samples_collected"] == 10
        assert "uptime_seconds" in health
        assert health["uptime_seconds"] >= 0

    def test_shows_unhealthy_on_high_error_rate(self):
        """health_check should indicate unhealthy when error rate is high."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)
        operator.start_monitoring()

        # Record high error rate
        for _ in range(50):
            operator.record_syscall(SysCall.READ, 1000, False)

        # Trigger analysis to update _last_snapshot
        operator.analyze()

        health = operator.health_check()

        assert "healthy" in health
        assert health["healthy"] is False


class TestTickResult:
    """Additional tests for TickResult dataclass."""

    def test_tick_result_structure(self):
        """TickResult should have expected fields."""
        result = TickResult(
            timestamp=time.time(),
            action_taken="monitoring",
            details={"samples": 10},
            recommendations=None,
        )

        assert result.timestamp > 0
        assert result.action_taken == "monitoring"
        assert result.details["samples"] == 10
        assert result.recommendations is None


class TestSetPolicy:
    """Tests for policy management."""

    def test_set_policy(self):
        """set_policy should update the selection policy."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)

        # Set a different policy
        new_policy = SelectionPolicy.PERFORMANCE
        operator.set_policy(new_policy)

        assert operator.selector.policy == new_policy


class TestResetMetrics:
    """Tests for metrics reset."""

    def test_reset_metrics(self):
        """reset_metrics should clear collected data."""
        kernel = HybridKernel()
        kernel.initialize()
        operator = AutonomousOperator(kernel)
        operator.start_monitoring()

        # Record data
        for _ in range(50):
            operator.record_syscall(SysCall.READ, 1000, True)

        # Verify data exists
        snapshot = operator.analyze()
        assert snapshot.total_syscalls == 50

        # Reset
        operator.reset_metrics()

        # Verify cleared - samples_collected should be 0
        assert operator.monitor.samples_collected == 0
        # analyze() returns None when no data is available
        snapshot = operator.analyze()
        assert snapshot is None
