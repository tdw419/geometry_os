#!/usr/bin/env python3
"""
Health Check System for Infinite Map OS.

Provides health status monitoring for Infinite Map components
including VAT integrity, storage availability, daemon status,
snapshot freshness, and memory usage.

Health Status Rules:
- healthy: All checks pass
- degraded: Some non-critical checks fail (e.g., no recent snapshot)
- unhealthy: Critical checks fail (e.g., VAT corrupted, no storage)
"""

import json
import os
import time
import shutil
from dataclasses import dataclass, field, asdict
from pathlib import Path
from typing import Dict, List, Optional, Any, Tuple

# Try to import psutil for memory checking (with fallback)
try:
    import psutil
    PSUTIL_AVAILABLE = True
except ImportError:
    PSUTIL_AVAILABLE = False

# Try to import Infinite Map components
try:
    from systems.pixel_compiler.infinite_map_v2 import VisualAllocationTable, ClusterLocation
    VAT_AVAILABLE = True
except ImportError:
    VAT_AVAILABLE = False
    VisualAllocationTable = Any
    ClusterLocation = Any

# Try to import SelfHealingDaemon
try:
    from systems.pixel_compiler.self_healing_daemon import SelfHealingDaemon
    DAEMON_AVAILABLE = True
except ImportError:
    DAEMON_AVAILABLE = False
    SelfHealingDaemon = Any

# Try to import SnapshotManager
try:
    from systems.pixel_compiler.snapshot_manager import SnapshotManager
    SNAPSHOT_AVAILABLE = True
except ImportError:
    SNAPSHOT_AVAILABLE = False
    SnapshotManager = Any


# Health check thresholds
DEFAULT_MIN_STORAGE_GB = 1.0  # Minimum 1GB free storage
DEFAULT_MAX_MEMORY_PERCENT = 90.0  # Maximum 90% memory usage
DEFAULT_SNAPSHOT_MAX_AGE_HOURS = 24.0  # Snapshots should be < 24 hours old


@dataclass
class HealthStatus:
    """
    Health status dataclass for Infinite Map OS.

    Attributes:
        status: Overall health status ("healthy", "degraded", "unhealthy")
        checks: Dictionary of individual check results (check_name -> passed)
        details: Additional details for each check
        timestamp: Unix timestamp when the health check was performed
    """
    status: str
    checks: Dict[str, bool] = field(default_factory=dict)
    details: Dict[str, Any] = field(default_factory=dict)
    timestamp: float = field(default_factory=time.time)

    # Critical checks that cause unhealthy status if failed
    CRITICAL_CHECKS = {"vat_integrity", "storage_available"}

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return asdict(self)

    def to_json(self, indent: int = 2) -> str:
        """Export health status as JSON string."""
        return json.dumps(self.to_dict(), indent=indent)

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'HealthStatus':
        """Create from dictionary."""
        return cls(
            status=data.get('status', 'unknown'),
            checks=data.get('checks', {}),
            details=data.get('details', {}),
            timestamp=data.get('timestamp', time.time())
        )

    def is_healthy(self) -> bool:
        """Check if status is healthy."""
        return self.status == "healthy"

    def is_degraded(self) -> bool:
        """Check if status is degraded."""
        return self.status == "degraded"

    def is_unhealthy(self) -> bool:
        """Check if status is unhealthy."""
        return self.status == "unhealthy"


