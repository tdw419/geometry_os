"""
Autonomous Kernel Operator (Task 3 - Phase L)

Orchestrates monitoring, selection, and tuning for self-managing kernels.
Provides the central control loop for autonomous kernel management.

Architecture:
    ┌─────────────────────────────────────────────────────────┐
    │                AutonomousOperator                        │
    ├─────────────────────────────────────────────────────────┤
    │  ┌────────────────┐    ┌────────────────┐              │
    │  │ WorkloadMonitor│───▶│ KernelSelector │              │
    │  │  (Task 1)      │    │   (Task 2)     │              │
    │  └────────────────┘    └────────────────┘              │
    │           │                    │                        │
    │           ▼                    ▼                        │
    │  ┌─────────────────────────────────────────────┐       │
    │  │              Control Loop                    │       │
    │  │  1. Monitor syscalls                        │       │
    │  │  2. Analyze workload                        │       │
    │  │  3. Select optimal kernel (if enabled)      │       │
    │  │  4. Tune parameters (if enabled)            │       │
    │  │  5. Recover from errors (if needed)         │       │
    │  └─────────────────────────────────────────────┘       │
    │                          │                              │
    │                          ▼                              │
    │  ┌─────────────────────────────────────────────┐       │
    │  │              HybridKernel                    │       │
    │  │  (Software 1.0 + Software 2.0)              │       │
    │  └─────────────────────────────────────────────┘       │
    └─────────────────────────────────────────────────────────┘

Usage:
    kernel = HybridKernel()
    kernel.initialize()

    operator = AutonomousOperator(kernel)
    operator.start_monitoring()

    # Record syscalls (typically done by kernel dispatch)
    operator.record_syscall(SysCall.READ, 1000, True)

    # Tick to process and potentially act
    result = operator.tick()
    print(result.action_taken)
"""

from dataclasses import dataclass, field
from enum import Enum, auto
from typing import Dict, List, Optional, Any, TYPE_CHECKING
import time
import logging

from .unified_neural_kernel import (
    NeuralKernelInterface,
    KernelConfig,
    KernelState,
    KernelType,
    SysCall,
)
from .workload_monitor import WorkloadMonitor, WorkloadSnapshot, WorkloadPattern
from .kernel_selector import (
    KernelSelector,
    SelectionPolicy,
    SelectionConfig,
    SelectionResult,
)

if TYPE_CHECKING:
    from .hybrid_kernel import HybridKernel


class OperatorState(Enum):
    """States for the AutonomousOperator state machine."""
    IDLE = auto()        # Not monitoring
    MONITORING = auto()  # Actively collecting data
    ANALYZING = auto()   # Processing workload data
    TUNING = auto()      # Adjusting parameters
    RECOVERING = auto()  # Recovering from errors
    STOPPED = auto()     # Explicitly stopped


@dataclass
class OperatorConfig:
    """Configuration for AutonomousOperator."""
    auto_select: bool = False      # Auto-select kernel type
    auto_tune: bool = False        # Auto-tune parameters
    auto_recover: bool = True      # Auto-recover from errors
    sample_window: int = 100       # Workload sample window
    tick_interval: float = 1.0     # Seconds between ticks
    error_threshold: float = 0.1   # Error rate threshold for recovery


@dataclass
class TickResult:
    """Result of a tick operation."""
    timestamp: float
    action_taken: str
    details: Dict[str, Any]
    recommendations: Optional[SelectionResult] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "timestamp": self.timestamp,
            "action_taken": self.action_taken,
            "details": self.details,
            "recommendations": self.recommendations.to_dict() if self.recommendations else None,
        }


