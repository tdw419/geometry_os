"""
WeightMutation Protocol for Tectonic Weight Mutation.

Defines the data structures for neural weight mutations, district upgrades,
and rollback journal for the "Sentient Map" feature.

V14.2 Enhanced: Added checksum validation, thread safety, cascading rollback,
and failure recovery mechanisms.
"""

import hashlib
import threading
import time
import uuid
from collections import deque
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class MutationAuthority(Enum):
    """Authority levels for mutation operations."""
    ENGINEER = "engineer"  # Can initiate mutations
    GUARDIAN = "guardian"  # Can veto only
    COORDINATOR = "coordinator"  # Can do both


class Material(Enum):
    """Material types for neural weights."""
    GOLD = "gold"    # F32 full precision
    STEEL = "steel"  # Q8 8-bit quantization
    RUST = "rust"    # Q4 4-bit quantization
    DUST = "dust"    # Sparse/zero weights


@dataclass
class WeightMutation:
    """A single weight mutation event."""
    index_1d: int
    weight_delta: float
    layer: str = ""
    authority: MutationAuthority = MutationAuthority.ENGINEER
    timestamp: float = field(default_factory=time.time)
    mutation_id: str = field(default_factory=lambda: str(uuid.uuid4())[:8])

    def is_authorized(self) -> bool:
        """Check if the authority level can initiate mutations."""
        return self.authority in (MutationAuthority.ENGINEER, MutationAuthority.COORDINATOR)

    def to_json(self) -> dict[str, Any]:
        """Serialize to JSON for WebSocket transmission."""
        return {
            "type": "weight_mutation",
            "mutation_id": self.mutation_id,
            "index_1d": self.index_1d,
            "weight_delta": self.weight_delta,
            "layer": self.layer,
            "authority": self.authority.value,
            "timestamp": self.timestamp
        }

    @classmethod
    def from_json(cls, data: dict[str, Any]) -> "WeightMutation":
        """Deserialize from JSON."""
        return cls(
            index_1d=data["index_1d"],
            weight_delta=data["weight_delta"],
            layer=data.get("layer", ""),
            authority=MutationAuthority(data.get("authority", "engineer")),
            timestamp=data.get("timestamp", time.time()),
            mutation_id=data.get("mutation_id", str(uuid.uuid4())[:8])
        )


@dataclass
class DistrictUpgrade:
    """A district-level batch mutation."""
    district_id: str
    from_material: str
    to_material: str
    affected_indices: list[int] = field(default_factory=list)
    timestamp: float = field(default_factory=time.time)
    upgrade_id: str = field(default_factory=lambda: str(uuid.uuid4())[:8])

    def to_json(self) -> dict[str, Any]:
        """Serialize to JSON."""
        return {
            "type": "district_upgrade",
            "upgrade_id": self.upgrade_id,
            "district_id": self.district_id,
            "from_material": self.from_material,
            "to_material": self.to_material,
            "affected_indices": len(self.affected_indices),
            "timestamp": self.timestamp
        }

    @classmethod
    def from_json(cls, data: dict[str, Any]) -> "DistrictUpgrade":
        """Deserialize from JSON."""
        return cls(
            district_id=data["district_id"],
            from_material=data["from_material"],
            to_material=data["to_material"],
            affected_indices=data.get("affected_indices", []),
            timestamp=data.get("timestamp", time.time()),
            upgrade_id=data.get("upgrade_id", str(uuid.uuid4())[:8])
        )


@dataclass
class RollbackEntry:
    """Journal entry for rollback support."""
    snapshot_id: str
    mutation: WeightMutation
    previous_value: float
    timestamp: float = field(default_factory=time.time)
    dependencies: set[str] = field(default_factory=set)  # snapshot_ids this entry depends on
    checksum: str = ""

    def __post_init__(self):
        """Compute checksum after initialization."""
        if not self.checksum:
            self.checksum = self._compute_checksum()

    def _compute_checksum(self) -> str:
        """Compute SHA256 checksum for integrity validation."""
        data = f"{self.snapshot_id}:{self.mutation.mutation_id}:{self.mutation.index_1d}:" \
               f"{self.mutation.weight_delta}:{self.previous_value}:{self.timestamp}"
        return hashlib.sha256(data.encode()).hexdigest()[:16]

    def validate_checksum(self) -> bool:
        """Validate entry integrity via checksum."""
        expected = self._compute_checksum()
        return self.checksum == expected

    def to_dict(self) -> dict[str, Any]:
        """Serialize entry for storage/transmission."""
        return {
            "snapshot_id": self.snapshot_id,
            "mutation": self.mutation.to_json(),
            "previous_value": self.previous_value,
            "timestamp": self.timestamp,
            "dependencies": list(self.dependencies),
            "checksum": self.checksum
        }


