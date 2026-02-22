"""
PixelRTS v2 Blueprint Performance Benchmark Suite

Provides performance benchmarking tools for measuring blueprint layer performance
across different data sizes, encoding modes, and operations.

Performance Targets:
- Analyze 1MB binary: < 1 second
- Analyze 10MB binary: < 5 seconds
- Encode/Decode 1MB: < 2 seconds
- Serialize 100 components: < 0.1 seconds
- Render overlay 1024x1024: < 1 second
"""

import gc
import sys
import time
import tracemalloc
from dataclasses import dataclass, field
from pathlib import Path
from typing import List, Dict, Any, Optional, Tuple, Callable
import json
import tempfile


@dataclass
class BlueprintBenchmarkResult:
    """Result of a single blueprint benchmark run."""
    operation: str
    data_size_mb: float
    data_size_bytes: int
    iterations: int
    total_time: float
    avg_time: float
    min_time: float
    max_time: float
    throughput_mbps: float  # Megabytes per second
    peak_memory_mb: float
    target_met: bool  # Whether performance target was met
    metadata: Dict[str, Any] = field(default_factory=dict)


@dataclass
class BenchmarkSuite:
    """Container for multiple benchmark results."""
    results: List[BlueprintBenchmarkResult] = field(default_factory=list)
    suite_name: str = "Blueprint Performance Benchmark"
    timestamp: str = field(default_factory=lambda: time.strftime("%Y-%m-%d %H:%M:%S"))
    performance_targets: Dict[str, float] = field(default_factory=dict)

    def __post_init__(self):
        """Set default performance targets."""
        if not self.performance_targets:
            self.performance_targets = {
                "analyze_1mb": 1.0,  # 1 second for 1MB analysis
                "analyze_10mb": 5.0,  # 5 seconds for 10MB analysis
                "encode_1mb": 2.0,  # 2 seconds for 1MB encoding
                "decode_1mb": 2.0,  # 2 seconds for 1MB decoding
                "serialize_100": 0.1,  # 0.1 seconds for 100 components
                "overlay_1024": 1.0,  # 1 second for 1024x1024 overlay
            }

    def add_result(self, result: BlueprintBenchmarkResult) -> None:
        """Add a benchmark result to the suite."""
        self.results.append(result)

    def get_results_by_operation(self, operation: str) -> List[BlueprintBenchmarkResult]:
        """Get all results for a specific operation."""
        return [r for r in self.results if r.operation == operation]

    def check_performance_target(self, operation: str, actual_time: float, data_size_mb: float) -> bool:
        """Check if performance target was met."""
        if operation == "analyze":
            if data_size_mb <= 1:
                return actual_time <= self.performance_targets["analyze_1mb"]
            elif data_size_mb <= 10:
                return actual_time <= self.performance_targets["analyze_10mb"]
        elif operation == "encode":
            return actual_time <= self.performance_targets["encode_1mb"]
        elif operation == "decode":
            return actual_time <= self.performance_targets["decode_1mb"]
        elif operation == "serialize":
            return actual_time <= self.performance_targets["serialize_100"]
        elif operation == "overlay":
            return actual_time <= self.performance_targets["overlay_1024"]
        return True  # Unknown operation, assume target met

    def to_dict(self) -> Dict[str, Any]:
        """Convert suite to dictionary for serialization."""
        return {
            'suite_name': self.suite_name,
            'timestamp': self.timestamp,
            'performance_targets': self.performance_targets,
            'results': [
                {
                    'operation': r.operation,
                    'data_size_mb': r.data_size_mb,
                    'data_size_bytes': r.data_size_bytes,
                    'iterations': r.iterations,
                    'total_time': r.total_time,
                    'avg_time': r.avg_time,
                    'min_time': r.min_time,
                    'max_time': r.max_time,
                    'throughput_mbps': r.throughput_mbps,
                    'peak_memory_mb': r.peak_memory_mb,
                    'target_met': r.target_met,
                    'metadata': r.metadata
                }
                for r in self.results
            ]
        }

    def save_json(self, filepath: str) -> None:
        """Save benchmark results to JSON file."""
        with open(filepath, 'w') as f:
            json.dump(self.to_dict(), f, indent=2)


