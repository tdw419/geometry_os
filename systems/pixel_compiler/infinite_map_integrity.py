#!/usr/bin/env python3
"""
Infinite Map Data Integrity Verification System.

Provides checksum-based integrity verification, corruption detection,
and repair capabilities for the Infinite Map filesystem.

Key Components:
- ChecksumCalculator: Multi-algorithm checksum computation (CRC32, MD5, SHA256)
- IntegrityScanner: Scans VAT entries and verifies cluster checksums
- CorruptionDetector: Detects and reports corrupted data
- IntegrityRepairer: Repairs corrupted data from backups/WAL
- IntegrityManager: Unified integrity management interface

Usage:
    from infinite_map_integrity import IntegrityManager

    manager = IntegrityManager(vat_path="vat.json", image_path="image.rts.png")

    # Scan for corruption
    report = manager.scan()

    # Repair corrupted files
    repair_result = manager.repair(corrupted_paths=report.corrupted_files)
"""

import os
import zlib
import hashlib
import json
import threading
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple, BinaryIO, Any, Callable
from enum import Enum
from datetime import datetime
import struct
import logging

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class ChecksumAlgorithm(Enum):
    """Supported checksum algorithms."""
    CRC32 = "crc32"
    MD5 = "md5"
    SHA256 = "sha256"
    XXHASH = "xxhash"  # Fast, requires xxhash library (optional)


class IntegrityStatus(Enum):
    """Status of integrity verification."""
    VALID = "valid"
    CORRUPTED = "corrupted"
    MISSING = "missing"
    UNKNOWN = "unknown"
    REPAIRABLE = "repairable"
    UNREPAIRABLE = "unrepairable"


@dataclass
class ChecksumEntry:
    """Checksum information for a single cluster."""
    cluster_id: int
    algorithm: ChecksumAlgorithm
    checksum: str
    computed_at: datetime
    size: int  # Original data size in bytes

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "cluster_id": self.cluster_id,
            "algorithm": self.algorithm.value,
            "checksum": self.checksum,
            "computed_at": self.computed_at.isoformat(),
            "size": self.size
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "ChecksumEntry":
        """Create from dictionary."""
        return cls(
            cluster_id=data["cluster_id"],
            algorithm=ChecksumAlgorithm(data["algorithm"]),
            checksum=data["checksum"],
            computed_at=datetime.fromisoformat(data["computed_at"]),
            size=data["size"]
        )


@dataclass
class IntegrityReport:
    """Report from integrity verification scan."""
    scan_time: datetime
    total_clusters: int
    valid_clusters: int
    corrupted_clusters: int
    missing_clusters: int
    corruption_details: List[Dict[str, Any]] = field(default_factory=list)
    scan_duration_ms: float = 0.0

    @property
    def integrity_rate(self) -> float:
        """Calculate integrity rate as percentage."""
        if self.total_clusters == 0:
            return 100.0
        return (self.valid_clusters / self.total_clusters) * 100.0

    @property
    def is_clean(self) -> bool:
        """Check if filesystem is clean (no corruption)."""
        return self.corrupted_clusters == 0 and self.missing_clusters == 0

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "scan_time": self.scan_time.isoformat(),
            "total_clusters": self.total_clusters,
            "valid_clusters": self.valid_clusters,
            "corrupted_clusters": self.corrupted_clusters,
            "missing_clusters": self.missing_clusters,
            "corruption_details": self.corruption_details,
            "scan_duration_ms": self.scan_duration_ms,
            "integrity_rate": self.integrity_rate,
            "is_clean": self.is_clean
        }


@dataclass
class RepairResult:
    """Result of repair operation."""
    repaired_files: List[str] = field(default_factory=list)
    failed_files: List[Dict[str, Any]] = field(default_factory=list)
    total_bytes_repaired: int = 0
    repair_duration_ms: float = 0.0

    @property
    def success_rate(self) -> float:
        """Calculate repair success rate."""
        total = len(self.repaired_files) + len(self.failed_files)
        if total == 0:
            return 100.0
        return (len(self.repaired_files) / total) * 100.0

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "repaired_files": self.repaired_files,
            "failed_files": self.failed_files,
            "total_bytes_repaired": self.total_bytes_repaired,
            "repair_duration_ms": self.repair_duration_ms,
            "success_rate": self.success_rate
        }


