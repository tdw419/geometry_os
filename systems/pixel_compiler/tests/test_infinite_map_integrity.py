#!/usr/bin/env python3
"""
Tests for Infinite Map Data Integrity Verification System.

Comprehensive test coverage for:
- ChecksumCalculator (CRC32, MD5, SHA256)
- ChecksumStore (persistence, CRUD operations)
- IntegrityScanner (full scan, path scan)
- CorruptionDetector (patterns, bit rot)
- IntegrityRepairer (WAL, backup repair)
- IntegrityManager (unified interface)

Run with:
    PYTHONPATH=. pytest systems/pixel_compiler/tests/test_infinite_map_integrity.py -v
"""

import os
import sys
import json
import tempfile
import threading
from pathlib import Path
from datetime import datetime
from unittest.mock import Mock, MagicMock, patch, mock_open

import pytest

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.infinite_map_integrity import (
    ChecksumAlgorithm,
    IntegrityStatus,
    ChecksumEntry,
    IntegrityReport,
    RepairResult,
    ChecksumCalculator,
    ChecksumStore,
    IntegrityScanner,
    CorruptionDetector,
    IntegrityRepairer,
    IntegrityManager,
    quick_verify,
    compute_all_checksums,
)


class TestChecksumAlgorithm:
    """Tests for ChecksumAlgorithm enum."""

    def test_enum_values(self):
        """Test that all expected algorithms exist."""
        assert ChecksumAlgorithm.CRC32.value == "crc32"
        assert ChecksumAlgorithm.MD5.value == "md5"
        assert ChecksumAlgorithm.SHA256.value == "sha256"
        assert ChecksumAlgorithm.XXHASH.value == "xxhash"


class TestIntegrityStatus:
    """Tests for IntegrityStatus enum."""

    def test_all_status_values(self):
        """Test all integrity status values."""
        assert IntegrityStatus.VALID.value == "valid"
        assert IntegrityStatus.CORRUPTED.value == "corrupted"
        assert IntegrityStatus.MISSING.value == "missing"
        assert IntegrityStatus.UNKNOWN.value == "unknown"
        assert IntegrityStatus.REPAIRABLE.value == "repairable"
        assert IntegrityStatus.UNREPAIRABLE.value == "unrepairable"


class TestChecksumEntry:
    """Tests for ChecksumEntry dataclass."""

    def test_create_entry(self):
        """Test creating a checksum entry."""
        entry = ChecksumEntry(
            cluster_id=1,
            algorithm=ChecksumAlgorithm.SHA256,
            checksum="abc123",
            computed_at=datetime.now(),
            size=4096
        )
        assert entry.cluster_id == 1
        assert entry.algorithm == ChecksumAlgorithm.SHA256
        assert entry.checksum == "abc123"
        assert entry.size == 4096

    def test_entry_serialization(self):
        """Test entry serialization to dict."""
        dt = datetime.now()
        entry = ChecksumEntry(
            cluster_id=42,
            algorithm=ChecksumAlgorithm.MD5,
            checksum="deadbeef",
            computed_at=dt,
            size=8192
        )
        data = entry.to_dict()

        assert data["cluster_id"] == 42
        assert data["algorithm"] == "md5"
        assert data["checksum"] == "deadbeef"
        assert data["size"] == 8192
        assert "computed_at" in data

    def test_entry_deserialization(self):
        """Test creating entry from dict."""
        data = {
            "cluster_id": 99,
            "algorithm": "sha256",
            "checksum": "fedcba",
            "computed_at": "2026-02-11T12:00:00",
            "size": 2048
        }
        entry = ChecksumEntry.from_dict(data)

        assert entry.cluster_id == 99
        assert entry.algorithm == ChecksumAlgorithm.SHA256
        assert entry.checksum == "fedcba"
        assert entry.size == 2048


