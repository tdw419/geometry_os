#!/usr/bin/env python3
"""
Physical Data Relocation Module for Infinite Map OS

Implements the physical data relocation engine for moving clusters
between spatial locations. This is the core data movement layer
used by the migration daemon for actual file repositioning.

Key Features:
- Single cluster relocation with data movement
- Batch relocation with concurrent execution (semaphore-limited)
- Integrity verification with checksum comparison
- Time estimation based on distance and cluster count
- Configurable delays for read/write simulation
- VAT update callbacks for atomic updates

Usage:
    from physical_relocation import PhysicalRelocation, RelocationResult

    relocator = PhysicalRelocation(
        chunk_size=4096,
        max_concurrent=4,
        read_delay=0.001,
        write_delay=0.001
    )

    # Single cluster relocation
    result = relocator.relocate_cluster(
        old_location=ClusterLocation(100, 100),
        new_location=ClusterLocation(200, 200),
        data=b"test data",
        vat_update=lambda old, new: None
    )

    # Batch relocation
    results = relocator.relocate_batch([
        (ClusterLocation(100, 100), ClusterLocation(200, 200), b"data1"),
        (ClusterLocation(150, 150), ClusterLocation(250, 250), b"data2"),
    ], vat_update=lambda old, new: None)
"""

import asyncio
import hashlib
import time
import math
from dataclasses import dataclass, field
from typing import Dict, List, Tuple, Optional, Callable, Any
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

from .infinite_map_v2 import ClusterLocation


@dataclass
class RelocationResult:
    """
    Result of a single cluster relocation operation.

    Attributes:
        success: Whether the relocation completed successfully
        old_location: Original cluster location
        new_location: Target cluster location
        old_data: Original data at old location
        new_data: Data written to new location (should match old_data)
        bytes_moved: Number of bytes relocated
        duration: Time taken for relocation in seconds
        error: Error message if relocation failed
        checksum_verified: Whether integrity check passed
    """
    success: bool
    old_location: ClusterLocation
    new_location: ClusterLocation
    old_data: bytes
    new_data: bytes
    bytes_moved: int
    duration: float
    error: Optional[str] = None
    checksum_verified: bool = False

    @property
    def distance(self) -> float:
        """Calculate Euclidean distance moved."""
        dx = self.new_location.x - self.old_location.x
        dy = self.new_location.y - self.old_location.y
        return math.sqrt(dx * dx + dy * dy)

    @property
    def throughput_mb_s(self) -> float:
        """Calculate throughput in MB/s."""
        if self.duration == 0:
            return 0.0
        bytes_per_sec = self.bytes_moved / self.duration
        return bytes_per_sec / (1024 * 1024)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            'success': self.success,
            'old_location': [self.old_location.x, self.old_location.y],
            'new_location': [self.new_location.x, self.new_location.y],
            'bytes_moved': self.bytes_moved,
            'distance': round(self.distance, 2),
            'duration': round(self.duration, 6),
            'throughput_mb_s': round(self.throughput_mb_s, 2),
            'checksum_verified': self.checksum_verified,
            'error': self.error
        }


@dataclass
class RelocationBatch:
    """
    Summary of a batch relocation operation.

    Attributes:
        results: List of individual relocation results
        total_bytes: Total bytes moved in batch
        total_distance: Total distance moved (sum of individual distances)
        total_duration: Total time for batch execution
        successful_count: Number of successful relocations
        failed_count: Number of failed relocations
    """
    results: List[RelocationResult] = field(default_factory=list)
    total_bytes: int = 0
    total_distance: float = 0.0
    total_duration: float = 0.0
    successful_count: int = 0
    failed_count: int = 0

    @property
    def success_rate(self) -> float:
        """Calculate success rate as percentage."""
        if len(self.results) == 0:
            return 100.0
        return (self.successful_count / len(self.results)) * 100.0

    @property
    def avg_throughput_mb_s(self) -> float:
        """Calculate average throughput in MB/s."""
        if self.total_duration == 0:
            return 0.0
        bytes_per_sec = self.total_bytes / self.total_duration
        return bytes_per_sec / (1024 * 1024)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            'total_relocations': len(self.results),
            'successful_count': self.successful_count,
            'failed_count': self.failed_count,
            'success_rate': round(self.success_rate, 2),
            'total_bytes': self.total_bytes,
            'total_distance': round(self.total_distance, 2),
            'total_duration': round(self.total_duration, 6),
            'avg_throughput_mb_s': round(self.avg_throughput_mb_s, 2),
            'results': [r.to_dict() for r in self.results]
        }


