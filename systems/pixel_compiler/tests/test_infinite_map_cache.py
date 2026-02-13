"""
Test suite for LRU cache implementation for Infinite Map FUSE filesystem.

TDD: These tests are written FIRST before implementation.
"""
import pytest
import threading
import time
from systems.pixel_compiler.infinite_map_cache import LRUCache, CacheEntry


class TestCacheEntry:
    """Test CacheEntry dataclass."""

    def test_cache_entry_creation(self):
        """Test creating a cache entry."""
        entry = CacheEntry(
            key="test_key",
            data=b"test_data",
            size=9,
            access_count=0,
            created_at=time.time(),
            last_accessed=time.time()
        )
        assert entry.key == "test_key"
        assert entry.data == b"test_data"
        assert entry.size == 9
        assert entry.access_count == 0


class TestLRUCache:
    """Test LRU cache implementation."""

    def test_set_and_get(self):
        """Test basic set and get operations."""
        cache = LRUCache(max_size=1000)
        cache.set("key1", b"data1")
        assert cache.get("key1") == b"data1"

    def test_get_nonexistent_returns_none(self):
        """Test that getting nonexistent key returns None."""
        cache = LRUCache(max_size=1000)
        assert cache.get("nonexistent") is None

    def test_eviction_when_over_limit(self):
        """Test that LRU items are evicted when cache is full."""
        cache = LRUCache(max_size=10)  # Very small cache
        cache.set("key1", b"12345")    # 5 bytes
        cache.set("key2", b"67890")    # 5 bytes, now full
        cache.set("key3", b"abcde")    # 5 bytes, should evict key1

        assert cache.get("key1") is None  # Evicted
        assert cache.get("key2") == b"67890"
        assert cache.get("key3") == b"abcde"

    def test_lru_order_on_access(self):
        """Test that accessing an item updates its LRU position."""
        cache = LRUCache(max_size=14)  # Changed from 15 to force eviction
        cache.set("key1", b"12345")    # 5 bytes
        cache.set("key2", b"67890")    # 5 bytes, total=10

        # Access key1 to make it recently used (MRU order: key2, key1)
        cache.get("key1")

        # Add new item, should evict key2 (LRU), not key1
        # 10 bytes used + 5 bytes new = 15, but max is 14, so must evict
        cache.set("key3", b"abcde")    # 5 bytes, should evict key2

        assert cache.get("key1") == b"12345"  # Still there (was accessed recently)
        assert cache.get("key2") is None      # Evicted (was LRU)

    def test_statistics_tracking(self):
        """Test that cache statistics are tracked correctly."""
        cache = LRUCache(max_size=1000)
        cache.set("key1", b"data1")

        cache.get("key1")  # Hit
        cache.get("key1")  # Hit
        cache.get("missing")  # Miss

        stats = cache.get_stats()
        assert stats["hits"] == 2
        assert stats["misses"] == 1
        assert stats["hit_rate"] == 2/3

    def test_clear_cache(self):
        """Test clearing the cache."""
        cache = LRUCache(max_size=1000)
        cache.set("key1", b"data1")
        cache.set("key2", b"data2")

        freed = cache.clear()
        assert freed > 0
        assert cache.count == 0
        assert cache.size == 0

    def test_thread_safety(self):
        """Test concurrent access is thread-safe."""
        cache = LRUCache(max_size=10000)
        errors = []

        def writer(thread_id):
            try:
                for i in range(100):
                    cache.set(f"key_{thread_id}_{i}", f"data_{i}".encode() * 10)
            except Exception as e:
                errors.append(e)

        def reader(thread_id):
            try:
                for i in range(100):
                    cache.get(f"key_{thread_id}_{i}")
            except Exception as e:
                errors.append(e)

        threads = []
        for i in range(5):
            threads.append(threading.Thread(target=writer, args=(i,)))
            threads.append(threading.Thread(target=reader, args=(i,)))

        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0, f"Thread safety errors: {errors}"

    def test_size_property(self):
        """Test size property returns current cache size."""
        cache = LRUCache(max_size=1000)
        assert cache.size == 0

        cache.set("key1", b"12345")
        assert cache.size == 5

        cache.set("key2", b"67890")
        assert cache.size == 10

    def test_count_property(self):
        """Test count property returns number of items."""
        cache = LRUCache(max_size=1000)
        assert cache.count == 0

        cache.set("key1", b"data1")
        assert cache.count == 1

        cache.set("key2", b"data2")
        assert cache.count == 2

    def test_update_existing_key(self):
        """Test that updating an existing key works correctly."""
        cache = LRUCache(max_size=1000)
        cache.set("key1", b"old_data")
        cache.set("key1", b"new_data")

        assert cache.get("key1") == b"new_data"
        assert cache.count == 1

    def test_eviction_count_tracking(self):
        """Test that eviction count is tracked in statistics."""
        cache = LRUCache(max_size=10)
        cache.set("key1", b"12345")
        cache.set("key2", b"67890")
        cache.set("key3", b"abcde")  # Should evict key1

        stats = cache.get_stats()
        assert stats["evictions"] >= 1

    def test_evict_method_returns_bytes_freed(self):
        """Test that evict method returns bytes freed."""
        cache = LRUCache(max_size=1000)
        cache.set("key1", b"12345")
        cache.set("key2", b"67890")

        freed = cache.evict(needed_size=10)
        assert freed >= 10

    def test_large_data_handling(self):
        """Test handling of large data chunks."""
        cache = LRUCache(max_size=1024 * 1024)  # 1MB
        large_data = b"x" * (512 * 1024)  # 512KB

        cache.set("large_key", large_data)
        assert cache.get("large_key") == large_data
        assert cache.size == 512 * 1024

    def test_eviction_respects_lru_order(self):
        """Test that eviction respects LRU order with multiple items."""
        cache = LRUCache(max_size=20)

        cache.set("a", b"11111")  # 5 bytes, oldest
        cache.set("b", b"22222")  # 5 bytes
        cache.set("c", b"33333")  # 5 bytes
        cache.set("d", b"44444")  # 5 bytes, newest

        # Access 'a' and 'c' to update their positions
        cache.get("a")  # Now: b, d, a, c (MRU)
        cache.get("c")  # Now: b, d, a, c is newest

        # Add item that requires eviction
        cache.set("e", b"55555")  # Should evict 'b' (LRU)

        assert cache.get("a") == b"11111"  # Still there
        assert cache.get("b") is None      # Evicted (was LRU)
        assert cache.get("c") == b"33333"  # Still there
        assert cache.get("d") == b"44444"  # Still there

    def test_zero_max_size_edge_case(self):
        """Test cache with zero max size."""
        cache = LRUCache(max_size=0)
        # Should not store anything
        result = cache.set("key1", b"data")
        # Implementation should either reject or immediately evict
        assert cache.size == 0

    def test_hit_rate_with_no_accesses(self):
        """Test hit rate calculation with no accesses."""
        cache = LRUCache(max_size=1000)
        stats = cache.get_stats()
        # Should handle division by zero gracefully
        assert stats["hit_rate"] == 0.0

    def test_multiple_evictions(self):
        """Test that multiple items can be evicted if needed."""
        cache = LRUCache(max_size=15)

        cache.set("a", b"11111")  # 5 bytes
        cache.set("b", b"22222")  # 5 bytes
        cache.set("c", b"33333")  # 5 bytes, now full

        # This should evict multiple items
        cache.set("d", b"4444444444")  # 10 bytes

        # At least one should be evicted
        assert cache.size <= 15

    def test_stats_include_count_and_size(self):
        """Test that stats include count and size."""
        cache = LRUCache(max_size=1000)
        cache.set("key1", b"data1")
        cache.set("key2", b"data2")

        stats = cache.get_stats()
        assert "count" in stats
        assert "size" in stats
        assert stats["count"] == 2
        assert stats["size"] == 10


