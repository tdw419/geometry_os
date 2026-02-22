"""
Tests for Performance Profiler.

Tests the profiling infrastructure including:
- ProfileResult dataclass
- ProfilerStats dataclass
- PerformanceProfiler class
- Bottleneck identification
- Memory leak detection
- Report generation
"""

import pytest
import time
import json
from dataclasses import asdict

from systems.pixel_compiler.performance_profiler import (
    ProfileResult,
    ProfilerStats,
    PerformanceProfiler,
    profile
)


class TestProfileResult:
    """Tests for ProfileResult dataclass."""

    def test_profile_result_creation(self):
        """Test that ProfileResult can be created with all fields."""
        result = ProfileResult(
            operation="test_op",
            duration=0.123,
            memory_before=1000,
            memory_after=1500,
            memory_delta=500,
            cpu_percent=25.5,
            calls=1,
            timestamp=time.time()
        )

        assert result.operation == "test_op"
        assert result.duration == 0.123
        assert result.memory_before == 1000
        assert result.memory_after == 1500
        assert result.memory_delta == 500
        assert result.cpu_percent == 25.5
        assert result.calls == 1

    def test_profile_result_default_timestamp(self):
        """Test that ProfileResult has auto-generated timestamp."""
        before = time.time()
        result = ProfileResult(
            operation="test",
            duration=0.1,
            memory_before=0,
            memory_after=0,
            memory_delta=0,
            cpu_percent=0.0
        )
        after = time.time()

        assert before <= result.timestamp <= after

    def test_profile_result_to_dict(self):
        """Test converting ProfileResult to dictionary."""
        result = ProfileResult(
            operation="test_op",
            duration=0.5,
            memory_before=100,
            memory_after=200,
            memory_delta=100,
            cpu_percent=50.0,
            calls=3
        )

        data = result.to_dict()

        assert data["operation"] == "test_op"
        assert data["duration"] == 0.5
        assert data["memory_delta"] == 100
        assert data["calls"] == 3


class TestProfilerStats:
    """Tests for ProfilerStats dataclass."""

    def test_profiler_stats_creation(self):
        """Test that ProfilerStats can be created with all fields."""
        stats = ProfilerStats(
            total_operations=100,
            total_duration=10.5,
            total_memory_delta=5000,
            avg_duration=0.105,
            max_duration=0.5,
            min_duration=0.05,
            operations_per_second=9.52
        )

        assert stats.total_operations == 100
        assert stats.total_duration == 10.5
        assert stats.total_memory_delta == 5000
        assert stats.avg_duration == 0.105
        assert stats.max_duration == 0.5
        assert stats.min_duration == 0.05
        assert stats.operations_per_second == 9.52

    def test_profiler_stats_to_dict(self):
        """Test converting ProfilerStats to dictionary."""
        stats = ProfilerStats(
            total_operations=50,
            total_duration=5.0,
            total_memory_delta=1000,
            avg_duration=0.1,
            max_duration=0.2,
            min_duration=0.05,
            operations_per_second=10.0
        )

        data = stats.to_dict()

        assert data["total_operations"] == 50
        assert data["operations_per_second"] == 10.0


