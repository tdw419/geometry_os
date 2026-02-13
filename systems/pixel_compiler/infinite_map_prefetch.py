#!/usr/bin/env python3
"""
Infinite Map Prefetch System.

Proactive cache loading based on access predictions.
Pre-loads files into cache before they're accessed.
"""

import json
import time
import heapq
from typing import Dict, List, Optional, Any, Tuple
from dataclasses import dataclass, field
from itertools import count


# Global counter for preserving insertion order with same priority
_counter = count()


@dataclass
class PrefetchItem:
    """
    Item in prefetch queue.

    Items are ordered by priority (lower = higher priority).
    Uses counter to break ties while preserving order.
    """
    path: str
    priority: int
    data: Optional[bytes] = None
    size: int = 0
    added_time: float = field(default_factory=time.time)
    counter: int = field(default_factory=lambda: next(_counter))


@dataclass
class CacheEntry:
    """Entry in the prefetch cache."""
    path: str
    data: bytes
    size: int
    cached_at: float = field(default_factory=time.time)
    access_count: int = 0


class Prefetcher:
    """
    Proactive cache loading system.

    Pre-loads files into cache based on access predictions.
    Uses priority queue for prefetch ordering and LRU eviction.

    Features:
    - prefetch_file() - Add file to prefetch queue
    - process_next() - Process next item from queue
    - should_prefetch() - Decide if file should be prefetched
    - prefetch_from_predictions() - Batch prefetch from predictor
    """

    VERSION = "1.0"

    def __init__(self, cache_size: int = 1024 * 1024):  # 1MB default
        """
        Initialize prefetcher.

        Args:
            cache_size: Maximum cache size in bytes
        """
        self.cache_size = cache_size
        self.current_cache_size = 0

        # Priority queue for prefetch items (min-heap by priority)
        self.queue: List[PrefetchItem] = []

        # Cache storage
        self.cache: Dict[str, CacheEntry] = {}

        # Track files being prefetched (avoid duplicates)
        self.pending: set = set()

        # Statistics
        self.total_prefetched = 0
        self.total_evicted = 0
        self.cache_hits = 0
        self.cache_misses = 0

    def prefetch_file(self, path: str, data: Optional[bytes] = None,
                   priority: int = 10) -> bool:
        """
        Add file to prefetch queue.

        Args:
            path: File path to prefetch
            data: File data (if None, will skip prefetch)
            priority: Priority (lower = higher)

        Returns:
            True if enqueued, False if duplicate or data too large
        """
        # Check for duplicate
        if path in self.pending or path in self.cache:
            return False

        # Estimate size if data not provided
        if data is None:
            # Unknown size, skip
            return False

        size = len(data)

        # Check if fits in cache
        if size > self.cache_size:
            return False

        # Add to queue with priority counter for tie-breaking
        item = PrefetchItem(path=path, priority=priority, data=data, size=size)
        # Use tuple (priority, counter, item) for heap ordering
        entry = (item.priority, item.counter, item)
        heapq.heappush(self.queue, entry)
        self.pending.add(path)

        return True

    def process_next(self) -> Optional[PrefetchItem]:
        """
        Process next item from prefetch queue.

        Moves item from queue to cache.

        Returns:
            The processed item, or None if queue is empty
        """
        if not self.queue:
            return None

        # Pop highest priority item (queue contains (priority, counter, item) tuples)
        _priority, _counter, item = heapq.heappop(self.queue)
        self.pending.discard(item.path)

        # Check if still fits in cache
        if self.current_cache_size + item.size > self.cache_size:
            # Need to evict
            self._evict_for_size(item.size)

        # Add to cache
        entry = CacheEntry(
            path=item.path,
            data=item.data,
            size=item.size
        )
        self.cache[item.path] = entry
        self.current_cache_size += item.size
        self.total_prefetched += 1

        return item

    def _evict_for_size(self, required_size: int):
        """
        Evict oldest entries to make space.

        Uses LRU (least recently used) eviction.
        """
        # Sort cache by access time (oldest first)
        entries_by_age = sorted(
            self.cache.values(),
            key=lambda e: e.cached_at
        )

        freed = 0
        for entry in entries_by_age:
            if freed >= required_size:
                break

            # Evict
            del self.cache[entry.path]
            self.current_cache_size -= entry.size
            freed += entry.size
            self.total_evicted += 1

    def should_prefetch(self, predicted_time: float, now: Optional[float] = None) -> bool:
        """
        Decide if file should be prefetched based on prediction.

        Args:
            predicted_time: When file is predicted to be accessed
            now: Current time (default: current time)

        Returns:
            True if file should be prefetched
        """
        if now is None:
            now = time.time()

        # Prefetch if predicted access is within 60 seconds
        threshold = 60
        return (predicted_time - now) <= threshold

    def prefetch_from_predictions(self, predictor, threshold_seconds: int = 300) -> List[str]:
        """
        Batch prefetch from access predictor.

        Args:
            predictor: AccessPredictor instance
            threshold_seconds: Lookahead threshold

        Returns:
            List of prefetched file paths
        """
        hot_files = predictor.get_hot_files(threshold_seconds=threshold_seconds)
        prefetched = []

        for path, predicted_time in hot_files:
            if self.should_prefetch(predicted_time):
                # Get file data from filesystem (mock for now)
                # In real implementation, would read from InfiniteMap
                if self.prefetch_file(path, data=b"mock_data:" + path.encode(),
                                    priority=int(predicted_time - time.time())):
                    prefetched.append(path)

        return prefetched

    def get_cache_contents(self) -> Dict[str, bytes]:
        """
        Get current cache contents.

        Returns:
            Dictionary mapping path -> cached data
        """
        return {path: entry.data for path, entry in self.cache.items()}

    def get_from_cache(self, path: str) -> Optional[bytes]:
        """
        Get file from cache.

        Args:
            path: File path

        Returns:
            Cached data, or None if not in cache
        """
        if path not in self.cache:
            self.cache_misses += 1
            return None

        # Update access tracking
        entry = self.cache[path]
        entry.access_count += 1
        entry.cached_at = time.time()
        self.cache_hits += 1

        return entry.data

    def get_queue_size(self) -> int:
        """Get number of items in prefetch queue."""
        return len(self.queue)

    def get_cache_size(self) -> int:
        """Get current cache size in bytes."""
        return self.current_cache_size

    def clear_queue(self):
        """Clear prefetch queue."""
        self.queue.clear()
        self.pending.clear()

    def clear_cache(self):
        """Clear cache."""
        self.cache.clear()
        self.current_cache_size = 0

    def get_statistics(self) -> Dict[str, Any]:
        """
        Get prefetcher statistics.

        Returns:
            Dictionary with statistics
        """
        return {
            'total_prefetched': self.total_prefetched,
            'total_evicted': self.total_evicted,
            'cache_hits': self.cache_hits,
            'cache_misses': self.cache_misses,
            'cache_size': self.current_cache_size,
            'queue_size': len(self.queue),
            'cached_files': len(self.cache),
            'hit_rate': (self.cache_hits / (self.cache_hits + self.cache_misses)
                        if (self.cache_hits + self.cache_misses) > 0 else 0),
        }