class TestIntegrityReport:
    """Tests for IntegrityReport dataclass."""

    def test_create_report(self):
        """Test creating an integrity report."""
        report = IntegrityReport(
            scan_time=datetime.now(),
            total_clusters=100,
            valid_clusters=95,
            corrupted_clusters=3,
            missing_clusters=2
        )
        assert report.total_clusters == 100
        assert report.valid_clusters == 95

    def test_integrity_rate_calculation(self):
        """Test integrity rate calculation."""
        report = IntegrityReport(
            scan_time=datetime.now(),
            total_clusters=100,
            valid_clusters=95,
            corrupted_clusters=3,
            missing_clusters=2
        )
        assert report.integrity_rate == 95.0

    def test_integrity_rate_zero_clusters(self):
        """Test integrity rate with zero clusters."""
        report = IntegrityReport(
            scan_time=datetime.now(),
            total_clusters=0,
            valid_clusters=0,
            corrupted_clusters=0,
            missing_clusters=0
        )
        assert report.integrity_rate == 100.0

    def test_is_clean_property(self):
        """Test is_clean property."""
        clean_report = IntegrityReport(
            scan_time=datetime.now(),
            total_clusters=100,
            valid_clusters=100,
            corrupted_clusters=0,
            missing_clusters=0
        )
        assert clean_report.is_clean is True

        dirty_report = IntegrityReport(
            scan_time=datetime.now(),
            total_clusters=100,
            valid_clusters=98,
            corrupted_clusters=2,
            missing_clusters=0
        )
        assert dirty_report.is_clean is False

    def test_report_serialization(self):
        """Test report serialization to dict."""
        report = IntegrityReport(
            scan_time=datetime(2026, 2, 11, 12, 0, 0),
            total_clusters=50,
            valid_clusters=48,
            corrupted_clusters=1,
            missing_clusters=1,
            scan_duration_ms=150.5
        )
        data = report.to_dict()

        assert data["total_clusters"] == 50
        assert data["valid_clusters"] == 48
        assert data["integrity_rate"] == 96.0
        assert data["is_clean"] is False
        assert data["scan_duration_ms"] == 150.5


class TestRepairResult:
    """Tests for RepairResult dataclass."""

    def test_create_repair_result(self):
        """Test creating a repair result."""
        result = RepairResult(
            repaired_files=["1", "2", "3"],
            failed_files=[{"cluster_id": 4, "reason": "No backup"}],
            total_bytes_repaired=12288,
            repair_duration_ms=200.0
        )
        assert len(result.repaired_files) == 3
        assert len(result.failed_files) == 1
        assert result.total_bytes_repaired == 12288

    def test_success_rate_calculation(self):
        """Test success rate calculation."""
        # All successful
        result1 = RepairResult(
            repaired_files=["1", "2"],
            failed_files=[],
            total_bytes_repaired=8192
        )
        assert result1.success_rate == 100.0

        # Partial success
        result2 = RepairResult(
            repaired_files=["1", "2"],
            failed_files=[{"cluster_id": 3, "reason": "Failed"}],
            total_bytes_repaired=8192
        )
        assert result2.success_rate == pytest.approx(66.67, rel=0.01)

        # All failed
        result3 = RepairResult(
            repaired_files=[],
            failed_files=[{"cluster_id": 1, "reason": "Failed"}],
            total_bytes_repaired=0
        )
        assert result3.success_rate == 0.0

    def test_empty_repair_result(self):
        """Test empty repair result."""
        result = RepairResult()
        assert result.success_rate == 100.0  # Nothing to repair = 100% success


class TestChecksumCalculator:
    """Tests for ChecksumCalculator class."""

    def test_calculate_crc32(self):
        """Test CRC32 checksum calculation."""
        calc = ChecksumCalculator(ChecksumAlgorithm.CRC32)
        checksum = calc.calculate(b"hello world")
        assert checksum == "0d4a1185"

    def test_calculate_md5(self):
        """Test MD5 checksum calculation."""
        calc = ChecksumCalculator(ChecksumAlgorithm.MD5)
        checksum = calc.calculate(b"hello world")
        assert checksum == "5eb63bbbe01eeed093cb22bb8f5acdc3"

    def test_calculate_sha256(self):
        """Test SHA256 checksum calculation."""
        calc = ChecksumCalculator(ChecksumAlgorithm.SHA256)
        checksum = calc.calculate(b"hello world")
        expected = "b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9"
        assert checksum == expected

    def test_calculate_empty_data(self):
        """Test checksum of empty data."""
        calc = ChecksumCalculator(ChecksumAlgorithm.SHA256)
        checksum = calc.calculate(b"")
        # SHA256 of empty string
        expected = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        assert checksum == expected

    def test_verify_valid_checksum(self):
        """Test verifying valid checksum."""
        calc = ChecksumCalculator(ChecksumAlgorithm.SHA256)
        data = b"test data"
        checksum = calc.calculate(data)
        assert calc.verify(data, checksum) is True

    def test_verify_invalid_checksum(self):
        """Test verifying invalid checksum."""
        calc = ChecksumCalculator(ChecksumAlgorithm.SHA256)
        data = b"test data"
        assert calc.verify(data, "invalid_checksum") is False

    def test_convenience_methods(self):
        """Test convenience checksum methods."""
        calc = ChecksumCalculator()

        crc32 = calc.calculate_crc32(b"data")
        md5 = calc.calculate_md5(b"data")
        sha256 = calc.calculate_sha256(b"data")

        assert len(crc32) == 8  # CRC32 is 8 hex chars
        assert len(md5) == 32   # MD5 is 32 hex chars
        assert len(sha256) == 64  # SHA256 is 64 hex chars

    def test_xxhash_fallback(self):
        """Test XXHASH falls back to SHA256 when unavailable."""
        calc = ChecksumCalculator(ChecksumAlgorithm.XXHASH)
        # Should fall back to SHA256
        checksum = calc.calculate(b"test")
        assert len(checksum) == 64  # SHA256 length


