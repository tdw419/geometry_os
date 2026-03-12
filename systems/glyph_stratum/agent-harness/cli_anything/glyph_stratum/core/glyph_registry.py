"""Glyph Registry - manages glyphs and their relationships."""
from typing import Dict, List, Optional, Tuple
from dataclasses import dataclass, field
import json

from .stratum import GlyphInfo, Stratum, Opcode, GlyphMetadata, ProvenanceInfo


class GlyphRegistry:
    """Registry for tracking glyphs and their relationships."""

    def __init__(self):
        self.glyphs: Dict[int, GlyphInfo] = {}
        self.next_index: int = 0
        self.session_id: str = "session-001"

    def create(
        self,
        stratum: Stratum,
        opcode: Opcode,
        dependencies: Optional[List[int]] = None,
        invariants: Optional[dict] = None,
        rationale: str = "",
        x: int = 0,
        y: int = 0,
    ) -> GlyphInfo:
        """Create and register a new glyph."""
        index = self.next_index
        self.next_index += 1

        metadata = GlyphMetadata(
            dependencies=dependencies or [],
            invariants=invariants or {},
            provenance=ProvenanceInfo(session_id=self.session_id),
            rationale=rationale,
        )

        glyph = GlyphInfo(
            index=index,
            stratum=stratum,
            opcode=opcode,
            metadata=metadata,
            x=x,
            y=y,
        )

        self.glyphs[index] = glyph
        return glyph

    def get(self, index: int) -> Optional[GlyphInfo]:
        """Get glyph by index."""
        return self.glyphs.get(index)

    def update(self, index: int, **kwargs) -> Optional[GlyphInfo]:
        """Update glyph properties."""
        glyph = self.glyphs.get(index)
        if not glyph:
            return None

        for key, value in kwargs.items():
            if hasattr(glyph, key):
                setattr(glyph, key, value)

        # Increment version in provenance
        glyph.metadata.provenance.version += 1
        return glyph

    def delete(self, index: int) -> bool:
        """Delete a glyph. Returns True if existed."""
        if index in self.glyphs:
            del self.glyphs[index]
            return True
        return False

    def by_stratum(self, stratum: Stratum) -> List[Tuple[int, GlyphInfo]]:
        """Query glyphs by stratum."""
        return [
            (idx, glyph)
            for idx, glyph in self.glyphs.items()
            if glyph.stratum == stratum
        ]

    def by_opcode(self, opcode: Opcode) -> List[Tuple[int, GlyphInfo]]:
        """Query glyphs by opcode."""
        return [
            (idx, glyph)
            for idx, glyph in self.glyphs.items()
            if glyph.opcode == opcode
        ]

    def dependents(self, glyph_index: int) -> List[int]:
        """Get all glyphs that depend on a given glyph."""
        return [
            idx
            for idx, glyph in self.glyphs.items()
            if glyph_index in glyph.metadata.dependencies
        ]

    def dependencies(self, glyph_index: int) -> List[int]:
        """Get all glyphs that a given glyph depends on."""
        glyph = self.glyphs.get(glyph_index)
        if glyph:
            return glyph.metadata.dependencies.copy()
        return []

    def dependency_graph(self) -> Dict[int, List[int]]:
        """Get full dependency graph as adjacency list."""
        return {
            idx: glyph.metadata.dependencies.copy()
            for idx, glyph in self.glyphs.items()
        }

    def validate_stratum_order(self) -> List[str]:
        """Validate that lower strata exist before higher strata depend on them."""
        errors = []
        for idx, glyph in self.glyphs.items():
            for dep_idx in glyph.metadata.dependencies:
                dep = self.glyphs.get(dep_idx)
                if dep and dep.stratum > glyph.stratum:
                    errors.append(
                        f"Glyph {idx} (stratum {glyph.stratum.name}) "
                        f"depends on glyph {dep_idx} (stratum {dep.stratum.name}) "
                        f"- violates stratum ordering"
                    )
        return errors

    def to_dict(self) -> dict:
        """Serialize registry to dict."""
        return {
            "glyphs": {
                str(idx): glyph.to_dict() for idx, glyph in self.glyphs.items()
            },
            "next_index": self.next_index,
            "session_id": self.session_id,
        }

    @classmethod
    def from_dict(cls, data: dict) -> "GlyphRegistry":
        """Deserialize registry from dict."""
        registry = cls()
        registry.next_index = data.get("next_index", 0)
        registry.session_id = data.get("session_id", "session-001")

        for idx_str, glyph_data in data.get("glyphs", {}).items():
            glyph = GlyphInfo.from_dict(glyph_data)
            registry.glyphs[glyph.index] = glyph

        return registry

    def to_json(self) -> str:
        """Serialize to JSON string."""
        return json.dumps(self.to_dict(), indent=2)

    @classmethod
    def from_json(cls, json_str: str) -> "GlyphRegistry":
        """Deserialize from JSON string."""
        return cls.from_dict(json.loads(json_str))

    def count(self) -> int:
        """Total glyph count."""
        return len(self.glyphs)

    def strata_summary(self) -> Dict[str, int]:
        """Count glyphs per stratum."""
        summary = {s.name: 0 for s in Stratum}
        for glyph in self.glyphs.values():
            summary[glyph.stratum.name] += 1
        return summary

    def opcodes_summary(self) -> Dict[str, int]:
        """Count glyphs per opcode."""
        summary = {}
        for glyph in self.glyphs.values():
            name = glyph.opcode.name
            summary[name] = summary.get(name, 0) + 1
        return summary
