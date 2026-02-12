#!/usr/bin/env python3
"""
Cache Optimizer for Infinite Map OS.

Analyzes cache access patterns and provides tuning recommendations
for optimal cache performance.

Features:
- Access pattern analysis
- Cache size recommendations
- Eviction policy recommendations
- Auto-tuning capabilities
- Cache warming
- Policy simulation
"""

import time
import math
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Callable, TYPE_CHECKING
from collections import defaultdict
from enum import Enum

if TYPE_CHECKING:
    from texture_cache import TextureCache


class EvictionPolicy(Enum):
    """Supported eviction policies."""
    LRU = "lru"  # Least Recently Used
    LFU = "lfu"  # Least Frequently Used
    ARC = "arc"  # Adaptive Replacement Cache


@dataclass
class CacheStats:
    """
    Cache statistics for monitoring and optimization.

    Attributes:
        hits: Number of cache hits
        misses: Number of cache misses
        evictions: Number of cache evictions
        size: Current cache size (entries or bytes)
        max_size: Maximum cache size
        hit_rate: Cache hit rate (0.0 to 1.0)
        avg_access_time: Average access time in seconds
    """
    hits: int = 0
    misses: int = 0
    evictions: int = 0
    size: int = 0
    max_size: int = 0
    hit_rate: float = 0.0
    avg_access_time: float = 0.0

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            'hits': self.hits,
            'misses': self.misses,
            'evictions': self.evictions,
            'size': self.size,
            'max_size': self.max_size,
            'hit_rate': self.hit_rate,
            'avg_access_time': self.avg_access_time
        }


@dataclass
class AccessPattern:
    """
    Access pattern analysis for a cache key.

    Attributes:
        key: Cache key identifier
        access_count: Number of times accessed
        last_access: Timestamp of last access
        avg_interval: Average time between accesses in seconds
        priority: Computed priority score (higher = more important)
    """
    key: str
    access_count: int = 0
    last_access: float = 0.0
    avg_interval: float = 0.0
    priority: float = 0.0

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            'key': self.key,
            'access_count': self.access_count,
            'last_access': self.last_access,
            'avg_interval': self.avg_interval,
            'priority': self.priority
        }


@dataclass
class SimulationResult:
    """Result of cache policy simulation."""
    policy: str
    simulated_hits: int
    simulated_misses: int
    simulated_evictions: int
    hit_rate: float
    duration_seconds: float


class MockCache:
    """
    Mock cache for testing and simulation.

    Provides basic cache functionality with hit/miss tracking.
    """

    def __init__(self, max_size: int = 100):
        """Initialize mock cache."""
        self.max_size = max_size
        self._cache: Dict[str, Any] = {}
        self._hits = 0
        self._misses = 0
        self._evictions = 0
        self._access_times: Dict[str, List[float]] = defaultdict(list)
        self._access_counts: Dict[str, int] = defaultdict(int)
        self._last_access: Dict[str, float] = {}

    def get(self, key: str) -> Optional[Any]:
        """Get value from cache."""
        if key in self._cache:
            self._hits += 1
            self._access_counts[key] += 1
            self._last_access[key] = time.time()
            self._access_times[key].append(time.time())
            return self._cache[key]
        self._misses += 1
        return None

    def put(self, key: str, value: Any) -> None:
        """Put value in cache with eviction if needed."""
        if len(self._cache) >= self.max_size and key not in self._cache:
            # Evict LRU
            if self._cache:
                lru_key = min(self._last_access, key=self._last_access.get)
                del self._cache[lru_key]
                del self._last_access[lru_key]
                self._evictions += 1

        self._cache[key] = value
        self._last_access[key] = time.time()
        self._access_times[key].append(time.time())

    def clear(self) -> None:
        """Clear cache."""
        self._cache.clear()
        self._last_access.clear()
        self._hits = 0
        self._misses = 0
        self._evictions = 0

    def get_statistics(self) -> Dict[str, Any]:
        """Get cache statistics."""
        total = self._hits + self._misses
        return {
            'hits': self._hits,
            'misses': self._misses,
            'evictions': self._evictions,
            'entries': len(self._cache),
            'hit_rate': self._hits / total if total > 0 else 0.0,
            'max_size': self.max_size
        }