class TestChecksumStore:
    """Tests for ChecksumStore class."""

    @pytest.fixture
    def temp_store(self):
        """Create a temporary checksum store."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name
        store = ChecksumStore(store_path)
        yield store
        # Cleanup
        os.unlink(store_path)
        # Also cleanup temp file if created
        tmp_path = Path(store_path).with_suffix(".tmp")
        if tmp_path.exists():
            os.unlink(tmp_path)

    def test_create_store(self, temp_store):
        """Test creating a checksum store."""
        assert temp_store.checksums == {}

    def test_set_and_get(self, temp_store):
        """Test setting and getting checksums."""
        entry = ChecksumEntry(
            cluster_id=1,
            algorithm=ChecksumAlgorithm.SHA256,
            checksum="abc123",
            computed_at=datetime.now(),
            size=4096
        )
        temp_store.set(1, entry)

        retrieved = temp_store.get(1)
        assert retrieved is not None
        assert retrieved.checksum == "abc123"

    def test_get_nonexistent(self, temp_store):
        """Test getting non-existent checksum."""
        result = temp_store.get(999)
        assert result is None

    def test_remove(self, temp_store):
        """Test removing checksum."""
        entry = ChecksumEntry(
            cluster_id=1,
            algorithm=ChecksumAlgorithm.SHA256,
            checksum="abc123",
            computed_at=datetime.now(),
            size=4096
        )
        temp_store.set(1, entry)
        temp_store.remove(1)

        assert temp_store.get(1) is None

    def test_persistence(self, temp_store):
        """Test saving and loading checksums."""
        entry = ChecksumEntry(
            cluster_id=42,
            algorithm=ChecksumAlgorithm.SHA256,
            checksum="persisted",
            computed_at=datetime.now(),
            size=8192
        )
        temp_store.set(42, entry)
        temp_store.save()

        # Create new store from same file
        new_store = ChecksumStore(temp_store.store_path)
        retrieved = new_store.get(42)

        assert retrieved is not None
        assert retrieved.checksum == "persisted"

    def test_get_all(self, temp_store):
        """Test getting all checksums."""
        for i in range(3):
            entry = ChecksumEntry(
                cluster_id=i,
                algorithm=ChecksumAlgorithm.SHA256,
                checksum=f"checksum_{i}",
                computed_at=datetime.now(),
                size=4096
            )
            temp_store.set(i, entry)

        all_checksums = temp_store.get_all()
        assert len(all_checksums) == 3

    def test_thread_safety(self, temp_store):
        """Test thread-safe operations."""
        errors = []

        def writer(start_id):
            try:
                for i in range(start_id, start_id + 100):
                    entry = ChecksumEntry(
                        cluster_id=i,
                        algorithm=ChecksumAlgorithm.SHA256,
                        checksum=f"checksum_{i}",
                        computed_at=datetime.now(),
                        size=4096
                    )
                    temp_store.set(i, entry)
            except Exception as e:
                errors.append(e)

        threads = [threading.Thread(target=writer, args=(i * 100,)) for i in range(3)]
        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0
        assert len(temp_store.get_all()) == 300


class TestIntegrityScanner:
    """Tests for IntegrityScanner class."""

    @pytest.fixture
    def mock_vat(self):
        """Create a mock VAT."""
        vat = Mock()
        vat.get_all_clusters.return_value = {
            0: {"offset": 0, "size": 10, "path": "/file1"},
            1: {"offset": 10, "size": 10, "path": "/file2"},
            2: {"offset": 20, "size": 10, "path": "/file3"},
        }
        return vat

    @pytest.fixture
    def temp_image(self):
        """Create a temporary image file."""
        with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as f:
            f.write(b"0123456789" * 3)  # 30 bytes total
            image_path = f.name
        yield image_path
        os.unlink(image_path)

    @pytest.fixture
    def temp_store(self):
        """Create a temporary checksum store."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name
        store = ChecksumStore(store_path)
        yield store
        os.unlink(store_path)

    def test_scan_cluster_valid(self, mock_vat, temp_image, temp_store):
        """Test scanning a valid cluster."""
        # Store checksum
        calc = ChecksumCalculator()
        checksum = calc.calculate(b"0123456789")
        entry = ChecksumEntry(
            cluster_id=0,
            algorithm=ChecksumAlgorithm.SHA256,
            checksum=checksum,
            computed_at=datetime.now(),
            size=10
        )
        temp_store.set(0, entry)

        scanner = IntegrityScanner(mock_vat, temp_image, temp_store)
        status = scanner.scan_cluster(0, b"0123456789")

        assert status == IntegrityStatus.VALID

    def test_scan_cluster_corrupted(self, mock_vat, temp_image, temp_store):
        """Test scanning a corrupted cluster."""
        # Store checksum for "0123456789"
        calc = ChecksumCalculator()
        checksum = calc.calculate(b"0123456789")
        entry = ChecksumEntry(
            cluster_id=0,
            algorithm=ChecksumAlgorithm.SHA256,
            checksum=checksum,
            computed_at=datetime.now(),
            size=10
        )
        temp_store.set(0, entry)

        scanner = IntegrityScanner(mock_vat, temp_image, temp_store)
        # Check with different data
        status = scanner.scan_cluster(0, b"xxxxxxxxxx")

        assert status == IntegrityStatus.CORRUPTED

    def test_scan_cluster_unknown(self, mock_vat, temp_image, temp_store):
        """Test scanning cluster without stored checksum."""
        scanner = IntegrityScanner(mock_vat, temp_image, temp_store)
        status = scanner.scan_cluster(0, b"0123456789")

        assert status == IntegrityStatus.UNKNOWN

    def test_scan_all_with_progress(self, mock_vat, temp_image, temp_store):
        """Test full scan with progress callback."""
        # Store checksums
        calc = ChecksumCalculator()
        for i in range(3):
            checksum = calc.calculate(b"0123456789")
            entry = ChecksumEntry(
                cluster_id=i,
                algorithm=ChecksumAlgorithm.SHA256,
                checksum=checksum,
                computed_at=datetime.now(),
                size=10
            )
            temp_store.set(i, entry)

        progress_calls = []

        def progress_callback(current, total):
            progress_calls.append((current, total))

        scanner = IntegrityScanner(mock_vat, temp_image, temp_store)
        report = scanner.scan_all(progress_callback)

        assert report.total_clusters == 3
        assert report.valid_clusters == 3
        assert report.corrupted_clusters == 0
        assert len(progress_calls) == 3

    def test_scan_detects_corruption(self, mock_vat, temp_image, temp_store):
        """Test that scan detects corruption."""
        # Store checksum that doesn't match file content
        entry = ChecksumEntry(
            cluster_id=0,
            algorithm=ChecksumAlgorithm.SHA256,
            checksum="invalid_checksum",
            computed_at=datetime.now(),
            size=10
        )
        temp_store.set(0, entry)

        scanner = IntegrityScanner(mock_vat, temp_image, temp_store)
        report = scanner.scan_all()

        assert report.corrupted_clusters == 1
        assert len(report.corruption_details) == 1


