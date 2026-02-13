"""
Performance Profiler for Infinite Map OS

This module provides comprehensive performance profiling utilities for
identifying bottlenecks, detecting memory leaks, and generating reports.

Features:
- Operation-level profiling with timing and memory tracking
- Session-based continuous profiling
- Bottleneck identification
- Memory leak detection
- Report generation (text and JSON)
- Thread-safe statistics collection
"""

from dataclasses import dataclass, field, asdict
from typing import Callable, List, Optional, Dict, Any, Generator
from contextlib import contextmanager
import time
import threading
import json
from collections import defaultdict


# Try to import memory tracking modules with fallbacks
try:
    import tracemalloc
    TRACEMALLOC_AVAILABLE = True
except ImportError:
    TRACEMALLOC_AVAILABLE = False

try:
    import psutil
    PSUTIL_AVAILABLE = True
except ImportError:
    PSUTIL_AVAILABLE = False


@dataclass
class ProfileResult:
    """
    Result of profiling a single operation.

    Attributes:
        operation: Name of the operation profiled
        duration: Duration in seconds
        memory_before: Memory usage before operation (bytes)
        memory_after: Memory usage after operation (bytes)
        memory_delta: Memory change during operation (bytes)
        cpu_percent: CPU usage during operation (percent)
        calls: Number of times this operation has been called
        timestamp: Unix timestamp when profiled
    """
    operation: str
    duration: float
    memory_before: int
    memory_after: int
    memory_delta: int
    cpu_percent: float
    calls: int = 1
    timestamp: float = field(default_factory=time.time)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for JSON serialization."""
        return asdict(self)


@dataclass
class ProfilerStats:
    """
    Aggregated statistics for profiled operations.

    Attributes:
        total_operations: Total number of operations profiled
        total_duration: Sum of all durations in seconds
        total_memory_delta: Total memory change in bytes
        avg_duration: Average duration per operation
        max_duration: Maximum single operation duration
        min_duration: Minimum single operation duration
        operations_per_second: Throughput (ops/sec)
    """
    total_operations: int
    total_duration: float
    total_memory_delta: int
    avg_duration: float
    max_duration: float
    min_duration: float
    operations_per_second: float

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for JSON serialization."""
        return asdict(self)