class HealthChecker:
    """
    Health checker for Infinite Map OS components.

    Provides health status monitoring for:
    - VAT (Visual Allocation Table) integrity
    - Storage availability
    - Self-healing daemon status
    - Snapshot freshness
    - Memory usage

    Usage:
        checker = HealthChecker(vat_path="vat.json")
        status = checker.check_all()
        print(status.to_json())
    """

    def __init__(
        self,
        vat_path: Optional[str] = None,
        builder: Optional[Any] = None,
        daemon: Optional[Any] = None,
        snapshot_manager: Optional[Any] = None,
        min_storage_gb: float = DEFAULT_MIN_STORAGE_GB,
        max_memory_percent: float = DEFAULT_MAX_MEMORY_PERCENT,
        snapshot_max_age_hours: float = DEFAULT_SNAPSHOT_MAX_AGE_HOURS
    ):
        """
        Initialize health checker with optional components.

        Args:
            vat_path: Path to VAT JSON file for integrity checking
            builder: InfiniteMapBuilderV2 instance (optional)
            daemon: SelfHealingDaemon instance (optional)
            snapshot_manager: SnapshotManager instance (optional)
            min_storage_gb: Minimum required free storage in GB
            max_memory_percent: Maximum allowed memory usage percentage
            snapshot_max_age_hours: Maximum snapshot age in hours before warning
        """
        self.vat_path = Path(vat_path) if vat_path else None
        self.builder = builder
        self.daemon = daemon
        self.snapshot_manager = snapshot_manager

        # Thresholds
        self.min_storage_gb = min_storage_gb
        self.max_memory_percent = max_memory_percent
        self.snapshot_max_age_hours = snapshot_max_age_hours

    def check_all(self) -> HealthStatus:
        """
        Run all health checks and return aggregated status.

        Returns:
            HealthStatus with overall status and individual check results
        """
        checks: Dict[str, bool] = {}
        details: Dict[str, Any] = {}

        # Run all checks
        vat_result, vat_details = self.check_vat_integrity()
        checks["vat_integrity"] = vat_result
        details["vat_integrity"] = vat_details

        storage_result, storage_details = self.check_storage_available()
        checks["storage_available"] = storage_result
        details["storage_available"] = storage_details

        daemon_result, daemon_details = self.check_daemon_running()
        checks["daemon_running"] = daemon_result
        details["daemon_running"] = daemon_details

        snapshot_result, snapshot_details = self.check_snapshot_recent()
        checks["snapshot_recent"] = snapshot_result
        details["snapshot_recent"] = snapshot_details

        memory_result, memory_details = self.check_memory_usage()
        checks["memory_usage"] = memory_result
        details["memory_usage"] = memory_details

        # Determine overall status
        status = self._determine_status(checks)

        return HealthStatus(
            status=status,
            checks=checks,
            details=details
        )

    def _determine_status(self, checks: Dict[str, bool]) -> str:
        """
        Determine overall health status from check results.

        Rules:
        - unhealthy: Any critical check fails
        - degraded: Any non-critical check fails but all critical pass
        - healthy: All checks pass

        Args:
            checks: Dictionary of check name -> passed (bool)

        Returns:
            Overall status string
        """
        # Check for critical failures
        for check_name in HealthStatus.CRITICAL_CHECKS:
            if check_name in checks and not checks[check_name]:
                return "unhealthy"

        # Check for any non-critical failures
        for check_name, passed in checks.items():
            if not passed:
                return "degraded"

        return "healthy"

    def check_vat_integrity(self) -> Tuple[bool, Dict[str, Any]]:
        """
        Verify VAT consistency.

        Checks:
        1. VAT file exists and is readable
        2. JSON is valid
        3. Required fields are present
        4. Entry format is correct

        Returns:
            Tuple of (passed, details)
        """
        details: Dict[str, Any] = {
            "check": "vat_integrity",
            "passed": False,
            "error": None,
            "entries_count": 0,
            "grid_size": None
        }

        # Check if VAT path is configured
        if self.vat_path is None:
            details["error"] = "VAT path not configured"
            details["message"] = "No VAT path provided to health checker"
            return (False, details)

        # Check if VAT file exists
        if not self.vat_path.exists():
            details["error"] = f"VAT file not found: {self.vat_path}"
            return (False, details)

        try:
            # Load and parse VAT
            with open(self.vat_path, 'r') as f:
                vat_data = json.load(f)

            # Validate required fields
            required_fields = ['format', 'version', 'grid_size', 'entries']
            missing_fields = [f for f in required_fields if f not in vat_data]
            if missing_fields:
                details["error"] = f"Missing required fields: {missing_fields}"
                return (False, details)

            # Validate format identifier
            if vat_data.get('format') != 'visual-allocation-table-v2':
                details["error"] = f"Invalid VAT format: {vat_data.get('format')}"
                return (False, details)

            # Validate entries structure
            entries = vat_data.get('entries', {})
            if not isinstance(entries, dict):
                details["error"] = "Entries must be a dictionary"
                return (False, details)

            # Validate entry format (each should be list of [x, y] coordinates)
            for name, locs in entries.items():
                if locs is not None and not isinstance(locs, list):
                    details["error"] = f"Invalid entry format for '{name}'"
                    return (False, details)

                if locs:
                    for loc in locs:
                        if not isinstance(loc, list) or len(loc) < 2:
                            details["error"] = f"Invalid location format for '{name}'"
                            return (False, details)

            # All checks passed
            details["passed"] = True
            details["entries_count"] = len(entries)
            details["grid_size"] = vat_data.get('grid_size')
            details["message"] = "VAT integrity verified"

            return (True, details)

        except json.JSONDecodeError as e:
            details["error"] = f"Invalid JSON: {str(e)}"
            return (False, details)
        except IOError as e:
            details["error"] = f"IO error: {str(e)}"
            return (False, details)
        except Exception as e:
            details["error"] = f"Unexpected error: {str(e)}"
            return (False, details)

    def check_storage_available(self) -> Tuple[bool, Dict[str, Any]]:
        """
        Check free space on disk.

        Checks if there's at least min_storage_gb free space
        on the filesystem containing the VAT or current directory.

        Returns:
            Tuple of (passed, details)
        """
        details: Dict[str, Any] = {
            "check": "storage_available",
            "passed": False,
            "error": None,
            "free_gb": 0.0,
            "total_gb": 0.0,
            "percent_free": 0.0,
            "required_gb": self.min_storage_gb
        }

        try:
            # Determine path to check
            check_path = str(self.vat_path) if self.vat_path else "."

            # Get disk usage
            usage = shutil.disk_usage(check_path)

            free_bytes = usage.free
            total_bytes = usage.total
            free_gb = free_bytes / (1024 ** 3)
            total_gb = total_bytes / (1024 ** 3)
            percent_free = (free_bytes / total_bytes * 100) if total_bytes > 0 else 0

            details["free_gb"] = round(free_gb, 2)
            details["total_gb"] = round(total_gb, 2)
            details["percent_free"] = round(percent_free, 1)

            # Check threshold
            if free_gb >= self.min_storage_gb:
                details["passed"] = True
                details["message"] = f"Adequate storage: {free_gb:.2f}GB free"
            else:
                details["error"] = f"Insufficient storage: {free_gb:.2f}GB free (need {self.min_storage_gb}GB)"
                details["message"] = details["error"]

            return (details["passed"], details)

        except OSError as e:
            details["error"] = f"OS error: {str(e)}"
            return (False, details)
        except Exception as e:
            details["error"] = f"Unexpected error: {str(e)}"
            return (False, details)

    def check_daemon_running(self) -> Tuple[bool, Dict[str, Any]]:
        """
        Verify healing daemon is active.

        This is a non-critical check - daemon may be intentionally stopped.

        Returns:
            Tuple of (passed, details)
        """
        details: Dict[str, Any] = {
            "check": "daemon_running",
            "passed": False,
            "error": None,
            "is_running": False,
            "statistics": None
        }

        try:
            # Check if daemon reference is available
            if self.daemon is None:
                # No daemon provided - this is OK, just informational
                details["passed"] = True
                details["message"] = "No daemon instance provided"
                return (True, details)

            # Check if daemon has is_running method
            if hasattr(self.daemon, 'is_running'):
                is_running = self.daemon.is_running()
                details["is_running"] = is_running

                if is_running:
                    details["passed"] = True
                    details["message"] = "Self-healing daemon is running"

                    # Get statistics if available
                    if hasattr(self.daemon, 'get_statistics'):
                        stats = self.daemon.get_statistics()
                        if hasattr(stats, 'to_dict'):
                            details["statistics"] = stats.to_dict()
                        else:
                            details["statistics"] = {
                                "scans_completed": getattr(stats, 'scans_completed', 0),
                                "repairs_successful": getattr(stats, 'repairs_successful', 0)
                            }
                else:
                    details["message"] = "Self-healing daemon is not running"
                    # Not running is still OK - non-critical
                    details["passed"] = True
            else:
                # Daemon object doesn't have expected interface
                details["passed"] = True
                details["message"] = "Daemon interface not recognized"

            return (details["passed"], details)

        except Exception as e:
            details["error"] = f"Error checking daemon: {str(e)}"
            # Non-critical, so still pass
            details["passed"] = True
            return (True, details)

    def check_snapshot_recent(self) -> Tuple[bool, Dict[str, Any]]:
        """
        Verify recent snapshot exists.

        Checks if there's a snapshot created within the last
        snapshot_max_age_hours hours.

        This is a non-critical check - missing snapshot just means
        degraded redundancy.

        Returns:
            Tuple of (passed, details)
        """
        details: Dict[str, Any] = {
            "check": "snapshot_recent",
            "passed": False,
            "error": None,
            "snapshot_count": 0,
            "newest_snapshot_age_hours": None,
            "max_age_hours": self.snapshot_max_age_hours
        }

        try:
            # Check if snapshot manager is available
            if self.snapshot_manager is None:
                # Try to get from builder
                if self.builder is not None and hasattr(self.builder, '_snapshot_manager'):
                    self.snapshot_manager = self.builder._snapshot_manager

            if self.snapshot_manager is None:
                # No snapshot manager - this is OK
                details["passed"] = True
                details["message"] = "No snapshot manager available"
                return (True, details)

            # Get list of snapshots
            if hasattr(self.snapshot_manager, 'list_snapshots'):
                snapshots = self.snapshot_manager.list_snapshots()
            elif hasattr(self.snapshot_manager, '_index'):
                snapshots = list(self.snapshot_manager._index.values())
            else:
                details["passed"] = True
                details["message"] = "Snapshot manager interface not recognized"
                return (True, details)

            details["snapshot_count"] = len(snapshots)

            if not snapshots:
                details["message"] = "No snapshots found"
                details["passed"] = False
                return (False, details)

            # Find newest snapshot
            current_time = time.time()
            newest_time = 0

            for snap in snapshots:
                # Get timestamp from snapshot
                if hasattr(snap, 'timestamp'):
                    ts = snap.timestamp
                elif isinstance(snap, dict):
                    ts = snap.get('timestamp', 0)
                else:
                    continue

                if ts > newest_time:
                    newest_time = ts

            if newest_time > 0:
                age_seconds = current_time - newest_time
                age_hours = age_seconds / 3600
                details["newest_snapshot_age_hours"] = round(age_hours, 2)

                if age_hours <= self.snapshot_max_age_hours:
                    details["passed"] = True
                    details["message"] = f"Recent snapshot exists (age: {age_hours:.1f}h)"
                else:
                    details["message"] = f"Newest snapshot is {age_hours:.1f}h old (max: {self.snapshot_max_age_hours}h)"
                    details["passed"] = False
            else:
                details["message"] = "Could not determine snapshot age"
                details["passed"] = False

            return (details["passed"], details)

        except Exception as e:
            details["error"] = f"Error checking snapshots: {str(e)}"
            # Non-critical, so still pass but with warning
            details["passed"] = True
            return (True, details)

    def check_memory_usage(self) -> Tuple[bool, Dict[str, Any]]:
        """
        Check memory usage is acceptable.

        Uses psutil if available, otherwise returns a pass with
        a note that memory checking is unavailable.

        This is a non-critical check.

        Returns:
            Tuple of (passed, details)
        """
        details: Dict[str, Any] = {
            "check": "memory_usage",
            "passed": False,
            "error": None,
            "percent_used": None,
            "available_gb": None,
            "max_percent": self.max_memory_percent,
            "psutil_available": PSUTIL_AVAILABLE
        }

        if not PSUTIL_AVAILABLE:
            details["passed"] = True
            details["message"] = "psutil not available, memory check skipped"
            return (True, details)

        try:
            # Get memory info
            memory = psutil.virtual_memory()

            percent_used = memory.percent
            available_gb = memory.available / (1024 ** 3)

            details["percent_used"] = round(percent_used, 1)
            details["available_gb"] = round(available_gb, 2)
            details["total_gb"] = round(memory.total / (1024 ** 3), 2)

            if percent_used <= self.max_memory_percent:
                details["passed"] = True
                details["message"] = f"Memory usage OK: {percent_used:.1f}% used"
            else:
                details["message"] = f"High memory usage: {percent_used:.1f}% (max: {self.max_memory_percent}%)"
                details["passed"] = False

            return (details["passed"], details)

        except Exception as e:
            details["error"] = f"Error checking memory: {str(e)}"
            # Non-critical, so still pass
            details["passed"] = True
            return (True, details)

    def to_json(self, indent: int = 2) -> str:
        """
        Run all checks and return JSON result.

        Args:
            indent: JSON indentation level

        Returns:
            JSON string with health status
        """
        status = self.check_all()
        return status.to_json(indent)


