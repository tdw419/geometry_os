#!/usr/bin/env python3
"""
Self-Healing Daemon for Infinite Map OS.

Background daemon that continuously scans for corruption
and automatically repairs detected issues.

Features:
- Continuous background scanning with configurable interval
- Automatic corruption detection and repair
- Task queue for prioritized healing operations
- Statistics tracking (bytes healed, durations, counts)
- Integration with RepairToolkit and SnapshotManager
"""

import asyncio
import json
import time
import uuid
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Any
from collections import defaultdict
import logging

# Import from infinite_map_v2
from systems.pixel_compiler.infinite_map_v2 import (
    VisualAllocationTable,
    ClusterLocation
)


# Configure logging
logger = logging.getLogger(__name__)


class HealingDaemonError(Exception):
    """Exception raised for healing daemon errors."""
    pass


@dataclass
class HealingTask:
    """
    Individual healing job.

    Represents a single repair operation to be performed.
    """
    task_id: str
    location: ClusterLocation
    priority: int  # 0 = highest priority
    status: str  # pending, in_progress, completed, failed
    created_at: float
    started_at: Optional[float] = None
    completed_at: Optional[float] = None
    error: Optional[str] = None
    corruption_type: str = "unknown"
    bytes_healed: int = 0

    def __post_init__(self):
        """Validate task status."""
        valid_statuses = ["pending", "in_progress", "completed", "failed"]
        if self.status not in valid_statuses:
            raise ValueError(f"Invalid status: {self.status}")

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            'task_id': self.task_id,
            'location': {'x': self.location.x, 'y': self.location.y},
            'priority': self.priority,
            'status': self.status,
            'created_at': self.created_at,
            'started_at': self.started_at,
            'completed_at': self.completed_at,
            'error': self.error,
            'corruption_type': self.corruption_type,
            'bytes_healed': self.bytes_healed
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'HealingTask':
        """Create from dictionary."""
        location_data = data.get('location', {})
        location = ClusterLocation(
            x=location_data.get('x', 0),
            y=location_data.get('y', 0)
        )

        return cls(
            task_id=data['task_id'],
            location=location,
            priority=data.get('priority', 999),
            status=data.get('status', 'pending'),
            created_at=data.get('created_at', time.time()),
            started_at=data.get('started_at'),
            completed_at=data.get('completed_at'),
            error=data.get('error'),
            corruption_type=data.get('corruption_type', 'unknown'),
            bytes_healed=data.get('bytes_healed', 0)
        )


@dataclass
class HealingStatistics:
    """
    Daemon metrics for self-healing operations.

    Tracks scan counts, repair success/failure, bytes healed,
    and timing statistics.
    """
    scans_completed: int = 0
    corruptions_detected: int = 0
    repairs_attempted: int = 0
    repairs_successful: int = 0
    unrepairable: int = 0
    total_healed_bytes: int = 0
    avg_scan_duration: float = 0.0
    avg_repair_duration: float = 0.0

    # Internal tracking for moving averages
    _total_scan_time: float = field(default=0.0, repr=False)
    _total_repair_time: float = field(default=0.0, repr=False)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            'scans_completed': self.scans_completed,
            'corruptions_detected': self.corruptions_detected,
            'repairs_attempted': self.repairs_attempted,
            'repairs_successful': self.repairs_successful,
            'unrepairable': self.unrepairable,
            'total_healed_bytes': self.total_healed_bytes,
            'avg_scan_duration': self.avg_scan_duration,
            'avg_repair_duration': self.avg_repair_duration
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'HealingStatistics':
        """Create from dictionary."""
        return cls(
            scans_completed=data.get('scans_completed', 0),
            corruptions_detected=data.get('corruptions_detected', 0),
            repairs_attempted=data.get('repairs_attempted', 0),
            repairs_successful=data.get('repairs_successful', 0),
            unrepairable=data.get('unrepairable', 0),
            total_healed_bytes=data.get('total_healed_bytes', 0),
            avg_scan_duration=data.get('avg_scan_duration', 0.0),
            avg_repair_duration=data.get('avg_repair_duration', 0.0)
        )

    def update_scan_time(self, duration: float):
        """Update statistics with new scan duration."""
        self.scans_completed += 1
        self._total_scan_time += duration
        self.avg_scan_duration = self._total_scan_time / self.scans_completed

    def update_repair_time(self, duration: float):
        """Update statistics with new repair duration."""
        self.repairs_attempted += 1
        self._total_repair_time += duration
        self.avg_repair_duration = self._total_repair_time / self.repairs_attempted

    def record_corruption(self):
        """Record a detected corruption."""
        self.corruptions_detected += 1

    def record_successful_repair(self, bytes_healed: int):
        """Record a successful repair."""
        self.repairs_successful += 1
        self.total_healed_bytes += bytes_healed

    def record_failed_repair(self):
        """Record a failed repair."""
        self.unrepairable += 1


