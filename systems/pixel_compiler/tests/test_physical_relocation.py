#!/usr/bin/env python3
"""
Unit tests for Physical Data Relocation module.

Tests cover:
- Single cluster relocation
- Batch relocations with parallel execution
- Integrity verification
- Time estimation accuracy
- Concurrent limit enforcement
- Delay configuration
- Statistics tracking
"""

import pytest
import time
from dataclasses import dataclass, field
from typing import Dict, List, Tuple, Optional, Any
from unittest.mock import Mock, patch

import sys
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.pixel_compiler.physical_relocation import (
    PhysicalRelocation,
    RelocationResult,
    RelocationBatch
)
from systems.pixel_compiler.infinite_map_v2 import ClusterLocation


class TestRelocationResult:
    """Test RelocationResult dataclass."""

    def test_relocation_result_creation(self):
        """Test creating a RelocationResult."""
        old = ClusterLocation(100, 100)
        new = ClusterLocation(200, 200)
        data = b"test data"

        result = RelocationResult(
            success=True,
            old_location=old,
            new_location=new,
            old_data=data,
            new_data=data,
            bytes_moved=len(data),
            duration=0.001,
            checksum_verified=True
        )

        assert result.success is True
        assert result.old_location == old
        assert result.new_location == new
        assert result.bytes_moved == len(data)
        assert result.duration == 0.001
        assert result.checksum_verified is True
        assert result.error is None

    def test_distance_calculation(self):
        """Test distance calculation property."""
        old = ClusterLocation(0, 0)
        new = ClusterLocation(3, 4)  # Distance should be 5

        result = RelocationResult(
            success=True,
            old_location=old,
            new_location=new,
            old_data=b'x',
            new_data=b'x',
            bytes_moved=1,
            duration=0.001
        )

        assert result.distance == 5.0

    def test_distance_calculation_diagonal(self):
        """Test distance calculation for diagonal movement."""
        old = ClusterLocation(100, 100)
        new = ClusterLocation(110, 110)  # dx=10, dy=10

        result = RelocationResult(
            success=True,
            old_location=old,
            new_location=new,
            old_data=b'x',
            new_data=b'x',
            bytes_moved=1,
            duration=0.001
        )

        # sqrt(10^2 + 10^2) = sqrt(200) ≈ 14.14
        assert abs(result.distance - 14.142) < 0.01

    def test_throughput_calculation(self):
        """Test throughput calculation property."""
        result = RelocationResult(
            success=True,
            old_location=ClusterLocation(0, 0),
            new_location=ClusterLocation(10, 10),
            old_data=b'x' * 4096,
            new_data=b'x' * 4096,
            bytes_moved=4096,
            duration=0.01  # 10ms
        )

        # 4096 bytes / 0.01s = 409600 bytes/s = 0.39 MB/s
        expected_throughput = 4096 / 0.01 / (1024 * 1024)
        assert abs(result.throughput_mb_s - expected_throughput) < 0.01

    def test_throughput_zero_duration(self):
        """Test throughput handles zero duration."""
        result = RelocationResult(
            success=True,
            old_location=ClusterLocation(0, 0),
            new_location=ClusterLocation(10, 10),
            old_data=b'x',
            new_data=b'x',
            bytes_moved=1,
            duration=0.0
        )

        assert result.throughput_mb_s == 0.0

    def test_to_dict(self):
        """Test RelocationResult serialization to dict."""
        old = ClusterLocation(100, 100)
        new = ClusterLocation(200, 200)
        data = b"test data"

        result = RelocationResult(
            success=True,
            old_location=old,
            new_location=new,
            old_data=data,
            new_data=data,
            bytes_moved=len(data),
            duration=0.0015,
            checksum_verified=True
        )

        result_dict = result.to_dict()

        assert result_dict['success'] is True
        assert result_dict['old_location'] == [100, 100]
        assert result_dict['new_location'] == [200, 200]
        assert result_dict['bytes_moved'] == len(data)
        assert 'distance' in result_dict
        assert 'duration' in result_dict
        assert 'throughput_mb_s' in result_dict
        assert result_dict['checksum_verified'] is True
        assert result_dict['error'] is None