class CacheOptimizer:
    """
    Cache performance optimizer.

    Analyzes access patterns and provides tuning recommendations
    for optimal cache performance.

    Features:
    - Access pattern analysis
    - Working set identification
    - Cache size recommendations
    - Eviction policy recommendations
    - Auto-tuning capabilities
    - Cache warming
    - Policy simulation

    Usage:
        optimizer = CacheOptimizer(cache, target_hit_rate=0.85)
        patterns = optimizer.analyze_access_pattern()
        optimal_size = optimizer.recommend_cache_size()
        policy = optimizer.recommend_eviction_policy()
        optimizer.auto_tune()
    """

    # Default configuration
    DEFAULT_TARGET_HIT_RATE = 0.85
    WORKING_SET_SAFETY_MARGIN = 1.5
    TEMPORAL_PATTERN_THRESHOLD = 0.6  # If > 60% patterns are temporal, use LRU

    def __init__(
        self,
        cache: Any,
        target_hit_rate: float = DEFAULT_TARGET_HIT_RATE
    ):
        """
        Initialize cache optimizer.

        Args:
            cache: Cache instance with get_statistics() method
            target_hit_rate: Target cache hit rate (0.0 to 1.0)
        """
        self.cache = cache
        self.target_hit_rate = target_hit_rate

        # Access tracking
        self._access_times: Dict[str, List[float]] = defaultdict(list)
        self._access_counts: Dict[str, int] = defaultdict(int)
        self._last_access: Dict[str, float] = {}
        self._first_access: Dict[str, float] = {}

        # Performance tracking
        self._access_time_samples: List[float] = []
        self._start_time = time.time()

        # Working set (frequently accessed keys)
        self._working_set: Optional[set] = None

    def record_access(self, key: str, access_time: Optional[float] = None) -> None:
        """
        Record an access event for analysis.

        Args:
            key: Cache key that was accessed
            access_time: Time of access (default: current time)
        """
        if access_time is None:
            access_time = time.time()

        # Track access times
        self._access_times[key].append(access_time)
        self._access_counts[key] += 1
        self._last_access[key] = access_time

        # Track first access
        if key not in self._first_access:
            self._first_access[key] = access_time

        # Invalidate working set cache
        self._working_set = None

    def analyze_access_pattern(self) -> List[AccessPattern]:
        """
        Analyze access frequency patterns.

        Returns:
            List of AccessPattern for each accessed key
        """
        patterns = []
        now = time.time()

        for key in self._access_times:
            access_times = self._access_times[key]
            access_count = self._access_counts[key]
            last_access = self._last_access.get(key, 0.0)
            first_access = self._first_access.get(key, now)

            # Calculate average interval
            if len(access_times) > 1:
                sorted_times = sorted(access_times)
                intervals = [sorted_times[i+1] - sorted_times[i]
                           for i in range(len(sorted_times) - 1)]
                avg_interval = sum(intervals) / len(intervals)
            else:
                avg_interval = 0.0

            # Calculate priority: frequency * recency factor
            # Higher access count = higher priority
            # More recent access = higher priority
            recency_factor = 1.0 / (1.0 + (now - last_access) / 60.0)  # Decay over minutes
            frequency_factor = math.log1p(access_count)  # Log scale for frequency
            priority = frequency_factor * recency_factor

            pattern = AccessPattern(
                key=key,
                access_count=access_count,
                last_access=last_access,
                avg_interval=avg_interval,
                priority=priority
            )
            patterns.append(pattern)

        # Sort by priority (highest first)
        patterns.sort(key=lambda p: p.priority, reverse=True)

        return patterns

    def identify_working_set(self, threshold_count: int = 3) -> set:
        """
        Identify the working set (frequently accessed keys).

        Working set = keys accessed more than threshold_count times.

        Args:
            threshold_count: Minimum accesses to be considered working set

        Returns:
            Set of keys in the working set
        """
        if self._working_set is not None:
            return self._working_set

        self._working_set = {
            key for key, count in self._access_counts.items()
            if count >= threshold_count
        }

        return self._working_set

    def recommend_cache_size(self) -> int:
        """
        Calculate optimal cache size based on access patterns.

        Uses working set analysis with safety margin.

        Returns:
            Recommended cache size (number of entries)
        """
        # If no access data yet, return default
        if not self._access_counts:
            return 100

        # Identify working set
        working_set = self.identify_working_set()
        working_set_size = len(working_set)

        # If no working set identified yet, return default
        if working_set_size == 0:
            return 100

        # Apply safety margin
        recommended_size = int(working_set_size * self.WORKING_SET_SAFETY_MARGIN)

        # Ensure minimum size is at least the working set size
        recommended_size = max(working_set_size, recommended_size)

        return recommended_size

    def recommend_eviction_policy(self) -> str:
        """
        Suggest best eviction policy based on access patterns.

        Analyzes:
        - Temporal locality (LRU favored)
        - Frequency distribution (LFU favored)
        - Pattern consistency (ARC for mixed)

        Returns:
            Policy name: "lru", "lfu", or "arc"
        """
        patterns = self.analyze_access_pattern()

        if not patterns:
            return "lru"  # Default to LRU if no data

        # Analyze patterns
        temporal_score = 0.0
        frequency_score = 0.0

        for pattern in patterns:
            # Temporal: consistent intervals suggest temporal locality
            if pattern.avg_interval > 0:
                # Low variance in intervals = temporal pattern
                interval_variance = self._calculate_interval_variance(pattern.key)
                if interval_variance < pattern.avg_interval * 0.5:
                    temporal_score += pattern.access_count

            # Frequency: high access count = frequency-based access
            if pattern.access_count > 5:
                frequency_score += pattern.access_count

        total_score = temporal_score + frequency_score
        if total_score == 0:
            return "lru"

        temporal_ratio = temporal_score / total_score

        # Decision logic
        if temporal_ratio > self.TEMPORAL_PATTERN_THRESHOLD:
            return "lru"
        elif temporal_ratio < (1.0 - self.TEMPORAL_PATTERN_THRESHOLD):
            return "lfu"
        else:
            return "arc"

    def _calculate_interval_variance(self, key: str) -> float:
        """Calculate variance of access intervals for a key."""
        times = sorted(self._access_times.get(key, []))
        if len(times) < 2:
            return 0.0

        intervals = [times[i+1] - times[i] for i in range(len(times) - 1)]
        if not intervals:
            return 0.0

        mean = sum(intervals) / len(intervals)
        variance = sum((i - mean) ** 2 for i in intervals) / len(intervals)
        return variance

    def auto_tune(self) -> Dict[str, Any]:
        """
        Apply optimizations automatically.

        Returns:
            Dictionary of changes made
        """
        changes = {}

        # Get current stats
        stats = self.get_stats()
        current_hit_rate = stats.hit_rate

        # Only tune if below target
        if current_hit_rate < self.target_hit_rate:
            # Recommend and apply new size
            new_size = self.recommend_cache_size()
            current_max = getattr(self.cache, 'max_size',
                                  getattr(self.cache, 'max_entries', 100))

            if new_size > current_max:
                # Apply new size
                if hasattr(self.cache, 'max_size'):
                    self.cache.max_size = new_size
                    changes['max_size'] = new_size
                if hasattr(self.cache, 'max_entries'):
                    self.cache.max_entries = new_size
                    changes['max_entries'] = new_size

            # Recommend policy
            policy = self.recommend_eviction_policy()
            if hasattr(self.cache, 'eviction_policy'):
                old_policy = self.cache.eviction_policy
                if policy != old_policy:
                    self.cache.eviction_policy = policy
                    changes['eviction_policy'] = policy

        # Clear working set cache for recalculation
        self._working_set = None

        return changes

    def get_stats(self) -> CacheStats:
        """
        Return current cache statistics.

        Returns:
            CacheStats with current metrics
        """
        # Get stats from cache if available
        if hasattr(self.cache, 'get_statistics'):
            cache_stats = self.cache.get_statistics()
        else:
            cache_stats = {
                'hits': 0,
                'misses': 0,
                'evictions': 0,
                'entries': 0,
                'hit_rate': 0.0
            }

        # Calculate hit rate
        hits = cache_stats.get('hits', 0)
        misses = cache_stats.get('misses', 0)
        total = hits + misses
        hit_rate = hits / total if total > 0 else 0.0

        # Get size info
        if hasattr(self.cache, 'max_size'):
            max_size = self.cache.max_size
        elif hasattr(self.cache, 'max_entries'):
            max_size = self.cache.max_entries
        else:
            max_size = 0

        if hasattr(self.cache, '_current_size_bytes'):
            size = self.cache._current_size_bytes
        elif hasattr(self.cache, '_cache'):
            size = len(self.cache._cache)
        elif hasattr(self.cache, 'cache'):
            size = len(self.cache.cache)
        else:
            size = cache_stats.get('entries', 0)

        # Calculate average access time
        avg_access_time = 0.0
        if self._access_time_samples:
            avg_access_time = sum(self._access_time_samples) / len(self._access_time_samples)

        return CacheStats(
            hits=hits,
            misses=misses,
            evictions=cache_stats.get('evictions', 0),
            size=size,
            max_size=max_size,
            hit_rate=hit_rate,
            avg_access_time=avg_access_time
        )

    def warm_cache(self, keys: List[str], loader: Optional[Callable[[str], Any]] = None) -> int:
        """
        Pre-populate cache with frequently accessed items.

        Args:
            keys: List of keys to warm
            loader: Optional function to load values (key -> value)

        Returns:
            Number of items successfully cached
        """
        warmed = 0

        for key in keys:
            # Check if already cached
            if hasattr(self.cache, 'get'):
                existing = self.cache.get(key)
                if existing is not None:
                    continue

            # Load and cache if loader provided
            if loader is not None:
                try:
                    value = loader(key)
                    if value is not None:
                        if hasattr(self.cache, 'put'):
                            self.cache.put(key, value)
                        elif hasattr(self.cache, '_cache'):
                            self.cache._cache[key] = value
                        warmed += 1
                except Exception:
                    continue
            else:
                # Just record as warmed if no loader
                warmed += 1

        return warmed

    def simulate_policy(
        self,
        policy: str,
        duration: float = 1.0
    ) -> SimulationResult:
        """
        Simulate eviction policy performance.

        Args:
            policy: Policy to simulate ("lru", "lfu", "arc")
            duration: Simulation duration in seconds (for time-based metrics)

        Returns:
            SimulationResult with predicted metrics
        """
        start_time = time.time()

        # Get historical access patterns
        patterns = self.analyze_access_pattern()

        if not patterns:
            return SimulationResult(
                policy=policy,
                simulated_hits=0,
                simulated_misses=0,
                simulated_evictions=0,
                hit_rate=0.0,
                duration_seconds=0.0
            )

        # Create simulated cache
        cache_size = self.recommend_cache_size()
        simulated_cache: Dict[str, int] = {}  # key -> access_count (for LFU) or timestamp (for LRU)
        simulated_hits = 0
        simulated_misses = 0
        simulated_evictions = 0

        # Replay access patterns
        for pattern in patterns:
            key = pattern.key

            for _ in range(pattern.access_count):
                if key in simulated_cache:
                    simulated_hits += 1
                    # Update metadata based on policy
                    if policy == "lru":
                        simulated_cache[key] = int(time.time())
                    elif policy == "lfu":
                        simulated_cache[key] += 1
                else:
                    simulated_misses += 1

                    # Evict if needed
                    if len(simulated_cache) >= cache_size:
                        evict_key = self._select_eviction_key(
                            simulated_cache, policy
                        )
                        if evict_key:
                            del simulated_cache[evict_key]
                            simulated_evictions += 1

                    # Add to cache
                    if policy == "lfu":
                        simulated_cache[key] = 1
                    else:
                        simulated_cache[key] = int(time.time())

        total = simulated_hits + simulated_misses
        hit_rate = simulated_hits / total if total > 0 else 0.0

        return SimulationResult(
            policy=policy,
            simulated_hits=simulated_hits,
            simulated_misses=simulated_misses,
            simulated_evictions=simulated_evictions,
            hit_rate=hit_rate,
            duration_seconds=time.time() - start_time
        )

    def _select_eviction_key(
        self,
        cache: Dict[str, int],
        policy: str
    ) -> Optional[str]:
        """Select key to evict based on policy."""
        if not cache:
            return None

        if policy == "lru":
            # Evict lowest timestamp (oldest)
            return min(cache, key=cache.get)
        elif policy == "lfu":
            # Evict lowest count
            return min(cache, key=cache.get)
        elif policy == "arc":
            # Simple ARC approximation: combine LRU and LFU
            # In real implementation would use dual ghost lists
            return min(cache, key=cache.get)

        return min(cache, key=cache.get)  # Default to LRU

    def compare_policies(self) -> Dict[str, SimulationResult]:
        """
        Compare all eviction policies.

        Returns:
            Dictionary mapping policy name to SimulationResult
        """
        results = {}
        for policy in ["lru", "lfu", "arc"]:
            results[policy] = self.simulate_policy(policy)
        return results

    def get_recommendations(self) -> Dict[str, Any]:
        """
        Get all optimization recommendations.

        Returns:
            Dictionary with size, policy, and working set recommendations
        """
        patterns = self.analyze_access_pattern()
        working_set = self.identify_working_set()

        return {
            'recommended_size': self.recommend_cache_size(),
            'recommended_policy': self.recommend_eviction_policy(),
            'working_set_size': len(working_set),
            'total_keys': len(patterns),
            'current_stats': self.get_stats().to_dict(),
            'top_accessed': [p.to_dict() for p in patterns[:10]]
        }


