#!/usr/bin/env python3
"""Workload Monitor for Autonomous Kernel Operator.

This module provides real-time monitoring and analysis of syscall patterns
to support autonomous kernel decision-making.

Part of Phase L: Autonomous Kernel Operator
Task 1: WorkloadMonitor for detecting syscall patterns.
"""

import time
from dataclasses import dataclass, field
from enum import Enum, auto
from typing import Dict, List, Optional
from collections import deque
import statistics


class WorkloadPattern(Enum):
    """Enumeration of detectable syscall patterns."""
    SEQUENTIAL = auto()      # Linear address progression
    STRIDED = auto()         # Fixed stride access
    RANDOM = auto()          # No discernible pattern
    LOOPING = auto()         # Repeating address sequence
    MIXED = auto()           # Multiple patterns combined
    UNKNOWN = auto()         # Insufficient data to determine pattern


@dataclass
class SyscallRecord:
    """Record of a single syscall invocation."""
    syscall: str
    latency_ns: int
    success: bool
    timestamp: float
    address: Optional[int] = None
    size: Optional[int] = None


@dataclass
class WorkloadSnapshot:
    """Snapshot of workload statistics at a point in time."""
    timestamp: float
    total_syscalls: int
    avg_latency_ns: float
    p95_latency_ns: float
    success_rate: float
    syscall_distribution: Dict[str, int]
    detected_pattern: WorkloadPattern
    workload_score: float
    hot_syscalls: List[str]