class TestPhysicalRelocation:
    """Test PhysicalRelocation class."""

    def test_initialization(self):
        """Test PhysicalRelocation initialization with defaults."""
        relocator = PhysicalRelocation()

        assert relocator.chunk_size == 4096
        assert relocator.max_concurrent == 4
        assert relocator.read_delay == 0.001
        assert relocator.write_delay == 0.001

    def test_initialization_custom(self):
        """Test PhysicalRelocation initialization with custom values."""
        relocator = PhysicalRelocation(
            chunk_size=8192,
            max_concurrent=8,
            read_delay=0.005,
            write_delay=0.01
        )

        assert relocator.chunk_size == 8192
        assert relocator.max_concurrent == 8
        assert relocator.read_delay == 0.005
        assert relocator.write_delay == 0.01

    def test_relocate_cluster_success(self):
        """Test successful single cluster relocation."""
        relocator = PhysicalRelocation(read_delay=0, write_delay=0)

        old = ClusterLocation(100, 100)
        new = ClusterLocation(200, 200)
        test_data = b"test data for relocation" * 100

        result = relocator.relocate_cluster(
            old_location=old,
            new_location=new,
            old_data=test_data
        )

        assert result.success is True
        assert result.old_location == old
        assert result.new_location == new
        assert result.bytes_moved == len(test_data)
        assert result.checksum_verified is True
        assert result.old_data == test_data
        assert result.new_data == test_data

    def test_relocate_cluster_with_vat_update(self):
        """Test relocation with VAT update callback."""
        relocator = PhysicalRelocation(read_delay=0, write_delay=0)

        old = ClusterLocation(100, 100)
        new = ClusterLocation(200, 200)
        test_data = b"test data"

        # Mock VAT update callback
        vat_update = Mock()

        result = relocator.relocate_cluster(
            old_location=old,
            new_location=new,
            old_data=test_data,
            vat_update=vat_update
        )

        assert result.success is True
        vat_update.assert_called_once_with(old, new)

    def test_relocate_cluster_empty_data(self):
        """Test relocation with empty data fails integrity check."""
        relocator = PhysicalRelocation(read_delay=0, write_delay=0)

        old = ClusterLocation(100, 100)
        new = ClusterLocation(200, 200)

        result = relocator.relocate_cluster(
            old_location=old,
            new_location=new,
            old_data=b''
        )

        # Empty data should fail integrity verification
        assert result.success is False
        assert result.checksum_verified is False
        assert 'Checksum verification failed' in result.error

    def test_relocate_cluster_statistics_tracking(self):
        """Test that relocations update internal statistics."""
        relocator = PhysicalRelocation(read_delay=0, write_delay=0)

        old = ClusterLocation(100, 100)
        new = ClusterLocation(200, 200)
        test_data = b"x" * 1000

        relocator.relocate_cluster(old, new, test_data)

        stats = relocator.get_statistics()
        assert stats['total_relocations'] == 1
        assert stats['total_bytes_moved'] == 1000
        assert stats['total_distance'] > 0

    def test_relocate_batch_single_item(self):
        """Test batch relocation with single item."""
        relocator = PhysicalRelocation(read_delay=0, write_delay=0)

        clusters = [
            (ClusterLocation(100, 100), ClusterLocation(200, 200), b"data1")
        ]

        batch = relocator.relocate_batch(clusters, use_async=False)

        assert len(batch.results) == 1
        assert batch.successful_count == 1
        assert batch.failed_count == 0
        assert batch.total_bytes == 5

    def test_relocate_batch_multiple_items(self):
        """Test batch relocation with multiple items."""
        relocator = PhysicalRelocation(read_delay=0, write_delay=0)

        clusters = [
            (ClusterLocation(100, 100), ClusterLocation(200, 200), b"data1"),
            (ClusterLocation(150, 150), ClusterLocation(250, 250), b"data2"),
            (ClusterLocation(200, 200), ClusterLocation(300, 300), b"data3"),
        ]

        batch = relocator.relocate_batch(clusters, use_async=False)

        assert len(batch.results) == 3
        assert batch.successful_count == 3
        assert batch.failed_count == 0
        assert batch.total_bytes == 5 * 3  # Each data is 5 bytes

    def test_relocate_batch_with_vat_update(self):
        """Test batch relocation with VAT update for each cluster."""
        relocator = PhysicalRelocation(read_delay=0, write_delay=0)

        clusters = [
            (ClusterLocation(100, 100), ClusterLocation(200, 200), b"data1"),
            (ClusterLocation(150, 150), ClusterLocation(250, 250), b"data2"),
        ]

        vat_update = Mock()
        batch = relocator.relocate_batch(clusters, vat_update, use_async=False)

        assert batch.successful_count == 2
        assert vat_update.call_count == 2

    def test_relocate_batch_concurrent_limit(self):
        """Test that batch respects max_concurrent limit."""
        # Create relocator with limit of 2
        relocator = PhysicalRelocation(
            max_concurrent=2,
            read_delay=0.01,
            write_delay=0.01
        )

        # Create 5 clusters
        clusters = [
            (ClusterLocation(100 + i * 10, 100),
             ClusterLocation(200 + i * 10, 200),
             f"data{i}".encode())
            for i in range(5)
        ]

        start = time.time()
        batch = relocator.relocate_batch(clusters, use_async=False)
        duration = time.time() - start

        # With limit of 2, should take approximately 2.5x longer
        # than single operation (5 operations / 2 concurrent)
        assert batch.successful_count == 5
        assert duration > 0.02  # At least 2 sequential operations

    def test_verify_integrity_success(self):
        """Test successful integrity verification."""
        relocator = PhysicalRelocation()

        old = ClusterLocation(100, 100)
        new = ClusterLocation(200, 200)
        test_data = b"test data"
        expected_checksum = relocator._calculate_checksum(test_data)

        result = relocator.verify_integrity(
            old_location=old,
            new_location=new,
            new_data=test_data,
            expected_checksum=expected_checksum
        )

        assert result is True

    def test_verify_integrity_checksum_mismatch(self):
        """Test integrity verification with checksum mismatch."""
        relocator = PhysicalRelocation()

        old = ClusterLocation(100, 100)
        new = ClusterLocation(200, 200)
        test_data = b"test data"
        wrong_checksum = "wrong_checksum"

        result = relocator.verify_integrity(
            old_location=old,
            new_location=new,
            new_data=test_data,
            expected_checksum=wrong_checksum
        )

        assert result is False

    def test_verify_integrity_empty_data(self):
        """Test integrity verification rejects empty data."""
        relocator = PhysicalRelocation()

        result = relocator.verify_integrity(
            old_location=ClusterLocation(100, 100),
            new_location=ClusterLocation(200, 200),
            new_data=b''
        )

        assert result is False

    def test_verify_integrity_negative_coordinates(self):
        """Test integrity verification rejects negative coordinates."""
        relocator = PhysicalRelocation()

        result = relocator.verify_integrity(
            old_location=ClusterLocation(100, 100),
            new_location=ClusterLocation(-1, 200),  # Invalid x
            new_data=b'test data'
        )

        assert result is False

    def test_verify_integrity_negative_y_coordinate(self):
        """Test integrity verification rejects negative y coordinate."""
        relocator = PhysicalRelocation()

        result = relocator.verify_integrity(
            old_location=ClusterLocation(100, 100),
            new_location=ClusterLocation(200, -1),  # Invalid y
            new_data=b'test data'
        )

        assert result is False

    def test_estimate_time_basic(self):
        """Test basic time estimation."""
        relocator = PhysicalRelocation(
            read_delay=0.001,
            write_delay=0.001,
            max_concurrent=4
        )

        estimated = relocator.estimate_time(
            num_clusters=10,
            distance=100
        )

        # Should be a positive value
        assert estimated > 0
        # With 4 concurrent workers, 10 clusters should take ~3x longer than single
        assert estimated < 10 * (0.001 + 0.001)

    def test_estimate_time_scales_with_clusters(self):
        """Test that estimation scales with cluster count."""
        relocator = PhysicalRelocation(max_concurrent=4)

        est_10 = relocator.estimate_time(10, 100)
        est_100 = relocator.estimate_time(100, 100)

        # 100 clusters should take roughly 10x longer (accounting for concurrency)
        assert est_100 > est_10

    def test_estimate_time_scales_with_distance(self):
        """Test that estimation scales with distance."""
        relocator = PhysicalRelocation()

        est_100 = relocator.estimate_time(10, 100)
        est_500 = relocator.estimate_time(10, 500)

        # Greater distance should take longer
        assert est_500 > est_100

    def test_get_statistics_initial(self):
        """Test statistics before any relocations."""
        relocator = PhysicalRelocation()

        stats = relocator.get_statistics()

        assert stats['total_relocations'] == 0
        assert stats['total_bytes_moved'] == 0
        assert stats['total_distance'] == 0.0
        assert stats['avg_bytes_per_relocation'] == 0
        assert stats['avg_distance'] == 0

    def test_get_statistics_after_relocations(self):
        """Test statistics after multiple relocations."""
        relocator = PhysicalRelocation(read_delay=0, write_delay=0)

        # Perform 3 relocations
        for i in range(3):
            old = ClusterLocation(100 + i * 10, 100)
            new = ClusterLocation(200 + i * 10, 200)
            relocator.relocate_cluster(old, new, b"x" * 100)

        stats = relocator.get_statistics()

        assert stats['total_relocations'] == 3
        assert stats['total_bytes_moved'] == 300
        assert stats['avg_bytes_per_relocation'] == 100
        assert stats['avg_distance'] > 0

    def test_reset_statistics(self):
        """Test resetting statistics."""
        relocator = PhysicalRelocation(read_delay=0, write_delay=0)

        # Perform some relocations
        relocator.relocate_cluster(
            ClusterLocation(100, 100),
            ClusterLocation(200, 200),
            b"data"
        )

        # Verify stats are recorded
        stats_before = relocator.get_statistics()
        assert stats_before['total_relocations'] > 0

        # Reset
        relocator.reset_statistics()

        # Verify stats are cleared
        stats_after = relocator.get_statistics()
        assert stats_after['total_relocations'] == 0
        assert stats_after['total_bytes_moved'] == 0
        assert stats_after['total_distance'] == 0.0