def main():
    """CLI for prefetch system testing."""
    import argparse
    import sys

    parser = argparse.ArgumentParser(
        description='Infinite Map Prefetch System',
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )

    parser.add_argument('--cache-size', type=int, default=1024*1024,
                      metavar='BYTES',
                      help='Maximum cache size in bytes')
    parser.add_argument('--prefetch', metavar='PATH',
                      help='Prefetch a file')
    parser.add_argument('--priority', type=int, default=10,
                      metavar='N',
                      help='Prefetch priority (lower=higher)')
    parser.add_argument('--process', action='store_true',
                      help='Process next prefetch item')
    parser.add_argument('--stats', action='store_true',
                      help='Show prefetch statistics')
    parser.add_argument('--clear', action='store_true',
                      help='Clear queue and cache')

    args = parser.parse_args()

    prefetcher = Prefetcher(cache_size=args.cache_size)

    try:
        if args.prefetch:
            result = prefetcher.prefetch_file(args.prefetch, priority=args.priority)
            if result:
                print(f"[*] Enqueued prefetch: {args.prefetch}")
            else:
                print(f"[!] Failed to enqueue: {args.prefetch}")

        if args.process:
            item = prefetcher.process_next()
            if item:
                print(f"[*] Processed: {item.path} ({item.size} bytes)")
            else:
                print(f"[!] Queue is empty")

        if args.stats:
            stats = prefetcher.get_statistics()
            print(f"[*] Prefetch Statistics:")
            print(f"    Total prefetched: {stats['total_prefetched']}")
            print(f"    Total evicted: {stats['total_evicted']}")
            print(f"    Cache hits: {stats['cache_hits']}")
            print(f"    Cache misses: {stats['cache_misses']}")
            print(f"    Hit rate: {stats['hit_rate']:.2%}")
            print(f"    Cache size: {stats['cache_size']} / {prefetcher.cache_size}")
            print(f"    Queue size: {stats['queue_size']}")
            print(f"    Cached files: {stats['cached_files']}")

        if args.clear:
            prefetcher.clear_queue()
            prefetcher.clear_cache()
            print(f"[*] Cleared queue and cache")

        if not any([args.prefetch, args.process, args.stats, args.clear]):
            parser.print_help()

    except Exception as e:
        print(f"[!] Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()
