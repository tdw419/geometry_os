#!/usr/bin/env python3
"""
GlyphStratum API - Integration with Python codebase

Provides utilities to:
1. Export GlyphRegistry to JSON for visualizers
2. Load glyph programs from Python code
3. Serve glyphs via HTTP for live visualization
"""
import json
import sys
import os
from pathlib import Path
from typing import Dict, List, Any, Optional
from dataclasses import asdict

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "agent-harness", "cli_anything"))

from glyph_stratum.core.stratum import Stratum, Opcode, GlyphInfo, GlyphMetadata, ProvenanceInfo
from glyph_stratum.core.glyph_registry import GlyphRegistry
from glyph_stratum.core.executor import GlyphStratumExecutor, run_program


class GlyphExporter:
    """Export GlyphRegistry to various formats for visualization."""

    @staticmethod
    def to_json(registry: GlyphRegistry, name: str = "program") -> str:
        """Export registry to JSON format for graph_viewer.html."""
        glyphs = {}
        for idx, glyph in registry.glyphs.items():
            glyphs[str(idx)] = {
                "stratum": glyph.stratum.name,
                "opcode": glyph.opcode.name,
                "rationale": glyph.metadata.rationale,
                "dependencies": glyph.metadata.dependencies,
                "runtime_refs": glyph.metadata.runtime_refs,
                "invariants": glyph.metadata.invariants
            }

        return json.dumps({
            "name": name,
            "glyphs": glyphs
        }, indent=2)

    @staticmethod
    def to_dict(registry: GlyphRegistry, name: str = "program") -> Dict:
        """Export registry to dict format."""
        return json.loads(GlyphExporter.to_json(registry, name))

    @staticmethod
    def save(registry: GlyphRegistry, path: str, name: str = "program"):
        """Save registry to file."""
        data = GlyphExporter.to_dict(registry, name)
        with open(path, 'w') as f:
            json.dump(data, f, indent=2)
        print(f"Saved {len(registry.glyphs)} glyphs to {path}")

    @staticmethod
    def to_sample_programs(registries: Dict[str, GlyphRegistry], output_path: str):
        """Export multiple registries as sample_programs.json format."""
        samples = {}
        for name, registry in registries.items():
            samples[name] = GlyphExporter.to_dict(registry, name)

        data = {
            "samples": samples,
            "metadata": {
                "version": "1.0",
                "generated": True,
                "total_glyphs": sum(len(r.glyphs) for r in registries.values()),
                "programs": len(registries)
            }
        }

        with open(output_path, 'w') as f:
            json.dump(data, f, indent=2)
        print(f"Saved {len(registries)} programs ({data['metadata']['total_glyphs']} glyphs) to {output_path}")


class GlyphBuilder:
    """Fluent API for building glyph programs."""

    def __init__(self, name: str = "program"):
        self.name = name
        self.registry = GlyphRegistry()
        self._glyph_map: Dict[str, int] = {}

    def substrate(self, name: str, value: Any, rationale: str = "") -> 'GlyphBuilder':
        """Add a SUBSTRATE/DATA glyph."""
        idx = self.registry.create(
            stratum=Stratum.SUBSTRATE,
            opcode=Opcode.DATA,
            rationale=rationale or f"substrate: {name}",
            dependencies=[],
            invariants={"value": str(value) if not isinstance(value, (int, float, str, bool, list, dict)) else value}
        )
        self._glyph_map[name] = idx.index
        return self

    def memory(self, name: str, deps: List[str], rationale: str = "", opcode: str = "LOAD") -> 'GlyphBuilder':
        """Add a MEMORY glyph."""
        dep_indices = [self._glyph_map[d] for d in deps if d in self._glyph_map]
        op = Opcode[opcode] if opcode in Opcode.__members__ else Opcode.LOAD

        idx = self.registry.create(
            stratum=Stratum.MEMORY,
            opcode=op,
            rationale=rationale or f"memory: {name}",
            dependencies=dep_indices
        )
        self._glyph_map[name] = idx.index
        return self

    def logic(self, name: str, deps: List[str], rationale: str = "", opcode: str = "CALL",
             runtime_refs: List[str] = None) -> 'GlyphBuilder':
        """Add a LOGIC glyph."""
        dep_indices = [self._glyph_map[d] for d in deps if d in self._glyph_map]
        runtime_indices = [self._glyph_map[r] for r in (runtime_refs or []) if r in self._glyph_map]
        op = Opcode[opcode] if opcode in Opcode.__members__ else Opcode.CALL

        idx = self.registry.create(
            stratum=Stratum.LOGIC,
            opcode=op,
            rationale=rationale or f"logic: {name}",
            dependencies=dep_indices
        )

        # Add runtime refs to metadata
        if runtime_indices:
            glyph = self.registry.get(idx.index)
            if glyph:
                glyph.metadata.runtime_refs = runtime_indices

        self._glyph_map[name] = idx.index
        return self

    def spec(self, name: str, deps: List[str], rationale: str = "", opcode: str = "EXPORT") -> 'GlyphBuilder':
        """Add a SPEC glyph."""
        dep_indices = [self._glyph_map[d] for d in deps if d in self._glyph_map]
        op = Opcode[opcode] if opcode in Opcode.__members__ else Opcode.EXPORT

        idx = self.registry.create(
            stratum=Stratum.SPEC,
            opcode=op,
            rationale=rationale or f"spec: {name}",
            dependencies=dep_indices
        )
        self._glyph_map[name] = idx.index
        return self

    def intent(self, name: str, deps: List[str], rationale: str = "") -> 'GlyphBuilder':
        """Add an INTENT glyph."""
        dep_indices = [self._glyph_map[d] for d in deps if d in self._glyph_map]

        idx = self.registry.create(
            stratum=Stratum.INTENT,
            opcode=Opcode.MODULE,
            rationale=rationale or f"intent: {name}",
            dependencies=dep_indices
        )
        self._glyph_map[name] = idx.index
        return self

    def build(self) -> GlyphRegistry:
        """Build and return the registry."""
        return self.registry

    def export(self) -> str:
        """Export to JSON string."""
        return GlyphExporter.to_json(self.registry, self.name)

    def save(self, path: str):
        """Save to file."""
        GlyphExporter.save(self.registry, path, self.name)


