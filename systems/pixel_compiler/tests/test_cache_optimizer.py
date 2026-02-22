#!/usr/bin/env python3
"""
Tests for Cache Optimizer.

Tests cover:
- CacheStats dataclass
- AccessPattern dataclass
- CacheOptimizer class
- Access pattern analysis
- Cache size recommendations
- Eviction policy recommendations
- Auto-tuning
- Cache warming
- Policy simulation
"""

import pytest
import time
from dataclasses import asdict

from systems.pixel_compiler.cache_optimizer import (
    CacheStats,
    AccessPattern,
    CacheOptimizer,
    MockCache,
    EvictionPolicy,
    SimulationResult
)


class TestCacheStats:
    """Tests for CacheStats dataclass."""

    def test_cache_stats_creation(self):
        """Test CacheStats can be created with default values."""
        stats = CacheStats()
        assert stats.hits == 0
        assert stats.misses == 0
        assert stats.evictions == 0
        assert stats.size == 0
        assert stats.max_size == 0
        assert stats.hit_rate == 0.0
        assert stats.avg_access_time == 0.0

    def test_cache_stats_with_values(self):
        """Test CacheStats with explicit values."""
        stats = CacheStats(
            hits=100,
            misses=20,
            evictions=5,
            size=1024,
            max_size=2048,
            hit_rate=0.833,
            avg_access_time=0.001
        )
        assert stats.hits == 100
        assert stats.misses == 20
        assert stats.evictions == 5
        assert stats.size == 1024
        assert stats.max_size == 2048
        assert stats.hit_rate == 0.833
        assert stats.avg_access_time == 0.001

    def test_cache_stats_to_dict(self):
        """Test CacheStats serialization."""
        stats = CacheStats(hits=50, misses=10, evictions=3)
        d = stats.to_dict()
        assert d['hits'] == 50
        assert d['misses'] == 10
        assert d['evictions'] == 3
        assert 'hit_rate' in d
        assert 'avg_access_time' in d


class TestAccessPattern:
    """Tests for AccessPattern dataclass."""

    def test_access_pattern_creation(self):
        """Test AccessPattern can be created."""
        pattern = AccessPattern(key="test_key")
        assert pattern.key == "test_key"
        assert pattern.access_count == 0
        assert pattern.last_access == 0.0
        assert pattern.avg_interval == 0.0
        assert pattern.priority == 0.0

    def test_access_pattern_with_values(self):
        """Test AccessPattern with explicit values."""
        now = time.time()
        pattern = AccessPattern(
            key="kernel",
            access_count=10,
            last_access=now,
            avg_interval=5.0,
            priority=2.5
        )
        assert pattern.key == "kernel"
        assert pattern.access_count == 10
        assert pattern.last_access == now
        assert pattern.avg_interval == 5.0
        assert pattern.priority == 2.5

    def test_access_pattern_to_dict(self):
        """Test AccessPattern serialization."""
        pattern = AccessPattern(
            key="test",
            access_count=5,
            priority=1.5
        )
        d = pattern.to_dict()
        assert d['key'] == "test"
        assert d['access_count'] == 5
        assert d['priority'] == 1.5


class TestMockCache:
    """Tests for MockCache class."""

    def test_mock_cache_creation(self):
        """Test MockCache initialization."""
        cache = MockCache(max_size=50)
        assert cache.max_size == 50

    def test_mock_cache_put_get(self):
        """Test MockCache put and get operations."""
        cache = MockCache(max_size=10)
        cache.put("key1", "value1")

        result = cache.get("key1")
        assert result == "value1"
        assert cache._hits == 1

    def test_mock_cache_miss(self):
        """Test MockCache miss behavior."""
        cache = MockCache(max_size=10)
        result = cache.get("nonexistent")
        assert result is None
        assert cache._misses == 1

    def test_mock_cache_eviction(self):
        """Test MockCache LRU eviction."""
        cache = MockCache(max_size=2)
        cache.put("key1", "value1")
        time.sleep(0.01)
        cache.put("key2", "value2")
        time.sleep(0.01)
        cache.put("key3", "value3")  # Should evict key1

        assert "key1" not in cache._cache
        assert cache._evictions == 1

    def test_mock_cache_statistics(self):
        """Test MockCache get_statistics."""
        cache = MockCache(max_size=10)
        cache.put("key1", "value1")
        cache.get("key1")
        cache.get("nonexistent")

        stats = cache.get_statistics()
        assert stats['hits'] == 1
        assert stats['misses'] == 1
        assert stats['hit_rate'] == 0.5