class ChecksumCalculator:
    """
    Calculate checksums using multiple algorithms.

    Provides fast CRC32 for quick checks and SHA256 for
    cryptographic integrity verification.
    """

    def __init__(self, algorithm: ChecksumAlgorithm = ChecksumAlgorithm.SHA256):
        self.algorithm = algorithm

    def calculate(self, data: bytes) -> str:
        """Calculate checksum of data."""
        if self.algorithm == ChecksumAlgorithm.CRC32:
            return f"{zlib.crc32(data) & 0xffffffff:08x}"
        elif self.algorithm == ChecksumAlgorithm.MD5:
            return hashlib.md5(data).hexdigest()
        elif self.algorithm == ChecksumAlgorithm.SHA256:
            return hashlib.sha256(data).hexdigest()
        elif self.algorithm == ChecksumAlgorithm.XXHASH:
            try:
                import xxhash
                return xxhash.xxh64(data).hexdigest()
            except ImportError:
                # Fall back to SHA256 if xxhash not available
                logger.warning("xxhash not available, falling back to SHA256")
                return hashlib.sha256(data).hexdigest()
        else:
            raise ValueError(f"Unsupported algorithm: {self.algorithm}")

    def calculate_crc32(self, data: bytes) -> str:
        """Fast CRC32 checksum."""
        return f"{zlib.crc32(data) & 0xffffffff:08x}"

    def calculate_md5(self, data: bytes) -> str:
        """MD5 checksum."""
        return hashlib.md5(data).hexdigest()

    def calculate_sha256(self, data: bytes) -> str:
        """SHA256 checksum for cryptographic integrity."""
        return hashlib.sha256(data).hexdigest()

    def verify(self, data: bytes, expected_checksum: str) -> bool:
        """Verify data against expected checksum."""
        return self.calculate(data) == expected_checksum


class ChecksumStore:
    """
    Persistent storage for checksums.

    Stores checksums in a JSON file alongside the VAT.
    """

    def __init__(self, store_path: str):
        self.store_path = Path(store_path)
        self.checksums: Dict[int, ChecksumEntry] = {}
        self.lock = threading.RLock()
        self._load()

    def _load(self):
        """Load checksums from disk."""
        if self.store_path.exists():
            try:
                with open(self.store_path, "r") as f:
                    data = json.load(f)
                    self.checksums = {
                        int(k): ChecksumEntry.from_dict(v)
                        for k, v in data.get("checksums", {}).items()
                    }
            except (json.JSONDecodeError, KeyError) as e:
                logger.warning(f"Failed to load checksum store: {e}")
                self.checksums = {}

    def save(self):
        """Save checksums to disk."""
        with self.lock:
            data = {
                "version": 1,
                "checksums": {
                    str(k): v.to_dict()
                    for k, v in self.checksums.items()
                }
            }
            # Atomic write
            temp_path = self.store_path.with_suffix(".tmp")
            with open(temp_path, "w") as f:
                json.dump(data, f, indent=2)
            temp_path.replace(self.store_path)

    def get(self, cluster_id: int) -> Optional[ChecksumEntry]:
        """Get checksum for cluster."""
        with self.lock:
            return self.checksums.get(cluster_id)

    def set(self, cluster_id: int, entry: ChecksumEntry):
        """Set checksum for cluster."""
        with self.lock:
            self.checksums[cluster_id] = entry

    def remove(self, cluster_id: int):
        """Remove checksum for cluster."""
        with self.lock:
            self.checksums.pop(cluster_id, None)

    def get_all(self) -> Dict[int, ChecksumEntry]:
        """Get all checksums."""
        with self.lock:
            return dict(self.checksums)