def main():
    """CLI for cache optimizer."""
    import argparse
    import sys

    parser = argparse.ArgumentParser(
        description='Cache Optimizer for Infinite Map OS',
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )

    parser.add_argument('--analyze', action='store_true',
                       help='Analyze cache access patterns')
    parser.add_argument('--recommend-size', action='store_true',
                       help='Get cache size recommendation')
    parser.add_argument('--recommend-policy', action='store_true',
                       help='Get eviction policy recommendation')
    parser.add_argument('--auto-tune', action='store_true',
                       help='Apply optimizations automatically')
    parser.add_argument('--stats', action='store_true',
                       help='Show cache statistics')
    parser.add_argument('--simulate', metavar='POLICY',
                       choices=['lru', 'lfu', 'arc'],
                       help='Simulate eviction policy performance')
    parser.add_argument('--compare', action='store_true',
                       help='Compare all policies')
    parser.add_argument('--target-hit-rate', type=float,
                       default=0.85,
                       help='Target hit rate for auto-tuning')

    args = parser.parse_args()

    # Create mock cache for demo
    cache = MockCache(max_size=100)
    optimizer = CacheOptimizer(cache, target_hit_rate=args.target_hit_rate)

    # Simulate some access patterns for demo
    demo_keys = ['kernel', 'libc', 'shell', 'editor', 'compiler']
    for _ in range(10):
        for key in demo_keys:
            optimizer.record_access(key)

    # Add some one-time accesses
    for i in range(20):
        optimizer.record_access(f'cold_file_{i}')

    try:
        if args.analyze:
            patterns = optimizer.analyze_access_pattern()
            print("[*] Access Pattern Analysis:")
            for p in patterns[:10]:
                print(f"    {p.key}: count={p.access_count}, "
                      f"priority={p.priority:.3f}, "
                      f"avg_interval={p.avg_interval:.2f}s")

        if args.recommend_size:
            size = optimizer.recommend_cache_size()
            print(f"[*] Recommended Cache Size: {size} entries")

        if args.recommend_policy:
            policy = optimizer.recommend_eviction_policy()
            print(f"[*] Recommended Eviction Policy: {policy}")

        if args.auto_tune:
            changes = optimizer.auto_tune()
            if changes:
                print("[*] Auto-tune applied changes:")
                for key, value in changes.items():
                    print(f"    {key}: {value}")
            else:
                print("[*] No changes needed (cache already optimal)")

        if args.stats:
            stats = optimizer.get_stats()
            print("[*] Cache Statistics:")
            print(f"    Hits: {stats.hits}")
            print(f"    Misses: {stats.misses}")
            print(f"    Evictions: {stats.evictions}")
            print(f"    Size: {stats.size} / {stats.max_size}")
            print(f"    Hit Rate: {stats.hit_rate:.2%}")
            print(f"    Avg Access Time: {stats.avg_access_time:.4f}s")

        if args.simulate:
            result = optimizer.simulate_policy(args.simulate)
            print(f"[*] Simulation Results ({args.simulate}):")
            print(f"    Simulated Hits: {result.simulated_hits}")
            print(f"    Simulated Misses: {result.simulated_misses}")
            print(f"    Simulated Evictions: {result.simulated_evictions}")
            print(f"    Hit Rate: {result.hit_rate:.2%}")

        if args.compare:
            results = optimizer.compare_policies()
            print("[*] Policy Comparison:")
            for policy, result in results.items():
                print(f"    {policy.upper()}: hit_rate={result.hit_rate:.2%}, "
                      f"evictions={result.simulated_evictions}")

        if not any([args.analyze, args.recommend_size, args.recommend_policy,
                   args.auto_tune, args.stats, args.simulate, args.compare]):
            # Show full recommendations
            recs = optimizer.get_recommendations()
            print("[*] Cache Optimization Recommendations:")
            print(f"    Recommended Size: {recs['recommended_size']}")
            print(f"    Recommended Policy: {recs['recommended_policy']}")
            print(f"    Working Set Size: {recs['working_set_size']}")
            print(f"    Total Keys: {recs['total_keys']}")
            print(f"    Current Hit Rate: {recs['current_stats']['hit_rate']:.2%}")

    except Exception as e:
        print(f"[!] Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()