class TestRelocationBatch:
    """Test RelocationBatch summary class."""

    def test_batch_creation_empty(self):
        """Test creating empty batch."""
        batch = RelocationBatch()

        assert batch.results == []
        assert batch.total_bytes == 0
        assert batch.total_distance == 0.0
        assert batch.successful_count == 0
        assert batch.failed_count == 0

    def test_batch_success_rate_empty(self):
        """Test success rate for empty batch."""
        batch = RelocationBatch()
        assert batch.success_rate == 100.0

    def test_batch_success_rate_partial(self):
        """Test success rate with partial failures."""
        batch = RelocationBatch(
            results=[
                RelocationResult(
                    success=True,
                    old_location=ClusterLocation(0, 0),
                    new_location=ClusterLocation(10, 10),
                    old_data=b'x',
                    new_data=b'x',
                    bytes_moved=1,
                    duration=0.001
                ),
                RelocationResult(
                    success=False,
                    old_location=ClusterLocation(1, 1),
                    new_location=ClusterLocation(11, 11),
                    old_data=b'y',
                    new_data=b'',
                    bytes_moved=0,
                    duration=0.001,
                    error="Failed"
                )
            ],
            successful_count=1,
            failed_count=1
        )

        assert batch.success_rate == 50.0

    def test_batch_avg_throughput(self):
        """Test average throughput calculation."""
        batch = RelocationBatch(
            results=[],
            total_bytes=1024 * 1024,  # 1 MB
            total_duration=1.0  # 1 second
        )

        expected = (1024 * 1024) / 1.0 / (1024 * 1024)  # 1 MB/s
        assert abs(batch.avg_throughput_mb_s - expected) < 0.01

    def test_batch_to_dict(self):
        """Test batch serialization to dict."""
        old = ClusterLocation(0, 0)
        new = ClusterLocation(10, 10)

        batch = RelocationBatch(
            results=[
                RelocationResult(
                    success=True,
                    old_location=old,
                    new_location=new,
                    old_data=b'x',
                    new_data=b'x',
                    bytes_moved=1,
                    duration=0.001,
                    checksum_verified=True
                )
            ],
            total_bytes=1,
            total_distance=14.1421,
            total_duration=0.001,
            successful_count=1,
            failed_count=0
        )

        batch_dict = batch.to_dict()

        assert batch_dict['total_relocations'] == 1
        assert batch_dict['successful_count'] == 1
        assert batch_dict['failed_count'] == 0
        assert batch_dict['success_rate'] == 100.0
        assert batch_dict['total_bytes'] == 1
        assert 'total_distance' in batch_dict
        assert 'total_duration' in batch_dict
        assert 'avg_throughput_mb_s' in batch_dict
        assert len(batch_dict['results']) == 1


