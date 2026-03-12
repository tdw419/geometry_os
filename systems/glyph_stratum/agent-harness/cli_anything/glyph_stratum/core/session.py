"""Session management for GlyphStratum CLI."""
from typing import Optional, List, Dict, Any
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
import json
import uuid

from .glyph_registry import GlyphRegistry
from .stratum import Stratum, Opcode


@dataclass
class SessionState:
    """State for a CLI session."""
    session_id: str = field(default_factory=lambda: str(uuid.uuid4())[:8])
    created_at: str = field(default_factory=lambda: datetime.utcnow().isoformat())
    modified: bool = False
    current_file: Optional[str] = None
    registry: GlyphRegistry = field(default_factory=GlyphRegistry)
    undo_stack: List[dict] = field(default_factory=list)
    redo_stack: List[dict] = field(default_factory=list)

    def __post_init__(self):
        self.registry.session_id = self.session_id


class SessionManager:
    """Manages session state, persistence, and undo/redo."""

    def __init__(self):
        self.state = SessionState()
        self._max_undo = 100

    def new_session(self) -> SessionState:
        """Create a new session."""
        self.state = SessionState()
        return self.state

    def load(self, path: str) -> SessionState:
        """Load session from file.

        Supports two formats:
        - Session format: {"registry": {"glyphs": {...}}, ...}
        - Program format: {"glyphs": {...}, "name": "..."}
        """
        p = Path(path)
        if not p.exists():
            raise FileNotFoundError(f"File not found: {path}")

        with open(p, 'r') as f:
            data = json.load(f)

        # Handle both session format and simple program format
        if "registry" in data:
            # Session format
            registry = GlyphRegistry.from_dict(data["registry"])
            session_id = data.get("session_id", str(uuid.uuid4())[:8])
            created_at = data.get("created_at", datetime.utcnow().isoformat())
        else:
            # Simple program format - wrap in registry structure
            registry = GlyphRegistry.from_dict({"glyphs": data.get("glyphs", {})})
            session_id = str(uuid.uuid4())[:8]
            created_at = datetime.utcnow().isoformat()

        self.state = SessionState(
            session_id=session_id,
            created_at=created_at,
            modified=False,
            current_file=str(p.absolute()),
            registry=registry,
            undo_stack=[],
            redo_stack=[],
        )
        return self.state

    def save(self, path: Optional[str] = None) -> str:
        """Save session to file."""
        target = path or self.state.current_file
        if not target:
            raise ValueError("No file path specified")

        p = Path(target)
        p.parent.mkdir(parents=True, exist_ok=True)

        data = {
            "session_id": self.state.session_id,
            "created_at": self.state.created_at,
            "saved_at": datetime.utcnow().isoformat(),
            "registry": self.state.registry.to_dict(),
        }

        with open(p, 'w') as f:
            json.dump(data, f, indent=2)

        self.state.current_file = str(p.absolute())
        self.state.modified = False
        return str(p.absolute())

    def checkpoint(self) -> None:
        """Save current state to undo stack."""
        snapshot = self.state.registry.to_dict()
        self.state.undo_stack.append(snapshot)

        # Limit undo stack size
        if len(self.state.undo_stack) > self._max_undo:
            self.state.undo_stack.pop(0)

        # Clear redo stack on new action
        self.state.redo_stack.clear()
        self.state.modified = True

    def undo(self) -> bool:
        """Undo last action."""
        if not self.state.undo_stack:
            return False

        # Save current to redo
        self.state.redo_stack.append(self.state.registry.to_dict())

        # Restore from undo
        snapshot = self.state.undo_stack.pop()
        self.state.registry = GlyphRegistry.from_dict(snapshot)
        self.state.modified = True
        return True

    def redo(self) -> bool:
        """Redo last undone action."""
        if not self.state.redo_stack:
            return False

        # Save current to undo
        self.state.undo_stack.append(self.state.registry.to_dict())

        # Restore from redo
        snapshot = self.state.redo_stack.pop()
        self.state.registry = GlyphRegistry.from_dict(snapshot)
        self.state.modified = True
        return True

    def can_undo(self) -> bool:
        """Check if undo is available."""
        return len(self.state.undo_stack) > 0

    def can_redo(self) -> bool:
        """Check if redo is available."""
        return len(self.state.redo_stack) > 0

    def status(self) -> Dict[str, Any]:
        """Get session status."""
        return {
            "session_id": self.state.session_id,
            "created_at": self.state.created_at,
            "modified": self.state.modified,
            "current_file": self.state.current_file,
            "glyph_count": self.state.registry.count(),
            "strata": self.state.registry.strata_summary(),
            "opcodes": self.state.registry.opcodes_summary(),
            "undo_available": self.can_undo(),
            "redo_available": self.can_redo(),
        }

    # Pass-through methods to registry with checkpointing
    def add_glyph(
        self,
        stratum: Stratum,
        opcode: Opcode,
        dependencies: Optional[List[int]] = None,
        invariants: Optional[dict] = None,
        rationale: str = "",
        x: int = 0,
        y: int = 0,
    ):
        """Add a glyph with automatic checkpoint."""
        self.checkpoint()
        return self.state.registry.create(
            stratum=stratum,
            opcode=opcode,
            dependencies=dependencies,
            invariants=invariants,
            rationale=rationale,
            x=x,
            y=y,
        )

    def get_glyph(self, index: int):
        """Get glyph by index."""
        return self.state.registry.get(index)

    def update_glyph(self, index: int, **kwargs):
        """Update glyph with automatic checkpoint."""
        self.checkpoint()
        return self.state.registry.update(index, **kwargs)

    def delete_glyph(self, index: int) -> bool:
        """Delete glyph with automatic checkpoint."""
        self.checkpoint()
        return self.state.registry.delete(index)

    def query_dependents(self, index: int) -> List[int]:
        """Query glyphs that depend on given glyph."""
        return self.state.registry.dependents(index)

    def query_dependencies(self, index: int) -> List[int]:
        """Query glyphs that given glyph depends on."""
        return self.state.registry.dependencies(index)

    def query_by_stratum(self, stratum: Stratum):
        """Query glyphs by stratum."""
        return self.state.registry.by_stratum(stratum)

    def query_by_opcode(self, opcode: Opcode):
        """Query glyphs by opcode."""
        return self.state.registry.by_opcode(opcode)

    def validate(self) -> List[str]:
        """Validate the program."""
        return self.state.registry.validate_stratum_order()
