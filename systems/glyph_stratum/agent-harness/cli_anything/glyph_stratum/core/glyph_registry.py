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
        """Get construction dependency graph as adjacency list (excludes runtime refs)."""
        return {
            idx: glyph.metadata.dependencies.copy()
            for idx, glyph in self.glyphs.items()
        }

    def runtime_ref_graph(self) -> Dict[int, List[int]]:
        """Get runtime reference graph as adjacency list (can contain cycles for recursion)."""
        return {
            idx: glyph.metadata.runtime_refs.copy()
            for idx, glyph in self.glyphs.items()
        }

    def full_reference_graph(self) -> Dict[int, List[int]]:
        """Get combined graph of all references (deps + runtime_refs)."""
        return {
            idx: glyph.metadata.dependencies + glyph.metadata.runtime_refs
            for idx, glyph in self.glyphs.items()
        }

    def find_cycle(self, use_runtime_refs: bool = False) -> Optional[List[int]]:
        """Find a cycle in the dependency graph.

        Args:
            use_runtime_refs: If True, check full graph including runtime refs.
                            If False (default), only check construction dependencies.

        Returns the cycle path if found, None otherwise.
        """
        def find_cycle_recursive(idx: int, path: List[int], visited: set) -> Optional[List[int]]:
            if idx in path:
                cycle_start = path.index(idx)
                return path[cycle_start:] + [idx]
            if idx in visited:
                return None
            visited.add(idx)
            path.append(idx)
            glyph = self.glyphs.get(idx)
            if glyph:
                # Choose which edges to follow based on parameter
                edges = glyph.metadata.dependencies if not use_runtime_refs else (
                    glyph.metadata.dependencies + glyph.metadata.runtime_refs
                )
                for dep_idx in edges:
                    result = find_cycle_recursive(dep_idx, path, visited)
                    if result:
                        return result
            path.pop()
            return None

        visited: set = set()
        for idx in self.glyphs:
            if idx not in visited:
                cycle = find_cycle_recursive(idx, [], visited)
                if cycle:
                    return cycle
        return None

    def has_cycle(self, use_runtime_refs: bool = False) -> bool:
        """Check if the dependency graph has any cycles."""
        return self.find_cycle(use_runtime_refs) is not None

    def find_runtime_cycle(self) -> Optional[List[int]]:
        """Find cycles in the full reference graph (including runtime refs).

        Runtime cycles are expected for recursive patterns like parsers.
        """
        return self.find_cycle(use_runtime_refs=True)

    def validate_stratum_order(self) -> List[str]:
        """Validate strata ordering.

        In GlyphStratum, higher strata (INTENT, SPEC) define goals/interfaces,
        and lower strata (LOGIC, MEMORY, SUBSTRATE) implement them.
        A glyph SHOULD depend on glyphs at the same or higher stratum.
        A violation is when a glyph depends on a LOWER stratum (bottom-up leak).
        """
        errors = []
        for idx, glyph in self.glyphs.items():
            for dep_idx in glyph.metadata.dependencies:
                dep = self.glyphs.get(dep_idx)
                if dep and dep.stratum < glyph.stratum:
                    # Only flag as error if the gap is too large (>2 levels)
                    gap = glyph.stratum - dep.stratum
                    if gap > 2:
                        errors.append(
                            f"Glyph {idx} (stratum {glyph.stratum.name}) "
                            f"depends on glyph {dep_idx} (stratum {dep.stratum.name}) "
                            f"- {gap}-level stratum gap may indicate missing abstraction"
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
            idx = int(idx_str)
            # Inject index from dict key if not present in glyph_data
            if "index" not in glyph_data:
                glyph_data = dict(glyph_data)  # Copy to avoid mutating original
                glyph_data["index"] = idx
            glyph = GlyphInfo.from_dict(glyph_data)
            registry.glyphs[glyph.index] = glyph
            # Update next_index to be at least max+1
            registry.next_index = max(registry.next_index, idx + 1)

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
