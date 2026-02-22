"""
Kernel Selector (Task 2 - Phase L)

Selects optimal kernel type based on workload characteristics.
Uses WorkloadSnapshot data to make informed kernel selection decisions.
"""

from dataclasses import dataclass, field
from enum import Enum, auto
from typing import Dict, List, Optional, Any
import time

from .unified_neural_kernel import KernelType, SysCall
from .workload_monitor import WorkloadSnapshot, WorkloadPattern


class SelectionPolicy(Enum):
    """Policy for kernel selection decisions."""
    PERFORMANCE = auto()     # Prioritize raw performance
    EFFICIENCY = auto()      # Prioritize power/memory efficiency
    BALANCED = auto()        # Balance between performance and efficiency
    CONSERVATIVE = auto()    # Prefer stable, well-tested options
    AGGRESSIVE = auto()      # Prefer cutting-edge optimizations


@dataclass
class SelectionConfig:
    """Configuration for KernelSelector."""
    default_policy: SelectionPolicy = SelectionPolicy.BALANCED
    latency_threshold_ns: int = 10000  # 10 microseconds
    gpu_preferred_for_patterns: List[WorkloadPattern] = field(
        default_factory=lambda: [WorkloadPattern.SEQUENTIAL, WorkloadPattern.STRIDED]
    )
    cpu_preferred_for_patterns: List[WorkloadPattern] = field(
        default_factory=lambda: [WorkloadPattern.RANDOM, WorkloadPattern.MIXED]
    )


@dataclass
class SelectionResult:
    """Result of a kernel selection decision."""
    timestamp: float = field(default_factory=time.time)
    recommended_kernel: KernelType = KernelType.HYBRID
    current_kernel: KernelType = KernelType.HYBRID
    confidence: float = 0.0
    auto_selected: bool = False
    reasons: List[str] = field(default_factory=list)
    workload_match: Dict[str, float] = field(default_factory=dict)
    should_switch: bool = False

    def to_dict(self) -> Dict[str, Any]:
        """Convert result to dictionary."""
        return {
            "timestamp": self.timestamp,
            "recommended_kernel": self.recommended_kernel.name,
            "current_kernel": self.current_kernel.name,
            "confidence": self.confidence,
            "auto_selected": self.auto_selected,
            "reasons": self.reasons,
            "workload_match": self.workload_match,
            "should_switch": self.should_switch,
        }


