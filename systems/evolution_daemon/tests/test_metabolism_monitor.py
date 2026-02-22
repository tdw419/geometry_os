"""
Evolution Daemon V13 - Metabolism Monitor Tests

Tests for the adaptive resource monitoring system.
"""

import pytest
from unittest.mock import Mock, patch
from systems.evolution_daemon.safety.data_structures import (
    ThrottleLevel,
    MetabolismState,
)
from systems.evolution_daemon.safety.metabolism_monitor import MetabolismMonitor


class TestMetabolismMonitor:
    """Test suite for MetabolismMonitor."""

    def test_check_returns_state(self):
        """Test that check() returns a MetabolismState."""
        monitor = MetabolismMonitor()

        with patch.object(monitor, '_get_cpu_percent', return_value=30.0), \
             patch.object(monitor, '_get_memory_available', return_value=1000.0), \
             patch.object(monitor, '_get_gpu_percent', return_value=20.0):

            state = monitor.check()

            assert isinstance(state, MetabolismState)
            assert state.cpu_percent == 30.0
            assert state.memory_available_mb == 1000.0
            assert state.gpu_percent == 20.0
            assert isinstance(state.throttle_level, ThrottleLevel)

    def test_throttle_none_when_low_usage(self):
        """Test that throttle is NONE when resource usage is low."""
        monitor = MetabolismMonitor()

        with patch.object(monitor, '_get_cpu_percent', return_value=30.0), \
             patch.object(monitor, '_get_memory_available', return_value=1000.0), \
             patch.object(monitor, '_get_gpu_percent', return_value=20.0):

            state = monitor.check()

            assert state.throttle_level == ThrottleLevel.NONE

    def test_throttle_moderate_when_medium_usage(self):
        """Test that throttle is MODERATE when resource usage is medium."""
        monitor = MetabolismMonitor()

        with patch.object(monitor, '_get_cpu_percent', return_value=65.0), \
             patch.object(monitor, '_get_memory_available', return_value=400.0), \
             patch.object(monitor, '_get_gpu_percent', return_value=50.0):

            state = monitor.check()

            assert state.throttle_level == ThrottleLevel.MODERATE

    def test_throttle_aggressive_when_high_usage(self):
        """Test that throttle is AGGRESSIVE when resource usage is high."""
        monitor = MetabolismMonitor()

        with patch.object(monitor, '_get_cpu_percent', return_value=90.0), \
             patch.object(monitor, '_get_memory_available', return_value=100.0), \
             patch.object(monitor, '_get_gpu_percent', return_value=85.0):

            state = monitor.check()

            assert state.throttle_level == ThrottleLevel.AGGRESSIVE

    def test_should_defer_task_none(self):
        """Test that should_defer_task returns False for NONE throttle."""
        monitor = MetabolismMonitor()

        with patch.object(monitor, '_get_cpu_percent', return_value=30.0), \
             patch.object(monitor, '_get_memory_available', return_value=1000.0), \
             patch.object(monitor, '_get_gpu_percent', return_value=20.0):

            monitor.check()
            assert monitor.should_defer_task() is False

    def test_should_defer_task_aggressive(self):
        """Test that should_defer_task returns True for AGGRESSIVE throttle."""
        monitor = MetabolismMonitor()

        with patch.object(monitor, '_get_cpu_percent', return_value=90.0), \
             patch.object(monitor, '_get_memory_available', return_value=100.0), \
             patch.object(monitor, '_get_gpu_percent', return_value=85.0):

            monitor.check()
            assert monitor.should_defer_task() is True