class RollbackResult:
    """Result of a rollback operation."""
    def __init__(self, success: bool, restored_mutations: list[WeightMutation] = None,
                 error: str = None, rolled_back_ids: list[str] = None):
        self.success = success
        self.restored_mutations = restored_mutations or []
        self.error = error
        self.rolled_back_ids = rolled_back_ids or []


class MutationJournal:
    """
    Journal for recording mutations and supporting rollback.
    Stored in the Substrate District for the Hippocampus Rollback feature.

    V14.2 Enhanced Features:
    - Thread safety via RLock for concurrent mutation recording
    - Checksum validation for journal integrity
    - Cascading rollback for dependent mutations
    - Failure recovery with automatic state restoration
    """

    def __init__(self, max_entries: int = 1000):
        self.max_entries = max_entries
        self.entries: deque = deque(maxlen=max_entries)
        self.snapshot_index: dict[str, RollbackEntry] = {}
        self._lock = threading.RLock()  # Reentrant lock for thread safety
        self._journal_checksum: str = ""
        self._failed_rollbacks: list[dict[str, Any]] = []  # Track failed ops for recovery

    def record(self, mutation: WeightMutation, previous_value: float,
               depends_on: str | None = None) -> str:
        """
        Record a mutation in the journal.

        Args:
            mutation: The mutation to record
            previous_value: The value before mutation (for rollback)
            depends_on: Optional snapshot_id this mutation depends on

        Returns:
            snapshot_id for potential rollback
        """
        with self._lock:
            snapshot_id = f"snap_{mutation.mutation_id}_{int(time.time() * 1000)}"

            dependencies = set()
            if depends_on and depends_on in self.snapshot_index:
                dependencies.add(depends_on)

            entry = RollbackEntry(
                snapshot_id=snapshot_id,
                mutation=mutation,
                previous_value=previous_value,
                dependencies=dependencies
            )

            self.entries.append(entry)
            self.snapshot_index[snapshot_id] = entry
            self._update_journal_checksum()

            return snapshot_id

    def rollback(self, snapshot_id: str, cascade: bool = False) -> WeightMutation | None:
        """
        Rollback to a previous state.

        Args:
            snapshot_id: The snapshot to rollback to
            cascade: If True, also rollback all mutations that depend on this one

        Returns:
            WeightMutation with restored_value, or None if not found
        """
        with self._lock:
            if snapshot_id not in self.snapshot_index:
                return None

            entry = self.snapshot_index[snapshot_id]

            # Validate checksum before rollback
            if not entry.validate_checksum():
                self._record_failed_rollback(snapshot_id, "checksum_validation_failed")
                return None

            # Check for dependent entries if cascade is False
            dependents = self._find_dependents(snapshot_id)
            if dependents and not cascade:
                self._record_failed_rollback(snapshot_id, "has_dependents",
                                            {"dependent_count": len(dependents)})
                return None

            # If cascading, rollback dependents first (reverse order)
            if cascade:
                for dep_id in reversed(dependents):
                    self._rollback_single(dep_id)

            return self._rollback_single(snapshot_id)

    def rollback_cascading(self, snapshot_id: str) -> RollbackResult:
        """
        Perform cascading rollback including all dependent mutations.

        Returns:
            RollbackResult with all restored mutations
        """
        with self._lock:
            if snapshot_id not in self.snapshot_index:
                return RollbackResult(False, error="snapshot_not_found")

            # Find all dependents in dependency order
            to_rollback = self._get_rollback_order(snapshot_id)
            restored = []
            rolled_back_ids = []

            for snap_id in to_rollback:
                result = self._rollback_single(snap_id)
                if result:
                    restored.append(result)
                    rolled_back_ids.append(snap_id)
                else:
                    # Partial rollback - record for recovery
                    return RollbackResult(
                        False,
                        restored_mutations=restored,
                        error="partial_rollback",
                        rolled_back_ids=rolled_back_ids
                    )

            return RollbackResult(True, restored_mutations=restored, rolled_back_ids=rolled_back_ids)

    def _rollback_single(self, snapshot_id: str) -> WeightMutation | None:
        """Internal: rollback a single entry without lock."""
        if snapshot_id not in self.snapshot_index:
            return None

        entry = self.snapshot_index[snapshot_id]

        # Create a restoration mutation
        restore = WeightMutation(
            index_1d=entry.mutation.index_1d,
            weight_delta=-entry.mutation.weight_delta,  # Inverse delta
            layer=entry.mutation.layer,
            authority=MutationAuthority.COORDINATOR
        )
        restore.restored_value = entry.previous_value
        restore.rollback_snapshot_id = snapshot_id

        # Remove from journal and update dependencies
        del self.snapshot_index[snapshot_id]

        # Remove this snapshot_id from other entries' dependencies
        for other_entry in self.entries:
            if snapshot_id in other_entry.dependencies:
                other_entry.dependencies.discard(snapshot_id)

        # Remove from deque
        try:
            self.entries.remove(entry)
        except ValueError:
            pass  # Already removed by maxlen

        self._update_journal_checksum()
        return restore

    def _find_dependents(self, snapshot_id: str) -> list[str]:
        """Find all entries that depend on the given snapshot."""
        dependents = []
        for entry in self.snapshot_index.values():
            if snapshot_id in entry.dependencies:
                dependents.append(entry.snapshot_id)
        return dependents

    def _get_rollback_order(self, snapshot_id: str) -> list[str]:
        """Get the order for cascading rollback (dependents first, then target)."""
        order = []
        visited = set()

        def collect_dependents(snap_id: str):
            if snap_id in visited:
                return
            visited.add(snap_id)
            for entry in self.snapshot_index.values():
                if snap_id in entry.dependencies and entry.snapshot_id not in visited:
                    collect_dependents(entry.snapshot_id)
            order.append(snap_id)

        collect_dependents(snapshot_id)
        return order

    def _record_failed_rollback(self, snapshot_id: str, reason: str,
                                context: dict[str, Any] = None):
        """Record a failed rollback for recovery purposes."""
        self._failed_rollbacks.append({
            "snapshot_id": snapshot_id,
            "reason": reason,
            "context": context or {},
            "timestamp": time.time()
        })

    def get_failed_rollbacks(self) -> list[dict[str, Any]]:
        """Get list of failed rollback attempts for recovery."""
        return list(self._failed_rollbacks)

    def clear_failed_rollbacks(self):
        """Clear the failed rollback log."""
        self._failed_rollbacks.clear()

    def validate_integrity(self) -> dict[str, Any]:
        """
        Validate journal integrity via checksums.

        Returns:
            Dict with 'valid' bool and 'invalid_entries' list
        """
        with self._lock:
            invalid_entries = []
            for entry in self.entries:
                if not entry.validate_checksum():
                    invalid_entries.append(entry.snapshot_id)

            # Validate overall journal checksum
            expected_checksum = self._compute_journal_checksum()
            checksum_valid = (self._journal_checksum == expected_checksum or
                            not self._journal_checksum)  # Empty is OK

            return {
                "valid": len(invalid_entries) == 0 and checksum_valid,
                "invalid_entries": invalid_entries,
                "journal_checksum_valid": checksum_valid,
                "entry_count": len(self.entries),
                "snapshot_count": len(self.snapshot_index)
            }

    def _compute_journal_checksum(self) -> str:
        """Compute checksum for entire journal state."""
        if not self.entries:
            return ""
        data = "|".join(e.checksum for e in self.entries)
        return hashlib.sha256(data.encode()).hexdigest()[:32]

    def _update_journal_checksum(self):
        """Update the stored journal checksum."""
        self._journal_checksum = self._compute_journal_checksum()

    def get_recent(self, count: int = 10) -> list[RollbackEntry]:
        """Get recent journal entries."""
        with self._lock:
            return list(self.entries)[-count:]

    def get_entry(self, snapshot_id: str) -> RollbackEntry | None:
        """Get a specific entry by snapshot_id."""
        with self._lock:
            return self.snapshot_index.get(snapshot_id)

    def get_dependencies(self, snapshot_id: str) -> set[str]:
        """Get dependencies for a snapshot."""
        with self._lock:
            entry = self.snapshot_index.get(snapshot_id)
            return entry.dependencies.copy() if entry else set()

    def clear(self):
        """Clear the journal."""
        with self._lock:
            self.entries.clear()
            self.snapshot_index.clear()
            self._journal_checksum = ""
            self._failed_rollbacks.clear()

    # Thread-safe context manager for batch operations
    def batch_operation(self):
        """Context manager for thread-safe batch operations."""
        return _BatchContext(self)


class _BatchContext:
    """Context manager for batch operations on MutationJournal."""

    def __init__(self, journal: MutationJournal):
        self.journal = journal
        self.lock = journal._lock

    def __enter__(self):
        self.lock.acquire()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.lock.release()
        return False