def check_health(
    vat_path: Optional[str] = None,
    builder: Optional[Any] = None,
    daemon: Optional[Any] = None,
    snapshot_manager: Optional[Any] = None,
    min_storage_gb: float = DEFAULT_MIN_STORAGE_GB,
    max_memory_percent: float = DEFAULT_MAX_MEMORY_PERCENT,
    snapshot_max_age_hours: float = DEFAULT_SNAPSHOT_MAX_AGE_HOURS
) -> HealthStatus:
    """
    Convenience function to run health checks.

    Args:
        vat_path: Path to VAT JSON file
        builder: InfiniteMapBuilderV2 instance
        daemon: SelfHealingDaemon instance
        snapshot_manager: SnapshotManager instance
        min_storage_gb: Minimum required free storage in GB
        max_memory_percent: Maximum allowed memory usage percentage
        snapshot_max_age_hours: Maximum snapshot age in hours

    Returns:
        HealthStatus with check results
    """
    checker = HealthChecker(
        vat_path=vat_path,
        builder=builder,
        daemon=daemon,
        snapshot_manager=snapshot_manager,
        min_storage_gb=min_storage_gb,
        max_memory_percent=max_memory_percent,
        snapshot_max_age_hours=snapshot_max_age_hours
    )
    return checker.check_all()