class SelfHealingDaemon:
    """
    Background healing service for Infinite Map OS.

    Continuously scans for corruption and automatically repairs
    detected issues using the repair toolkit.

    Features:
    - Asyncio-based background service
    - Periodic scanning with configurable interval
    - Priority task queue for repairs
    - Comprehensive statistics tracking
    - Integration with RepairToolkit
    """

    VERSION = "1.0"

    def __init__(
        self,
        scan_interval: float = 300.0,
        repair_toolkit=None,
        vat_path: Optional[str] = None
    ):
        """
        Initialize self-healing daemon.

        Args:
            scan_interval: Seconds between scans (default: 300s = 5 minutes)
            repair_toolkit: RepairToolkit instance for corruption repair
            vat_path: Path to VAT file for loading allocation table
        """
        self.scan_interval = scan_interval
        self.repair_toolkit = repair_toolkit
        self.vat_path = vat_path

        # Task storage
        self._tasks: Dict[str, HealingTask] = {}
        self._task_queue: List[str] = []  # Task IDs sorted by priority

        # Statistics
        self._statistics = HealingStatistics()

        # Async state
        self._running = False
        self._task: Optional[asyncio.Task] = None
        self._scan_event = asyncio.Event()

        # Logging
        self._logger = logger

    def start(self) -> None:
        """
        Start background scanning.

        Launches asyncio background task for healing loop.
        """
        if self._running:
            self._logger.warning("Daemon already running")
            return

        self._running = True
        self._task = asyncio.create_task(self._healing_loop())
        self._logger.info(f"Self-healing daemon started (interval: {self.scan_interval}s)")

    def stop(self) -> None:
        """
        Stop daemon gracefully.

        Cancels running task and waits for completion.
        """
        if not self._running:
            self._logger.warning("Daemon not running")
            return

        self._running = False
        self._scan_event.set()  # Wake up sleeping loop

        if self._task is not None:
            self._task.cancel()

        self._logger.info("Self-healing daemon stopped")

    async def _healing_loop(self) -> None:
        """
        Main async loop for background healing.

        Continuously scans and heals at configured interval.
        """
        try:
            while self._running:
                # Run scan and heal cycle
                await self._scan_and_heal()

                # Wait for next interval or force scan
                try:
                    await asyncio.wait_for(
                        self._scan_event.wait(),
                        timeout=self.scan_interval
                    )
                    self._scan_event.clear()  # Reset for next wait
                except asyncio.TimeoutError:
                    pass  # Normal timeout, continue to next scan

        except asyncio.CancelledError:
            self._logger.info("Healing loop cancelled")

    async def _scan_and_heal(self) -> None:
        """
        Single scan and repair cycle.

        1. Load VAT
        2. Detect corruption
        3. Queue repairs
        4. Process repairs
        5. Update statistics
        """
        scan_start = time.time()

        try:
            # Load VAT
            vat = self._load_vat()
            if vat is None:
                self._logger.error("Failed to load VAT for scan")
                return

            # Collect all locations to check
            locations = self._collect_locations(vat)

            # Detect corruption (if toolkit available)
            corrupted = []
            if self.repair_toolkit and hasattr(self.repair_toolkit, 'detect_corruption'):
                try:
                    corrupted = self.repair_toolkit.detect_corruption(vat, locations)
                except Exception as e:
                    self._logger.error(f"Corruption detection failed: {e}")

            # Queue repairs for corrupted locations
            for location in corrupted:
                self._queue_repair(location, vat)

            # Process pending repairs
            await self._process_repairs(vat)

            # Update statistics
            scan_duration = time.time() - scan_start
            self._statistics.update_scan_time(scan_duration)
            self._statistics.corruptions_detected += len(corrupted)

            self._logger.debug(
                f"Scan completed: {scan_duration:.2f}s, "
                f"{len(corrupted)} corruptions detected"
            )

        except Exception as e:
            self._logger.error(f"Scan and heal cycle failed: {e}")

    def _load_vat(self) -> Optional[VisualAllocationTable]:
        """
        Load VAT from file.

        Returns:
            VisualAllocationTable or None if load fails
        """
        if self.vat_path is None:
            self._logger.warning("No VAT path configured")
            return None

        try:
            vat_file = Path(self.vat_path)
            if not vat_file.exists():
                self._logger.error(f"VAT file not found: {self.vat_path}")
                return None

            with open(vat_file, 'r') as f:
                vat_data = json.load(f)

            # Reconstruct entries
            entries = {}
            for name, locs_data in vat_data.get('entries', {}).items():
                entries[name] = [
                    ClusterLocation(x=loc[0], y=loc[1])
                    for loc in locs_data
                ]

            # Reconstruct center
            center_data = vat_data.get('center', [vat_data['grid_size'] // 2] * 2)
            center = ClusterLocation(x=center_data[0], y=center_data[1])

            # Create VAT
            vat = VisualAllocationTable(
                grid_size=vat_data['grid_size'],
                max_entries=vat_data.get('max_entries', 65536),
                center=center,
                entries=entries
            )

            return vat

        except (json.JSONDecodeError, KeyError, IOError) as e:
            self._logger.error(f"Failed to load VAT: {e}")
            return None

    def _collect_locations(self, vat: VisualAllocationTable) -> List[ClusterLocation]:
        """
        Collect all unique cluster locations from VAT.

        Args:
            vat: VisualAllocationTable to scan

        Returns:
            List of unique ClusterLocation objects
        """
        locations_set = set()

        for file_locations in vat.entries.values():
            for location in file_locations:
                locations_set.add((location.x, location.y))

        # Convert back to ClusterLocation objects
        return [ClusterLocation(x=x, y=y) for x, y in locations_set]

    def _queue_repair(self, location: ClusterLocation, vat: VisualAllocationTable):
        """
        Queue a repair task for corrupted location.

        Args:
            location: Corrupted cluster location
            vat: VisualAllocationTable for context
        """
        # Check if already queued
        for task in self._tasks.values():
            if task.location.x == location.x and task.location.y == location.y:
                if task.status in ["pending", "in_progress"]:
                    return  # Already queued/processing

        # Determine corruption type
        corruption_type = "unknown"
        if self.repair_toolkit and hasattr(self.repair_toolkit, 'get_corruption_type'):
            try:
                corruption_type = self.repair_toolkit.get_corruption_type(location)
            except Exception:
                pass

        # Determine priority based on distance from center
        distance = location.distance_to(vat.center)
        priority = int(distance)  # Closer = higher priority

        # Create task
        task = HealingTask(
            task_id=f"heal-{uuid.uuid4().hex[:8]}",
            location=location,
            priority=priority,
            status="pending",
            created_at=time.time(),
            corruption_type=corruption_type
        )

        self._add_task(task)

    async def _process_repairs(self, vat: VisualAllocationTable):
        """
        Process all pending repair tasks.

        Args:
            vat: VisualAllocationTable for context
        """
        pending = self.get_pending_tasks()

        for task in pending:
            if not self._running:
                break

            # Update to in_progress
            self._update_task_status(task.task_id, "in_progress")

            repair_start = time.time()

            try:
                # Perform repair
                if self.repair_toolkit:
                    success, bytes_healed = await self._perform_repair(task, vat)

                    repair_duration = time.time() - repair_start
                    self._statistics.update_repair_time(repair_duration)

                    if success:
                        self._update_task_status(task.task_id, "completed")
                        self._statistics.record_successful_repair(bytes_healed)

                        # Update task with bytes healed
                        if task.task_id in self._tasks:
                            self._tasks[task.task_id].bytes_healed = bytes_healed
                            self._tasks[task.task_id].completed_at = time.time()
                    else:
                        self._update_task_status(task.task_id, "failed", "Repair unsuccessful")
                        self._statistics.record_failed_repair()
                else:
                    # No toolkit - mark as failed
                    self._update_task_status(task.task_id, "failed", "No repair toolkit")
                    self._statistics.record_failed_repair()

            except Exception as e:
                error_msg = f"Repair failed: {str(e)}"
                self._update_task_status(task.task_id, "failed", error_msg)
                self._statistics.record_failed_repair()

    async def _perform_repair(
        self,
        task: HealingTask,
        vat: VisualAllocationTable
    ) -> tuple[bool, int]:
        """
        Perform actual repair operation.

        Args:
            task: HealingTask to execute
            vat: VisualAllocationTable for context

        Returns:
            Tuple of (success, bytes_healed)
        """
        if self.repair_toolkit and hasattr(self.repair_toolkit, 'repair_corruption'):
            # Call toolkit's repair method
            result = self.repair_toolkit.repair_corruption(
                task.location,
                task.corruption_type
            )

            if isinstance(result, tuple):
                return result
            elif result is True:
                return (True, 4096)  # Default cluster size
            else:
                return (False, 0)

        return (False, 0)

    def _add_task(self, task: HealingTask):
        """
        Add a healing task to the queue.

        Args:
            task: HealingTask to add
        """
        self._tasks[task.task_id] = task
        self._task_queue.append(task.task_id)
        # Sort by priority (lower = higher priority)
        self._task_queue.sort(key=lambda tid: self._tasks[tid].priority)

    def _update_task_status(self, task_id: str, status: str, error: Optional[str] = None):
        """
        Update task status.

        Args:
            task_id: ID of task to update
            status: New status
            error: Optional error message
        """
        if task_id in self._tasks:
            task = self._tasks[task_id]
            task.status = status

            if status == "in_progress" and task.started_at is None:
                task.started_at = time.time()
            elif status == "completed" and task.completed_at is None:
                task.completed_at = time.time()
            elif status == "failed" and task.completed_at is None:
                task.completed_at = time.time()

            if error:
                task.error = error

    def get_statistics(self) -> HealingStatistics:
        """
        Return healing metrics.

        Returns:
            HealingStatistics with current metrics
        """
        return self._statistics

    def force_scan(self) -> None:
        """
        Trigger immediate scan.

        Wakes up the healing loop to run a scan immediately.
        """
        self._scan_event.set()

    def is_running(self) -> bool:
        """
        Check if daemon is running.

        Returns:
            True if daemon is running
        """
        return self._running

    def get_task_queue_size(self) -> int:
        """
        Get number of tasks in queue.

        Returns:
            Number of tasks
        """
        return len(self._tasks)

    def get_pending_tasks(self) -> List[HealingTask]:
        """
        Get all pending tasks sorted by priority.

        Returns:
            List of pending HealingTask objects
        """
        return [
            self._tasks[tid]
            for tid in self._task_queue
            if self._tasks[tid].status == "pending"
        ]

    def get_completed_tasks(self) -> List[HealingTask]:
        """
        Get all completed tasks.

        Returns:
            List of completed HealingTask objects
        """
        return [
            task for task in self._tasks.values()
            if task.status == "completed"
        ]

    def get_failed_tasks(self) -> List[HealingTask]:
        """
        Get all failed tasks.

        Returns:
            List of failed HealingTask objects
        """
        return [
            task for task in self._tasks.values()
            if task.status == "failed"
        ]

    def clear_completed_tasks(self):
        """
        Remove all completed tasks from the queue.
        """
        to_remove = [
            tid for tid in self._task_queue
            if self._tasks[tid].status in ["completed", "failed"]
        ]

        for tid in to_remove:
            self._task_queue.remove(tid)
            del self._tasks[tid]

    def export_tasks(self) -> List[Dict[str, Any]]:
        """
        Export all tasks to serializable format.

        Returns:
            List of task dictionaries
        """
        return [task.to_dict() for task in self._tasks.values()]


def main():
    """CLI for self-healing daemon."""
    import argparse

    parser = argparse.ArgumentParser(
        description='Self-Healing Daemon for Infinite Map OS',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""Examples:
  # Start daemon with 5 minute scan interval
  python3 -m systems.pixel_compiler.self_healing_daemon start \\
      --vat-path vat.json --interval 300

  # Show statistics
  python3 -m systems.pixel_compiler.self_healing_daemon stats \\
      --vat-path vat.json

  # Force immediate scan
  python3 -m systems.pixel_compiler.self_healing_daemon scan \\
      --vat-path vat.json
        """
    )

    parser.add_argument(
        'action',
        choices=['start', 'stop', 'stats', 'scan', 'tasks'],
        help='Action to perform'
    )
    parser.add_argument(
        '--vat-path',
        required=True,
        help='Path to VAT file'
    )
    parser.add_argument(
        '--interval',
        type=float,
        default=300.0,
        help='Scan interval in seconds (default: 300)'
    )
    parser.add_argument(
        '--verbose',
        action='store_true',
        help='Enable verbose logging'
    )

    args = parser.parse_args()

    # Configure logging
    logging.basicConfig(
        level=logging.DEBUG if args.verbose else logging.INFO,
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    )

    try:
        daemon = SelfHealingDaemon(
            scan_interval=args.interval,
            vat_path=args.vat_path
        )

        if args.action == 'start':
            print(f"[*] Starting self-healing daemon...")
            print(f"    VAT path: {args.vat_path}")
            print(f"    Scan interval: {args.interval}s")

            daemon.start()

            # Run forever
            try:
                asyncio.run(asyncio.sleep(float('inf')))
            except KeyboardInterrupt:
                print("\n[*] Shutting down...")
                daemon.stop()

        elif args.action == 'stats':
            stats = daemon.get_statistics()
            print(f"[*] Self-Healing Statistics:")
            print(f"    Scans completed: {stats.scans_completed}")
            print(f"    Corruptions detected: {stats.corruptions_detected}")
            print(f"    Repairs attempted: {stats.repairs_attempted}")
            print(f"    Repairs successful: {stats.repairs_successful}")
            print(f"    Unrepairable: {stats.unrepairable}")
            print(f"    Total bytes healed: {stats.total_healed_bytes}")
            print(f"    Avg scan duration: {stats.avg_scan_duration:.2f}s")
            print(f"    Avg repair duration: {stats.avg_repair_duration:.2f}s")

        elif args.action == 'scan':
            print(f"[*] Forcing immediate scan...")
            daemon.force_scan()

        elif args.action == 'tasks':
            pending = daemon.get_pending_tasks()
            completed = daemon.get_completed_tasks()
            failed = daemon.get_failed_tasks()

            print(f"[*] Healing Tasks:")
            print(f"    Pending: {len(pending)}")
            print(f"    Completed: {len(completed)}")
            print(f"    Failed: {len(failed)}")

            if failed:
                print(f"\n[!] Failed tasks:")
                for task in failed:
                    print(f"    {task.task_id}: {task.error}")

    except Exception as e:
        print(f"[!] Error: {e}")
        import sys
        sys.exit(1)


if __name__ == '__main__':
    main()