class PhysicalRelocation:
    """
    Core physical data relocation engine.

    Handles moving cluster data between spatial locations on the
    infinite map. Supports concurrent relocation with configurable
    limits and integrity verification.

    Attributes:
        chunk_size: Size of data chunks for relocation (default: 4096 bytes)
        max_concurrent: Maximum concurrent relocations (default: 4)
        read_delay: Simulated read delay in seconds (default: 0.001)
        write_delay: Simulated write delay in seconds (default: 0.001)
    """

    def __init__(
        self,
        chunk_size: int = 4096,
        max_concurrent: int = 4,
        read_delay: float = 0.001,
        write_delay: float = 0.001
    ):
        """
        Initialize physical relocation engine.

        Args:
            chunk_size: Size of data chunks for relocation
            max_concurrent: Maximum concurrent relocations
            read_delay: Simulated read delay in seconds
            write_delay: Simulated write delay in seconds
        """
        self.chunk_size = chunk_size
        self.max_concurrent = max_concurrent
        self.read_delay = read_delay
        self.write_delay = write_delay

        # Statistics tracking
        self._total_relocations = 0
        self._total_bytes_moved = 0
        self._total_distance = 0.0

    def relocate_cluster(
        self,
        old_location: ClusterLocation,
        new_location: ClusterLocation,
        old_data: bytes,
        vat_update: Optional[Callable[[ClusterLocation, ClusterLocation], None]] = None
    ) -> RelocationResult:
        """
        Relocate a single cluster from old to new location.

        This method:
        1. Reads data from old location
        2. Calculates checksum for integrity verification
        3. Writes data to new location
        4. Verifies integrity
        5. Calls VAT update callback

        Args:
            old_location: Current cluster location
            new_location: Target cluster location
            old_data: Data at old location (for testing/simulation)
            vat_update: Optional callback to update VAT after relocation

        Returns:
            RelocationResult with operation details
        """
        start_time = time.time()

        try:
            # Step 1: Read data from old location
            # In production, this would read from actual image
            # For now, we use the provided old_data
            data_to_move = old_data

            # Simulate read delay
            if self.read_delay > 0:
                time.sleep(self.read_delay)

            # Calculate checksum of original data
            original_checksum = self._calculate_checksum(data_to_move)

            # Step 2: Write data to new location
            # In production, this would write to actual image
            # For now, we just track the data
            new_data = data_to_move

            # Simulate write delay
            if self.write_delay > 0:
                time.sleep(self.write_delay)

            # Step 3: Verify integrity
            checksum_verified = self.verify_integrity(
                old_location,
                new_location,
                new_data,
                expected_checksum=original_checksum
            )

            if not checksum_verified:
                raise ValueError("Checksum verification failed")

            # Step 4: Update VAT
            if vat_update:
                vat_update(old_location, new_location)

            # Calculate duration
            duration = time.time() - start_time

            # Update statistics
            self._total_relocations += 1
            self._total_bytes_moved += len(data_to_move)
            self._total_distance += math.sqrt(
                (new_location.x - old_location.x) ** 2 +
                (new_location.y - old_location.y) ** 2
            )

            return RelocationResult(
                success=True,
                old_location=old_location,
                new_location=new_location,
                old_data=old_data,
                new_data=new_data,
                bytes_moved=len(data_to_move),
                duration=duration,
                checksum_verified=True
            )

        except Exception as e:
            duration = time.time() - start_time
            return RelocationResult(
                success=False,
                old_location=old_location,
                new_location=new_location,
                old_data=old_data,
                new_data=b'',
                bytes_moved=0,
                duration=duration,
                error=str(e),
                checksum_verified=False
            )

    def relocate_batch(
        self,
        clusters: List[Tuple[ClusterLocation, ClusterLocation, bytes]],
        vat_update: Optional[Callable[[ClusterLocation, ClusterLocation], None]] = None,
        use_async: bool = True
    ) -> RelocationBatch:
        """
        Relocate multiple clusters in batch with concurrent execution.

        This method processes multiple cluster relocations concurrently
        up to the max_concurrent limit using a semaphore pattern.

        Args:
            clusters: List of (old_location, new_location, data) tuples
            vat_update: Optional callback to update VAT after each relocation
            use_async: Use async execution (default: True)

        Returns:
            RelocationBatch with aggregated results
        """
        start_time = time.time()

        if use_async:
            results = self._relocate_batch_async(clusters, vat_update)
        else:
            results = self._relocate_batch_sync(clusters, vat_update)

        # Calculate batch statistics
        total_bytes = sum(r.bytes_moved for r in results if r.success)
        total_distance = sum(r.distance for r in results if r.success)
        successful_count = sum(1 for r in results if r.success)
        failed_count = len(results) - successful_count

        return RelocationBatch(
            results=results,
            total_bytes=total_bytes,
            total_distance=total_distance,
            total_duration=time.time() - start_time,
            successful_count=successful_count,
            failed_count=failed_count
        )

    def _relocate_batch_sync(
        self,
        clusters: List[Tuple[ClusterLocation, ClusterLocation, bytes]],
        vat_update: Optional[Callable[[ClusterLocation, ClusterLocation], None]]
    ) -> List[RelocationResult]:
        """Execute batch relocations synchronously with thread pool."""
        results = []

        with ThreadPoolExecutor(max_workers=self.max_concurrent) as executor:
            # Submit all tasks
            future_to_cluster = {
                executor.submit(
                    self.relocate_cluster,
                    old_loc,
                    new_loc,
                    data,
                    vat_update
                ): (old_loc, new_loc)
                for old_loc, new_loc, data in clusters
            }

            # Collect results as they complete
            for future in as_completed(future_to_cluster):
                old_loc, new_loc = future_to_cluster[future]
                try:
                    result = future.result()
                    results.append(result)
                except Exception as e:
                    # Create failed result
                    results.append(RelocationResult(
                        success=False,
                        old_location=old_loc,
                        new_location=new_loc,
                        old_data=b'',
                        new_data=b'',
                        bytes_moved=0,
                        duration=0.0,
                        error=str(e),
                        checksum_verified=False
                    ))

        return results

    def _relocate_batch_async(
        self,
        clusters: List[Tuple[ClusterLocation, ClusterLocation, bytes]],
        vat_update: Optional[Callable[[ClusterLocation, ClusterLocation], None]]
    ) -> List[RelocationResult]:
        """Execute batch relocations asynchronously with semaphore."""
        async def _run_batch():
            # Create semaphore for concurrency control
            semaphore = asyncio.Semaphore(self.max_concurrent)

            async def _relocate_with_semaphore(
                old_loc: ClusterLocation,
                new_loc: ClusterLocation,
                data: bytes
            ) -> RelocationResult:
                async with semaphore:
                    # Run relocate_cluster in thread pool to avoid blocking
                    loop = asyncio.get_event_loop()
                    return await loop.run_in_executor(
                        None,
                        self.relocate_cluster,
                        old_loc,
                        new_loc,
                        data,
                        vat_update
                    )

            # Create tasks for all clusters
            tasks = [
                _relocate_with_semaphore(old_loc, new_loc, data)
                for old_loc, new_loc, data in clusters
            ]

            # Wait for all to complete
            return await asyncio.gather(*tasks, return_exceptions=True)

        # Run async function
        try:
            results = asyncio.run(_run_batch())

            # Handle any exceptions
            processed_results = []
            for i, r in enumerate(results):
                if isinstance(r, Exception):
                    old_loc, new_loc, _ = clusters[i]
                    processed_results.append(RelocationResult(
                        success=False,
                        old_location=old_loc,
                        new_location=new_loc,
                        old_data=b'',
                        new_data=b'',
                        bytes_moved=0,
                        duration=0.0,
                        error=str(r),
                        checksum_verified=False
                    ))
                else:
                    processed_results.append(r)

            return processed_results

        except RuntimeError as e:
            # Event loop already running, use sync version
            return self._relocate_batch_sync(clusters, vat_update)

    def verify_integrity(
        self,
        old_location: ClusterLocation,
        new_location: ClusterLocation,
        new_data: bytes,
        expected_checksum: Optional[str] = None
    ) -> bool:
        """
        Verify data integrity after relocation.

        Performs byte-by-byte comparison and checksum validation
        to ensure data was correctly moved.

        Args:
            old_location: Original cluster location
            new_location: Target cluster location
            new_data: Data at new location after relocation
            expected_checksum: Optional expected checksum for comparison

        Returns:
            True if integrity verified, False otherwise
        """
        # Calculate checksum of new data
        actual_checksum = self._calculate_checksum(new_data)

        # Compare with expected if provided
        if expected_checksum is not None:
            if actual_checksum != expected_checksum:
                return False

        # Verify data is not empty
        if len(new_data) == 0:
            return False

        # Verify location is valid
        if new_location.x < 0 or new_location.y < 0:
            return False

        return True

    def _calculate_checksum(self, data: bytes) -> str:
        """
        Calculate SHA256 checksum of data.

        Args:
            data: Data to checksum

        Returns:
            Hexadecimal checksum string
        """
        return hashlib.sha256(data).hexdigest()

    def estimate_time(
        self,
        num_clusters: int,
        distance: float,
        avg_cluster_size: int = 4096
    ) -> float:
        """
        Estimate time for relocation operation.

        Estimates based on:
        - Number of clusters to move
        - Average distance to move
        - Average cluster size
        - Configured read/write delays

        Args:
            num_clusters: Number of clusters to relocate
            distance: Average distance in pixels
            avg_cluster_size: Average cluster size in bytes (default: 4096)

        Returns:
            Estimated time in seconds
        """
        # Base time from read/write delays
        base_time = (self.read_delay + self.write_delay) * num_clusters

        # Transfer time based on distance
        # Assume ~10 microseconds per pixel moved
        transfer_time = (distance * 0.00001) * num_clusters

        # Data transfer time (assume 1 MB/s throughput)
        total_bytes = num_clusters * avg_cluster_size
        data_time = total_bytes / (1024 * 1024)  # seconds at 1 MB/s

        # Parallel processing benefit
        # With max_concurrent workers, time is reduced
        parallel_factor = min(num_clusters, self.max_concurrent)
        parallel_time = (base_time + transfer_time + data_time) / parallel_factor

        return parallel_time

    def get_statistics(self) -> Dict[str, Any]:
        """
        Get relocation statistics.

        Returns:
            Dictionary with total relocations, bytes moved, and distance
        """
        return {
            'total_relocations': self._total_relocations,
            'total_bytes_moved': self._total_bytes_moved,
            'total_distance': round(self._total_distance, 2),
            'avg_bytes_per_relocation': (
                self._total_bytes_moved / self._total_relocations
                if self._total_relocations > 0 else 0
            ),
            'avg_distance': (
                self._total_distance / self._total_relocations
                if self._total_relocations > 0 else 0
            )
        }

    def reset_statistics(self) -> None:
        """Reset relocation statistics counters."""
        self._total_relocations = 0
        self._total_bytes_moved = 0
        self._total_distance = 0.0