class TestDelayConfiguration:
    """Test delay configuration functionality."""

    def test_read_delay_respected(self):
        """Test that read delay is respected."""
        delay = 0.01  # 10ms
        relocator = PhysicalRelocation(read_delay=delay, write_delay=0)

        old = ClusterLocation(100, 100)
        new = ClusterLocation(200, 200)

        start = time.time()
        result = relocator.relocate_cluster(old, new, b"data")
        duration = time.time() - start

        assert result.success is True
        assert duration >= delay

    def test_write_delay_respected(self):
        """Test that write delay is respected."""
        delay = 0.01  # 10ms
        relocator = PhysicalRelocation(read_delay=0, write_delay=delay)

        old = ClusterLocation(100, 100)
        new = ClusterLocation(200, 200)

        start = time.time()
        result = relocator.relocate_cluster(old, new, b"data")
        duration = time.time() - start

        assert result.success is True
        assert duration >= delay

    def test_both_delays_respected(self):
        """Test that both read and write delays are respected."""
        read_delay = 0.01
        write_delay = 0.02
        relocator = PhysicalRelocation(
            read_delay=read_delay,
            write_delay=write_delay
        )

        old = ClusterLocation(100, 100)
        new = ClusterLocation(200, 200)

        start = time.time()
        result = relocator.relocate_cluster(old, new, b"data")
        duration = time.time() - start

        assert result.success is True
        assert duration >= (read_delay + write_delay)