class BlueprintBenchmark:
    """
    Benchmark runner for blueprint layer operations.

    Supports benchmarking of:
    - Binary analysis (ELF parsing, entropy calculation)
    - PNG encoding/decoding
    - Blueprint serialization/deserialization
    - Visual overlay rendering
    """

    def __init__(self, output_dir: Optional[str] = None):
        """
        Initialize benchmark runner.

        Args:
            output_dir: Directory to save benchmark output files (optional)
        """
        self.output_dir = Path(output_dir) if output_dir else None
        self.suite = BenchmarkSuite()

    def _generate_test_data(self, size_bytes: int, pattern: str = "random") -> bytes:
        """
        Generate test binary data.

        Args:
            size_bytes: Size of data to generate in bytes
            pattern: Pattern type ("random", "zeros", "ones", "elf_header")

        Returns:
            Generated binary data
        """
        import os

        if pattern == "random":
            return os.urandom(size_bytes)
        elif pattern == "zeros":
            return b'\x00' * size_bytes
        elif pattern == "ones":
            return b'\xff' * size_bytes
        elif pattern == "elf_header":
            # Create data with ELF header for testing ELF analysis
            header = b'\x7fELF' + b'\x02' + b'\x01' + b'\x01' + b'\x00' * 9
            return header + os.urandom(size_bytes - len(header))
        else:
            return os.urandom(size_bytes)

    def _create_test_blueprint(self, num_components: int = 100) -> 'PixelRTSBlueprint':
        """Create a test blueprint with specified number of components."""
        from systems.pixel_compiler.pixelrts_blueprint import (
            PixelRTSBlueprint, Component, ComponentType, HilbertRange,
            MemoryRegion
        )

        blueprint = PixelRTSBlueprint(
            system_name="test_system",
            system_type="kernel",
            architecture="x86_64"
        )

        # Add components
        for i in range(num_components):
            component = Component(
                id=f"component_{i}",
                type=ComponentType.EXECUTABLE if i % 2 == 0 else ComponentType.DATA,
                description=f"Test component {i}",
                hilbert_range=HilbertRange(
                    start_index=i * 1000,
                    end_index=(i + 1) * 1000,
                    pixel_start=(i % 64, i // 64),
                    pixel_end=((i + 1) % 64, (i + 1) // 64)
                ),
                entropy_profile="medium" if i % 3 == 0 else "low",
                visual_hint="red_dominant" if i % 2 == 0 else "green_dominant",
                dependencies=[f"component_{j}" for j in range(max(0, i - 2), i)],
                semantic_tags=["test", f"tag_{i % 5}"]
            )
            blueprint.components.append(component)

        # Add memory regions
        for region_name in [".text", ".data", ".rodata", ".bss"]:
            blueprint.memory_map.append(
                MemoryRegion(region=region_name, permissions="rx" if region_name == ".text" else "rw")
            )

        blueprint.entry_point = "0x1000"

        return blueprint

    def _measure_performance(
        self,
        func: Callable,
        iterations: int = 10,
        warmup_iterations: int = 2
    ) -> Tuple[float, float, float, float]:
        """
        Measure performance of a function.

        Args:
            func: Function to benchmark (should return immediately)
            iterations: Number of iterations to run
            warmup_iterations: Number of warmup iterations (not counted)

        Returns:
            Tuple of (total_time, avg_time, min_time, max_time)
        """
        # Warmup
        for _ in range(warmup_iterations):
            func()

        # Force garbage collection before benchmarking
        gc.collect()

        # Measure
        times = []
        for _ in range(iterations):
            start = time.perf_counter()
            result = func()
            end = time.perf_counter()
            times.append(end - start)

        total_time = sum(times)
        avg_time = total_time / iterations
        min_time = min(times)
        max_time = max(times)

        return total_time, avg_time, min_time, max_time

    def _measure_memory(self, func: Callable) -> float:
        """
        Measure peak memory usage of a function.

        Args:
            func: Function to measure

        Returns:
            Peak memory usage in MB
        """
        tracemalloc.start()
        result = func()
        current, peak = tracemalloc.get_traced_memory()
        tracemalloc.stop()
        return peak / (1024 * 1024)  # Convert to MB

    def benchmark_analyze(
        self,
        data_sizes_mb: List[float] = None,
        iterations: int = 5,
        pattern: str = "elf_header"
    ) -> BenchmarkSuite:
        """
        Benchmark binary analysis across different data sizes.

        Args:
            data_sizes_mb: List of data sizes in MB to benchmark
            iterations: Number of iterations per size
            pattern: Test pattern to use

        Returns:
            BenchmarkSuite with results
        """
        if data_sizes_mb is None:
            data_sizes_mb = [0.1, 0.5, 1.0, 5.0, 10.0]

        from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

        for size_mb in data_sizes_mb:
            size_bytes = int(size_mb * 1024 * 1024)
            data = self._generate_test_data(size_bytes, pattern)

            try:
                analyzer = BlueprintAnalyzer()

                # Measure performance
                def run_analyze():
                    return analyzer.analyze(
                        data,
                        system_name="test_system",
                        system_type="kernel",
                        architecture="x86_64"
                    )

                total_time, avg_time, min_time, max_time = self._measure_performance(
                    run_analyze, iterations=iterations
                )

                # Measure memory separately
                peak_memory = self._measure_memory(run_analyze)

                # Calculate throughput
                throughput = (size_mb / avg_time) if avg_time > 0 else 0

                # Check if target met
                target_met = self.suite.check_performance_target("analyze", avg_time, size_mb)

                result = BlueprintBenchmarkResult(
                    operation="analyze",
                    data_size_mb=size_mb,
                    data_size_bytes=size_bytes,
                    iterations=iterations,
                    total_time=total_time,
                    avg_time=avg_time,
                    min_time=min_time,
                    max_time=max_time,
                    throughput_mbps=throughput,
                    peak_memory_mb=peak_memory,
                    target_met=target_met,
                    metadata={'pattern': pattern}
                )

                self.suite.add_result(result)

            except Exception as e:
                print(f"Error benchmarking analyze for {size_mb}MB: {e}")

        return self.suite

    def benchmark_encode(
        self,
        data_sizes_mb: List[float] = None,
        iterations: int = 5,
        mode: str = "standard"
    ) -> BenchmarkSuite:
        """
        Benchmark PNG encoding across different data sizes.

        Args:
            data_sizes_mb: List of data sizes in MB to benchmark
            iterations: Number of iterations per size
            mode: Encoding mode ("standard" or "code")

        Returns:
            BenchmarkSuite with results
        """
        if data_sizes_mb is None:
            data_sizes_mb = [0.1, 0.5, 1.0, 5.0]

        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder

        for size_mb in data_sizes_mb:
            size_bytes = int(size_mb * 1024 * 1024)
            data = self._generate_test_data(size_bytes, "random")

            try:
                encoder = PixelRTSEncoder(mode=mode)

                # Measure performance
                def run_encode():
                    return encoder.encode(data, metadata={"type": "test", "name": "benchmark"})

                total_time, avg_time, min_time, max_time = self._measure_performance(
                    run_encode, iterations=iterations
                )

                # Measure memory separately
                peak_memory = self._measure_memory(run_encode)

                # Calculate throughput
                throughput = (size_mb / avg_time) if avg_time > 0 else 0

                # Check if target met (1MB in < 2 seconds)
                target_met = True
                if size_mb <= 1:
                    target_met = avg_time <= self.suite.performance_targets["encode_1mb"]

                result = BlueprintBenchmarkResult(
                    operation="encode",
                    data_size_mb=size_mb,
                    data_size_bytes=size_bytes,
                    iterations=iterations,
                    total_time=total_time,
                    avg_time=avg_time,
                    min_time=min_time,
                    max_time=max_time,
                    throughput_mbps=throughput,
                    peak_memory_mb=peak_memory,
                    target_met=target_met,
                    metadata={'mode': mode}
                )

                self.suite.add_result(result)

            except Exception as e:
                print(f"Error benchmarking encode for {size_mb}MB: {e}")

        return self.suite

    def benchmark_decode(
        self,
        data_sizes_mb: List[float] = None,
        iterations: int = 5,
        mode: str = "standard"
    ) -> BenchmarkSuite:
        """
        Benchmark PNG decoding across different data sizes.

        Args:
            data_sizes_mb: List of data sizes in MB to benchmark
            iterations: Number of iterations per size
            mode: Encoding mode ("standard" or "code")

        Returns:
            BenchmarkSuite with results
        """
        if data_sizes_mb is None:
            data_sizes_mb = [0.1, 0.5, 1.0, 5.0]

        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder

        for size_mb in data_sizes_mb:
            size_bytes = int(size_mb * 1024 * 1024)
            data = self._generate_test_data(size_bytes, "random")

            try:
                # First encode the data
                encoder = PixelRTSEncoder(mode=mode)
                png_data = encoder.encode(data, metadata={"type": "test"})

                decoder = PixelRTSDecoder()
                decoder.set_metadata(encoder.get_metadata())

                # Measure performance
                def run_decode():
                    return decoder.decode(png_data)

                total_time, avg_time, min_time, max_time = self._measure_performance(
                    run_decode, iterations=iterations
                )

                # Measure memory separately
                decoder_mem = PixelRTSDecoder()
                decoder_mem.set_metadata(encoder.get_metadata())
                peak_memory = self._measure_memory(
                    lambda: decoder_mem.decode(png_data)
                )

                # Calculate throughput
                throughput = (size_mb / avg_time) if avg_time > 0 else 0

                # Check if target met (1MB in < 2 seconds)
                target_met = True
                if size_mb <= 1:
                    target_met = avg_time <= self.suite.performance_targets["decode_1mb"]

                result = BlueprintBenchmarkResult(
                    operation="decode",
                    data_size_mb=size_mb,
                    data_size_bytes=size_bytes,
                    iterations=iterations,
                    total_time=total_time,
                    avg_time=avg_time,
                    min_time=min_time,
                    max_time=max_time,
                    throughput_mbps=throughput,
                    peak_memory_mb=peak_memory,
                    target_met=target_met,
                    metadata={'mode': mode}
                )

                self.suite.add_result(result)

            except Exception as e:
                print(f"Error benchmarking decode for {size_mb}MB: {e}")

        return self.suite

    def benchmark_serialize(
        self,
        component_counts: List[int] = None,
        iterations: int = 10
    ) -> BenchmarkSuite:
        """
        Benchmark blueprint serialization across different component counts.

        Args:
            component_counts: List of component counts to benchmark
            iterations: Number of iterations per count

        Returns:
            BenchmarkSuite with results
        """
        if component_counts is None:
            component_counts = [10, 50, 100, 500, 1000]

        from systems.pixel_compiler.pixelrts_blueprint import PixelRTSBlueprint

        for count in component_counts:
            try:
                blueprint = self._create_test_blueprint(count)

                # Measure serialization performance
                def run_serialize():
                    return blueprint.to_json()

                total_time, avg_time, min_time, max_time = self._measure_performance(
                    run_serialize, iterations=iterations
                )

                # Measure memory separately
                blueprint_mem = self._create_test_blueprint(count)
                peak_memory = self._measure_memory(run_serialize)

                # Check if target met (100 components in < 0.1 seconds)
                target_met = True
                if count <= 100:
                    target_met = avg_time <= self.suite.performance_targets["serialize_100"]

                result = BlueprintBenchmarkResult(
                    operation="serialize",
                    data_size_mb=0,  # Not applicable for serialization
                    data_size_bytes=count,  # Use component count instead
                    iterations=iterations,
                    total_time=total_time,
                    avg_time=avg_time,
                    min_time=min_time,
                    max_time=max_time,
                    throughput_mbps=0,  # Not applicable
                    peak_memory_mb=peak_memory,
                    target_met=target_met,
                    metadata={'component_count': count}
                )

                self.suite.add_result(result)

                # Also benchmark deserialization
                json_str = blueprint.to_json()

                def run_deserialize():
                    return PixelRTSBlueprint.from_json(json_str)

                total_time_d, avg_time_d, min_time_d, max_time_d = self._measure_performance(
                    run_deserialize, iterations=iterations
                )

                blueprint_mem2 = self._create_test_blueprint(count)
                json_str_mem = blueprint_mem2.to_json()
                peak_memory_d = self._measure_memory(
                    lambda: PixelRTSBlueprint.from_json(json_str_mem)
                )

                result_d = BlueprintBenchmarkResult(
                    operation="deserialize",
                    data_size_mb=0,
                    data_size_bytes=count,
                    iterations=iterations,
                    total_time=total_time_d,
                    avg_time=avg_time_d,
                    min_time=min_time_d,
                    max_time=max_time_d,
                    throughput_mbps=0,
                    peak_memory_mb=peak_memory_d,
                    target_met=target_met,
                    metadata={'component_count': count}
                )

                self.suite.add_result(result_d)

            except Exception as e:
                print(f"Error benchmarking serialize for {count} components: {e}")

        return self.suite

    def benchmark_overlay(
        self,
        grid_sizes: List[int] = None,
        iterations: int = 10
    ) -> BenchmarkSuite:
        """
        Benchmark visual overlay rendering across different grid sizes.

        Args:
            grid_sizes: List of grid dimensions to benchmark
            iterations: Number of iterations per size

        Returns:
            BenchmarkSuite with results
        """
        if grid_sizes is None:
            grid_sizes = [256, 512, 1024, 2048]

        try:
            from systems.pixel_compiler.pixelrts_blueprint_visualizer import BlueprintVisualizer
        except ImportError:
            print("BlueprintVisualizer not available, skipping overlay benchmark")
            return self.suite

        for grid_size in grid_sizes:
            try:
                # Create test blueprint and data
                blueprint = self._create_test_blueprint(100)
                data = self._generate_test_data(grid_size * grid_size * 4, "random")

                # Create visualizer
                visualizer = BlueprintVisualizer()

                # Measure performance
                def run_overlay():
                    return visualizer.render_overlay(
                        blueprint,
                        data,
                        grid_size=grid_size,
                        output_path=None  # Don't save, just render
                    )

                total_time, avg_time, min_time, max_time = self._measure_performance(
                    run_overlay, iterations=iterations
                )

                # Measure memory separately
                peak_memory = self._measure_memory(run_overlay)

                # Check if target met (1024x1024 in < 1 second)
                target_met = True
                if grid_size <= 1024:
                    target_met = avg_time <= self.suite.performance_targets["overlay_1024"]

                result = BlueprintBenchmarkResult(
                    operation="overlay",
                    data_size_mb=0,
                    data_size_bytes=grid_size,
                    iterations=iterations,
                    total_time=total_time,
                    avg_time=avg_time,
                    min_time=min_time,
                    max_time=max_time,
                    throughput_mbps=0,
                    peak_memory_mb=peak_memory,
                    target_met=target_met,
                    metadata={'grid_size': grid_size}
                )

                self.suite.add_result(result)

            except Exception as e:
                print(f"Error benchmarking overlay for {grid_size}x{grid_size}: {e}")

        return self.suite

    def benchmark_all(
        self,
        iterations: int = 5
    ) -> BenchmarkSuite:
        """
        Run all benchmarks.

        Args:
            iterations: Number of iterations per benchmark

        Returns:
            BenchmarkSuite with all results
        """
        print("Running Blueprint Performance Benchmarks...")
        print("=" * 60)

        print("\n1. Binary Analysis Benchmark...")
        self.benchmark_analyze(iterations=iterations)

        print("\n2. PNG Encoding Benchmark...")
        self.benchmark_encode(iterations=iterations)

        print("\n3. PNG Decoding Benchmark...")
        self.benchmark_decode(iterations=iterations)

        print("\n4. Serialization Benchmark...")
        self.benchmark_serialize(iterations=iterations)

        print("\n5. Overlay Rendering Benchmark...")
        self.benchmark_overlay(iterations=iterations)

        print("\n" + "=" * 60)
        print("Benchmark suite complete!")

        return self.suite

    def print_benchmark_report(self, results: Optional[BenchmarkSuite] = None) -> None:
        """
        Print a formatted benchmark report.

        Args:
            results: BenchmarkSuite to report (default: use internal suite)
        """
        if results is None:
            results = self.suite

        print("\n" + "=" * 80)
        print(f" {results.suite_name}")
        print(f" Timestamp: {results.timestamp}")
        print("=" * 80)

        # Group results by operation
        operations = {}
        for result in results.results:
            if result.operation not in operations:
                operations[result.operation] = []
            operations[result.operation].append(result)

        # Print results for each operation
        for operation, op_results in sorted(operations.items()):
            print(f"\n{operation.upper()}")
            print("-" * 80)

            # Determine column headers based on operation type
            if operation in ["serialize", "deserialize"]:
                header = f"{'Components':>12} {'Avg (ms)':>12} {'Min (ms)':>12} {'Max (ms)':>12} " \
                         f"{'Memory (MB)':>12} {'Target':>8}"
                print(header)
                print("-" * 80)

                for result in op_results:
                    count = result.data_size_bytes  # Component count
                    status = "PASS" if result.target_met else "FAIL"
                    print(f"{count:>12} "
                          f"{result.avg_time*1000:>12.3f} "
                          f"{result.min_time*1000:>12.3f} "
                          f"{result.max_time*1000:>12.3f} "
                          f"{result.peak_memory_mb:>12.2f} "
                          f"{status:>8}")

            elif operation == "overlay":
                header = f"{'Grid Size':>12} {'Avg (ms)':>12} {'Min (ms)':>12} {'Max (ms)':>12} " \
                         f"{'Memory (MB)':>12} {'Target':>8}"
                print(header)
                print("-" * 80)

                for result in op_results:
                    size = result.data_size_bytes  # Grid size
                    status = "PASS" if result.target_met else "FAIL"
                    print(f"{size}x{size:>7} "
                          f"{result.avg_time*1000:>12.3f} "
                          f"{result.min_time*1000:>12.3f} "
                          f"{result.max_time*1000:>12.3f} "
                          f"{result.peak_memory_mb:>12.2f} "
                          f"{status:>8}")

            else:  # analyze, encode, decode
                header = f"{'Size (MB)':>12} {'Avg (ms)':>12} {'Min (ms)':>12} {'Max (ms)':>12} " \
                         f"{'Throughput':>12} {'Memory (MB)':>12} {'Target':>8}"
                print(header)
                print("-" * 80)

                for result in sorted(op_results, key=lambda r: r.data_size_mb):
                    status = "PASS" if result.target_met else "FAIL"
                    print(f"{result.data_size_mb:>12.2f} "
                          f"{result.avg_time*1000:>12.3f} "
                          f"{result.min_time*1000:>12.3f} "
                          f"{result.max_time*1000:>12.3f} "
                          f"{result.throughput_mbps:>12.2f} "
                          f"{result.peak_memory_mb:>12.2f} "
                          f"{status:>8}")

        # Print performance target summary
        print("\n" + "=" * 80)
        print(" PERFORMANCE TARGETS SUMMARY")
        print("=" * 80)

        if not results.results:
            print("No benchmark results available.")
        else:
            targets_met = 0
            targets_total = 0
            for result in results.results:
                targets_total += 1
                if result.target_met:
                    targets_met += 1

            print(f"Targets Met: {targets_met}/{targets_total} "
                  f"({100*targets_met/targets_total:.1f}%)")

        if targets_met < targets_total:
            print("\nFailed Targets:")
            for result in results.results:
                if not result.target_met:
                    if result.operation in ["analyze", "encode", "decode"]:
                        print(f"  - {result.operation} {result.data_size_mb}MB: "
                              f"{result.avg_time*1000:.2f}ms > target")
                    elif result.operation in ["serialize", "deserialize"]:
                        print(f"  - {result.operation} {result.data_size_bytes} components: "
                              f"{result.avg_time*1000:.2f}ms > target")
                    elif result.operation == "overlay":
                        print(f"  - {result.operation} {result.data_size_bytes}x{result.data_size_bytes}: "
                              f"{result.avg_time*1000:.2f}ms > target")

        print("\n" + "=" * 80)

    def save_results(self, filepath: Optional[str] = None) -> str:
        """
        Save benchmark results to JSON file.

        Args:
            filepath: Path to save results (default: auto-generated)

        Returns:
            Path to saved file
        """
        if filepath is None:
            if self.output_dir:
                self.output_dir.mkdir(parents=True, exist_ok=True)
                timestamp = time.strftime("%Y%m%d_%H%M%S")
                filepath = self.output_dir / f"blueprint_benchmark_{timestamp}.json"
            else:
                timestamp = time.strftime("%Y%m%d_%H%M%S")
                filepath = f"blueprint_benchmark_{timestamp}.json"

        self.suite.save_json(str(filepath))
        return str(filepath)


def main():
    """Main entry point for CLI benchmark execution."""
    import argparse

    parser = argparse.ArgumentParser(
        description='Blueprint Performance Benchmark Suite',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Run all benchmarks with default settings
  python -m benchmarks.blueprint_benchmark

  # Run only analysis benchmarks
  python -m benchmarks.blueprint_benchmark --operation analyze

  # Run with specific data sizes
  python -m benchmarks.blueprint_benchmark --sizes 1 5 10

  # Run with more iterations for accuracy
  python -m benchmarks.blueprint_benchmark --iterations 10

  # Save results to specific file
  python -m benchmarks.blueprint_benchmark --output results.json
        """
    )

    parser.add_argument(
        '--operation', '-o',
        choices=['analyze', 'encode', 'decode', 'serialize', 'overlay', 'all'],
        default='all',
        help='Operation to benchmark (default: all)'
    )

    parser.add_argument(
        '--sizes', '-s',
        type=float,
        nargs='+',
        default=[0.1, 0.5, 1.0, 5.0, 10.0],
        help='Data sizes in MB to benchmark (default: 0.1 0.5 1.0 5.0 10.0)'
    )

    parser.add_argument(
        '--iterations', '-i',
        type=int,
        default=5,
        help='Number of iterations per benchmark (default: 5)'
    )

    parser.add_argument(
        '--output', '-out',
        type=str,
        help='Output JSON file for results'
    )

    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Enable verbose output'
    )

    args = parser.parse_args()

    # Create benchmark runner
    benchmark = BlueprintBenchmark()

    if args.verbose:
        print(f"Running {args.operation} benchmark for sizes: {args.sizes} MB")
        print(f"Iterations: {args.iterations}")

    # Run benchmarks
    if args.operation == 'analyze':
        benchmark.benchmark_analyze(data_sizes_mb=args.sizes, iterations=args.iterations)
    elif args.operation == 'encode':
        benchmark.benchmark_encode(data_sizes_mb=args.sizes, iterations=args.iterations)
    elif args.operation == 'decode':
        benchmark.benchmark_decode(data_sizes_mb=args.sizes, iterations=args.iterations)
    elif args.operation == 'serialize':
        # Use sizes as component counts for serialization
        counts = [int(s) for s in args.sizes[:5]]  # Limit to 5 values
        benchmark.benchmark_serialize(component_counts=counts, iterations=args.iterations)
    elif args.operation == 'overlay':
        # Use sizes as grid sizes for overlay
        grid_sizes = [int(s) for s in args.sizes[:4]]  # Limit to 4 values
        benchmark.benchmark_overlay(grid_sizes=grid_sizes, iterations=args.iterations)
    else:  # all
        benchmark.benchmark_all(iterations=args.iterations)

    # Print report
    benchmark.print_benchmark_report()

    # Save results if output specified
    if args.output:
        output_path = benchmark.save_results(args.output)
        print(f"\nResults saved to: {output_path}")

    return 0


if __name__ == '__main__':
    sys.exit(main())