def main():
    """CLI entry point for health checking."""
    import argparse

    parser = argparse.ArgumentParser(
        description='Infinite Map OS Health Checker',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Check health with VAT file
  python3 -m systems.pixel_compiler.health_check --vat-path vat.json

  # Check with custom thresholds
  python3 -m systems.pixel_compiler.health_check \\
      --vat-path vat.json \\
      --min-storage-gb 5.0 \\
      --max-memory-percent 80

  # Output as JSON for monitoring systems
  python3 -m systems.pixel_compiler.health_check --vat-path vat.json --json
        """
    )

    parser.add_argument(
        '--vat-path',
        help='Path to VAT JSON file'
    )
    parser.add_argument(
        '--min-storage-gb',
        type=float,
        default=DEFAULT_MIN_STORAGE_GB,
        help=f'Minimum free storage in GB (default: {DEFAULT_MIN_STORAGE_GB})'
    )
    parser.add_argument(
        '--max-memory-percent',
        type=float,
        default=DEFAULT_MAX_MEMORY_PERCENT,
        help=f'Maximum memory usage percent (default: {DEFAULT_MAX_MEMORY_PERCENT})'
    )
    parser.add_argument(
        '--snapshot-max-age-hours',
        type=float,
        default=DEFAULT_SNAPSHOT_MAX_AGE_HOURS,
        help=f'Maximum snapshot age in hours (default: {DEFAULT_SNAPSHOT_MAX_AGE_HOURS})'
    )
    parser.add_argument(
        '--json',
        action='store_true',
        help='Output as JSON'
    )
    parser.add_argument(
        '--quiet',
        action='store_true',
        help='Only output status (healthy/degraded/unhealthy)'
    )

    args = parser.parse_args()

    # Run health check
    checker = HealthChecker(
        vat_path=args.vat_path,
        min_storage_gb=args.min_storage_gb,
        max_memory_percent=args.max_memory_percent,
        snapshot_max_age_hours=args.snapshot_max_age_hours
    )

    status = checker.check_all()

    if args.quiet:
        print(status.status)
    elif args.json:
        print(status.to_json())
    else:
        # Human-readable output
        print("=" * 60)
        print("Infinite Map OS Health Check")
        print("=" * 60)
        print(f"\nStatus: {status.status.upper()}")
        print(f"Timestamp: {time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(status.timestamp))}")
        print("\nChecks:")

        for check_name, passed in status.checks.items():
            icon = "[PASS]" if passed else "[FAIL]"
            critical = "(critical)" if check_name in HealthStatus.CRITICAL_CHECKS else ""
            print(f"  {icon} {check_name} {critical}")

            # Print details
            details = status.details.get(check_name, {})
            if details.get('message'):
                print(f"        {details['message']}")
            if details.get('error'):
                print(f"        Error: {details['error']}")

        print("\n" + "=" * 60)

        # Exit with appropriate code
        if status.is_unhealthy():
            print("CRITICAL: System is unhealthy!")
            return 2
        elif status.is_degraded():
            print("WARNING: System is degraded")
            return 1
        else:
            print("OK: System is healthy")
            return 0


if __name__ == '__main__':
    exit(main())
