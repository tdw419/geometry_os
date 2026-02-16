"""
Evolution Daemon V13 - Metabolism Monitor

Adaptive resource monitoring for daemon self-regulation.

The daemon adjusts its activity level based on available resources,
similar to how living organisms regulate metabolism.
"""

import psutil
from typing import Optional

from systems.evolution_daemon.safety.data_structures import (
    ThrottleLevel,
    MetabolismState,
)


class MetabolismMonitor:
    """
    Monitors system resources and determines appropriate throttle level.

    The metabolism monitor helps the daemon adapt to system load:
    - NONE: Full speed evolution (low resource usage)
    - MODERATE: Slower evolution (medium resource usage)
    - AGGRESSIVE: Minimal/paused evolution (high resource usage)
    """

    # CPU thresholds (percent)
    CPU_MODERATE_THRESHOLD = 60.0
    CPU_AGGRESSIVE_THRESHOLD = 80.0

    # Memory thresholds (available MB)
    MEMORY_MODERATE_MB = 500
    MEMORY_AGGRESSIVE_MB = 200

    # GPU thresholds (percent) - for future use
    GPU_MODERATE_THRESHOLD = 60.0
    GPU_AGGRESSIVE_THRESHOLD = 80.0

    def __init__(self):
        """Initialize the metabolism monitor."""
        self._last_state: Optional[MetabolismState] = None

    def check(self) -> MetabolismState:
        """
        Check current system resources and return metabolism state.

        Returns:
            MetabolismState with current resource levels and throttle recommendation
        """
        cpu_percent = self._get_cpu_percent()
        memory_available_mb = self._get_memory_available()
        gpu_percent = self._get_gpu_percent()

        throttle_level = self._calculate_throttle(
            cpu_percent,
            memory_available_mb,
            gpu_percent
        )

        state = MetabolismState(
            cpu_percent=cpu_percent,
            memory_available_mb=memory_available_mb,
            gpu_percent=gpu_percent,
            throttle_level=throttle_level,
        )

        self._last_state = state
        return state

    def _get_cpu_percent(self) -> float:
        """Get current CPU usage percent."""
        return psutil.cpu_percent(interval=0.1)

    def _get_memory_available(self) -> float:
        """Get available memory in MB."""
        mem = psutil.virtual_memory()
        return mem.available / (1024 * 1024)

    def _get_gpu_percent(self) -> float:
        """
        Get current GPU usage percent.

        Returns 0.0 if GPU monitoring is not available.
        """
        # GPU monitoring is optional and may not be available
        # In mock mode or without GPU, return 0
        try:
            # Try to get GPU stats if available
            # This is a placeholder for actual GPU monitoring
            return 0.0
        except Exception:
            return 0.0

    def _calculate_throttle(
        self,
        cpu_percent: float,
        memory_available_mb: float,
        gpu_percent: float
    ) -> ThrottleLevel:
        """
        Calculate the appropriate throttle level based on resource usage.

        Uses the most restrictive signal - if any resource is at aggressive,
        the throttle is aggressive.

        Args:
            cpu_percent: Current CPU usage (0-100)
            memory_available_mb: Available memory in MB
            gpu_percent: Current GPU usage (0-100)

        Returns:
            ThrottleLevel indicating how much to slow down evolution
        """
        # Check for aggressive conditions (any one triggers aggressive)
        if cpu_percent >= self.CPU_AGGRESSIVE_THRESHOLD:
            return ThrottleLevel.AGGRESSIVE
        if memory_available_mb <= self.MEMORY_AGGRESSIVE_MB:
            return ThrottleLevel.AGGRESSIVE
        if gpu_percent >= self.GPU_AGGRESSIVE_THRESHOLD:
            return ThrottleLevel.AGGRESSIVE

        # Check for moderate conditions
        if cpu_percent >= self.CPU_MODERATE_THRESHOLD:
            return ThrottleLevel.MODERATE
        if memory_available_mb <= self.MEMORY_MODERATE_MB:
            return ThrottleLevel.MODERATE
        if gpu_percent >= self.GPU_MODERATE_THRESHOLD:
            return ThrottleLevel.MODERATE

        # All resources are in good shape
        return ThrottleLevel.NONE

    def should_defer_task(self) -> bool:
        """
        Check if evolution tasks should be deferred due to resource pressure.

        Returns:
            True if tasks should be deferred (aggressive throttle),
            False otherwise
        """
        if self._last_state is None:
            # No state yet, check now
            self.check()

        return self._last_state.throttle_level == ThrottleLevel.AGGRESSIVE

    def get_evolution_delay_ms(self) -> int:
        """
        Get the recommended delay between evolution cycles in milliseconds.

        Returns:
            Delay in ms based on current throttle level:
            - NONE: 100ms (fast)
            - MODERATE: 500ms (slower)
            - AGGRESSIVE: 2000ms (minimal activity)
        """
        if self._last_state is None:
            self.check()

        delays = {
            ThrottleLevel.NONE: 100,
            ThrottleLevel.MODERATE: 500,
            ThrottleLevel.AGGRESSIVE: 2000,
        }

        return delays.get(self._last_state.throttle_level, 100)