class TestAccessPatternTracker:
    """Test AccessPatternTracker for predictive prefetching."""

    def test_record_access(self):
        """Test recording file accesses."""
        from systems.pixel_compiler.infinite_map_cache import AccessPatternTracker
        tracker = AccessPatternTracker()
        tracker.record_access("file.txt", 0)
        tracker.record_access("file.txt", 4096)
        assert "file.txt" in tracker._access_history
        assert len(tracker._access_history["file.txt"]) == 2

    def test_detects_sequential_pattern(self):
        """Test detection of sequential access pattern."""
        from systems.pixel_compiler.infinite_map_cache import AccessPatternTracker
        tracker = AccessPatternTracker()
        for offset in [0, 4096, 8192, 12288]:  # Sequential
            tracker.record_access("file.txt", offset)
        assert tracker.is_sequential("file.txt") is True

    def test_detects_random_pattern(self):
        """Test detection of random access pattern."""
        from systems.pixel_compiler.infinite_map_cache import AccessPatternTracker
        tracker = AccessPatternTracker()
        for offset in [0, 8192, 4096, 32768]:  # Random
            tracker.record_access("file.txt", offset)
        assert tracker.is_sequential("file.txt") is False

    def test_predicts_next_offset(self):
        """Test prediction of next offset based on pattern."""
        from systems.pixel_compiler.infinite_map_cache import AccessPatternTracker
        tracker = AccessPatternTracker()
        for offset in [0, 4096, 8192]:
            tracker.record_access("file.txt", offset)
        assert tracker.predict_next_offset("file.txt") == 12288

    def test_predicts_next_offset_with_different_stride(self):
        """Test prediction with non-default stride."""
        from systems.pixel_compiler.infinite_map_cache import AccessPatternTracker
        tracker = AccessPatternTracker()
        for offset in [0, 8192, 16384]:  # 8KB stride
            tracker.record_access("file.txt", offset)
        assert tracker.predict_next_offset("file.txt") == 24576

    def test_no_prediction_without_enough_history(self):
        """Test that prediction returns None without enough history."""
        from systems.pixel_compiler.infinite_map_cache import AccessPatternTracker
        tracker = AccessPatternTracker()
        tracker.record_access("file.txt", 0)
        tracker.record_access("file.txt", 4096)
        # Only 2 accesses - not enough for pattern detection (need 3+)
        assert tracker.predict_next_offset("file.txt") is None

    def test_unknown_file_not_sequential(self):
        """Test that unknown files are not considered sequential."""
        from systems.pixel_compiler.infinite_map_cache import AccessPatternTracker
        tracker = AccessPatternTracker()
        assert tracker.is_sequential("unknown.txt") is False

    def test_window_size_limit(self):
        """Test that access history respects window size."""
        from systems.pixel_compiler.infinite_map_cache import AccessPatternTracker
        tracker = AccessPatternTracker(window_size=3)
        for offset in [0, 4096, 8192, 12288, 16384]:  # 5 accesses
            tracker.record_access("file.txt", offset)
        # Should only keep last 3
        assert len(tracker._access_history["file.txt"]) == 3

    def test_get_detected_stride(self):
        """Test getting the detected stride for a file."""
        from systems.pixel_compiler.infinite_map_cache import AccessPatternTracker
        tracker = AccessPatternTracker()
        for offset in [0, 4096, 8192]:
            tracker.record_access("file.txt", offset)
        assert tracker.get_detected_stride("file.txt") == 4096

    def test_get_detected_stride_no_pattern(self):
        """Test stride detection returns None for no pattern."""
        from systems.pixel_compiler.infinite_map_cache import AccessPatternTracker
        tracker = AccessPatternTracker()
        assert tracker.get_detected_stride("unknown.txt") is None