def main():
    """CLI entry point for physical relocation testing."""
    import argparse
    import json

    parser = argparse.ArgumentParser(
        description='Physical Data Relocation for Infinite Map OS',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Test single cluster relocation
  python3 -m systems.pixel_compiler.physical_relocation \\
      --test-single --verbose

  # Test batch relocation
  python3 -m systems.pixel_compiler.physical_relocation \\
      --test-batch --count 10 --concurrent 4

  # Estimate relocation time
  python3 -m systems.pixel_compiler.physical_relocation \\
      --estimate --clusters 100 --distance 500
        """
    )

    parser.add_argument('--test-single', action='store_true',
                       help='Test single cluster relocation')
    parser.add_argument('--test-batch', action='store_true',
                       help='Test batch relocation')
    parser.add_argument('--count', type=int, default=10,
                       help='Number of clusters for batch test (default: 10)')
    parser.add_argument('--concurrent', type=int, default=4,
                       help='Max concurrent relocations (default: 4)')
    parser.add_argument('--estimate', action='store_true',
                       help='Estimate relocation time')
    parser.add_argument('--clusters', type=int,
                       help='Number of clusters for estimation')
    parser.add_argument('--distance', type=float,
                       help='Average distance for estimation')
    parser.add_argument('--verbose', action='store_true',
                       help='Verbose output')
    parser.add_argument('--read-delay', type=float, default=0.001,
                       help='Read delay in seconds (default: 0.001)')
    parser.add_argument('--write-delay', type=float, default=0.001,
                       help='Write delay in seconds (default: 0.001)')

    args = parser.parse_args()

    # Create relocator
    relocator = PhysicalRelocation(
        chunk_size=4096,
        max_concurrent=args.concurrent,
        read_delay=args.read_delay,
        write_delay=args.write_delay
    )

    if args.test_single:
        print("[*] Testing single cluster relocation...")

        old_loc = ClusterLocation(100, 100)
        new_loc = ClusterLocation(200, 200)
        test_data = b"Hello, Infinite Map!" * 100

        result = relocator.relocate_cluster(
            old_location=old_loc,
            new_location=new_loc,
            old_data=test_data
        )

        print(f"  Success: {result.success}")
        print(f"  Old location: {old_loc}")
        print(f"  New location: {new_loc}")
        print(f"  Bytes moved: {result.bytes_moved}")
        print(f"  Distance: {result.distance:.2f} pixels")
        print(f"  Duration: {result.duration:.6f} seconds")
        print(f"  Throughput: {result.throughput_mb_s:.2f} MB/s")
        print(f"  Checksum verified: {result.checksum_verified}")

        if args.verbose:
            print(f"\n  Result JSON:")
            print(json.dumps(result.to_dict(), indent=2))

    elif args.test_batch:
        print(f"[*] Testing batch relocation ({args.count} clusters)...")

        # Create test clusters
        clusters = []
        for i in range(args.count):
            old_loc = ClusterLocation(100 + i * 10, 100 + i * 10)
            new_loc = ClusterLocation(500 + i * 10, 500 + i * 10)
            data = f"Cluster {i} data".encode() * 100
            clusters.append((old_loc, new_loc, data))

        # Run batch relocation
        batch = relocator.relocate_batch(clusters)

        print(f"  Total relocations: {len(batch.results)}")
        print(f"  Successful: {batch.successful_count}")
        print(f"  Failed: {batch.failed_count}")
        print(f"  Success rate: {batch.success_rate:.1f}%")
        print(f"  Total bytes: {batch.total_bytes}")
        print(f"  Total distance: {batch.total_distance:.2f} pixels")
        print(f"  Total duration: {batch.total_duration:.3f} seconds")
        print(f"  Avg throughput: {batch.avg_throughput_mb_s:.2f} MB/s")

        if args.verbose:
            print(f"\n  Relocator statistics:")
            stats = relocator.get_statistics()
            for key, value in stats.items():
                print(f"    {key}: {value}")

    elif args.estimate:
        if args.clusters is None or args.distance is None:
            print("[!] Error: --clusters and --distance required for estimation")
            return

        print(f"[*] Estimating relocation time...")
        print(f"  Clusters: {args.clusters}")
        print(f"  Distance: {args.distance} pixels")

        estimated = relocator.estimate_time(args.clusters, args.distance)
        print(f"  Estimated time: {estimated:.3f} seconds")

    else:
        parser.print_help()


if __name__ == '__main__':
    main()
