"""Stratum and Opcode definitions for GlyphStratum."""
from enum import IntEnum
from dataclasses import dataclass, field
from typing import Optional, List
from datetime import datetime
import json


class Stratum(IntEnum):
    """Semantic strata for program organization."""
    SUBSTRATE = 0  # Raw pixel/glyph operations
    MEMORY = 1     # Memory allocation, layout, types
    LOGIC = 2      # Control flow, computation
    SPEC = 3       # Component interfaces, contracts
    INTENT = 4     # Goals, requirements, rationale

    @classmethod
    def from_value(cls, value) -> Optional["Stratum"]:
        """Convert from numeric value or string name."""
        if isinstance(value, str):
            # Handle string name
            try:
                return cls[value.upper()]
            except KeyError:
                return None
        try:
            return cls(value)
        except ValueError:
            return None

    def describe(self) -> str:
        """Human-readable description."""
        descriptions = {
            Stratum.SUBSTRATE: "Raw pixel/glyph operations",
            Stratum.MEMORY: "Memory allocation, layout, types",
            Stratum.LOGIC: "Control flow, computation",
            Stratum.SPEC: "Component interfaces, contracts",
            Stratum.INTENT: "Goals, requirements, rationale",
        }
        return descriptions.get(self, "Unknown")


class Opcode(IntEnum):
    """Executable opcodes for glyph-based instructions."""
    # No operation
    NOP = 0

    # Memory operations
    ALLOC = 1    # Allocate memory block
    FREE = 2     # Release memory block
    LOAD = 3     # Load value from memory
    STORE = 4    # Store value to memory

    # Control flow
    LOOP = 5     # Begin iteration construct
    BRANCH = 6   # Conditional execution
    CALL = 7     # Function/subroutine invocation
    RETURN = 8   # Exit current scope

    # Data and types
    DATA = 9     # Literal/constant value
    TYPE = 10    # Type declaration/constraint
    PTR = 11     # Pointer/reference type
    STRUCT = 12  # Structure definition

    # Program structure
    MODULE = 13  # Encapsulation boundary
    EXPORT = 14  # Export symbol
    IMPORT = 15  # Import symbol

    # Special
    HALT = 255   # Program termination

    @classmethod
    def from_value(cls, value) -> Optional["Opcode"]:
        """Convert from numeric value or string name."""
        if isinstance(value, str):
            # Handle string name
            try:
                return cls[value.upper()]
            except KeyError:
                return None
        try:
            return cls(value)
        except ValueError:
            if value == 255:
                return cls.HALT
            return None

    def describe(self) -> str:
        """Human-readable description."""
        descriptions = {
            Opcode.NOP: "No operation",
            Opcode.ALLOC: "Allocate memory block",
            Opcode.FREE: "Release memory block",
            Opcode.LOAD: "Load value from memory",
            Opcode.STORE: "Store value to memory",
            Opcode.LOOP: "Begin iteration construct",
            Opcode.BRANCH: "Conditional execution",
            Opcode.CALL: "Function/subroutine invocation",
            Opcode.RETURN: "Exit current scope",
            Opcode.DATA: "Literal/constant value",
            Opcode.TYPE: "Type declaration/constraint",
            Opcode.PTR: "Pointer/reference type",
            Opcode.STRUCT: "Structure definition",
            Opcode.MODULE: "Encapsulation boundary",
            Opcode.EXPORT: "Export symbol",
            Opcode.IMPORT: "Import symbol",
            Opcode.HALT: "Program termination",
        }
        return descriptions.get(self, "Unknown")


@dataclass
class ProvenanceInfo:
    """Provenance tracking information."""
    session_id: str = "unknown"
    timestamp: str = field(default_factory=lambda: datetime.utcnow().isoformat())
    creator: str = "ai-agent"
    version: int = 1

    def to_dict(self) -> dict:
        return {
            "session_id": self.session_id,
            "timestamp": self.timestamp,
            "creator": self.creator,
            "version": self.version,
        }

    @classmethod
    def from_dict(cls, data: dict) -> "ProvenanceInfo":
        return cls(
            session_id=data.get("session_id", "unknown"),
            timestamp=data.get("timestamp", datetime.utcnow().isoformat()),
            creator=data.get("creator", "ai-agent"),
            version=data.get("version", 1),
        )


@dataclass
class GlyphMetadata:
    """Glyph metadata structure.

    Dependencies vs Runtime References:
    - dependencies: Construction-time deps (must be DAG) - what must exist to BUILD this glyph
    - runtime_refs: Execution-time calls (can be cyclic) - what gets CALLED when running

    Example: parse_object() depends on parse_value() at runtime for nested objects,
    but they're built independently. So parse_value is a runtime_ref, not a dependency.
    """
    dependencies: List[int] = field(default_factory=list)
    runtime_refs: List[int] = field(default_factory=list)  # Can be cyclic (for recursion)
    invariants: dict = field(default_factory=dict)
    provenance: ProvenanceInfo = field(default_factory=ProvenanceInfo)
    rationale: str = ""

    def to_dict(self) -> dict:
        return {
            "dependencies": self.dependencies,
            "runtime_refs": self.runtime_refs,
            "invariants": self.invariants,
            "provenance": self.provenance.to_dict(),
            "rationale": self.rationale,
        }

    @classmethod
    def from_dict(cls, data: dict) -> "GlyphMetadata":
        return cls(
            dependencies=data.get("dependencies", []),
            runtime_refs=data.get("runtime_refs", []),
            invariants=data.get("invariants", {}),
            provenance=ProvenanceInfo.from_dict(data.get("provenance", {})),
            rationale=data.get("rationale", ""),
        )


@dataclass
class GlyphInfo:
    """Enhanced glyph information."""
    index: int
    stratum: Stratum
    opcode: Opcode
    metadata: GlyphMetadata
    # Visual properties
    x: int = 0
    y: int = 0
    width: int = 32
    height: int = 32

    def to_dict(self) -> dict:
        return {
            "index": self.index,
            "stratum": self.stratum.value,
            "stratum_name": self.stratum.name,
            "opcode": self.opcode.value,
            "opcode_name": self.opcode.name,
            "metadata": self.metadata.to_dict(),
            "x": self.x,
            "y": self.y,
            "width": self.width,
            "height": self.height,
        }

    @classmethod
    def from_dict(cls, data: dict) -> "GlyphInfo":
        # Handle both formats: nested metadata or flat structure
        index = data.get("index", 0)

        # Get stratum - try multiple keys
        stratum_val = data.get("stratum") or data.get("stratum_name")
        stratum = Stratum.from_value(stratum_val) or Stratum.SUBSTRATE

        # Get opcode - try multiple keys
        opcode_val = data.get("opcode") or data.get("opcode_name")
        opcode = Opcode.from_value(opcode_val) or Opcode.NOP

        # Build metadata - handle both nested and flat formats
        if "metadata" in data:
            metadata = GlyphMetadata.from_dict(data["metadata"])
        else:
            # Flat format: dependencies/invariants/rationale/runtime_refs at top level
            metadata = GlyphMetadata(
                dependencies=data.get("dependencies", []),
                runtime_refs=data.get("runtime_refs", []),
                invariants=data.get("invariants", {}),
                rationale=data.get("rationale", ""),
                provenance=ProvenanceInfo()
            )

        return cls(
            index=index,
            stratum=stratum,
            opcode=opcode,
            metadata=metadata,
            x=data.get("x", 0),
            y=data.get("y", 0),
            width=data.get("width", 32),
            height=data.get("height", 32),
        )