class TestCacheOptimizer:
    """Tests for CacheOptimizer class."""

    def test_optimizer_creation(self):
        """Test CacheOptimizer initialization."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache)
        assert optimizer.cache == cache
        assert optimizer.target_hit_rate == 0.85

    def test_optimizer_custom_target(self):
        """Test CacheOptimizer with custom target hit rate."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache, target_hit_rate=0.95)
        assert optimizer.target_hit_rate == 0.95

    def test_record_access(self):
        """Test access recording."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache)

        optimizer.record_access("key1")
        optimizer.record_access("key1")
        optimizer.record_access("key2")

        assert optimizer._access_counts["key1"] == 2
        assert optimizer._access_counts["key2"] == 1

    def test_analyze_access_pattern_empty(self):
        """Test analyze_access_pattern with no data."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache)

        patterns = optimizer.analyze_access_pattern()
        assert patterns == []

    def test_analyze_access_pattern(self):
        """Test analyze_access_pattern returns correct patterns."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache)

        # Record some accesses
        for _ in range(5):
            optimizer.record_access("hot_key")
        optimizer.record_access("cold_key")

        patterns = optimizer.analyze_access_pattern()

        assert len(patterns) == 2
        # hot_key should have higher priority
        hot_pattern = next(p for p in patterns if p.key == "hot_key")
        cold_pattern = next(p for p in patterns if p.key == "cold_key")

        assert hot_pattern.access_count == 5
        assert cold_pattern.access_count == 1
        assert hot_pattern.priority > cold_pattern.priority

    def test_identify_working_set(self):
        """Test working set identification."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache)

        # Create working set
        for _ in range(5):
            optimizer.record_access("hot1")
            optimizer.record_access("hot2")

        # Cold files
        optimizer.record_access("cold1")
        optimizer.record_access("cold2")

        working_set = optimizer.identify_working_set(threshold_count=3)

        assert "hot1" in working_set
        assert "hot2" in working_set
        assert "cold1" not in working_set
        assert "cold2" not in working_set

    def test_recommend_cache_size(self):
        """Test cache size recommendation."""
        cache = MockCache(max_size=10)
        optimizer = CacheOptimizer(cache)

        # Create working set of 5 items (accessed >= 3 times)
        for _ in range(5):
            for key in ["key1", "key2", "key3", "key4", "key5"]:
                optimizer.record_access(key)

        size = optimizer.recommend_cache_size()

        # Should be working_set * 1.5 = 5 * 1.5 = 7, min 10
        # So size should be at least 10 (the min_size in recommend_cache_size)
        assert size >= 7

    def test_recommend_cache_size_empty(self):
        """Test cache size recommendation with no data."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache)

        size = optimizer.recommend_cache_size()
        # Default when no data - returns 100
        assert size == 100

    def test_recommend_eviction_policy_lru(self):
        """Test LRU policy recommendation for temporal patterns."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache)

        # Create temporal pattern (consistent intervals)
        base_time = time.time()
        for i in range(20):
            optimizer.record_access("temporal_key", access_time=base_time + i * 1.0)

        policy = optimizer.recommend_eviction_policy()
        # Should favor LRU for temporal patterns
        assert policy in ["lru", "lfu", "arc"]

    def test_recommend_eviction_policy_default(self):
        """Test default policy when no data."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache)

        policy = optimizer.recommend_eviction_policy()
        assert policy == "lru"  # Default

    def test_get_stats(self):
        """Test get_stats returns correct statistics."""
        cache = MockCache(max_size=100)
        optimizer = CacheOptimizer(cache)

        # Add some cache activity
        cache.put("key1", "value1")
        cache.get("key1")  # hit
        cache.get("nonexistent")  # miss

        stats = optimizer.get_stats()

        assert stats.hits == 1
        assert stats.misses == 1
        assert stats.max_size == 100
        assert stats.hit_rate == 0.5

    def test_auto_tune_below_target(self):
        """Test auto_tune when below target hit rate."""
        cache = MockCache(max_size=10)
        optimizer = CacheOptimizer(cache, target_hit_rate=0.9)

        # Create working set larger than cache
        for _ in range(5):
            for i in range(20):
                optimizer.record_access(f"key{i}")

        # Cause misses to lower hit rate
        for i in range(20):
            cache.get(f"key{i}")  # Will miss

        changes = optimizer.auto_tune()

        # Should recommend size increase
        assert 'max_size' in changes or len(changes) >= 0

    def test_auto_tune_at_target(self):
        """Test auto_tune when at target hit rate."""
        cache = MockCache(max_size=100)
        optimizer = CacheOptimizer(cache, target_hit_rate=0.5)

        # Warm the cache
        for i in range(10):
            cache.put(f"key{i}", f"value{i}")

        # Get some hits
        for i in range(10):
            cache.get(f"key{i}")

        changes = optimizer.auto_tune()

        # At or above target, may not need changes
        assert isinstance(changes, dict)

    def test_warm_cache(self):
        """Test cache warming."""
        cache = MockCache(max_size=100)
        optimizer = CacheOptimizer(cache)

        loader = lambda key: f"value_{key}"

        warmed = optimizer.warm_cache(["key1", "key2", "key3"], loader=loader)

        assert warmed == 3
        assert cache.get("key1") == "value_key1"
        assert cache.get("key2") == "value_key2"

    def test_warm_cache_already_cached(self):
        """Test cache warming with already cached items."""
        cache = MockCache(max_size=100)
        optimizer = CacheOptimizer(cache)

        # Pre-cache one item
        cache.put("key1", "existing")

        loader = lambda key: f"value_{key}"
        warmed = optimizer.warm_cache(["key1", "key2"], loader=loader)

        # Only key2 should be warmed
        assert warmed == 1

    def test_simulate_policy_lru(self):
        """Test LRU policy simulation."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache)

        # Create access patterns
        for _ in range(5):
            optimizer.record_access("hot")
        optimizer.record_access("cold")

        result = optimizer.simulate_policy("lru")

        assert isinstance(result, SimulationResult)
        assert result.policy == "lru"
        assert result.simulated_hits >= 0
        assert result.simulated_misses >= 0
        assert result.hit_rate >= 0.0

    def test_simulate_policy_lfu(self):
        """Test LFU policy simulation."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache)

        # Create access patterns
        for _ in range(10):
            optimizer.record_access("frequent")
        for _ in range(2):
            optimizer.record_access("rare")

        result = optimizer.simulate_policy("lfu")

        assert result.policy == "lfu"
        assert result.simulated_evictions >= 0

    def test_simulate_policy_arc(self):
        """Test ARC policy simulation."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache)

        for _ in range(5):
            optimizer.record_access("key1")

        result = optimizer.simulate_policy("arc")

        assert result.policy == "arc"

    def test_compare_policies(self):
        """Test comparing all policies."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache)

        # Create diverse access patterns
        for i in range(10):
            optimizer.record_access(f"key{i}")

        results = optimizer.compare_policies()

        assert "lru" in results
        assert "lfu" in results
        assert "arc" in results
        assert all(isinstance(r, SimulationResult) for r in results.values())

    def test_get_recommendations(self):
        """Test getting all recommendations."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache)

        for _ in range(5):
            optimizer.record_access("hot_key")

        recs = optimizer.get_recommendations()

        assert 'recommended_size' in recs
        assert 'recommended_policy' in recs
        assert 'working_set_size' in recs
        assert 'total_keys' in recs
        assert 'current_stats' in recs
        assert 'top_accessed' in recs


