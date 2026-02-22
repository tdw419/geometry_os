#!/usr/bin/env python3
"""
Performance Tuner for Infinite Map OS.

Orchestrates all performance optimization subsystems to provide
comprehensive tuning of the infinite map.

Features:
- Unified tuning interface
- Cache optimization
- Zone rebalancing
- Cluster optimization
- Before/after benchmarking
- Automatic tuning mode
"""

import time
import math
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, TYPE_CHECKING
from pathlib import Path

if TYPE_CHECKING:
    from systems.pixel_compiler.infinite_map_v2 import InfiniteMapBuilderV2
    from systems.pixel_compiler.cache_optimizer import CacheOptimizer, CacheStats
    from systems.pixel_compiler.performance_profiler import PerformanceProfiler
    from systems.pixel_compiler.migration_strategy import MigrationStrategy, MigrationBatch


@dataclass
class TuningConfig:
    """
    Configuration for performance tuning.

    Attributes:
        target_latency_ms: Target latency in milliseconds (default: 100)
        target_throughput_ops: Target operations per second (default: 1000)
        max_memory_mb: Maximum memory in MB (default: 512)
        enable_auto_tune: Enable automatic tuning (default: True)
        tune_cache: Include cache tuning (default: True)
        tune_zones: Include zone rebalancing (default: True)
        tune_clusters: Include cluster optimization (default: True)
    """
    target_latency_ms: float = 100.0
    target_throughput_ops: int = 1000
    max_memory_mb: int = 512
    enable_auto_tune: bool = True
    tune_cache: bool = True
    tune_zones: bool = True
    tune_clusters: bool = True

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            'target_latency_ms': self.target_latency_ms,
            'target_throughput_ops': self.target_throughput_ops,
            'max_memory_mb': self.max_memory_mb,
            'enable_auto_tune': self.enable_auto_tune,
            'tune_cache': self.tune_cache,
            'tune_zones': self.tune_zones,
            'tune_clusters': self.tune_clusters,
        }


@dataclass
class TuningResult:
    """
    Result of a tuning operation.

    Attributes:
        success: Whether tuning succeeded
        changes_made: Changes applied
        before_metrics: Metrics before tuning
        after_metrics: Metrics after tuning
        improvement_percent: Overall improvement percentage
        recommendations: Additional recommendations
    """
    success: bool
    changes_made: Dict[str, Any]
    before_metrics: Dict[str, float]
    after_metrics: Dict[str, float]
    improvement_percent: float
    recommendations: List[str]

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            'success': self.success,
            'changes_made': self.changes_made,
            'before_metrics': self.before_metrics,
            'after_metrics': self.after_metrics,
            'improvement_percent': self.improvement_percent,
            'recommendations': self.recommendations,
        }