class IntegrityScanner:
    """
    Scan filesystem for corruption.

    Reads clusters and verifies their checksums against
    stored values.
    """

    def __init__(
        self,
        vat,
        image_path: str,
        checksum_store: ChecksumStore,
        algorithm: ChecksumAlgorithm = ChecksumAlgorithm.SHA256
    ):
        self.vat = vat
        self.image_path = Path(image_path)
        self.checksum_store = checksum_store
        self.calculator = ChecksumCalculator(algorithm)
        self.lock = threading.RLock()

    def scan_cluster(self, cluster_id: int, data: bytes) -> IntegrityStatus:
        """Scan a single cluster for corruption."""
        stored = self.checksum_store.get(cluster_id)

        if stored is None:
            return IntegrityStatus.UNKNOWN

        if self.calculator.calculate(data) == stored.checksum:
            return IntegrityStatus.VALID

        return IntegrityStatus.CORRUPTED

    def scan_all(
        self,
        progress_callback: Optional[Callable[[int, int], None]] = None
    ) -> IntegrityReport:
        """
        Scan all clusters for corruption.

        Args:
            progress_callback: Optional callback(current, total) for progress updates

        Returns:
            IntegrityReport with scan results
        """
        start_time = datetime.now()

        # Get all clusters from VAT
        all_clusters = self._get_all_clusters()
        total_clusters = len(all_clusters)

        valid = 0
        corrupted = 0
        missing = 0
        details = []

        # Open image file
        try:
            with open(self.image_path, "rb") as f:
                for idx, (cluster_id, cluster_info) in enumerate(all_clusters.items()):
                    if progress_callback:
                        progress_callback(idx + 1, total_clusters)

                    try:
                        # Read cluster data
                        data = self._read_cluster(f, cluster_info)

                        if data is None:
                            missing += 1
                            details.append({
                                "cluster_id": cluster_id,
                                "status": IntegrityStatus.MISSING.value,
                                "message": "Cluster data not found"
                            })
                            continue

                        # Verify checksum
                        status = self.scan_cluster(cluster_id, data)

                        if status == IntegrityStatus.VALID:
                            valid += 1
                        elif status == IntegrityStatus.CORRUPTED:
                            corrupted += 1
                            stored = self.checksum_store.get(cluster_id)
                            details.append({
                                "cluster_id": cluster_id,
                                "status": IntegrityStatus.CORRUPTED.value,
                                "expected": stored.checksum if stored else None,
                                "actual": self.calculator.calculate(data),
                                "path": cluster_info.get("path", "unknown")
                            })
                        elif status == IntegrityStatus.UNKNOWN:
                            # No checksum stored - not corrupted, just unknown
                            valid += 1

                    except Exception as e:
                        missing += 1
                        details.append({
                            "cluster_id": cluster_id,
                            "status": IntegrityStatus.UNKNOWN.value,
                            "message": str(e)
                        })

        except FileNotFoundError:
            missing = total_clusters

        end_time = datetime.now()
        duration_ms = (end_time - start_time).total_seconds() * 1000

        return IntegrityReport(
            scan_time=start_time,
            total_clusters=total_clusters,
            valid_clusters=valid,
            corrupted_clusters=corrupted,
            missing_clusters=missing,
            corruption_details=details,
            scan_duration_ms=duration_ms
        )

    def scan_path(self, path: str) -> IntegrityStatus:
        """Scan a specific file path for corruption."""
        # Get clusters for path from VAT
        clusters = self._get_clusters_for_path(path)

        if not clusters:
            return IntegrityStatus.MISSING

        try:
            with open(self.image_path, "rb") as f:
                for cluster_id, cluster_info in clusters.items():
                    data = self._read_cluster(f, cluster_info)
                    if data is None:
                        return IntegrityStatus.MISSING

                    status = self.scan_cluster(cluster_id, data)
                    if status != IntegrityStatus.VALID and status != IntegrityStatus.UNKNOWN:
                        return status

                return IntegrityStatus.VALID
        except Exception:
            return IntegrityStatus.UNKNOWN

    def _get_all_clusters(self) -> Dict[int, Dict[str, Any]]:
        """Get all clusters from VAT."""
        # This would interface with the actual VAT implementation
        # For now, return empty dict if VAT doesn't have this method
        if hasattr(self.vat, "get_all_clusters"):
            return self.vat.get_all_clusters()
        elif hasattr(self.vat, "entries"):
            return {e.cluster_id: e.to_dict() for e in self.vat.entries.values()}
        return {}

    def _get_clusters_for_path(self, path: str) -> Dict[int, Dict[str, Any]]:
        """Get clusters for a specific path."""
        if hasattr(self.vat, "lookup"):
            entry = self.vat.lookup(path)
            if entry and hasattr(entry, "clusters"):
                return {c.cluster_id: c.to_dict() for c in entry.clusters}
        return {}

    def _read_cluster(
        self,
        f: BinaryIO,
        cluster_info: Dict[str, Any]
    ) -> Optional[bytes]:
        """Read cluster data from image file."""
        try:
            offset = cluster_info.get("offset", 0)
            size = cluster_info.get("size", 4096)
            f.seek(offset)
            return f.read(size)
        except Exception:
            return None