class AutonomousOperator:
    """
    Autonomous operator for self-managing kernels.

    Orchestrates monitoring, selection, and tuning operations
    to keep the kernel running optimally.

    Attributes:
        kernel: The neural kernel being managed
        config: Operator configuration
        state: Current operator state
        monitor: WorkloadMonitor instance
        selector: KernelSelector instance
    """

    def __init__(
        self,
        kernel: NeuralKernelInterface,
        config: Optional[OperatorConfig] = None,
    ):
        """
        Initialize the AutonomousOperator.

        Args:
            kernel: The kernel to manage
            config: Optional configuration
        """
        self.kernel = kernel
        self.config = config or OperatorConfig()
        self.state = OperatorState.IDLE

        # Initialize monitor and selector
        self.monitor = WorkloadMonitor(sample_window=self.config.sample_window)

        selection_config = SelectionConfig()
        self.selector = KernelSelector(config=selection_config)

        # Internal state
        self._start_time: float = time.time()
        self._last_tick: float = 0.0
        self._tick_count: int = 0
        self._last_snapshot: Optional[WorkloadSnapshot] = None
        self._last_selection: Optional[SelectionResult] = None

        # Logger
        self._logger = logging.getLogger(__name__)

    def start_monitoring(self) -> None:
        """
        Start monitoring the kernel.

        Transitions from IDLE to MONITORING state.
        """
        if self.state == OperatorState.STOPPED:
            self._logger.info("Restarting from STOPPED state")

        self.state = OperatorState.MONITORING
        self._start_time = time.time()
        self._logger.info(f"Started monitoring, state={self.state.name}")

    def stop(self) -> None:
        """
        Stop the operator.

        Transitions to STOPPED state.
        """
        self.state = OperatorState.STOPPED
        self._logger.info(f"Operator stopped, state={self.state.name}")

    def record_syscall(
        self,
        syscall: SysCall,
        latency_ns: int,
        success: bool,
        address: Optional[int] = None,
    ) -> None:
        """
        Record a syscall execution.

        Args:
            syscall: The syscall type
            latency_ns: Execution latency in nanoseconds
            success: Whether the syscall succeeded
            address: Optional memory address for pattern analysis
        """
        if self.state not in (OperatorState.MONITORING, OperatorState.ANALYZING):
            return

        # Convert SysCall enum to string for monitor
        syscall_name = syscall.name if isinstance(syscall, SysCall) else str(syscall)
        self.monitor.record_syscall(
            syscall=syscall_name,
            latency_ns=latency_ns,
            success=success,
            address=address,
        )

    def analyze(self) -> Optional[WorkloadSnapshot]:
        """
        Analyze current workload and return a snapshot.

        Returns:
            WorkloadSnapshot if data available, None otherwise
        """
        if self.monitor.samples_collected == 0:
            return None

        snapshot = self.monitor.get_snapshot()
        self._last_snapshot = snapshot
        return snapshot

    def tick(self) -> TickResult:
        """
        Execute one control loop iteration.

        Returns:
            TickResult describing what happened
        """
        self._tick_count += 1
        timestamp = time.time()

        if self.state == OperatorState.STOPPED:
            return TickResult(
                timestamp=timestamp,
                action_taken="stopped",
                details={"reason": "Operator is stopped"},
            )

        if self.state == OperatorState.IDLE:
            return TickResult(
                timestamp=timestamp,
                action_taken="idle",
                details={"reason": "Not monitoring"},
            )

        # Transition to ANALYZING
        prev_state = self.state
        self.state = OperatorState.ANALYZING

        # Get workload snapshot
        snapshot = self.analyze()

        if snapshot is None or snapshot.total_syscalls == 0:
            self.state = OperatorState.MONITORING
            return TickResult(
                timestamp=timestamp,
                action_taken="monitoring",
                details={"samples": 0, "reason": "No data collected yet"},
            )

        details: Dict[str, Any] = {
            "samples": snapshot.total_syscalls,
            "avg_latency_ns": snapshot.avg_latency_ns,
            "success_rate": snapshot.success_rate,
            "pattern": snapshot.detected_pattern.name,
        }

        # Check for high error rate
        if snapshot.success_rate < (1.0 - self.config.error_threshold):
            if self.config.auto_recover:
                self.state = OperatorState.RECOVERING
                details["recovery_triggered"] = True
                details["error_rate"] = 1.0 - snapshot.success_rate

                # Perform recovery actions
                recovery_result = self._perform_recovery(snapshot)
                details["recovery_result"] = recovery_result

                return TickResult(
                    timestamp=timestamp,
                    action_taken="recovering",
                    details=details,
                )

        # Get kernel selection recommendation
        current_kernel_type = self._get_current_kernel_type()
        selection = self.selector.select(
            snapshot=snapshot,
            current_kernel=current_kernel_type,
            auto_select=self.config.auto_select,
        )
        self._last_selection = selection

        details["selection_confidence"] = selection.confidence
        details["recommended_kernel"] = selection.recommended_kernel.name

        # Auto-select if enabled
        if self.config.auto_select and selection.should_switch:
            self.state = OperatorState.TUNING
            details["auto_selection"] = True
            details["switching_to"] = selection.recommended_kernel.name

            return TickResult(
                timestamp=timestamp,
                action_taken="auto_select",
                details=details,
                recommendations=selection,
            )

        # Auto-tune if enabled
        if self.config.auto_tune:
            tune_result = self._perform_tuning(snapshot)
            if tune_result:
                self.state = OperatorState.TUNING
                details["tuning"] = tune_result

                return TickResult(
                    timestamp=timestamp,
                    action_taken="auto_tune",
                    details=details,
                    recommendations=selection,
                )

        # Return to monitoring
        self.state = OperatorState.MONITORING
        self._last_tick = timestamp

        return TickResult(
            timestamp=timestamp,
            action_taken="monitoring",
            details=details,
            recommendations=selection,
        )

    def _get_current_kernel_type(self) -> KernelType:
        """Get the current kernel type."""
        if hasattr(self.kernel, 'config') and hasattr(self.kernel.config, 'kernel_type'):
            return self.kernel.config.kernel_type
        return KernelType.HYBRID

    def _perform_recovery(self, snapshot: WorkloadSnapshot) -> Dict[str, Any]:
        """Perform recovery actions for high error rate."""
        actions = []

        # Reset metrics to get fresh data
        self.monitor.reset()
        actions.append("reset_monitor")

        # If kernel has error handling, invoke it
        if hasattr(self.kernel, 'health_check'):
            health = self.kernel.health_check()
            actions.append(f"health_check:{health.get('state', 'unknown')}")

        return {
            "actions": actions,
            "timestamp": time.time(),
        }

    def _perform_tuning(self, snapshot: WorkloadSnapshot) -> Optional[Dict[str, Any]]:
        """Perform parameter tuning based on workload."""
        if not hasattr(self.kernel, 'config'):
            return None

        adjustments = {}

        # Adjust learning rate based on workload score
        if hasattr(self.kernel.config, 'learning_rate'):
            current_lr = self.kernel.config.learning_rate

            # Increase learning rate for high-performing workloads
            if snapshot.workload_score > 0.8:
                new_lr = min(current_lr * 1.05, 0.1)
                adjustments["learning_rate"] = {
                    "from": current_lr,
                    "to": new_lr,
                }
                self.kernel.config.learning_rate = new_lr

        if adjustments:
            return {
                "adjustments": adjustments,
                "timestamp": time.time(),
            }

        return None

    def get_recommendations(self) -> Dict[str, Any]:
        """
        Get current recommendations.

        Returns:
            Dictionary with selection recommendations and analysis
        """
        result = {
            "current_kernel": self._get_current_kernel_type().name,
            "recommended_kernel": KernelType.HYBRID.name,
            "confidence": 0.0,
            "selection_analysis": {
                "workload_type": "unknown",
            },
        }

        # Get latest snapshot
        snapshot = self._last_snapshot
        if snapshot is None:
            snapshot = self.analyze()

        if snapshot is not None:
            result["selection_analysis"]["workload_type"] = snapshot.detected_pattern.name.lower()

            # Get selection recommendation
            selection = self.selector.select(
                snapshot=snapshot,
                current_kernel=self._get_current_kernel_type(),
                auto_select=False,
            )

            result["recommended_kernel"] = selection.recommended_kernel.name
            result["confidence"] = selection.confidence
            result["selection_analysis"]["reasons"] = selection.reasons

        return result

    def health_check(self) -> Dict[str, Any]:
        """
        Perform a health check.

        Returns:
            Dictionary with health status
        """
        # Get kernel health
        kernel_health = {}
        if hasattr(self.kernel, 'health_check'):
            kernel_health = self.kernel.health_check()

        # Determine overall health
        healthy = True
        issues = []

        # Check error rate
        if self._last_snapshot and self._last_snapshot.success_rate < 0.9:
            healthy = False
            issues.append("high_error_rate")

        # Check kernel state
        if kernel_health.get("state") == "ERROR":
            healthy = False
            issues.append("kernel_error")

        return {
            "state": self.state.name,
            "healthy": healthy,
            "issues": issues,
            "kernel_health": kernel_health,
            "samples_collected": self.monitor.samples_collected,
            "uptime_seconds": time.time() - self._start_time,
            "tick_count": self._tick_count,
        }

    def set_policy(self, policy: SelectionPolicy) -> None:
        """
        Set the selection policy.

        Args:
            policy: The new selection policy
        """
        self.selector.set_policy(policy)

    def reset_metrics(self) -> None:
        """Reset all collected metrics."""
        self.monitor.reset()
        self._last_snapshot = None
        self._last_selection = None
