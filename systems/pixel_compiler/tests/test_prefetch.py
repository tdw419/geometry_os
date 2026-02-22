#!/usr/bin/env python3
"""
Tests for Infinite Map Prefetch System.

Tests proactive cache loading based on access predictions.
"""

import pytest
from unittest.mock import Mock, patch
import sys
import itertools


@pytest.fixture(autouse=True, scope="function")
def reset_module_state(monkeypatch):
    """Reset module state before each test."""
    import systems.pixel_compiler.infinite_map_prefetch as prefetch_module
    # Reset the global counter using monkeypatch
    monkeypatch.setattr(prefetch_module, '_counter', itertools.count())


from systems.pixel_compiler.infinite_map_prefetch import Prefetcher, PrefetchItem


def test_empty_prefetcher_has_no_items():
    """New prefetcher has empty queue."""
    prefetcher = Prefetcher(cache_size=1000)
    assert prefetcher.get_queue_size() == 0
    assert prefetcher.get_cache_size() == 0
    assert prefetcher.get_statistics()['total_prefetched'] == 0


def test_prefetcher_adds_to_queue():
    """Prefetcher adds files to prefetch queue."""
    prefetcher = Prefetcher(cache_size=1000)

    result = prefetcher.prefetch_file("boot/vmlinuz", data=b"test", priority=1)
    assert result is True, "Should successfully enqueue prefetch"
    assert prefetcher.get_queue_size() == 1


def test_prefetcher_respects_cache_size():
    """Prefetcher limits cache to configured size."""
    prefetcher = Prefetcher(cache_size=100)  # 100 byte limit

    # Add file larger than cache
    large_file = b"x" * 200  # 200 bytes
    result = prefetcher.prefetch_file("large/file", data=large_file, priority=1)

    assert result is False, "Should reject file that exceeds cache (200 > 100)"
    assert prefetcher.get_queue_size() == 0


def test_prefetcher_processes_queue_by_priority():
    """Prefetcher processes higher priority files first."""

    prefetcher = Prefetcher(cache_size=1000)

    prefetcher.prefetch_file("low/priority", data=b"low", priority=10)
    prefetcher.prefetch_file("high/priority", data=b"high", priority=1)
    prefetcher.prefetch_file("medium/priority", data=b"medium", priority=5)

    processed = []
    for _ in range(3):
        item = prefetcher.process_next()
        if item:
            processed.append(item)

    assert processed[0].path == "high/priority"
    assert processed[1].path == "medium/priority"
    assert processed[2].path == "low/priority"


def test_prefetcher_should_prefetch_based_on_prediction():
    """Prefetcher decides to prefetch based on prediction time."""
    import time as time_module

    prefetcher = Prefetcher(cache_size=1000)
    now = time_module.time()

    # File predicted to be accessed in 10 seconds
    soon_prediction = now + 10

    # File predicted to be accessed in 1000 seconds
    later_prediction = now + 1000

    # Should prefetch file accessed soon
    assert prefetcher.should_prefetch(soon_prediction, now) is True

    # Should not prefetch file accessed much later
    assert prefetcher.should_prefetch(later_prediction, now) is False


def test_prefetcher_removes_duplicates():
    """Prefetcher removes duplicate prefetch requests."""
    prefetcher = Prefetcher(cache_size=1000)

    prefetcher.prefetch_file("test/file", data=b"test", priority=1)
    initial_size = prefetcher.get_queue_size()

    # Try to add same file again
    result = prefetcher.prefetch_file("test/file", data=b"test", priority=1)
    assert result is False, "Should reject duplicate"
    assert prefetcher.get_queue_size() == initial_size


def test_prefetcher_clear_queue():
    """Prefetcher can clear its queue."""
    prefetcher = Prefetcher(cache_size=1000)

    prefetcher.prefetch_file("file1", data=b"data1", priority=1)
    prefetcher.prefetch_file("file2", data=b"data2", priority=2)

    assert prefetcher.get_queue_size() == 2

    prefetcher.clear_queue()

    assert prefetcher.get_queue_size() == 0


def test_prefetcher_get_cache_contents():
    """Prefetcher reports cached file contents."""
    prefetcher = Prefetcher(cache_size=1000)

    prefetcher.prefetch_file("file1", data=b"content1")
    prefetcher.prefetch_file("file2", data=b"content2")

    # Process to cache
    prefetcher.process_next()
    prefetcher.process_next()

    cache = prefetcher.get_cache_contents()
    assert "file1" in cache
    assert "file2" in cache
    assert cache["file1"] == b"content1"
    assert cache["file2"] == b"content2"


def test_prefetcher_statistics():
    """Prefetcher tracks statistics."""
    prefetcher = Prefetcher(cache_size=1000)

    prefetcher.prefetch_file("file1", data=b"data1")
    prefetcher.prefetch_file("file2", data=b"data2")

    prefetcher.process_next()
    prefetcher.process_next()

    stats = prefetcher.get_statistics()

    assert stats['total_prefetched'] == 2
    assert stats['cache_size'] == 10  # "data1" (5) + "data2" (5)
    assert stats['queue_size'] == 0


def test_prefetcher_evicts_oldest_when_full():
    """Prefetcher evicts oldest cache entry when full."""
    prefetcher = Prefetcher(cache_size=15)  # Small cache

    # Fill cache with 10 bytes
    prefetcher.prefetch_file("old", data=b"1234567890")  # 10 bytes
    prefetcher.process_next()

    assert prefetcher.get_cache_size() == 10

    # Add another file that would exceed cache
    # 10 + 8 = 18 > 15, so eviction should happen
    prefetcher.prefetch_file("new", data=b"xxxxxxxx")  # 8 bytes
    prefetcher.process_next()

    # Old file should be evicted, new file cached
    cache = prefetcher.get_cache_contents()
    assert "old" not in cache
    assert "new" in cache
    assert prefetcher.get_cache_size() == 8  # Only "new" fits


def test_prefetcher_with_predictor():
    """Prefetcher integrates with AccessPredictor."""
    from systems.pixel_compiler.infinite_map_predictor import AccessPredictor

    predictor = AccessPredictor()
    prefetcher = Prefetcher(cache_size=1000)

    import time
    now = time.time()

    # Record some accesses
    predictor.record_access("boot/vmlinuz", timestamp=now - 100)
    predictor.record_access("boot/vmlinuz", timestamp=now - 50)
    predictor.record_access("boot/vmlinuz", timestamp=now)

    # Prefetch based on predictor
    prefetched = prefetcher.prefetch_from_predictions(predictor, threshold_seconds=300)

    # Should have prefetched vmlinuz (accessed frequently)
    assert "boot/vmlinuz" in prefetched
