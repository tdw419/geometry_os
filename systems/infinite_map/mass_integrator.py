"""
Mass Integrator: Converts file events to semantic mass deltas.

Mass increases with access frequency, creating "hot spots" in the gravity map.
Implements the "Semantic Gravity" concept from the v1.2 vision.
"""

from dataclasses import dataclass, field
from typing import Dict, Optional
from .file_watcher import FileEvent


@dataclass
class MassDelta:
    """Represents a change in semantic mass for a file."""
    file_path: str
    delta_mass: float
    event_type: str


class MassIntegrator:
    """
    Converts file system events to semantic mass changes.

    The mass of a file represents its "importance" or "heat" in the
    Tectonic Engine. Files that are accessed frequently become "hot"
    and drift toward the center of the gravity map.
    """

    def __init__(
        self,
        access_weight: float = 0.1,
        modify_weight: float = 0.25,
        create_weight: float = 0.5,
        delete_weight: float = -0.3,
        decay_factor: float = 0.95
    ):
        """
        Initialize the mass integrator.

        Args:
            access_weight: Mass added per file access
            modify_weight: Mass added per file modification
            create_weight: Mass added per file creation
            delete_weight: Mass change per file deletion (usually negative)
            decay_factor: Factor for mass decay (0.95 = 5% decay per cycle)
        """
        self.access_weight = access_weight
        self.modify_weight = modify_weight
        self.create_weight = create_weight
        self.delete_weight = delete_weight
        self.decay_factor = decay_factor

        # Track accumulated mass per file
        self._file_masses: Dict[str, float] = {}

    def process_event(self, event: FileEvent) -> MassDelta:
        """
        Process a file event and return the mass delta.

        Args:
            event: The file event to process

        Returns:
            MassDelta with the change in semantic mass
        """
        # Determine weight based on event type
        weight_map = {
            "accessed": self.access_weight,
            "modified": self.modify_weight,
            "created": self.create_weight,
            "deleted": self.delete_weight
        }

        delta_mass = weight_map.get(event.event_type, 0.0)

        # Update accumulated mass
        if event.file_path not in self._file_masses:
            self._file_masses[event.file_path] = 0.0
        self._file_masses[event.file_path] += delta_mass

        return MassDelta(
            file_path=event.file_path,
            delta_mass=delta_mass,
            event_type=event.event_type
        )

    def get_file_mass(self, file_path: str) -> float:
        """Get the accumulated mass for a file."""
        return self._file_masses.get(file_path, 0.0)

    def apply_decay(self) -> Dict[str, float]:
        """
        Apply decay to all file masses.

        Returns:
            Dict of file_path -> new_mass after decay
        """
        for path in self._file_masses:
            self._file_masses[path] *= self.decay_factor
        return dict(self._file_masses)

    def get_all_masses(self) -> Dict[str, float]:
        """Get all file masses."""
        return dict(self._file_masses)

    def clear(self):
        """Clear all accumulated mass."""
        self._file_masses.clear()