class TestLRUCachePrefetch:
    """Test LRU cache predictive prefetching."""

    def test_should_prefetch_returns_true_for_sequential(self):
        """Test should_prefetch returns True for sequential access."""
        from systems.pixel_compiler.infinite_map_cache import LRUCache
        cache = LRUCache(max_size=1000)

        # Simulate sequential access pattern
        for offset in [0, 100, 200]:
            cache.should_prefetch("file.txt", offset)

        # After 3 sequential accesses, should recommend prefetch
        assert cache.should_prefetch("file.txt", 300) is True

    def test_should_prefetch_returns_false_for_random(self):
        """Test should_prefetch returns False for random access."""
        from systems.pixel_compiler.infinite_map_cache import LRUCache
        cache = LRUCache(max_size=1000)

        # Simulate random access pattern
        cache.should_prefetch("file.txt", 0)
        cache.should_prefetch("file.txt", 500)
        cache.should_prefetch("file.txt", 100)

        # Random pattern should not recommend prefetch
        assert cache.should_prefetch("file.txt", 300) is False

    def test_queue_prefetch_stores_data(self):
        """Test queue_prefetch stores data for later retrieval."""
        from systems.pixel_compiler.infinite_map_cache import LRUCache
        cache = LRUCache(max_size=1000)

        cache.queue_prefetch("file.txt:400:100", b"prefetched_data")

        # Data should be in prefetch queue
        assert len(cache._prefetch_queue) == 1
        assert cache._prefetch_queue[0] == ("file.txt:400:100", b"prefetched_data")

    def test_get_prefetched_data_returns_data(self):
        """Test get_prefetched_data returns queued data."""
        from systems.pixel_compiler.infinite_map_cache import LRUCache
        cache = LRUCache(max_size=1000)

        cache.queue_prefetch("file.txt:400:100", b"prefetched_data")

        # Should return the prefetched data
        data = cache.get_prefetched("file.txt:400:100")
        assert data == b"prefetched_data"

    def test_get_prefetched_data_returns_none_if_not_found(self):
        """Test get_prefetched_data returns None if key not found."""
        from systems.pixel_compiler.infinite_map_cache import LRUCache
        cache = LRUCache(max_size=1000)

        data = cache.get_prefetched("nonexistent:0:100")
        assert data is None

    def test_prefetch_can_be_disabled(self):
        """Test prefetch can be disabled."""
        from systems.pixel_compiler.infinite_map_cache import LRUCache
        cache = LRUCache(max_size=1000)

        cache.prefetch_enabled = False

        # Even with sequential pattern, should not prefetch
        for offset in [0, 100, 200]:
            cache.should_prefetch("file.txt", offset)

        assert cache.should_prefetch("file.txt", 300) is False


class TestLRUCacheIntegration:
    """Integration tests for LRU cache."""

    def test_simulated_filesystem_access_pattern(self):
        """Test cache with simulated filesystem access pattern."""
        # Use smaller files to ensure hot files stay in cache
        cache = LRUCache(max_size=5000)  # 5KB cache

        # Simulate initial file reads (100 bytes each)
        for i in range(10):
            cache.set(f"/path/file_{i}", f"f{i}".encode() * 25)  # ~50 bytes each

        # Simulate repeated access to some files (hot files)
        for _ in range(5):
            cache.get("/path/file_0")  # Hot file
            cache.get("/path/file_1")  # Hot file

        # Simulate new file reads - only 5 more to leave room for hot files
        for i in range(10, 15):
            cache.set(f"/path/file_{i}", f"f{i}".encode() * 25)

        # Hot files should still be in cache (they were accessed recently)
        # With 15 files of ~50 bytes each, we have ~750 bytes in a 5000 byte cache
        # So all files should fit without eviction
        assert cache.get("/path/file_0") is not None
        assert cache.get("/path/file_1") is not None

        # Check statistics
        stats = cache.get_stats()
        assert stats["hits"] >= 10  # At least 10 hits from hot file access