class PerformanceProfiler:
    """
    Performance profiler for identifying bottlenecks and memory leaks.

    This class provides comprehensive profiling capabilities including:
    - Individual operation profiling with timing and memory tracking
    - Session-based continuous profiling
    - Bottleneck identification (slow operations)
    - Memory leak detection (memory growth patterns)
    - Report generation in text and JSON formats
    - Thread-safe statistics collection

    Example:
        >>> profiler = PerformanceProfiler()
        >>> result, data = profiler.profile_operation("load_file", load_data, "file.bin")
        >>> print(f"Duration: {result.duration:.3f}s, Memory: {result.memory_delta} bytes")

        >>> # Or use as context manager
        >>> with profiler.profile_block("processing"):
        ...     process_data(data)
    """

    def __init__(self):
        """Initialize the performance profiler."""
        self._lock = threading.RLock()
        self._results: List[ProfileResult] = []
        self._operation_counts: Dict[str, int] = defaultdict(int)
        self._session_active = False
        self._session_start_time: Optional[float] = None
        self._session_start_memory: Optional[int] = None

        # Memory tracking state
        self._tracemalloc_started = False
        if TRACEMALLOC_AVAILABLE and not tracemalloc.is_tracing():
            try:
                tracemalloc.start()
                self._tracemalloc_started = True
            except Exception:
                pass  # Failed to start tracemalloc, use fallback

    def _get_memory_usage(self) -> int:
        """Get current memory usage in bytes."""
        if TRACEMALLOC_AVAILABLE and tracemalloc.is_tracing():
            current, peak = tracemalloc.get_traced_memory()
            return current
        elif PSUTIL_AVAILABLE:
            process = psutil.Process()
            return process.memory_info().rss
        else:
            # Fallback: return 0 if no memory tracking available
            return 0

    def _get_cpu_percent(self) -> float:
        """Get current CPU usage percentage."""
        if PSUTIL_AVAILABLE:
            try:
                return psutil.cpu_percent(interval=0.001)
            except Exception:
                return 0.0
        return 0.0

    def profile_operation(
        self,
        name: str,
        func: Callable,
        *args,
        **kwargs
    ) -> tuple[Any, ProfileResult]:
        """
        Profile a single operation.

        Args:
            name: Operation name for identification
            func: Function to profile
            *args: Positional arguments to pass to func
            **kwargs: Keyword arguments to pass to func

        Returns:
            Tuple of (function_result, ProfileResult)

        Example:
            >>> def load_file(path):
            ...     with open(path, 'rb') as f:
            ...         return f.read()
            >>> result, profile = profiler.profile_operation("load", load_file, "data.bin")
            >>> print(f"Loaded in {profile.duration:.3f}s")
        """
        with self._lock:
            self._operation_counts[name] += 1
            calls = self._operation_counts[name]

        # Capture pre-operation state
        memory_before = self._get_memory_usage()
        cpu_start = self._get_cpu_percent()
        start_time = time.perf_counter()

        # Execute the function
        try:
            result = func(*args, **kwargs)
        finally:
            # Capture post-operation state
            end_time = time.perf_counter()
            memory_after = self._get_memory_usage()
            cpu_end = self._get_cpu_percent()

            # Calculate metrics
            duration = end_time - start_time
            memory_delta = memory_after - memory_before
            cpu_percent = (cpu_start + cpu_end) / 2  # Average during operation

            profile_result = ProfileResult(
                operation=name,
                duration=duration,
                memory_before=memory_before,
                memory_after=memory_after,
                memory_delta=memory_delta,
                cpu_percent=cpu_percent,
                calls=calls,
                timestamp=time.time()
            )

            with self._lock:
                self._results.append(profile_result)

        return result, profile_result

    @contextmanager
    def profile_block(self, name: str) -> Generator[None, None, None]:
        """
        Context manager for profiling a code block.

        Args:
            name: Operation name for identification

        Example:
            >>> with profiler.profile_block("data_processing"):
            ...     process_data(data)
        """
        with self._lock:
            self._operation_counts[name] += 1
            calls = self._operation_counts[name]

        # Capture pre-operation state
        memory_before = self._get_memory_usage()
        cpu_start = self._get_cpu_percent()
        start_time = time.perf_counter()
        error = None

        try:
            yield
        except Exception as e:
            error = e
            raise
        finally:
            # Capture post-operation state
            end_time = time.perf_counter()
            memory_after = self._get_memory_usage()
            cpu_end = self._get_cpu_percent()

            # Calculate metrics
            duration = end_time - start_time
            memory_delta = memory_after - memory_before
            cpu_percent = (cpu_start + cpu_end) / 2

            profile_result = ProfileResult(
                operation=name,
                duration=duration,
                memory_before=memory_before,
                memory_after=memory_after,
                memory_delta=memory_delta,
                cpu_percent=cpu_percent,
                calls=calls,
                timestamp=time.time()
            )

            with self._lock:
                self._results.append(profile_result)

    def start_profiling(self) -> None:
        """
        Start a continuous profiling session.

        This marks the beginning of a profiling session. Call stop_profiling()
        to get aggregated statistics for the session.

        Example:
            >>> profiler.start_profiling()
            >>> # ... run operations ...
            >>> stats = profiler.stop_profiling()
            >>> print(f"Total operations: {stats.total_operations}")
        """
        with self._lock:
            if self._session_active:
                raise RuntimeError("Profiling session already active")

            self._session_active = True
            self._session_start_time = time.perf_counter()
            self._session_start_memory = self._get_memory_usage()

    def stop_profiling(self) -> ProfilerStats:
        """
        Stop the current profiling session and return statistics.

        Returns:
            ProfilerStats with aggregated session statistics

        Raises:
            RuntimeError: If no profiling session is active
        """
        with self._lock:
            if not self._session_active:
                raise RuntimeError("No profiling session active")

            session_end_time = time.perf_counter()
            session_end_memory = self._get_memory_usage()

            # Get all results from this session
            session_results = [
                r for r in self._results
                if r.timestamp >= self._session_start_time
            ]

            if not session_results:
                stats = ProfilerStats(
                    total_operations=0,
                    total_duration=0.0,
                    total_memory_delta=0,
                    avg_duration=0.0,
                    max_duration=0.0,
                    min_duration=0.0,
                    operations_per_second=0.0
                )
            else:
                durations = [r.duration for r in session_results]
                total_duration = sum(durations)
                total_ops = len(session_results)

                stats = ProfilerStats(
                    total_operations=total_ops,
                    total_duration=total_duration,
                    total_memory_delta=session_end_memory - self._session_start_memory,
                    avg_duration=total_duration / total_ops if total_ops > 0 else 0.0,
                    max_duration=max(durations),
                    min_duration=min(durations),
                    operations_per_second=total_ops / total_duration if total_duration > 0 else 0.0
                )

            self._session_active = False
            return stats

    def get_bottlenecks(self, threshold_ms: float = 100) -> List[ProfileResult]:
        """
        Identify slow operations that exceed the threshold.

        Args:
            threshold_ms: Minimum duration in milliseconds to be considered a bottleneck

        Returns:
            List of ProfileResult for operations exceeding the threshold,
            sorted by duration (slowest first)

        Example:
            >>> bottlenecks = profiler.get_bottlenecks(threshold_ms=50)
            >>> for b in bottlenecks:
            ...     print(f"{b.operation}: {b.duration*1000:.1f}ms")
        """
        threshold_seconds = threshold_ms / 1000.0

        with self._lock:
            bottlenecks = [
                r for r in self._results
                if r.duration >= threshold_seconds
            ]

        # Sort by duration, slowest first
        bottlenecks.sort(key=lambda x: x.duration, reverse=True)
        return bottlenecks

    def get_memory_leaks(self, threshold_bytes: int = 1024) -> List[ProfileResult]:
        """
        Detect operations that show memory growth patterns.

        This identifies operations that consistently increase memory usage,
        which may indicate memory leaks.

        Args:
            threshold_bytes: Minimum memory delta in bytes to be considered significant

        Returns:
            List of ProfileResult for operations with significant memory growth,
            sorted by memory delta (largest first)

        Example:
            >>> leaks = profiler.get_memory_leaks(threshold_bytes=4096)
            >>> for leak in leaks:
            ...     print(f"{leak.operation}: {leak.memory_delta} bytes leaked")
        """
        with self._lock:
            # Group by operation name
            operation_deltas: Dict[str, List[int]] = defaultdict(list)
            for r in self._results:
                operation_deltas[r.operation].append(r.memory_delta)

            # Find operations with consistent positive memory growth
            leak_operations = set()
            for op_name, deltas in operation_deltas.items():
                if len(deltas) >= 2:
                    # Check if there's a trend of increasing memory
                    avg_delta = sum(deltas) / len(deltas)
                    positive_count = sum(1 for d in deltas if d > threshold_bytes)

                    # If more than half the calls show growth above threshold
                    if positive_count > len(deltas) / 2 and avg_delta > threshold_bytes:
                        leak_operations.add(op_name)

            # Get all results for leak operations
            leaks = [
                r for r in self._results
                if r.operation in leak_operations and r.memory_delta > threshold_bytes
            ]

        # Sort by memory delta, largest first
        leaks.sort(key=lambda x: x.memory_delta, reverse=True)
        return leaks

    def get_stats(self, operation: Optional[str] = None) -> Optional[ProfilerStats]:
        """
        Get aggregated statistics for an operation or all operations.

        Args:
            operation: Optional operation name to filter by. If None, returns
                      stats for all operations.

        Returns:
            ProfilerStats for the specified operation(s), or None if no data available

        Example:
            >>> stats = profiler.get_stats("load_file")
            >>> if stats:
            ...     print(f"Average: {stats.avg_duration:.3f}s")
        """
        with self._lock:
            if operation:
                results = [r for r in self._results if r.operation == operation]
            else:
                results = self._results.copy()

        if not results:
            return None

        durations = [r.duration for r in results]
        total_duration = sum(durations)
        total_ops = len(results)

        return ProfilerStats(
            total_operations=total_ops,
            total_duration=total_duration,
            total_memory_delta=sum(r.memory_delta for r in results),
            avg_duration=total_duration / total_ops,
            max_duration=max(durations),
            min_duration=min(durations),
            operations_per_second=total_ops / total_duration if total_duration > 0 else 0.0
        )

    def clear_stats(self) -> None:
        """
        Clear all collected profiling statistics.

        Example:
            >>> profiler.clear_stats()
            >>> assert profiler.get_stats() is None
        """
        with self._lock:
            self._results.clear()
            self._operation_counts.clear()
            self._session_active = False
            self._session_start_time = None
            self._session_start_memory = None

    def generate_report(self, format: str = "text") -> str:
        """
        Generate a performance report.

        Args:
            format: Output format - "text" for human-readable or "json" for JSON

        Returns:
            Formatted report string

        Example:
            >>> report = profiler.generate_report(format="text")
            >>> print(report)
        """
        with self._lock:
            results = self._results.copy()

        if format == "json":
            return self._generate_json_report(results)
        else:
            return self._generate_text_report(results)

    def _generate_text_report(self, results: List[ProfileResult]) -> str:
        """Generate human-readable text report."""
        if not results:
            return "Performance Profiler Report\n==========================\n\nNo profiling data collected.\n"

        # Group by operation
        operations: Dict[str, List[ProfileResult]] = defaultdict(list)
        for r in results:
            operations[r.operation].append(r)

        lines = [
            "Performance Profiler Report",
            "=" * 50,
            "",
            f"Total Operations Profiled: {len(results)}",
            f"Unique Operations: {len(operations)}",
            "",
        ]

        # Operation summary
        lines.append("Operation Summary:")
        lines.append("-" * 50)

        for op_name, op_results in sorted(operations.items()):
            durations = [r.duration for r in op_results]
            total_duration = sum(durations)
            avg_duration = total_duration / len(durations)
            total_memory = sum(r.memory_delta for r in op_results)

            lines.append(f"\n{op_name}:")
            lines.append(f"  Calls: {len(op_results)}")
            lines.append(f"  Total Duration: {total_duration:.4f}s")
            lines.append(f"  Average Duration: {avg_duration:.4f}s")
            lines.append(f"  Min Duration: {min(durations):.4f}s")
            lines.append(f"  Max Duration: {max(durations):.4f}s")
            lines.append(f"  Total Memory Delta: {total_memory:,} bytes")

            if total_duration > 0:
                ops_per_sec = len(op_results) / total_duration
                lines.append(f"  Operations/sec: {ops_per_sec:.2f}")

        # Bottlenecks
        bottlenecks = self.get_bottlenecks(threshold_ms=50)
        if bottlenecks:
            lines.append("")
            lines.append("Bottlenecks (>50ms):")
            lines.append("-" * 50)
            for b in bottlenecks[:10]:  # Top 10
                lines.append(f"  {b.operation}: {b.duration*1000:.2f}ms (call #{b.calls})")

        # Memory concerns
        memory_leaks = self.get_memory_leaks(threshold_bytes=1024)
        if memory_leaks:
            lines.append("")
            lines.append("Potential Memory Leaks (>1KB growth):")
            lines.append("-" * 50)
            for m in memory_leaks[:10]:  # Top 10
                lines.append(f"  {m.operation}: {m.memory_delta:,} bytes (call #{m.calls})")

        lines.append("")
        lines.append("=" * 50)
        return "\n".join(lines)

    def _generate_json_report(self, results: List[ProfileResult]) -> str:
        """Generate JSON report."""
        if not results:
            return json.dumps({"error": "No profiling data collected"}, indent=2)

        # Group by operation
        operations: Dict[str, List[ProfileResult]] = defaultdict(list)
        for r in results:
            operations[r.operation].append(r)

        report = {
            "summary": {
                "total_operations": len(results),
                "unique_operations": len(operations),
            },
            "operations": {},
            "bottlenecks": [],
            "memory_leaks": []
        }

        # Per-operation stats
        for op_name, op_results in operations.items():
            durations = [r.duration for r in op_results]
            total_duration = sum(durations)

            report["operations"][op_name] = {
                "calls": len(op_results),
                "total_duration": total_duration,
                "avg_duration": total_duration / len(durations),
                "min_duration": min(durations),
                "max_duration": max(durations),
                "total_memory_delta": sum(r.memory_delta for r in op_results),
                "operations_per_second": len(op_results) / total_duration if total_duration > 0 else 0
            }

        # Bottlenecks
        for b in self.get_bottlenecks(threshold_ms=50):
            report["bottlenecks"].append(b.to_dict())

        # Memory leaks
        for m in self.get_memory_leaks(threshold_bytes=1024):
            report["memory_leaks"].append(m.to_dict())

        return json.dumps(report, indent=2)

    def __del__(self):
        """Cleanup on deletion."""
        if self._tracemalloc_started and TRACEMALLOC_AVAILABLE:
            try:
                tracemalloc.stop()
            except Exception:
                pass


# Convenience function for quick profiling
def profile(func: Callable) -> Callable:
    """
    Decorator for profiling a function.

    Example:
        >>> @profile
        ... def slow_function():
        ...     time.sleep(0.1)
        ...     return "done"
    """
    profiler = PerformanceProfiler()

    def wrapper(*args, **kwargs):
        result, _ = profiler.profile_operation(func.__name__, func, *args, **kwargs)
        return result

    wrapper._profiler = profiler
    wrapper.__name__ = func.__name__
    wrapper.__doc__ = func.__doc__
    return wrapper
