"""
Spatial Layout Manager for Visual Catalog

Manages and persists catalog entry positions with drag-and-drop support.
Layout is stored in ~/.rts/catalog_layout.json for session persistence.
"""

from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Optional, Tuple
import json


@dataclass
class SpatialPosition:
    """Represents a position in the catalog grid."""
    x: int  # Grid column (0-based)
    y: int  # Grid row (0-based)

    def __eq__(self, other: object) -> bool:
        """Two positions are equal if x and y match."""
        if not isinstance(other, SpatialPosition):
            return NotImplemented
        return self.x == other.x and self.y == other.y

    def to_dict(self) -> Dict[str, int]:
        """Convert to dictionary for JSON serialization."""
        return {"x": self.x, "y": self.y}

    @classmethod
    def from_dict(cls, data: Dict[str, int]) -> "SpatialPosition":
        """Create from dictionary."""
        return cls(x=data["x"], y=data["y"])


class SpatialLayoutManager:
    """
    Manages spatial positions of catalog entries.

    Features:
    - Position persistence to JSON file
    - Swap-on-collision for drag-and-drop operations
    - Grid dimension calculation
    """

    LAYOUT_VERSION = "1.0"

    def __init__(self, layout_file: str = "~/.rts/catalog_layout.json"):
        """
        Initialize the layout manager.

        Args:
            layout_file: Path to layout JSON file (supports ~ expansion)
        """
        self.layout_file = Path(layout_file).expanduser()
        self._positions: Dict[str, SpatialPosition] = self._load_layout()

    def _load_layout(self) -> Dict[str, SpatialPosition]:
        """
        Load layout from JSON file.

        Returns:
            Dictionary mapping entry_id to SpatialPosition
        """
        if not self.layout_file.exists():
            return {}

        try:
            with open(self.layout_file, "r") as f:
                data = json.load(f)

            # Validate version
            if data.get("version") != self.LAYOUT_VERSION:
                return {}

            # Parse positions
            positions = {}
            for entry_id, pos_data in data.get("positions", {}).items():
                try:
                    positions[entry_id] = SpatialPosition.from_dict(pos_data)
                except (KeyError, TypeError):
                    # Skip malformed entries
                    continue

            return positions

        except (json.JSONDecodeError, IOError):
            # Handle corrupt or unreadable file
            return {}

    def _save_layout(self) -> None:
        """
        Persist positions to JSON file.
        """
        # Ensure parent directory exists
        self.layout_file.parent.mkdir(parents=True, exist_ok=True)

        # Build data structure
        data = {
            "version": self.LAYOUT_VERSION,
            "positions": {
                entry_id: pos.to_dict()
                for entry_id, pos in self._positions.items()
            }
        }

        # Write to file
        with open(self.layout_file, "w") as f:
            json.dump(data, f, indent=2)

    def get_position(self, entry_id: str) -> Optional[SpatialPosition]:
        """
        Get position for a catalog entry.

        Args:
            entry_id: Unique identifier for the entry

        Returns:
            SpatialPosition if found, None otherwise
        """
        return self._positions.get(entry_id)

    def set_position(self, entry_id: str, position: SpatialPosition) -> None:
        """
        Set position for a new entry.

        Args:
            entry_id: Unique identifier for the entry
            position: Position in the grid
        """
        self._positions[entry_id] = position
        self._save_layout()

    def move_entry(self, entry_id: str, new_position: SpatialPosition) -> bool:
        """
        Move entry to a new position with swap semantics.

        If the target position is occupied by another entry,
        the two entries swap positions.

        Args:
            entry_id: Unique identifier for the entry to move
            new_position: Target position in the grid

        Returns:
            True if successful, False if entry_id not found
        """
        # Check if entry exists
        if entry_id not in self._positions:
            return False

        old_position = self._positions[entry_id]

        # Find if target position is occupied
        occupant_id = None
        for other_id, other_pos in self._positions.items():
            if other_id != entry_id and other_pos == new_position:
                occupant_id = other_id
                break

        # Perform swap if occupied
        if occupant_id is not None:
            self._positions[occupant_id] = old_position

        # Move entry to new position
        self._positions[entry_id] = new_position

        self._save_layout()
        return True

    def get_all_positions(self) -> Dict[str, SpatialPosition]:
        """
        Get all entry positions.

        Returns:
            Dictionary mapping entry_id to SpatialPosition
        """
        return dict(self._positions)

    def get_grid_dimensions(self) -> Tuple[int, int]:
        """
        Calculate required grid size based on positions.

        Returns (max_x + 2, max_y + 2) for padding.
        Defaults to (4, 4) if no entries.

        Returns:
            Tuple of (width, height) in grid cells
        """
        if not self._positions:
            return (4, 4)

        max_x = max(pos.x for pos in self._positions.values())
        max_y = max(pos.y for pos in self._positions.values())

        # Add padding
        return (max_x + 2, max_y + 2)

    def clear_layout(self) -> None:
        """
        Clear all positions and delete layout file.
        """
        self._positions.clear()

        if self.layout_file.exists():
            self.layout_file.unlink()