class TestChecksumCalculation:
    """Test checksum calculation functionality."""

    def test_checksum_consistent(self):
        """Test that checksum is consistent for same data."""
        relocator = PhysicalRelocation()
        data = b"test data for checksum"

        checksum1 = relocator._calculate_checksum(data)
        checksum2 = relocator._calculate_checksum(data)

        assert checksum1 == checksum2

    def test_checksum_different_data(self):
        """Test that different data produces different checksums."""
        relocator = PhysicalRelocation()

        checksum1 = relocator._calculate_checksum(b"data1")
        checksum2 = relocator._calculate_checksum(b"data2")

        assert checksum1 != checksum2

    def test_checksum_empty_data(self):
        """Test checksum of empty data."""
        relocator = PhysicalRelocation()

        checksum = relocator._calculate_checksum(b'')

        # Should produce a valid hash
        assert len(checksum) == 64  # SHA256 produces 64 hex chars
        assert all(c in '0123456789abcdef' for c in checksum)


class TestEdgeCases:
    """Test edge cases and error conditions."""

    def test_relocate_zero_distance(self):
        """Test relocation with zero distance (same location)."""
        relocator = PhysicalRelocation(read_delay=0, write_delay=0)

        loc = ClusterLocation(100, 100)
        result = relocator.relocate_cluster(loc, loc, b"data")

        assert result.success is True
        assert result.distance == 0.0

    def test_relocate_large_distance(self):
        """Test relocation with large distance."""
        relocator = PhysicalRelocation(read_delay=0, write_delay=0)

        old = ClusterLocation(0, 0)
        new = ClusterLocation(2048, 2048)
        result = relocator.relocate_cluster(old, new, b"data")

        assert result.success is True
        # Distance should be sqrt(2048^2 + 2048^2) ≈ 2896
        assert abs(result.distance - 2896.3) < 1.0

    def test_batch_empty_list(self):
        """Test batch with empty cluster list."""
        relocator = PhysicalRelocation()

        batch = relocator.relocate_batch([])

        assert len(batch.results) == 0
        assert batch.successful_count == 0
        assert batch.failed_count == 0
        assert batch.success_rate == 100.0

    def test_large_data_relocation(self):
        """Test relocation of large data chunk."""
        relocator = PhysicalRelocation(read_delay=0, write_delay=0)

        large_data = b"x" * 100000  # 100 KB
        old = ClusterLocation(100, 100)
        new = ClusterLocation(200, 200)

        result = relocator.relocate_cluster(old, new, large_data)

        assert result.success is True
        assert result.bytes_moved == 100000
        assert result.checksum_verified is True


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