class WorkloadMonitor:
    """Monitor for detecting syscall patterns and workload characteristics.

    Analyzes syscall behavior to identify patterns (sequential, random, looping, etc.)
    and calculates workload scores for autonomous decision-making.

    Attributes:
        sample_window: Maximum number of syscalls to keep in history.
    """

    def __init__(self, sample_window: int = 100):
        """Initialize the WorkloadMonitor.

        Args:
            sample_window: Maximum number of syscall records to retain.
                          Older records are discarded as new ones arrive.
        """
        self.sample_window = sample_window
        self._syscall_history: deque = deque(maxlen=sample_window)
        self._start_time: float = time.time()

    def record_syscall(
        self,
        syscall: str,
        latency_ns: int,
        success: bool,
        address: Optional[int] = None,
        size: Optional[int] = None
    ) -> None:
        """Record a syscall invocation.

        Args:
            syscall: Name of the syscall (e.g., "read", "write").
            latency_ns: Latency of the syscall in nanoseconds.
            success: Whether the syscall succeeded.
            address: Optional memory address involved in the syscall.
            size: Optional size parameter for the syscall.
        """
        record = SyscallRecord(
            syscall=syscall,
            latency_ns=latency_ns,
            success=success,
            timestamp=time.time(),
            address=address,
            size=size
        )
        self._syscall_history.append(record)

    def get_snapshot(self) -> WorkloadSnapshot:
        """Get a snapshot of current workload statistics.

        Returns:
            WorkloadSnapshot containing current metrics and patterns.
        """
        history = list(self._syscall_history)

        if not history:
            return WorkloadSnapshot(
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

        # Calculate basic statistics
        total = len(history)
        latencies = [r.latency_ns for r in history]
        successes = sum(1 for r in history if r.success)

        avg_latency = statistics.mean(latencies) if latencies else 0.0
        success_rate = successes / total if total > 0 else 1.0

        # Calculate p95 latency
        sorted_latencies = sorted(latencies)
        p95_index = int(len(sorted_latencies) * 0.95)
        p95_latency = sorted_latencies[min(p95_index, len(sorted_latencies) - 1)]

        # Calculate syscall distribution
        distribution: Dict[str, int] = {}
        for record in history:
            distribution[record.syscall] = distribution.get(record.syscall, 0) + 1

        # Detect pattern and calculate score
        pattern = self.detect_pattern()
        score = self.calculate_workload_score()
        hot = self.get_hot_syscalls()

        return WorkloadSnapshot(
            timestamp=time.time(),
            total_syscalls=total,
            avg_latency_ns=avg_latency,
            p95_latency_ns=p95_latency,
            success_rate=success_rate,
            syscall_distribution=distribution,
            detected_pattern=pattern,
            workload_score=score,
            hot_syscalls=hot
        )

    def detect_pattern(self) -> WorkloadPattern:
        """Detect the access pattern from recent syscall history.

        Analyzes address sequences to determine if access is sequential,
        strided, random, looping, or mixed.

        Returns:
            WorkloadPattern indicating the detected pattern type.
        """
        history = list(self._syscall_history)

        # Need at least 5 records for meaningful pattern detection
        if len(history) < 5:
            return WorkloadPattern.UNKNOWN

        # Extract addresses
        addresses = [r.address for r in history if r.address is not None]

        # If no address info, return UNKNOWN
        if len(addresses) < 5:
            return WorkloadPattern.UNKNOWN

        # Check for looping pattern (repeated addresses)
        if self._detect_looping(addresses):
            return WorkloadPattern.LOOPING

        # Check for sequential or strided pattern
        if self._detect_sequential_or_strided(addresses):
            # Determine if it's sequential (large strides) or strided (smaller)
            strides = [addresses[i+1] - addresses[i] for i in range(len(addresses)-1)]
            if all(s > 0 for s in strides):
                return WorkloadPattern.SEQUENTIAL
            return WorkloadPattern.STRIDED

        # Check if it's truly random or mixed
        if self._is_random_pattern(addresses):
            return WorkloadPattern.RANDOM

        return WorkloadPattern.MIXED

    def _detect_looping(self, addresses: List[int]) -> bool:
        """Detect if addresses form a looping pattern."""
        if len(addresses) < 8:
            return False

        # Look for repeating sequences
        # Try different sequence lengths from 2 to len/4
        max_seq_len = len(addresses) // 4

        for seq_len in range(2, max_seq_len + 1):
            # Get the first sequence
            first_seq = addresses[:seq_len]

            # Check if it repeats at least 2 more times
            matches = 0
            for start in range(seq_len, len(addresses) - seq_len + 1, seq_len):
                if addresses[start:start + seq_len] == first_seq:
                    matches += 1

            # If we have at least 2 full matches, it's looping
            if matches >= 2:
                return True

        return False

    def _detect_sequential_or_strided(self, addresses: List[int]) -> bool:
        """Detect if addresses follow a sequential or strided pattern."""
        if len(addresses) < 5:
            return False

        # Calculate strides
        strides = []
        for i in range(len(addresses) - 1):
            stride = addresses[i + 1] - addresses[i]
            strides.append(stride)

        if not strides:
            return False

        # Check if strides are consistent (same sign and magnitude)
        # Allow 20% variance for strided pattern
        positive_strides = [s for s in strides if s > 0]
        negative_strides = [s for s in strides if s < 0]

        # Predominantly one direction
        if len(positive_strides) >= len(strides) * 0.8:
            test_strides = positive_strides
        elif len(negative_strides) >= len(strides) * 0.8:
            test_strides = [abs(s) for s in negative_strides]
        else:
            return False

        if not test_strides:
            return False

        # Check stride consistency
        mean_stride = statistics.mean(test_strides)
        if mean_stride == 0:
            return False

        # Allow 30% variance in stride
        variance = statistics.stdev(test_strides) if len(test_strides) > 1 else 0
        cv = variance / mean_stride if mean_stride != 0 else float('inf')

        return cv < 0.3

    def _is_random_pattern(self, addresses: List[int]) -> bool:
        """Check if addresses appear random (no consistent pattern)."""
        if len(addresses) < 5:
            return True

        # Calculate strides
        strides = [addresses[i+1] - addresses[i] for i in range(len(addresses)-1)]

        # Check for high variance in both magnitude and direction
        positive = sum(1 for s in strides if s > 0)
        negative = sum(1 for s in strides if s < 0)

        # If roughly equal mix of directions, likely random
        total = len(strides)
        if 0.3 * total <= positive <= 0.7 * total:
            return True

        # Check magnitude variance
        abs_strides = [abs(s) for s in strides if s != 0]
        if not abs_strides:
            return True

        mean_stride = statistics.mean(abs_strides)
        if mean_stride == 0:
            return True

        stdev = statistics.stdev(abs_strides) if len(abs_strides) > 1 else 0
        cv = stdev / mean_stride

        # High coefficient of variation indicates randomness
        return cv > 0.5

    def calculate_workload_score(self) -> float:
        """Calculate a workload score based on performance metrics.

        Score is based on:
        - Success rate (higher is better)
        - Latency (lower is better)
        - Frequency of operations

        Returns:
            Float between 0.0 (poor) and 1.0 (excellent).
        """
        history = list(self._syscall_history)

        if not history:
            return 0.0

        # Calculate component scores
        total = len(history)

        # Success rate component (0-0.4 weight)
        successes = sum(1 for r in history if r.success)
        success_score = (successes / total) * 0.4

        # Latency component (0-0.4 weight)
        # Score decreases as latency increases
        # 100ns = max score, 1s = min score
        latencies = [r.latency_ns for r in history]
        avg_latency = statistics.mean(latencies)

        # Normalize latency: 100ns -> 1.0, 1s -> 0.0
        # Using logarithmic scale
        import math
        if avg_latency <= 100:
            latency_score = 0.4
        elif avg_latency >= 1_000_000_000:  # 1 second
            latency_score = 0.0
        else:
            # Log scale between 100ns and 1s
            log_min = math.log10(100)
            log_max = math.log10(1_000_000_000)
            log_current = math.log10(avg_latency)
            latency_score = 0.4 * (1 - (log_current - log_min) / (log_max - log_min))

        # Frequency component (0-0.2 weight)
        # Higher frequency = higher score (up to sample_window ops)
        frequency_score = min(total / self.sample_window, 1.0) * 0.2

        return success_score + latency_score + frequency_score

    def get_hot_syscalls(self, threshold: float = 0.1) -> List[str]:
        """Get syscalls that exceed the frequency threshold.

        Args:
            threshold: Minimum fraction of total calls to be considered "hot".
                      Default 0.1 means syscall must be > 10% of total.

        Returns:
            List of syscall names that exceed the threshold.
        """
        history = list(self._syscall_history)

        if not history:
            return []

        total = len(history)
        distribution: Dict[str, int] = {}

        for record in history:
            distribution[record.syscall] = distribution.get(record.syscall, 0) + 1

        hot = [
            syscall for syscall, count in distribution.items()
            if count / total >= threshold
        ]

        # Sort by frequency (descending)
        hot.sort(key=lambda s: distribution[s], reverse=True)

        return hot

    def reset(self) -> None:
        """Clear all history and reset the monitor."""
        self._syscall_history.clear()
        self._start_time = time.time()