class TestCorruptionDetector:
    """Tests for CorruptionDetector class."""

    @pytest.fixture
    def detector(self):
        """Create a corruption detector."""
        vat = Mock()
        return CorruptionDetector(vat, "/tmp/test.png")

    def test_detect_bit_rot(self, detector):
        """Test bit rot detection."""
        calc = ChecksumCalculator()
        data = b"test data"
        expected = calc.calculate(data)

        # Same data = not bit rot
        assert detector.detect_bit_rot(data, expected) is False

    def test_detect_truncation(self, detector):
        """Test truncation detection."""
        data = b"short"
        is_truncated, missing = detector.detect_truncation(data, 100)

        assert is_truncated is True
        assert missing == 95

    def test_detect_truncation_not_truncated(self, detector):
        """Test no truncation."""
        data = b"exact size"
        is_truncated, missing = detector.detect_truncation(data, len(data))

        assert is_truncated is False
        assert missing == 0

    def test_detect_pattern_empty(self, detector):
        """Test empty data pattern."""
        patterns = detector.detect_pattern_corruption(b"")
        assert "empty" in patterns

    def test_detect_pattern_all_zeros(self, detector):
        """Test all zeros pattern."""
        patterns = detector.detect_pattern_corruption(b"\x00" * 100)
        assert "all_zeros" in patterns

    def test_detect_pattern_all_ones(self, detector):
        """Test all ones pattern."""
        patterns = detector.detect_pattern_corruption(b"\xff" * 100)
        assert "all_ones" in patterns

    def test_detect_pattern_repeating(self, detector):
        """Test repeating pattern."""
        patterns = detector.detect_pattern_corruption(b"ABCD" * 25)
        assert "repeating_pattern" in patterns

    def test_detect_pattern_normal(self, detector):
        """Test normal data has no corruption patterns."""
        import random
        random.seed(42)
        data = bytes([random.randint(0, 255) for _ in range(100)])
        patterns = detector.detect_pattern_corruption(data)

        # Random data shouldn't trigger any patterns
        assert "all_zeros" not in patterns
        assert "all_ones" not in patterns