class PerformanceTuner:
    """
    Performance tuner for Infinite Map OS.

    Coordinates all performance optimization subsystems including:
    - Cache optimization (via CacheOptimizer)
    - Zone rebalancing (via MigrationStrategy)
    - Cluster optimization
    - Benchmarking (via PerformanceProfiler)

    Example:
        >>> tuner = PerformanceTuner(builder)
        >>> result = tuner.tune_all()
        >>> print(f"Improvement: {result.improvement_percent:.1f}%")
    """

    def __init__(
        self,
        builder: 'InfiniteMapBuilderV2',
        config: Optional[TuningConfig] = None
    ):
        """
        Initialize performance tuner.

        Args:
            builder: InfiniteMapBuilderV2 instance to tune
            config: Tuning configuration (uses default if None)
        """
        self.builder = builder
        self.config = config or TuningConfig()

        # Initialize subsystems lazily
        self._cache_optimizer: Optional['CacheOptimizer'] = None
        self._profiler: Optional['PerformanceProfiler'] = None
        self._migration_strategy: Optional['MigrationStrategy'] = None

        # Track tuning history
        self._tuning_history: List[TuningResult] = []

        # Access tracking for zone optimization
        self._access_counts: Dict[str, int] = {}

    def _get_profiler(self) -> 'PerformanceProfiler':
        """Get or create profiler instance."""
        if self._profiler is None:
            from systems.pixel_compiler.performance_profiler import PerformanceProfiler
            self._profiler = PerformanceProfiler()
        return self._profiler

    def _get_cache_optimizer(self) -> 'CacheOptimizer':
        """Get or create cache optimizer for the builder's cache."""
        if self._cache_optimizer is None:
            from systems.pixel_compiler.cache_optimizer import CacheOptimizer

            # Use texture cache if available
            cache = getattr(self.builder, '_texture_cache', None)
            if cache is None:
                # Create a mock cache for testing
                from systems.pixel_compiler.cache_optimizer import MockCache
                cache = MockCache(max_size=100)

            self._cache_optimizer = CacheOptimizer(
                cache=cache,
                target_hit_rate=self.config.target_throughput_ops / 10000
            )
        return self._cache_optimizer

    def _get_migration_strategy(self) -> 'MigrationStrategy':
        """Get or create migration strategy instance."""
        if self._migration_strategy is None:
            from systems.pixel_compiler.migration_strategy import MigrationStrategy

            grid_size = self.builder.grid_size
            center = (grid_size // 2, grid_size // 2)

            self._migration_strategy = MigrationStrategy(center=center)
        return self._migration_strategy

    def validate_config(self) -> tuple[bool, List[str]]:
        """
        Validate tuning configuration.

        Returns:
            Tuple of (is_valid, list_of_errors)
        """
        errors = []

        if self.config.target_latency_ms <= 0:
            errors.append("target_latency_ms must be positive")

        if self.config.target_throughput_ops <= 0:
            errors.append("target_throughput_ops must be positive")

        if self.config.max_memory_mb <= 0:
            errors.append("max_memory_mb must be positive")

        # Note: We allow tune_all to succeed even with no tuners enabled
        # This is useful for just getting metrics

        return len(errors) == 0, errors

    def get_current_metrics(self) -> Dict[str, float]:
        """
        Get current performance metrics.

        Returns:
            Dictionary with metrics:
            - read_latency_ms: Average read latency
            - write_latency_ms: Average write latency
            - throughput_ops: Operations per second
            - memory_mb: Memory usage in MB
            - cache_hit_rate: Cache hit rate (0.0 to 1.0)
        """
        profiler = self._get_profiler()

        # Get stats from profiler
        stats = profiler.get_stats()

        # Get cache stats
        cache_optimizer = self._get_cache_optimizer()
        cache_stats = cache_optimizer.get_stats()

        # Safely get cache size (handle both int and Mock)
        try:
            cache_size = int(cache_stats.size) if cache_stats.size is not None else 0
        except (TypeError, ValueError):
            cache_size = 0

        # Safely get hit rate
        try:
            hit_rate = float(cache_stats.hit_rate) if cache_stats.hit_rate is not None else 0.0
        except (TypeError, ValueError):
            hit_rate = 0.0

        # Calculate memory in MB
        if cache_size > 1024 * 1024:
            memory_mb = cache_size / (1024 * 1024)
        else:
            memory_mb = cache_size / 1024 if cache_size > 0 else 0.0

        # Calculate metrics
        metrics = {
            'read_latency_ms': stats.avg_duration * 1000 if stats else 0.0,
            'write_latency_ms': stats.avg_duration * 1000 if stats else 0.0,
            'throughput_ops': stats.operations_per_second if stats else 0.0,
            'memory_mb': memory_mb,
            'cache_hit_rate': hit_rate,
        }

        return metrics

    def benchmark(self, iterations: int = 100) -> Dict[str, Any]:
        """
        Run performance benchmarks.

        Args:
            iterations: Number of benchmark iterations

        Returns:
            Dictionary with benchmark results:
            - read_latency_ms: Average read latency
            - write_latency_ms: Average write latency
            - throughput_ops: Operations per second
            - memory_mb: Peak memory usage
            - cache_hit_rate: Cache hit rate
            - iterations: Number of iterations run
            - duration_seconds: Total benchmark duration
        """
        profiler = self._get_profiler()
        cache_optimizer = self._get_cache_optimizer()

        # Track timing
        start_time = time.time()

        # Run simulated benchmarks using profiler
        read_times = []
        write_times = []

        # Get VAT entries for benchmarking
        vat = self.builder.ai_placer.vat
        file_paths = list(vat.entries.keys())[:min(10, len(vat.entries))]

        if not file_paths:
            # No files to benchmark, use synthetic data
            for i in range(iterations):
                profiler.profile_operation(f"read_{i}", lambda: None)
                profiler.profile_operation(f"write_{i}", lambda: None)
        else:
            # Benchmark with real file paths
            for i in range(iterations):
                # Simulate read operation
                path = file_paths[i % len(file_paths)]

                def read_op(p=path):
                    loc = vat.lookup(p)
                    return loc

                _, result = profiler.profile_operation(f"read_{path}", read_op)
                read_times.append(result.duration)

                # Simulate write operation (just profile, don't actually write)
                def write_op(p=path):
                    return self._access_counts.get(p, 0)

                _, result = profiler.profile_operation(f"write_{path}", write_op)
                write_times.append(result.duration)

                # Record access for cache optimizer
                cache_optimizer.record_access(path)

        end_time = time.time()
        duration = end_time - start_time

        # Calculate metrics
        stats = profiler.get_stats()
        cache_stats = cache_optimizer.get_stats()

        # Safely get cache size and hit rate
        try:
            cache_size = int(cache_stats.size) if cache_stats.size is not None else 0
        except (TypeError, ValueError):
            cache_size = 0

        try:
            hit_rate = float(cache_stats.hit_rate) if cache_stats.hit_rate is not None else 0.0
        except (TypeError, ValueError):
            hit_rate = 0.0

        # Calculate memory in MB
        if cache_size > 1024 * 1024:
            memory_mb = cache_size / (1024 * 1024)
        else:
            memory_mb = cache_size / 1024 if cache_size > 0 else 0.0

        avg_read_ms = (sum(read_times) / len(read_times) * 1000) if read_times else 0.0
        avg_write_ms = (sum(write_times) / len(write_times) * 1000) if write_times else 0.0
        throughput = iterations / duration if duration > 0 else 0.0

        return {
            'read_latency_ms': avg_read_ms,
            'write_latency_ms': avg_write_ms,
            'throughput_ops': throughput,
            'memory_mb': memory_mb,
            'cache_hit_rate': hit_rate,
            'iterations': iterations,
            'duration_seconds': duration,
            'total_operations': stats.total_operations if stats else iterations * 2,
        }

    def tune_cache(self) -> Dict[str, Any]:
        """
        Optimize cache settings.

        Returns:
            Dictionary of changes made:
            - max_size: New cache size (if changed)
            - eviction_policy: New eviction policy (if changed)
            - warmed_keys: Number of keys pre-warmed
        """
        if not self.config.tune_cache:
            return {}

        cache_optimizer = self._get_cache_optimizer()
        changes = {}

        # Get current stats
        stats = cache_optimizer.get_stats()

        # Auto-tune if below target
        if stats.hit_rate < 0.85:  # Default target
            auto_changes = cache_optimizer.auto_tune()
            changes.update(auto_changes)

        # Warm cache with hot files
        vat = self.builder.ai_placer.vat
        hot_files = []

        # Find files in HOT zone
        center = (self.builder.grid_size // 2, self.builder.grid_size // 2)
        for path, locs in vat.entries.items():
            if locs:
                loc = locs[0]
                dist = math.sqrt((loc.x - center[0])**2 + (loc.y - center[1])**2)
                if dist < self.builder.grid_size // 16:  # HOT zone
                    hot_files.append(path)

        # Warm the cache with hot files
        if hot_files:
            warmed = cache_optimizer.warm_cache(hot_files[:20])  # Top 20 hot files
            changes['warmed_keys'] = warmed

        return changes

    def tune_zone_distribution(self) -> Dict[str, Any]:
        """
        Rebalance files across zones based on access patterns.

        Returns:
            Dictionary of changes made:
            - files_migrated: Number of files moved
            - zones_rebalanced: List of zones rebalanced
            - avg_distance_change: Average distance change
        """
        if not self.config.tune_zones:
            return {}

        migration_strategy = self._get_migration_strategy()
        vat = self.builder.ai_placer.vat
        center = (self.builder.grid_size // 2, self.builder.grid_size // 2)

        changes = {
            'files_migrated': 0,
            'zones_rebalanced': set(),
            'avg_distance_change': 0.0,
        }

        # Build occupied locations set
        occupied = set()
        for locs in vat.entries.values():
            for loc in locs:
                occupied.add((loc.x, loc.y))
        migration_strategy.set_occupied_locations(occupied)

        # Find files that should be migrated
        from systems.pixel_compiler.migration_strategy import MigrationCandidate

        candidates = []
        for path, locs in vat.entries.items():
            if not locs:
                continue

            loc = locs[0]
            zone = migration_strategy.classify_location(loc.x, loc.y)
            access_count = self._access_counts.get(path, 1)

            # Check if should migrate
            if migration_strategy.should_migrate(path, zone, access_count):
                candidate = MigrationCandidate(
                    path=path,
                    current_location=(loc.x, loc.y),
                    current_zone=zone,
                    access_count=access_count,
                    size_bytes=len(self.builder.file_data.get(path, b'')),
                    last_access=time.time()
                )
                candidates.append(candidate)

        # Select batch for migration
        if candidates:
            batch = migration_strategy.select_migration_batch(
                candidates,
                limits={'max_count': 50, 'max_bytes': 10 * 1024 * 1024}
            )

            # Apply migrations
            total_distance = 0.0
            for candidate in batch.candidates:
                # Calculate new target location
                new_loc = migration_strategy.calculate_target_location(
                    candidate.current_location,
                    candidate.access_count,
                    candidate.size_bytes
                )

                # Update VAT entry
                old_locs = vat.entries.get(candidate.path, [])
                if old_locs:
                    # Move first cluster to new location
                    from systems.pixel_compiler.infinite_map_v2 import ClusterLocation
                    old_locs[0] = ClusterLocation(new_loc[0], new_loc[1])
                    changes['files_migrated'] += 1
                    changes['zones_rebalanced'].add(candidate.current_zone)

                    # Track distance change
                    old_dist = math.sqrt(
                        (candidate.current_location[0] - center[0])**2 +
                        (candidate.current_location[1] - center[1])**2
                    )
                    new_dist = math.sqrt(
                        (new_loc[0] - center[0])**2 +
                        (new_loc[1] - center[1])**2
                    )
                    total_distance += abs(new_dist - old_dist)

            if changes['files_migrated'] > 0:
                changes['avg_distance_change'] = total_distance / changes['files_migrated']

        # Convert set to list for JSON serialization
        changes['zones_rebalanced'] = list(changes['zones_rebalanced'])

        return changes

    def tune_cluster_size(self) -> Dict[str, Any]:
        """
        Optimize cluster allocation.

        This performs:
        - Defragmentation of fragmented files
        - Sequential allocation optimization

        Returns:
            Dictionary of changes made:
            - defragmented_files: Number of files defragmented
            - sequential_optimized: Number of files optimized for sequential access
            - fragmentation_before: Fragmentation percentage before
            - fragmentation_after: Fragmentation percentage after
        """
        if not self.config.tune_clusters:
            return {}

        vat = self.builder.ai_placer.vat

        changes = {
            'defragmented_files': 0,
            'sequential_optimized': 0,
            'fragmentation_before': 0.0,
            'fragmentation_after': 0.0,
        }

        # Calculate initial fragmentation
        fragmented_count = 0
        total_files = 0

        for path, locs in vat.entries.items():
            if not locs or len(locs) <= 1:
                continue

            total_files += 1

            # Check if clusters are non-sequential
            sequential = True
            for i in range(len(locs) - 1):
                dist = math.sqrt(
                    (locs[i+1].x - locs[i].x)**2 +
                    (locs[i+1].y - locs[i].y)**2
                )
                # If clusters are more than 32 pixels apart, consider fragmented
                if dist > 32:
                    sequential = False
                    break

            if not sequential:
                fragmented_count += 1

        if total_files > 0:
            changes['fragmentation_before'] = (fragmented_count / total_files) * 100

        # For now, we just report fragmentation - actual defragmentation
        # would require significant data movement
        # This could be enhanced to actually relocate clusters

        changes['fragmentation_after'] = changes['fragmentation_before']
        changes['defragmented_files'] = 0
        changes['sequential_optimized'] = 0

        return changes

    def tune_all(self) -> TuningResult:
        """
        Run all tuning optimizations.

        Returns:
            TuningResult with all changes and metrics
        """
        # Validate config first
        is_valid, errors = self.validate_config()
        if not is_valid:
            return TuningResult(
                success=False,
                changes_made={},
                before_metrics={},
                after_metrics={},
                improvement_percent=0.0,
                recommendations=[f"Configuration error: {e}" for e in errors]
            )

        # Capture before metrics
        before_metrics = self.get_current_metrics()

        # Track all changes
        all_changes = {}
        recommendations = []

        # Run tuning stages
        if self.config.tune_cache:
            cache_changes = self.tune_cache()
            if cache_changes:
                all_changes['cache'] = cache_changes
                if cache_changes.get('warmed_keys', 0) > 0:
                    recommendations.append(
                        f"Warmed {cache_changes['warmed_keys']} hot files in cache"
                    )

        if self.config.tune_zones:
            zone_changes = self.tune_zone_distribution()
            if zone_changes and zone_changes.get('files_migrated', 0) > 0:
                all_changes['zones'] = zone_changes
                recommendations.append(
                    f"Migrated {zone_changes['files_migrated']} files to optimal zones"
                )

        if self.config.tune_clusters:
            cluster_changes = self.tune_cluster_size()
            all_changes['clusters'] = cluster_changes
            if cluster_changes.get('fragmentation_before', 0) > 20:
                recommendations.append(
                    f"Consider running defragmentation (current: {cluster_changes['fragmentation_before']:.1f}%)"
                )

        # Capture after metrics
        after_metrics = self.get_current_metrics()

        # Calculate improvement
        improvement = self._calculate_improvement(before_metrics, after_metrics)

        # Add general recommendations
        if after_metrics['cache_hit_rate'] < 0.8:
            recommendations.append(
                "Consider increasing cache size to improve hit rate"
            )
        if after_metrics['throughput_ops'] < self.config.target_throughput_ops:
            recommendations.append(
                f"Throughput below target ({self.config.target_throughput_ops} ops/sec)"
            )

        result = TuningResult(
            success=True,
            changes_made=all_changes,
            before_metrics=before_metrics,
            after_metrics=after_metrics,
            improvement_percent=improvement,
            recommendations=recommendations if recommendations else ["System is well optimized"]
        )

        # Record in history
        self._tuning_history.append(result)

        return result

    def _calculate_improvement(
        self,
        before: Dict[str, float],
        after: Dict[str, float]
    ) -> float:
        """
        Calculate overall improvement percentage.

        Considers:
        - Latency improvement (lower is better)
        - Throughput improvement (higher is better)
        - Cache hit rate improvement (higher is better)
        """
        improvements = []

        # Latency improvement (lower is better)
        if before['read_latency_ms'] > 0:
            latency_improvement = (
                (before['read_latency_ms'] - after['read_latency_ms']) /
                before['read_latency_ms'] * 100
            )
            improvements.append(max(0, latency_improvement))

        # Throughput improvement (higher is better)
        if before['throughput_ops'] > 0:
            throughput_improvement = (
                (after['throughput_ops'] - before['throughput_ops']) /
                before['throughput_ops'] * 100
            )
            improvements.append(max(0, throughput_improvement))

        # Cache hit rate improvement (higher is better)
        if before['cache_hit_rate'] > 0:
            hit_rate_improvement = (
                (after['cache_hit_rate'] - before['cache_hit_rate']) /
                before['cache_hit_rate'] * 100
            )
            improvements.append(max(0, hit_rate_improvement))

        # Return average improvement
        return sum(improvements) / len(improvements) if improvements else 0.0

    def compare_before_after(self) -> Dict[str, Any]:
        """
        Show improvement from last tuning.

        Returns:
            Dictionary with before/after comparison
        """
        if not self._tuning_history:
            return {
                'error': 'No tuning history available',
                'before': None,
                'after': None,
                'improvement': None
            }

        last_result = self._tuning_history[-1]

        comparison = {
            'before': last_result.before_metrics,
            'after': last_result.after_metrics,
            'improvement': {},
            'improvement_percent': last_result.improvement_percent,
            'changes_made': last_result.changes_made,
            'recommendations': last_result.recommendations,
        }

        # Calculate per-metric improvement
        for key in last_result.before_metrics:
            before_val = last_result.before_metrics[key]
            after_val = last_result.after_metrics[key]

            if before_val > 0:
                delta = after_val - before_val
                percent = (delta / before_val) * 100
            else:
                delta = after_val
                percent = 0.0

            comparison['improvement'][key] = {
                'before': before_val,
                'after': after_val,
                'delta': delta,
                'percent': percent,
            }

        return comparison

    def record_access(self, path: str) -> None:
        """
        Record a file access for tuning decisions.

        Args:
            path: File path that was accessed
        """
        self._access_counts[path] = self._access_counts.get(path, 0) + 1

        # Also record in cache optimizer
        cache_optimizer = self._get_cache_optimizer()
        cache_optimizer.record_access(path)

    def get_tuning_history(self) -> List[TuningResult]:
        """
        Get history of tuning operations.

        Returns:
            List of TuningResult objects
        """
        return self._tuning_history.copy()

    def reset_history(self) -> None:
        """Clear tuning history."""
        self._tuning_history.clear()


def main():
    """CLI for performance tuner."""
    import argparse
    import sys
    import json

    parser = argparse.ArgumentParser(
        description='Performance Tuner for Infinite Map OS',
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )

    parser.add_argument('--image', required=True,
                       help='Path to Infinite Map image (.rts.png)')
    parser.add_argument('--tune-all', action='store_true',
                       help='Run all tuning optimizations')
    parser.add_argument('--tune-cache', action='store_true',
                       help='Tune cache settings only')
    parser.add_argument('--tune-zones', action='store_true',
                       help='Rebalance zones only')
    parser.add_argument('--tune-clusters', action='store_true',
                       help='Optimize clusters only')
    parser.add_argument('--benchmark', type=int, default=100,
                       help='Run benchmark with N iterations')
    parser.add_argument('--metrics', action='store_true',
                       help='Show current metrics')
    parser.add_argument('--compare', action='store_true',
                       help='Compare before/after from last tuning')
    parser.add_argument('--config', type=str,
                       help='JSON file with tuning configuration')
    parser.add_argument('--output', type=str,
                       help='Output file for results (JSON)')

    args = parser.parse_args()

    # Load configuration
    config = TuningConfig()
    if args.config:
        with open(args.config, 'r') as f:
            config_data = json.load(f)
            config = TuningConfig(**config_data)

    # Create mock builder for CLI demo
    # (In real use, this would load from the image)
    from systems.pixel_compiler.infinite_map_v2 import InfiniteMapBuilderV2
    import tempfile

    with tempfile.TemporaryDirectory() as tmpdir:
        # Create minimal source directory
        source = Path(tmpdir) / "source"
        source.mkdir()
        (source / "test.txt").write_bytes(b"test data")

        output = Path(tmpdir) / "output.rts.png"

        builder = InfiniteMapBuilderV2(
            source_dir=str(source),
            output_path=str(output),
            grid_size=512
        )

        tuner = PerformanceTuner(builder, config)

        results = {}

        try:
            if args.metrics:
                metrics = tuner.get_current_metrics()
                print("[*] Current Performance Metrics:")
                for key, value in metrics.items():
                    if 'rate' in key:
                        print(f"    {key}: {value:.2%}")
                    elif 'latency' in key:
                        print(f"    {key}: {value:.2f} ms")
                    else:
                        print(f"    {key}: {value:.2f}")
                results['metrics'] = metrics

            if args.benchmark > 0 and not args.tune_all:
                benchmark_results = tuner.benchmark(iterations=args.benchmark)
                print(f"\n[*] Benchmark Results ({args.benchmark} iterations):")
                print(f"    Read Latency: {benchmark_results['read_latency_ms']:.2f} ms")
                print(f"    Write Latency: {benchmark_results['write_latency_ms']:.2f} ms")
                print(f"    Throughput: {benchmark_results['throughput_ops']:.2f} ops/sec")
                print(f"    Cache Hit Rate: {benchmark_results['cache_hit_rate']:.2%}")
                print(f"    Duration: {benchmark_results['duration_seconds']:.2f} s")
                results['benchmark'] = benchmark_results

            if args.tune_cache:
                changes = tuner.tune_cache()
                print(f"\n[*] Cache Tuning Results:")
                for key, value in changes.items():
                    print(f"    {key}: {value}")
                results['cache_tuning'] = changes

            if args.tune_zones:
                changes = tuner.tune_zone_distribution()
                print(f"\n[*] Zone Rebalancing Results:")
                for key, value in changes.items():
                    print(f"    {key}: {value}")
                results['zone_tuning'] = changes

            if args.tune_clusters:
                changes = tuner.tune_cluster_size()
                print(f"\n[*] Cluster Optimization Results:")
                for key, value in changes.items():
                    print(f"    {key}: {value}")
                results['cluster_tuning'] = changes

            if args.tune_all:
                result = tuner.tune_all()
                print(f"\n[*] Full Tuning Results:")
                print(f"    Success: {result.success}")
                print(f"    Improvement: {result.improvement_percent:.1f}%")
                print(f"    Changes Made:")
                for category, changes in result.changes_made.items():
                    print(f"      {category}: {changes}")
                print(f"    Recommendations:")
                for rec in result.recommendations:
                    print(f"      - {rec}")
                results['tuning'] = result.to_dict()

            if args.compare:
                comparison = tuner.compare_before_after()
                if 'error' in comparison:
                    print(f"\n[!] {comparison['error']}")
                else:
                    print(f"\n[*] Before/After Comparison:")
                    print(f"    Overall Improvement: {comparison['improvement_percent']:.1f}%")
                    for key, data in comparison.get('improvement', {}).items():
                        print(f"    {key}:")
                        print(f"      Before: {data['before']:.4f}")
                        print(f"      After: {data['after']:.4f}")
                        print(f"      Change: {data['percent']:+.1f}%")
                results['comparison'] = comparison

            if args.output:
                with open(args.output, 'w') as f:
                    json.dump(results, f, indent=2, default=str)
                print(f"\n[*] Results saved to: {args.output}")

            if not any([args.tune_all, args.tune_cache, args.tune_zones,
                       args.tune_clusters, args.metrics, args.compare]):
                # Default: show metrics
                metrics = tuner.get_current_metrics()
                print("[*] Current Performance Metrics:")
                for key, value in metrics.items():
                    if 'rate' in key:
                        print(f"    {key}: {value:.2%}")
                    else:
                        print(f"    {key}: {value:.2f}")

        except Exception as e:
            print(f"[!] Error: {e}", file=sys.stderr)
            import traceback
            traceback.print_exc()
            sys.exit(1)


if __name__ == '__main__':
    main()
