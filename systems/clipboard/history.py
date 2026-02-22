"""Clipboard History module with circular buffer implementation."""

import json
import time
import uuid
from collections import deque
from dataclasses import dataclass, field, asdict
from typing import List, Optional, Dict, Any


@dataclass
class ClipboardEntry:
    """Represents a single clipboard entry."""

    content: str
    source: str
    source_ip: str
    id: str = field(default_factory=lambda: uuid.uuid4().hex[:8])
    timestamp: float = field(default_factory=time.time)

    def to_dict(self) -> Dict[str, Any]:
        """Convert entry to dictionary."""
        return asdict(self)

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "ClipboardEntry":
        """Create entry from dictionary."""
        return cls(**data)


class ClipboardHistory:
    """Circular buffer clipboard history manager."""

    def __init__(self, max_size: int = 50):
        """Initialize clipboard history.

        Args:
            max_size: Maximum number of entries to keep (default 50)
        """
        self.max_size = max_size
        self._entries: deque = deque(maxlen=max_size)
        self._id_index: Dict[str, ClipboardEntry] = {}

    def add(self, content: str, source: str, source_ip: str) -> ClipboardEntry:
        """Add a new entry to the history.

        Args:
            content: The clipboard content
            source: Source hostname/identifier
            source_ip: Source IP address

        Returns:
            The created ClipboardEntry
        """
        entry = ClipboardEntry(
            content=content,
            source=source,
            source_ip=source_ip
        )

        # If buffer is full, remove oldest from index
        if len(self._entries) == self.max_size:
            oldest = self._entries[0]
            self._id_index.pop(oldest.id, None)

        self._entries.append(entry)
        self._id_index[entry.id] = entry

        return entry

    def get_all(self) -> List[ClipboardEntry]:
        """Get all entries in chronological order.

        Returns:
            List of all entries (oldest first)
        """
        return list(self._entries)

    def get_latest(self) -> Optional[ClipboardEntry]:
        """Get the most recent entry.

        Returns:
            Latest entry or None if history is empty
        """
        if not self._entries:
            return None
        return self._entries[-1]

    def get_since(self, entry_id: str) -> List[ClipboardEntry]:
        """Get entries added after the specified entry.

        Args:
            entry_id: ID of the reference entry

        Returns:
            List of entries added after the reference (chronological order)
        """
        if entry_id not in self._id_index:
            return []

        # Find position of reference entry
        ref_entry = self._id_index[entry_id]
        entries = []

        for entry in self._entries:
            if entry.timestamp > ref_entry.timestamp:
                entries.append(entry)

        return entries

    def get_by_id(self, entry_id: str) -> Optional[ClipboardEntry]:
        """Get entry by its ID.

        Args:
            entry_id: The entry ID to look up

        Returns:
            The entry or None if not found
        """
        return self._id_index.get(entry_id)

    def delete(self, entry_id: str) -> bool:
        """Delete an entry by ID.

        Args:
            entry_id: ID of entry to delete

        Returns:
            True if deleted, False if not found
        """
        if entry_id not in self._id_index:
            return False

        # Rebuild deque without the deleted entry
        entry_to_delete = self._id_index[entry_id]
        new_entries = deque(maxlen=self.max_size)

        for entry in self._entries:
            if entry.id != entry_id:
                new_entries.append(entry)

        self._entries = new_entries
        del self._id_index[entry_id]

        return True

    def to_json(self) -> str:
        """Serialize history to JSON string.

        Returns:
            JSON string representation
        """
        data = {
            "max_size": self.max_size,
            "entries": [entry.to_dict() for entry in self._entries]
        }
        return json.dumps(data)

    @classmethod
    def from_json(cls, json_str: str) -> "ClipboardHistory":
        """Deserialize history from JSON string.

        Args:
            json_str: JSON string representation

        Returns:
            ClipboardHistory instance
        """
        data = json.loads(json_str)
        history = cls(max_size=data.get("max_size", 50))

        for entry_data in data.get("entries", []):
            entry = ClipboardEntry.from_dict(entry_data)
            history._entries.append(entry)
            history._id_index[entry.id] = entry

        return history