class TestIntegrityRepairer:
    """Tests for IntegrityRepairer class."""

    @pytest.fixture
    def mock_vat(self):
        """Create a mock VAT."""
        vat = Mock()
        vat.get_cluster_offset.return_value = 0
        return vat

    @pytest.fixture
    def temp_image(self):
        """Create a temporary image file."""
        with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as f:
            f.write(b"original data here")
            image_path = f.name
        yield image_path
        os.unlink(image_path)

    @pytest.fixture
    def temp_store(self):
        """Create a temporary checksum store."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name
        store = ChecksumStore(store_path)
        yield store
        os.unlink(store_path)

    @pytest.fixture
    def temp_backup_dir(self):
        """Create a temporary backup directory."""
        with tempfile.TemporaryDirectory() as d:
            yield d

    def test_repair_without_sources(self, mock_vat, temp_image, temp_store):
        """Test repair fails without WAL or backup."""
        repairer = IntegrityRepairer(mock_vat, temp_image, temp_store)

        success, message = repairer.repair_cluster(0)
        assert success is False
        assert "No valid recovery source" in message

    def test_can_repair_status(self, mock_vat, temp_image, temp_store, temp_backup_dir):
        """Test can_repair returns correct status."""
        # Create backup file
        backup_file = Path(temp_backup_dir) / "cluster_0.bin"
        backup_file.write_bytes(b"backup data")

        # Store checksum for backup data
        calc = ChecksumCalculator()
        entry = ChecksumEntry(
            cluster_id=0,
            algorithm=ChecksumAlgorithm.SHA256,
            checksum=calc.calculate(b"backup data"),
            computed_at=datetime.now(),
            size=len(b"backup data")
        )
        temp_store.set(0, entry)

        repairer = IntegrityRepairer(
            mock_vat, temp_image, temp_store,
            backup_path=temp_backup_dir
        )

        status = repairer.can_repair(0)
        assert status == IntegrityStatus.REPAIRABLE

    def test_repair_all(self, mock_vat, temp_image, temp_store):
        """Test repairing multiple clusters."""
        repairer = IntegrityRepairer(mock_vat, temp_image, temp_store)

        result = repairer.repair_all([0, 1, 2])

        assert isinstance(result, RepairResult)
        assert len(result.failed_files) == 3  # All fail without sources


class TestIntegrityManager:
    """Tests for IntegrityManager class."""

    @pytest.fixture
    def mock_vat(self):
        """Create a mock VAT."""
        vat = Mock()
        vat.get_all_clusters.return_value = {
            0: {"offset": 0, "size": 10},
            1: {"offset": 10, "size": 10},
        }
        vat.get_cluster_info.return_value = {"offset": 0, "size": 10}
        return vat

    @pytest.fixture
    def temp_image(self):
        """Create a temporary image file."""
        with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as f:
            f.write(b"01234567890123456789")
            image_path = f.name
        yield image_path
        os.unlink(image_path)

    @pytest.fixture
    def manager(self, mock_vat, temp_image):
        """Create an integrity manager."""
        with tempfile.TemporaryDirectory() as d:
            store_path = str(Path(d) / "checksums.json")
            manager = IntegrityManager(
                mock_vat, temp_image,
                checksum_store_path=store_path
            )
            yield manager

    def test_compute_checksum(self, manager):
        """Test computing checksum."""
        data = b"test data"
        entry = manager.compute_checksum(data, 0)

        assert entry.cluster_id == 0
        assert entry.size == len(data)
        assert len(entry.checksum) == 64  # SHA256

    def test_verify_checksum_valid(self, manager):
        """Test verifying valid checksum."""
        data = b"test data"
        manager.compute_checksum(data, 0)

        assert manager.verify_checksum(data, 0) is True

    def test_verify_checksum_invalid(self, manager):
        """Test verifying invalid checksum."""
        manager.compute_checksum(b"test data", 0)

        assert manager.verify_checksum(b"wrong data", 0) is False

    def test_verify_checksum_unknown(self, manager):
        """Test verifying with no stored checksum."""
        # No checksum stored, should return True
        assert manager.verify_checksum(b"any data", 999) is True

    def test_scan(self, manager):
        """Test scanning filesystem."""
        report = manager.scan()

        assert isinstance(report, IntegrityReport)
        assert report.total_clusters >= 0

    def test_repair(self, manager):
        """Test repairing corruption."""
        result = manager.repair(cluster_ids=[0])

        assert isinstance(result, RepairResult)

    def test_get_statistics(self, manager):
        """Test getting statistics."""
        stats = manager.get_statistics()

        assert "total_checksums" in stats
        assert "algorithm" in stats
        assert "image_path" in stats

    def test_persist_checksums(self, manager):
        """Test persisting checksums."""
        data = b"test data"
        manager.compute_checksum(data, 0)
        manager.persist_checksums()

        # Checksums should be saved
        assert Path(manager.checksum_store.store_path).exists()


class TestQuickVerify:
    """Tests for quick_verify convenience function."""

    def test_quick_verify(self):
        """Test quick verify function."""
        with tempfile.TemporaryDirectory() as d:
            # Create VAT file
            vat_path = Path(d) / "vat.json"
            vat_data = {"clusters": {}}
            vat_path.write_text(json.dumps(vat_data))

            # Create image file
            image_path = Path(d) / "image.png"
            image_path.write_bytes(b"test data")

            report = quick_verify(str(image_path), str(vat_path))

            assert isinstance(report, IntegrityReport)


class TestComputeAllChecksums:
    """Tests for compute_all_checksums convenience function."""

    def test_compute_all(self):
        """Test computing all checksums."""
        with tempfile.TemporaryDirectory() as d:
            # Create VAT
            vat = Mock()
            vat.get_all_clusters.return_value = {
                0: {"offset": 0, "size": 5},
                1: {"offset": 5, "size": 5},
            }

            # Create image
            image_path = Path(d) / "image.png"
            image_path.write_bytes(b"0123456789")

            count = compute_all_checksums(
                str(image_path), vat,
                algorithm=ChecksumAlgorithm.SHA256
            )

            assert count == 2


class TestIntegration:
    """Integration tests for the full integrity workflow."""

    def test_full_workflow(self):
        """Test complete integrity workflow."""
        with tempfile.TemporaryDirectory() as d:
            # Create test image
            image_path = Path(d) / "test.png"
            original_data = b"original content for cluster 0"
            image_path.write_bytes(original_data)

            # Create mock VAT
            vat = Mock()
            vat.get_all_clusters.return_value = {
                0: {"offset": 0, "size": len(original_data), "path": "/test"},
            }
            vat.get_cluster_info.return_value = {"offset": 0, "size": len(original_data)}
            vat.get_cluster_offset.return_value = 0

            # Create manager
            manager = IntegrityManager(
                vat, str(image_path),
                checksum_store_path=str(Path(d) / "checksums.json")
            )

            # Compute initial checksums
            entry = manager.compute_checksum(original_data, 0)
            manager.persist_checksums()

            # Verify initial state is valid
            assert manager.verify_checksum(original_data, 0) is True

            # Scan - should be clean
            report = manager.scan()
            assert report.valid_clusters == 1

            # Corrupt the file
            corrupted_data = b"corrupted content for cluster 0"
            image_path.write_bytes(corrupted_data)

            # Scan - should detect corruption
            report = manager.scan()
            assert report.corrupted_clusters == 1

            # Verify checksum fails
            assert manager.verify_checksum(corrupted_data, 0) is False

    def test_checksum_algorithm_consistency(self):
        """Test that checksums are consistent across calculations."""
        calc = ChecksumCalculator()

        data = b"consistent data test"

        # Calculate same checksum multiple times
        checksums = [calc.calculate_sha256(data) for _ in range(5)]

        # All should be identical
        assert len(set(checksums)) == 1


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
