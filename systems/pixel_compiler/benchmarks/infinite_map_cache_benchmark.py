#!/usr/bin/env python3
"""
Infinite Map Cache Performance Benchmark.

Measures cache hit rates and read performance for various workloads.

Usage:
    PYTHONPATH=. python3 systems/pixel_compiler/benchmarks/infinite_map_cache_benchmark.py
"""

import sys
import time
import tempfile
import random
from pathlib import Path
from dataclasses import dataclass
from typing import List, Dict, Any

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.infinite_map_cache import LRUCache, AccessPatternTracker
from systems.pixel_compiler.infinite_map_v2 import InfiniteMapBuilderV2


@dataclass
class BenchmarkResult:
    """Result of a single benchmark run."""
    name: str
    total_ops: int
    total_time: float
    ops_per_second: float
    cache_hits: int
    cache_misses: int
    hit_rate: float
    extra_stats: Dict[str, Any]


class CacheBenchmark:
    """Benchmark suite for LRU cache performance."""

    def __init__(self, cache_size: int = 10 * 1024 * 1024):
        self.cache = LRUCache(max_size=cache_size)

    def reset(self):
        """Reset cache for fresh benchmark."""
        self.cache.clear()
        self.cache._pattern_tracker = AccessPatternTracker()
        self.cache.hits = 0
        self.cache.misses = 0
        self.cache.evictions = 0

    def benchmark_sequential_reads(self, num_ops: int = 1000, chunk_size: int = 4096) -> BenchmarkResult:
        """
        Benchmark sequential read performance.
        Simulates reading a large file sequentially.
        """
        self.reset()

        # Simulate file chunks
        chunks = {i: b"x" * chunk_size for i in range(100)}

        start = time.perf_counter()

        for _ in range(num_ops // 100):
            for i in range(100):
                key = f"file.bin:{i * chunk_size}:{chunk_size}"

                # Check cache
                data = self.cache.get(key)
                if data is None:
                    # Simulate read from storage
                    data = chunks[i]
                    self.cache.set(key, data)
                    self.cache._pattern_tracker.record_access("file.bin", i * chunk_size)

        elapsed = time.perf_counter() - start
        stats = self.cache.get_stats()

        return BenchmarkResult(
            name="Sequential Reads",
            total_ops=num_ops,
            total_time=elapsed,
            ops_per_second=num_ops / elapsed,
            cache_hits=stats["hits"],
            cache_misses=stats["misses"],
            hit_rate=stats["hit_rate"],
            extra_stats={"prefetch_opportunities": num_ops // 100 - 1}
        )

    def benchmark_random_reads(self, num_ops: int = 1000, chunk_size: int = 4096) -> BenchmarkResult:
        """
        Benchmark random read performance.
        Simulates random access pattern with some locality.
        """
        self.reset()

        # Simulate file chunks
        chunks = {i: b"x" * chunk_size for i in range(100)}

        # Generate random access pattern with 20% locality
        random.seed(42)
        hot_chunks = random.sample(range(100), 20)

        start = time.perf_counter()

        for _ in range(num_ops):
            # 80% random, 20% hot chunks
            if random.random() < 0.2:
                i = random.choice(hot_chunks)
            else:
                i = random.randint(0, 99)

            key = f"file.bin:{i * chunk_size}:{chunk_size}"

            data = self.cache.get(key)
            if data is None:
                data = chunks[i]
                self.cache.set(key, data)

        elapsed = time.perf_counter() - start
        stats = self.cache.get_stats()

        return BenchmarkResult(
            name="Random Reads (20% locality)",
            total_ops=num_ops,
            total_time=elapsed,
            ops_per_second=num_ops / elapsed,
            cache_hits=stats["hits"],
            cache_misses=stats["misses"],
            hit_rate=stats["hit_rate"],
            extra_stats={"hot_chunks": len(hot_chunks)}
        )

    def benchmark_repeated_reads(self, num_ops: int = 1000, chunk_size: int = 4096) -> BenchmarkResult:
        """
        Benchmark repeated reads of the same data.
        Should achieve very high hit rate.
        """
        self.reset()

        # Only 10 unique chunks
        chunks = {i: b"x" * chunk_size for i in range(10)}

        start = time.perf_counter()

        for i in range(num_ops):
            chunk_idx = i % 10
            key = f"file.bin:{chunk_idx * chunk_size}:{chunk_size}"

            data = self.cache.get(key)
            if data is None:
                data = chunks[chunk_idx]
                self.cache.set(key, data)

        elapsed = time.perf_counter() - start
        stats = self.cache.get_stats()

        return BenchmarkResult(
            name="Repeated Reads (10 chunks)",
            total_ops=num_ops,
            total_time=elapsed,
            ops_per_second=num_ops / elapsed,
            cache_hits=stats["hits"],
            cache_misses=stats["misses"],
            hit_rate=stats["hit_rate"],
            extra_stats={"unique_chunks": 10}
        )

    def benchmark_mixed_workload(self, num_ops: int = 1000, chunk_size: int = 4096) -> BenchmarkResult:
        """
        Benchmark mixed workload with reads and writes.
        """
        self.reset()

        chunks = {i: b"x" * chunk_size for i in range(100)}
        random.seed(42)

        start = time.perf_counter()

        reads = 0
        writes = 0

        for _ in range(num_ops):
            if random.random() < 0.7:  # 70% reads
                i = random.randint(0, 99)
                key = f"file.bin:{i * chunk_size}:{chunk_size}"
                data = self.cache.get(key)
                if data is None:
                    self.cache.set(key, chunks[i])
                reads += 1
            else:  # 30% writes (invalidate cache)
                i = random.randint(0, 99)
                key = f"file.bin:{i * chunk_size}:{chunk_size}"
                self.cache.set(key, chunks[i])  # Update cache
                writes += 1

        elapsed = time.perf_counter() - start
        stats = self.cache.get_stats()

        return BenchmarkResult(
            name="Mixed Workload (70% read, 30% write)",
            total_ops=num_ops,
            total_time=elapsed,
            ops_per_second=num_ops / elapsed,
            cache_hits=stats["hits"],
            cache_misses=stats["misses"],
            hit_rate=stats["hit_rate"],
            extra_stats={"reads": reads, "writes": writes}
        )

    def benchmark_eviction_pressure(self, num_ops: int = 1000, chunk_size: int = 4096) -> BenchmarkResult:
        """
        Benchmark with cache pressure causing evictions.
        Cache size is small relative to data.
        """
        # Create small cache
        self.cache = LRUCache(max_size=20 * chunk_size)  # Only 20 chunks fit
        self.cache.hits = 0
        self.cache.misses = 0

        chunks = {i: b"x" * chunk_size for i in range(100)}

        start = time.perf_counter()

        for i in range(num_ops):
            # Access pattern that causes thrashing
            chunk_idx = i % 100
            key = f"file.bin:{chunk_idx * chunk_size}:{chunk_size}"

            data = self.cache.get(key)
            if data is None:
                self.cache.set(key, chunks[chunk_idx])

        elapsed = time.perf_counter() - start
        stats = self.cache.get_stats()

        return BenchmarkResult(
            name="Eviction Pressure (20% cache)",
            total_ops=num_ops,
            total_time=elapsed,
            ops_per_second=num_ops / elapsed,
            cache_hits=stats["hits"],
            cache_misses=stats["misses"],
            hit_rate=stats["hit_rate"],
            extra_stats={"cache_size_chunks": 20, "total_chunks": 100}
        )


def print_results(results: List[BenchmarkResult]):
    """Print benchmark results in a formatted table."""
    print("\n" + "=" * 80)
    print("Infinite Map Cache Performance Benchmark Results")
    print("=" * 80)

    print(f"\n{'Benchmark':<35} {'Ops/s':>10} {'Hit Rate':>10} {'Hits':>8} {'Misses':>8}")
    print("-" * 80)

    for r in results:
        print(f"{r.name:<35} {r.ops_per_second:>10.0f} {r.hit_rate:>9.1%} {r.cache_hits:>8} {r.cache_misses:>8}")

    print("-" * 80)

    # Summary
    total_ops = sum(r.total_ops for r in results)
    total_hits = sum(r.cache_hits for r in results)
    total_misses = sum(r.cache_misses for r in results)
    overall_hit_rate = total_hits / (total_hits + total_misses) if (total_hits + total_misses) > 0 else 0

    print(f"{'TOTAL':<35} {'':<10} {overall_hit_rate:>9.1%} {total_hits:>8} {total_misses:>8}")
    print("=" * 80)

    # Detailed results
    print("\nDetailed Results:")
    print("-" * 80)
    for r in results:
        print(f"\n{r.name}:")
        print(f"  Total operations: {r.total_ops}")
        print(f"  Total time: {r.total_time:.3f}s")
        print(f"  Operations/second: {r.ops_per_second:.0f}")
        print(f"  Cache hits: {r.cache_hits}")
        print(f"  Cache misses: {r.cache_misses}")
        print(f"  Hit rate: {r.hit_rate:.1%}")
        if r.extra_stats:
            print(f"  Extra: {r.extra_stats}")


def main():
    """Run all benchmarks."""
    print("Running Infinite Map Cache Benchmarks...")
    print("Cache size: 10MB (default)")
    print()

    benchmark = CacheBenchmark(cache_size=10 * 1024 * 1024)

    results = []

    # Run benchmarks
    print("1. Sequential reads...")
    results.append(benchmark.benchmark_sequential_reads(num_ops=10000))

    print("2. Random reads (with locality)...")
    results.append(benchmark.benchmark_random_reads(num_ops=10000))

    print("3. Repeated reads...")
    results.append(benchmark.benchmark_repeated_reads(num_ops=10000))

    print("4. Mixed workload...")
    results.append(benchmark.benchmark_mixed_workload(num_ops=10000))

    print("5. Eviction pressure...")
    results.append(benchmark.benchmark_eviction_pressure(num_ops=10000))

    # Print results
    print_results(results)

    return 0


if __name__ == "__main__":
    sys.exit(main())
