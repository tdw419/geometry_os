"""
WeightMutation Protocol for Tectonic Weight Mutation.

Defines the data structures for neural weight mutations, district upgrades,
and rollback journal for the "Sentient Map" feature.
"""

import json
import time
import uuid
from dataclasses import dataclass, field
from enum import Enum
from typing import List, Optional, Dict, Any
from collections import deque


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

    def to_json(self) -> Dict[str, Any]:
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
    def from_json(cls, data: Dict[str, Any]) -> "WeightMutation":
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
    affected_indices: List[int] = field(default_factory=list)
    timestamp: float = field(default_factory=time.time)
    upgrade_id: str = field(default_factory=lambda: str(uuid.uuid4())[:8])

    def to_json(self) -> Dict[str, Any]:
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
    def from_json(cls, data: Dict[str, Any]) -> "DistrictUpgrade":
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


class MutationJournal:
    """
    Journal for recording mutations and supporting rollback.
    Stored in the Substrate District for the Hippocampus Rollback feature.
    """

    def __init__(self, max_entries: int = 1000):
        self.max_entries = max_entries
        self.entries: deque = deque(maxlen=max_entries)
        self.snapshot_index: Dict[str, RollbackEntry] = {}

    def record(self, mutation: WeightMutation, previous_value: float) -> str:
        """
        Record a mutation in the journal.

        Returns:
            snapshot_id for potential rollback
        """
        snapshot_id = f"snap_{mutation.mutation_id}_{int(time.time() * 1000)}"

        entry = RollbackEntry(
            snapshot_id=snapshot_id,
            mutation=mutation,
            previous_value=previous_value
        )

        self.entries.append(entry)
        self.snapshot_index[snapshot_id] = entry

        return snapshot_id

    def rollback(self, snapshot_id: str) -> Optional[WeightMutation]:
        """
        Rollback to a previous state.

        Returns:
            WeightMutation with restored_value, or None if not found
        """
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

        # Remove from journal
        del self.snapshot_index[snapshot_id]

        return restore

    def get_recent(self, count: int = 10) -> List[RollbackEntry]:
        """Get recent journal entries."""
        return list(self.entries)[-count:]

    def clear(self):
        """Clear the journal."""
        self.entries.clear()
        self.snapshot_index.clear()