class KernelSelector:
    """
    Selects optimal kernel type based on workload analysis.

    Analyzes workload snapshots to determine the best kernel type
    for current operating conditions.

    Usage:
        selector = KernelSelector()
        result = selector.select(snapshot, current_kernel=KernelType.HYBRID)
        if result.should_switch:
            switch_to(result.recommended_kernel)
    """

    def __init__(self, config: Optional[SelectionConfig] = None):
        self.config = config or SelectionConfig()
        self.policy = self.config.default_policy

        # Selection history for learning
        self._selection_history: List[SelectionResult] = []
        self._max_history: int = 100

    def select(
        self,
        snapshot: Optional[WorkloadSnapshot],
        current_kernel: KernelType = KernelType.HYBRID,
        auto_select: bool = False,
    ) -> SelectionResult:
        """
        Select optimal kernel based on workload snapshot.

        Args:
            snapshot: Current workload snapshot (can be None for default)
            current_kernel: Currently active kernel type
            auto_select: Whether this is an automatic selection

        Returns:
            SelectionResult with recommendation
        """
        result = SelectionResult(
            current_kernel=current_kernel,
            auto_selected=auto_select,
        )

        if snapshot is None or snapshot.total_syscalls == 0:
            result.recommended_kernel = current_kernel
            result.confidence = 0.0
            result.reasons = ["No workload data available"]
            return result

        # Calculate scores for each kernel type
        scores = self._calculate_kernel_scores(snapshot)

        # Find best kernel
        best_kernel = max(scores.keys(), key=lambda k: scores[k])
        best_score = scores[best_kernel]

        result.recommended_kernel = best_kernel
        result.confidence = best_score
        result.workload_match = {k.name: v for k, v in scores.items()}
        result.should_switch = best_kernel != current_kernel and best_score > 0.6

        # Generate reasons
        result.reasons = self._generate_reasons(snapshot, scores, best_kernel)

        # Store in history
        self._selection_history.append(result)
        if len(self._selection_history) > self._max_history:
            self._selection_history.pop(0)

        return result

    def _calculate_kernel_scores(
        self,
        snapshot: WorkloadSnapshot
    ) -> Dict[KernelType, float]:
        """Calculate fitness scores for each kernel type."""
        scores = {
            KernelType.HYBRID: 0.5,      # Default, balanced
            KernelType.GPU_RESIDENT: 0.3, # Good for parallel patterns
            KernelType.DISPATCHER: 0.3,   # Good for mixed workloads
        }

        # Adjust based on workload pattern
        pattern = snapshot.detected_pattern

        if pattern in self.config.gpu_preferred_for_patterns:
            scores[KernelType.GPU_RESIDENT] += 0.3
            scores[KernelType.HYBRID] += 0.1
        elif pattern in self.config.cpu_preferred_for_patterns:
            scores[KernelType.DISPATCHER] += 0.2
            scores[KernelType.HYBRID] += 0.2

        # Adjust based on latency requirements
        if snapshot.avg_latency_ns < self.config.latency_threshold_ns:
            # Low latency - prefer GPU for throughput
            scores[KernelType.GPU_RESIDENT] += 0.2
        else:
            # High latency - prefer hybrid for flexibility
            scores[KernelType.HYBRID] += 0.2

        # Adjust based on success rate
        if snapshot.success_rate > 0.99:
            # Very stable - can use aggressive optimizations
            scores[KernelType.GPU_RESIDENT] += 0.1
        elif snapshot.success_rate < 0.95:
            # Unstable - prefer conservative hybrid
            scores[KernelType.HYBRID] += 0.2
            scores[KernelType.GPU_RESIDENT] -= 0.1

        # Adjust based on policy
        if self.policy == SelectionPolicy.PERFORMANCE:
            scores[KernelType.GPU_RESIDENT] += 0.15
        elif self.policy == SelectionPolicy.EFFICIENCY:
            scores[KernelType.HYBRID] += 0.1
        elif self.policy == SelectionPolicy.CONSERVATIVE:
            scores[KernelType.HYBRID] += 0.2
            scores[KernelType.GPU_RESIDENT] -= 0.1

        # Normalize scores to 0-1 range
        for kernel in scores:
            scores[kernel] = max(0.0, min(1.0, scores[kernel]))

        return scores

    def _generate_reasons(
        self,
        snapshot: WorkloadSnapshot,
        scores: Dict[KernelType, float],
        best_kernel: KernelType,
    ) -> List[str]:
        """Generate human-readable reasons for the selection."""
        reasons = []

        # Pattern-based reason
        pattern = snapshot.detected_pattern
        if pattern != WorkloadPattern.UNKNOWN:
            reasons.append(f"Detected {pattern.name.lower()} access pattern")

        # Latency-based reason
        if snapshot.avg_latency_ns < 1000:
            reasons.append("Low latency workload")
        elif snapshot.avg_latency_ns > 100000:
            reasons.append("High latency workload")

        # Success rate reason
        if snapshot.success_rate < 0.95:
            reasons.append(f"Success rate concern: {snapshot.success_rate:.1%}")

        # Hot syscall reason
        if snapshot.hot_syscalls:
            hot = snapshot.hot_syscalls[:3]
            reasons.append(f"Hot syscalls: {', '.join(hot)}")

        # Score-based reason
        reasons.append(
            f"{best_kernel.name} scored {scores[best_kernel]:.2f} "
            f"(vs {scores.get(KernelType.HYBRID, 0):.2f} for HYBRID)"
        )

        return reasons

    def set_policy(self, policy: SelectionPolicy) -> None:
        """Set the selection policy."""
        self.policy = policy

    def get_policy(self) -> SelectionPolicy:
        """Get the current selection policy."""
        return self.policy

    def get_selection_history(self, limit: int = 10) -> List[SelectionResult]:
        """Get recent selection history."""
        return self._selection_history[-limit:]

    def analyze_trends(self) -> Dict[str, Any]:
        """Analyze selection trends over time."""
        if not self._selection_history:
            return {"trend": "no_data"}

        # Count kernel recommendations
        kernel_counts: Dict[KernelType, int] = {}
        for result in self._selection_history:
            kernel = result.recommended_kernel
            kernel_counts[kernel] = kernel_counts.get(kernel, 0) + 1

        # Calculate average confidence
        avg_confidence = sum(
            r.confidence for r in self._selection_history
        ) / len(self._selection_history)

        # Determine dominant recommendation
        dominant_kernel = max(kernel_counts.keys(), key=lambda k: kernel_counts[k])

        return {
            "total_selections": len(self._selection_history),
            "kernel_distribution": {k.name: v for k, v in kernel_counts.items()},
            "dominant_recommendation": dominant_kernel.name,
            "average_confidence": avg_confidence,
        }