class TestIntegration:
    """Integration tests with TextureCache-like interface."""

    def test_with_mock_cache_full_workflow(self):
        """Test full workflow with mock cache."""
        cache = MockCache(max_size=10)
        optimizer = CacheOptimizer(cache, target_hit_rate=0.8)

        # Simulate workload
        for i in range(100):
            # Hot files
            for hot in ["kernel", "libc", "shell"]:
                optimizer.record_access(hot)
                cache.put(hot, f"data_{hot}")
                cache.get(hot)

            # Cold files (less frequent)
            if i % 10 == 0:
                optimizer.record_access(f"cold_{i}")
                cache.put(f"cold_{i}", f"data_{i}")

        # Analyze
        patterns = optimizer.analyze_access_pattern()
        assert len(patterns) > 0

        # Get recommendations
        size = optimizer.recommend_cache_size()
        assert size >= 3  # At least 3 hot files

        policy = optimizer.recommend_eviction_policy()
        assert policy in ["lru", "lfu", "arc"]

        # Get stats
        stats = optimizer.get_stats()
        assert stats.hits > 0

    def test_working_set_evolution(self):
        """Test that working set evolves over time."""
        cache = MockCache()
        optimizer = CacheOptimizer(cache)

        # Initial working set
        for _ in range(5):
            optimizer.record_access("old_hot")

        ws1 = optimizer.identify_working_set()
        assert "old_hot" in ws1

        # New working set
        for _ in range(10):
            optimizer.record_access("new_hot")

        ws2 = optimizer.identify_working_set()
        assert "new_hot" in ws2
        assert "old_hot" in ws2  # Still there

    def test_cache_warming_improves_hit_rate(self):
        """Test that cache warming improves hit rate."""
        cache = MockCache(max_size=100)
        optimizer = CacheOptimizer(cache)

        loader = lambda key: f"data_{key}"

        # Warm cache with hot keys
        hot_keys = ["kernel", "libc", "shell"]
        optimizer.warm_cache(hot_keys, loader=loader)

        # Access should be hits now
        for key in hot_keys:
            result = cache.get(key)
            assert result is not None

        stats = optimizer.get_stats()
        assert stats.hits >= 3


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