class GlyphServer:
    """Simple HTTP server for live visualization."""

    def __init__(self, registry: GlyphRegistry = None, port: int = 8080):
        self.registry = registry
        self.port = port
        self.server = None

    def update_registry(self, registry: GlyphRegistry):
        """Update the registry being served."""
        self.registry = registry

    def start(self):
        """Start the HTTP server."""
        from http.server import HTTPServer, SimpleHTTPRequestHandler
        import threading

        class GlyphHandler(SimpleHTTPRequestHandler):
            server_instance = self

            def do_GET(self):
                if self.path == "/api/glyphs":
                    self.send_response(200)
                    self.send_header("Content-type", "application/json")
                    self.end_headers()
                    if self.server_instance.registry:
                        self.wfile.write(GlyphExporter.to_json(self.server_instance.registry).encode())
                    else:
                        self.wfile.write(b'{"name": "empty", "glyphs": {}}')
                else:
                    super().do_GET()

        GlyphHandler.server_instance = self

        self.server = HTTPServer(('localhost', self.port), GlyphHandler)
        print(f"GlyphServer running at http://localhost:{self.port}")
        print(f"  - Graph viewer: http://localhost:{self.port}/graph_viewer.html")
        print(f"  - API endpoint: http://localhost:{self.port}/api/glyphs")

        thread = threading.Thread(target=self.server.serve_forever)
        thread.daemon = True
        thread.start()

    def stop(self):
        """Stop the server."""
        if self.server:
            self.server.shutdown()


# Convenience functions
def build_program(name: str = "program") -> GlyphBuilder:
    """Create a new GlyphBuilder for fluent program construction."""
    return GlyphBuilder(name)


def export_registry(registry: GlyphRegistry, name: str = "program") -> str:
    """Export a registry to JSON string."""
    return GlyphExporter.to_json(registry, name)


def save_registry(registry: GlyphRegistry, path: str, name: str = "program"):
    """Save a registry to file."""
    GlyphExporter.save(registry, path, name)


# Demo
if __name__ == "__main__":
    print("=" * 60)
    print("GlyphStratum API Demo")
    print("=" * 60)

    # Build a simple program using fluent API
    print("\n1. Building program with fluent API...")

    program = (GlyphBuilder("multiply")
        .substrate("a", 7, "First operand")
        .substrate("b", 6, "Second operand")
        .memory("load_a", ["a"], "Load operand a")
        .memory("load_b", ["b"], "Load operand b")
        .logic("multiply", ["load_a", "load_b"], "a * b")
        .spec("export", ["multiply"], "multiply(a, b) interface")
        .intent("module", ["export"], "Multiply two numbers")
    )

    registry = program.build()
    print(f"   Created {len(registry.glyphs)} glyphs")

    # Validate coherence
    errors = registry.validate_stratum_order()
    print(f"   Coherence: {'100%' if not errors else f'{len(errors)} issues'}")

    # Export to JSON
    print("\n2. Exporting to JSON...")
    json_str = program.export()
    print(f"   JSON length: {len(json_str)} chars")

    # Save to file
    print("\n3. Saving to file...")
    output_path = "demo_multiply.json"
    program.save(output_path)

    # Show sample of JSON
    print("\n4. JSON Preview:")
    data = json.loads(json_str)
    for idx, glyph in list(data["glyphs"].items())[:3]:
        print(f"   [{idx}] {glyph['stratum']:10} {glyph['opcode']:8} {glyph['rationale'][:30]}")
    print("   ...")

    print("\n" + "=" * 60)
    print("Demo complete!")
    print(f"Output saved to: {output_path}")
    print("Load in graph_viewer.html by pasting the JSON")
    print("=" * 60)