class CorruptionDetector:
    """
    Detect and analyze corruption patterns.

    Provides advanced corruption detection beyond simple
    checksum verification.
    """

    def __init__(self, vat, image_path: str):
        self.vat = vat
        self.image_path = Path(image_path)

    def detect_bit_rot(self, data: bytes, expected_checksum: str) -> bool:
        """Detect potential bit rot (single bit errors)."""
        # Check if Hamming distance is small (indicating few bit flips)
        actual = ChecksumCalculator(ChecksumAlgorithm.SHA256).calculate(data)

        # If checksums match exactly, no corruption
        if actual == expected_checksum:
            return False

        # Compare character by character
        differences = 0
        for a, b in zip(actual, expected_checksum):
            if a != b:
                differences += 1

        # If only 1-2 character differences in hex representation, likely bit rot
        # More than that suggests major corruption, not simple bit rot
        return 0 < differences <= 2

    def detect_truncation(
        self,
        data: bytes,
        expected_size: int
    ) -> Tuple[bool, int]:
        """
        Detect if data was truncated.

        Returns:
            Tuple of (is_truncated, bytes_missing)
        """
        if len(data) < expected_size:
            return True, expected_size - len(data)
        return False, 0

    def detect_pattern_corruption(self, data: bytes) -> List[str]:
        """
        Detect common corruption patterns.

        Returns:
            List of detected corruption pattern types
        """
        patterns = []

        if not data:
            patterns.append("empty")
            return patterns

        # Check for all zeros
        if all(b == 0 for b in data):
            patterns.append("all_zeros")

        # Check for all 0xFF
        if all(b == 0xFF for b in data):
            patterns.append("all_ones")

        # Check for repeating pattern
        if len(data) >= 4:
            pattern = data[:4]
            if data == pattern * (len(data) // 4):
                patterns.append("repeating_pattern")

        # Check for potential metadata corruption (non-printable in text files)
        non_printable = sum(1 for b in data if b < 32 and b not in (9, 10, 13))
        if non_printable > len(data) * 0.5:
            patterns.append("binary_corruption")

        return patterns


class IntegrityRepairer:
    """
    Repair corrupted data from backups or WAL.

    Attempts to restore data integrity using available
    recovery mechanisms.
    """

    def __init__(
        self,
        vat,
        image_path: str,
        checksum_store: ChecksumStore,
        wal_manager=None,
        backup_path: Optional[str] = None
    ):
        self.vat = vat
        self.image_path = Path(image_path)
        self.checksum_store = checksum_store
        self.wal_manager = wal_manager
        self.backup_path = Path(backup_path) if backup_path else None
        self.lock = threading.RLock()

    def can_repair(self, cluster_id: int) -> IntegrityStatus:
        """Check if a corrupted cluster can be repaired."""
        # Check WAL for valid backup
        if self.wal_manager:
            if self._find_in_wal(cluster_id):
                return IntegrityStatus.REPAIRABLE

        # Check backup directory
        if self.backup_path and self.backup_path.exists():
            if self._find_in_backup(cluster_id):
                return IntegrityStatus.REPAIRABLE

        return IntegrityStatus.UNREPAIRABLE

    def repair_cluster(
        self,
        cluster_id: int,
        progress_callback: Optional[Callable[[str], None]] = None
    ) -> Tuple[bool, str]:
        """
        Attempt to repair a corrupted cluster.

        Returns:
            Tuple of (success, message)
        """
        with self.lock:
            # Try WAL first
            if self.wal_manager:
                if progress_callback:
                    progress_callback(f"Checking WAL for cluster {cluster_id}")

                wal_data = self._find_in_wal(cluster_id)
                if wal_data:
                    if self._write_cluster(cluster_id, wal_data):
                        return True, "Repaired from WAL"

            # Try backup
            if self.backup_path and self.backup_path.exists():
                if progress_callback:
                    progress_callback(f"Checking backup for cluster {cluster_id}")

                backup_data = self._find_in_backup(cluster_id)
                if backup_data:
                    if self._write_cluster(cluster_id, backup_data):
                        return True, "Repaired from backup"

            return False, "No valid recovery source found"

    def repair_all(
        self,
        cluster_ids: List[int],
        progress_callback: Optional[Callable[[int, int, str], None]] = None
    ) -> RepairResult:
        """
        Repair multiple corrupted clusters.

        Args:
            cluster_ids: List of cluster IDs to repair
            progress_callback: Optional callback(current, total, message)

        Returns:
            RepairResult with repair statistics
        """
        start_time = datetime.now()
        repaired = []
        failed = []
        total_bytes = 0

        for idx, cluster_id in enumerate(cluster_ids):
            if progress_callback:
                progress_callback(idx + 1, len(cluster_ids), f"Repairing cluster {cluster_id}")

            success, message = self.repair_cluster(cluster_id)

            if success:
                repaired.append(str(cluster_id))
                # Get cluster size
                entry = self.checksum_store.get(cluster_id)
                if entry:
                    total_bytes += entry.size
            else:
                failed.append({
                    "cluster_id": cluster_id,
                    "reason": message
                })

        end_time = datetime.now()
        duration_ms = (end_time - start_time).total_seconds() * 1000

        return RepairResult(
            repaired_files=repaired,
            failed_files=failed,
            total_bytes_repaired=total_bytes,
            repair_duration_ms=duration_ms
        )

    def _find_in_wal(self, cluster_id: int) -> Optional[bytes]:
        """Find valid data for cluster in WAL."""
        if not self.wal_manager:
            return None

        try:
            # Get the last valid entry for this cluster from WAL
            if hasattr(self.wal_manager, "get_last_valid"):
                return self.wal_manager.get_last_valid(cluster_id)
        except Exception as e:
            logger.error(f"Error reading from WAL: {e}")

        return None

    def _find_in_backup(self, cluster_id: int) -> Optional[bytes]:
        """Find valid data for cluster in backup."""
        if not self.backup_path or not self.backup_path.exists():
            return None

        backup_file = self.backup_path / f"cluster_{cluster_id}.bin"
        if backup_file.exists():
            try:
                # Verify backup integrity
                stored = self.checksum_store.get(cluster_id)
                if stored:
                    with open(backup_file, "rb") as f:
                        data = f.read()
                    calc = ChecksumCalculator(stored.algorithm)
                    if calc.calculate(data) == stored.checksum:
                        return data
            except Exception as e:
                logger.error(f"Error reading backup: {e}")

        return None

    def _write_cluster(self, cluster_id: int, data: bytes) -> bool:
        """Write repaired data to image."""
        try:
            # Get cluster offset from VAT
            if hasattr(self.vat, "get_cluster_offset"):
                offset = self.vat.get_cluster_offset(cluster_id)
            else:
                return False

            # Write to image
            with open(self.image_path, "r+b") as f:
                f.seek(offset)
                f.write(data)
                f.flush()
                os.fsync(f.fileno())

            return True
        except Exception as e:
            logger.error(f"Error writing cluster: {e}")
            return False


class IntegrityManager:
    """
    Unified integrity management interface.

    Coordinates checksum calculation, scanning, detection,
    and repair operations.
    """

    def __init__(
        self,
        vat,
        image_path: str,
        checksum_store_path: Optional[str] = None,
        algorithm: ChecksumAlgorithm = ChecksumAlgorithm.SHA256,
        wal_manager=None,
        backup_path: Optional[str] = None
    ):
        self.vat = vat
        self.image_path = Path(image_path)

        # Initialize components
        store_path = checksum_store_path or str(self.image_path.with_suffix(".checksums.json"))
        self.checksum_store = ChecksumStore(store_path)
        self.calculator = ChecksumCalculator(algorithm)
        self.scanner = IntegrityScanner(vat, image_path, self.checksum_store, algorithm)
        self.detector = CorruptionDetector(vat, image_path)
        self.repairer = IntegrityRepairer(
            vat, image_path, self.checksum_store,
            wal_manager, backup_path
        )

        self.lock = threading.RLock()
        self.algorithm = algorithm

    def compute_checksum(self, data: bytes, cluster_id: int) -> ChecksumEntry:
        """Compute and store checksum for data."""
        entry = ChecksumEntry(
            cluster_id=cluster_id,
            algorithm=self.algorithm,
            checksum=self.calculator.calculate(data),
            computed_at=datetime.now(),
            size=len(data)
        )
        self.checksum_store.set(cluster_id, entry)
        return entry

    def verify_checksum(self, data: bytes, cluster_id: int) -> bool:
        """Verify data against stored checksum."""
        stored = self.checksum_store.get(cluster_id)
        if stored is None:
            return True  # No checksum stored, assume valid

        calc = ChecksumCalculator(stored.algorithm)
        return calc.calculate(data) == stored.checksum

    def scan(
        self,
        progress_callback: Optional[Callable[[int, int], None]] = None
    ) -> IntegrityReport:
        """Scan filesystem for corruption."""
        return self.scanner.scan_all(progress_callback)

    def scan_path(self, path: str) -> IntegrityStatus:
        """Scan a specific path for corruption."""
        return self.scanner.scan_path(path)

    def repair(
        self,
        cluster_ids: Optional[List[int]] = None,
        progress_callback: Optional[Callable[[int, int, str], None]] = None
    ) -> RepairResult:
        """
        Repair corrupted clusters.

        Args:
            cluster_ids: Specific clusters to repair, or None to repair all
            progress_callback: Optional progress callback

        Returns:
            RepairResult with repair statistics
        """
        if cluster_ids is None:
            # Scan first to find corrupted clusters
            report = self.scan()
            cluster_ids = [
                d["cluster_id"]
                for d in report.corruption_details
                if d["status"] == IntegrityStatus.CORRUPTED.value
            ]

        return self.repairer.repair_all(cluster_ids, progress_callback)

    def persist_checksums(self):
        """Save checksums to disk."""
        self.checksum_store.save()

    def get_statistics(self) -> Dict[str, Any]:
        """Get integrity statistics."""
        checksums = self.checksum_store.get_all()

        return {
            "total_checksums": len(checksums),
            "algorithm": self.algorithm.value,
            "image_path": str(self.image_path),
            "checksum_store_path": str(self.checksum_store.store_path)
        }

    def create_backup(self, backup_dir: str) -> int:
        """
        Create backup of all checksumed data.

        Returns:
            Number of clusters backed up
        """
        backup_path = Path(backup_dir)
        backup_path.mkdir(parents=True, exist_ok=True)

        count = 0
        checksums = self.checksum_store.get_all()

        # Read and backup each cluster
        try:
            with open(self.image_path, "rb") as img:
                for cluster_id, entry in checksums.items():
                    # Get cluster info from VAT
                    if hasattr(self.vat, "get_cluster_info"):
                        info = self.vat.get_cluster_info(cluster_id)
                        if info:
                            offset = info.get("offset", 0)
                            size = info.get("size", entry.size)

                            img.seek(offset)
                            data = img.read(size)

                            # Write backup
                            backup_file = backup_path / f"cluster_{cluster_id}.bin"
                            with open(backup_file, "wb") as f:
                                f.write(data)
                            count += 1
        except Exception as e:
            logger.error(f"Error creating backup: {e}")

        return count


# Convenience functions

def quick_verify(image_path: str, vat_path: str) -> IntegrityReport:
    """Quick integrity verification for an image."""
    # Load VAT
    with open(vat_path, "r") as f:
        vat_data = json.load(f)

    # Create minimal VAT interface
    class MinimalVAT:
        def __init__(self, data):
            self.data = data

        def get_all_clusters(self):
            return self.data.get("clusters", {})

    vat = MinimalVAT(vat_data)
    store_path = str(Path(image_path).with_suffix(".checksums.json"))
    store = ChecksumStore(store_path)

    scanner = IntegrityScanner(vat, image_path, store)
    return scanner.scan_all()


def compute_all_checksums(
    image_path: str,
    vat,
    algorithm: ChecksumAlgorithm = ChecksumAlgorithm.SHA256
) -> int:
    """
    Compute checksums for all clusters in an image.

    Returns:
        Number of checksums computed
    """
    manager = IntegrityManager(vat, image_path, algorithm=algorithm)

    # Get all clusters
    if hasattr(vat, "get_all_clusters"):
        clusters = vat.get_all_clusters()
    else:
        return 0

    count = 0
    with open(image_path, "rb") as f:
        for cluster_id, info in clusters.items():
            offset = info.get("offset", 0)
            size = info.get("size", 4096)

            f.seek(offset)
            data = f.read(size)

            manager.compute_checksum(data, cluster_id)
            count += 1

    manager.persist_checksums()
    return count
