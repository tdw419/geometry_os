"""
Memory Drift Engine - Core drift physics for KV-Cache entries.

Implements gravitational memory where entries drift toward related code tiles
based on semantic similarity as a physical force.
"""

import time
from dataclasses import dataclass, field
from typing import Any, Dict, List, Optional, Tuple

import numpy as np


@dataclass
class MemoryEntry:
    """Represents a single KV-Cache entry with spatial and semantic properties."""

    key: str
    value: Any
    position: Tuple[float, float]
    semantic_vector: np.ndarray
    last_access: float = field(default_factory=time.time)
    access_count: int = 0
    drift_history: List[Tuple[float, float]] = field(default_factory=list)

    def __post_init__(self):
        """Initialize drift history with starting position."""
        if not self.drift_history:
            self.drift_history = [self.position]

    def to_dict(self) -> Dict[str, Any]:
        """Convert entry to dictionary for serialization."""
        return {
            "key": self.key,
            "value": self.value,
            "position": self.position,
            "semantic_vector": self.semantic_vector.tolist(),
            "last_access": self.last_access,
            "access_count": self.access_count,
            "drift_history": self.drift_history,
        }


class DriftEngine:
    """
    Core drift engine for gravitational memory.

    KV-Cache entries physically drift toward related code tiles based on
    semantic similarity. The drift follows an exponential decay formula
    where recently accessed entries drift faster toward their targets.

    Formula:
        position_new = position_old + alpha * e^(-beta * t) * (code_position - position_old)

    Where:
        alpha = drift_rate (default 0.1)
        beta = decay_rate (default 0.5)
        t = time_since_last_access
    """

    def __init__(
        self,
        drift_rate: float = 0.1,
        decay_rate: float = 0.5,
        bounds: Tuple[float, float, float, float] = (0.0, 0.0, 1000.0, 1000.0),
    ):
        """
        Initialize the drift engine.

        Args:
            drift_rate: Alpha parameter - how fast entries drift (0-1)
            decay_rate: Beta parameter - how fast drift decays with time (0-1)
            bounds: Spatial bounds as (x1, y1, x2, y2)
        """
        self.drift_rate = drift_rate
        self.decay_rate = decay_rate
        self.bounds = bounds
        self._entries: Dict[str, MemoryEntry] = {}

    def add_entry(
        self,
        key: str,
        value: Any,
        semantic_vector: np.ndarray,
        initial_position: Tuple[float, float],
    ) -> MemoryEntry:
        """
        Add a new memory entry to the engine.

        Args:
            key: Unique identifier for the entry
            value: The cached value
            semantic_vector: 64-dimensional semantic embedding
            initial_position: Starting (x, y) position on the Infinite Map

        Returns:
            The created MemoryEntry
        """
        entry = MemoryEntry(
            key=key,
            value=value,
            position=initial_position,
            semantic_vector=semantic_vector,
            last_access=time.time(),
            access_count=0,
        )
        self._entries[key] = entry
        return entry

    def get_entry(self, key: str) -> Optional[MemoryEntry]:
        """
        Retrieve an entry by key without updating access time.

        Args:
            key: Entry identifier

        Returns:
            MemoryEntry if found, None otherwise
        """
        return self._entries.get(key)

    def access_entry(self, key: str) -> Optional[MemoryEntry]:
        """
        Access an entry, updating its last_access time and access_count.

        This triggers drift when drift_toward is called subsequently.

        Args:
            key: Entry identifier

        Returns:
            MemoryEntry if found, None otherwise
        """
        entry = self._entries.get(key)
        if entry is not None:
            entry.last_access = time.time()
            entry.access_count += 1
        return entry

    def drift_toward(
        self,
        key: str,
        code_position: Tuple[float, float],
        code_vector: Optional[np.ndarray] = None,
        similarity: float = 1.0,
    ) -> Optional[Tuple[float, float]]:
        """
        Apply drift formula to move an entry toward a code position.

        Formula:
            position_new = position_old + alpha * e^(-beta * t) * (code_position - position_old)

        Args:
            key: Entry identifier
            code_position: Target (x, y) position to drift toward
            code_vector: Semantic vector of the code (for similarity weighting)
            similarity: Pre-computed similarity (0-1), defaults to 1.0

        Returns:
            New position after drift, or None if entry not found
        """
        entry = self._entries.get(key)
        if entry is None:
            return None

        # Calculate time since last access
        t = time.time() - entry.last_access

        # Calculate drift factor with exponential decay
        # Recent entries drift faster toward their targets
        drift_factor = self.drift_rate * np.exp(-self.decay_rate * t) * similarity

        # Apply drift formula
        old_x, old_y = entry.position
        target_x, target_y = code_position

        new_x = old_x + drift_factor * (target_x - old_x)
        new_y = old_y + drift_factor * (target_y - old_y)

        # Clamp to bounds
        x1, y1, x2, y2 = self.bounds
        new_x = max(x1, min(x2, new_x))
        new_y = max(y1, min(y2, new_y))

        # Update entry
        new_position = (new_x, new_y)
        entry.position = new_position
        entry.drift_history.append(new_position)

        # Limit history to prevent memory bloat
        if len(entry.drift_history) > 100:
            entry.drift_history = entry.drift_history[-50:]

        return new_position

    def batch_drift(
        self,
        entries: Optional[List[str]] = None,
        code_tiles: List[Tuple[Tuple[int, int], np.ndarray]] = None,
        min_similarity: float = 0.1,
    ) -> Dict[str, Tuple[float, float]]:
        """
        Drift all (or specified) entries toward their nearest semantic match.

        For each entry, finds the code tile with highest semantic similarity
        and drifts toward it using the drift formula.

        Args:
            entries: List of entry keys to drift (None = all entries)
            code_tiles: List of (tile_position, semantic_vector) tuples
            min_similarity: Minimum similarity threshold to trigger drift

        Returns:
            Dict mapping entry keys to their new positions
        """
        if code_tiles is None or len(code_tiles) == 0:
            return {}

        keys = entries if entries is not None else list(self._entries.keys())
        results = {}

        for key in keys:
            entry = self._entries.get(key)
            if entry is None:
                continue

            # Find nearest semantic match
            best_similarity = min_similarity
            best_tile = None

            for tile_pos, tile_vector in code_tiles:
                similarity = self._cosine_similarity(
                    entry.semantic_vector, tile_vector
                )
                if similarity > best_similarity:
                    best_similarity = similarity
                    best_tile = tile_pos

            # Apply drift if we found a match
            if best_tile is not None:
                new_pos = self.drift_toward(
                    key,
                    (float(best_tile[0]), float(best_tile[1])),
                    similarity=best_similarity,
                )
                if new_pos is not None:
                    results[key] = new_pos

        return results

    def get_entries_in_region(
        self, x1: float, y1: float, x2: float, y2: float
    ) -> List[MemoryEntry]:
        """
        Get all entries within a rectangular region.

        Args:
            x1, y1: Top-left corner of region
            x2, y2: Bottom-right corner of region

        Returns:
            List of MemoryEntry objects in the region
        """
        results = []
        for entry in self._entries.values():
            ex, ey = entry.position
            if x1 <= ex <= x2 and y1 <= ey <= y2:
                results.append(entry)
        return results

    @property
    def entries(self) -> Dict[str, MemoryEntry]:
        """Get all entries as a dictionary."""
        return self._entries

    def remove_entry(self, key: str) -> bool:
        """
        Remove an entry from the engine.

        Args:
            key: Entry identifier

        Returns:
            True if entry was removed, False if not found
        """
        if key in self._entries:
            del self._entries[key]
            return True
        return False

    def clear(self) -> None:
        """Remove all entries from the engine."""
        self._entries.clear()

    def get_statistics(self) -> Dict[str, Any]:
        """
        Get statistics about the drift engine.

        Returns:
            Dict with entry count, average access count, etc.
        """
        if not self._entries:
            return {
                "entry_count": 0,
                "avg_access_count": 0.0,
                "total_access_count": 0,
                "bounds": self.bounds,
            }

        access_counts = [e.access_count for e in self._entries.values()]
        return {
            "entry_count": len(self._entries),
            "avg_access_count": np.mean(access_counts),
            "total_access_count": sum(access_counts),
            "bounds": self.bounds,
        }

    def _cosine_similarity(self, a: np.ndarray, b: np.ndarray) -> float:
        """Compute cosine similarity between two vectors."""
        # Handle different dimensions by projecting to common dimension
        if len(a) != len(b):
            min_dim = min(len(a), len(b))
            a = a[:min_dim]
            b = b[:min_dim]

        dot_product = np.dot(a, b)
        norm_a = np.linalg.norm(a)
        norm_b = np.linalg.norm(b)

        if norm_a == 0 or norm_b == 0:
            return 0.0

        return float(dot_product / (norm_a * norm_b))