class TestPerformanceProfiler:
    """Tests for PerformanceProfiler class."""

    def test_profiler_creation(self):
        """Test that PerformanceProfiler can be created."""
        profiler = PerformanceProfiler()

        assert profiler is not None
        stats = profiler.get_stats()
        assert stats is None  # No data yet

    def test_profile_operation_returns_result(self):
        """Test that profile_operation returns function result."""
        profiler = PerformanceProfiler()

        def add(a, b):
            return a + b

        result, profile = profiler.profile_operation("add", add, 2, 3)

        assert result == 5
        assert profile.operation == "add"
        assert profile.duration >= 0

    def test_profile_operation_with_kwargs(self):
        """Test profile_operation with keyword arguments."""
        profiler = PerformanceProfiler()

        def greet(name, greeting="Hello"):
            return f"{greeting}, {name}!"

        result, profile = profiler.profile_operation(
            "greet", greet, "World", greeting="Hi"
        )

        assert result == "Hi, World!"
        assert profile.operation == "greet"

    def test_profile_operation_tracks_calls(self):
        """Test that profile_operation tracks number of calls."""
        profiler = PerformanceProfiler()

        def dummy():
            pass

        for i in range(5):
            _, profile = profiler.profile_operation("dummy", dummy)
            assert profile.calls == i + 1

    def test_profile_operation_measures_time(self):
        """Test that profile_operation measures duration."""
        profiler = PerformanceProfiler()

        def slow():
            time.sleep(0.01)
            return "done"

        _, profile = profiler.profile_operation("slow", slow)

        # Should be at least 10ms
        assert profile.duration >= 0.01

    def test_profile_block_context_manager(self):
        """Test profile_block as context manager."""
        profiler = PerformanceProfiler()

        with profiler.profile_block("test_block"):
            time.sleep(0.01)

        stats = profiler.get_stats("test_block")
        assert stats is not None
        assert stats.total_operations == 1
        assert stats.avg_duration >= 0.01

    def test_profile_block_multiple_calls(self):
        """Test multiple profile_block calls."""
        profiler = PerformanceProfiler()

        for _ in range(3):
            with profiler.profile_block("iterative"):
                pass

        stats = profiler.get_stats("iterative")
        assert stats.total_operations == 3

    def test_profile_block_exception_handling(self):
        """Test that profile_block handles exceptions."""
        profiler = PerformanceProfiler()

        with pytest.raises(ValueError):
            with profiler.profile_block("error_case"):
                raise ValueError("test error")

        # Should still have recorded the profile
        stats = profiler.get_stats("error_case")
        assert stats is not None
        assert stats.total_operations == 1

    def test_start_stop_profiling(self):
        """Test start_profiling and stop_profiling."""
        profiler = PerformanceProfiler()

        profiler.start_profiling()

        for _ in range(5):
            with profiler.profile_block("session_op"):
                pass

        stats = profiler.stop_profiling()

        assert stats.total_operations == 5
        assert stats.total_duration > 0

    def test_stop_profiling_without_start(self):
        """Test stop_profiling raises error if not started."""
        profiler = PerformanceProfiler()

        with pytest.raises(RuntimeError, match="No profiling session active"):
            profiler.stop_profiling()

    def test_double_start_profiling(self):
        """Test start_profiling raises error if already started."""
        profiler = PerformanceProfiler()

        profiler.start_profiling()

        with pytest.raises(RuntimeError, match="already active"):
            profiler.start_profiling()

    def test_get_bottlenecks_empty(self):
        """Test get_bottlenecks with no data."""
        profiler = PerformanceProfiler()

        bottlenecks = profiler.get_bottlenecks(threshold_ms=100)

        assert bottlenecks == []

    def test_get_bottlenecks_finds_slow_operations(self):
        """Test get_bottlenecks identifies slow operations."""
        profiler = PerformanceProfiler()

        # Fast operation
        with profiler.profile_block("fast"):
            pass

        # Slow operation (>100ms)
        with profiler.profile_block("slow"):
            time.sleep(0.15)

        bottlenecks = profiler.get_bottlenecks(threshold_ms=100)

        assert len(bottlenecks) == 1
        assert bottlenecks[0].operation == "slow"
        assert bottlenecks[0].duration >= 0.1

    def test_get_bottlenecks_sorted_by_duration(self):
        """Test get_bottlenecks returns results sorted by duration."""
        profiler = PerformanceProfiler()

        # Multiple slow operations
        with profiler.profile_block("medium"):
            time.sleep(0.12)

        with profiler.profile_block("very_slow"):
            time.sleep(0.20)

        with profiler.profile_block("slow"):
            time.sleep(0.15)

        bottlenecks = profiler.get_bottlenecks(threshold_ms=100)

        assert len(bottlenecks) == 3
        # Should be sorted by duration, descending
        assert bottlenecks[0].operation == "very_slow"
        assert bottlenecks[1].operation == "slow"
        assert bottlenecks[2].operation == "medium"

    def test_get_bottlenecks_custom_threshold(self):
        """Test get_bottlenecks with custom threshold."""
        profiler = PerformanceProfiler()

        with profiler.profile_block("slow"):
            time.sleep(0.05)

        # Default threshold (100ms) - no bottlenecks
        assert len(profiler.get_bottlenecks()) == 0

        # Lower threshold (10ms) - should find bottleneck
        bottlenecks = profiler.get_bottlenecks(threshold_ms=10)
        assert len(bottlenecks) == 1

    def test_get_memory_leaks_empty(self):
        """Test get_memory_leaks with no data."""
        profiler = PerformanceProfiler()

        leaks = profiler.get_memory_leaks(threshold_bytes=1024)

        assert leaks == []

    def test_get_stats_all_operations(self):
        """Test get_stats returns all operations when no filter."""
        profiler = PerformanceProfiler()

        with profiler.profile_block("op1"):
            pass

        with profiler.profile_block("op2"):
            pass

        stats = profiler.get_stats()

        assert stats is not None
        assert stats.total_operations == 2

    def test_get_stats_specific_operation(self):
        """Test get_stats for specific operation."""
        profiler = PerformanceProfiler()

        with profiler.profile_block("target"):
            pass

        with profiler.profile_block("other"):
            pass

        with profiler.profile_block("target"):
            pass

        stats = profiler.get_stats("target")

        assert stats is not None
        assert stats.total_operations == 2

    def test_get_stats_no_data(self):
        """Test get_stats returns None when no data."""
        profiler = PerformanceProfiler()

        stats = profiler.get_stats("nonexistent")

        assert stats is None

    def test_clear_stats(self):
        """Test clear_stats removes all data."""
        profiler = PerformanceProfiler()

        with profiler.profile_block("test"):
            pass

        assert profiler.get_stats() is not None

        profiler.clear_stats()

        assert profiler.get_stats() is None

    def test_generate_report_text(self):
        """Test generate_report in text format."""
        profiler = PerformanceProfiler()

        with profiler.profile_block("test_op"):
            time.sleep(0.01)

        report = profiler.generate_report(format="text")

        assert "Performance Profiler Report" in report
        assert "test_op" in report
        assert "Calls:" in report

    def test_generate_report_json(self):
        """Test generate_report in JSON format."""
        profiler = PerformanceProfiler()

        with profiler.profile_block("json_op"):
            pass

        report = profiler.generate_report(format="json")

        # Should be valid JSON
        data = json.loads(report)

        assert "summary" in data
        assert "operations" in data
        assert "json_op" in data["operations"]

    def test_generate_report_empty(self):
        """Test generate_report with no data."""
        profiler = PerformanceProfiler()

        report_text = profiler.generate_report(format="text")
        assert "No profiling data" in report_text

        report_json = profiler.generate_report(format="json")
        data = json.loads(report_json)
        assert "error" in data

    def test_thread_safety(self):
        """Test that profiler is thread-safe."""
        import threading

        profiler = PerformanceProfiler()
        errors = []

        def worker(worker_id):
            try:
                for i in range(10):
                    with profiler.profile_block(f"worker_{worker_id}"):
                        time.sleep(0.001)
            except Exception as e:
                errors.append(e)

        threads = [threading.Thread(target=worker, args=(i,)) for i in range(4)]
        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0
        stats = profiler.get_stats()
        assert stats.total_operations == 40  # 4 workers * 10 ops


class TestProfileDecorator:
    """Tests for the profile decorator."""

    def test_profile_decorator(self):
        """Test the profile decorator."""
        @profile
        def decorated_function(x):
            return x * 2

        result = decorated_function(5)

        assert result == 10
        assert hasattr(decorated_function, '_profiler')

    def test_profile_decorator_preserves_metadata(self):
        """Test that decorator preserves function metadata."""
        @profile
        def my_func():
            """My docstring."""
            pass

        assert my_func.__name__ == "my_func"
        assert my_func.__doc__ == "My docstring."
