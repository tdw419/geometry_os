#!/usr/bin/env python3
"""
Geometry OS Bootstrap Health Check

Measures completeness of each OS layer.
Follows GEOS-HARNESS.md methodology.

Usage:
    python3 systems/health/bootstrap_check.py
    python3 systems/health/bootstrap_check.py --json
"""

import json
import sys
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional

ROOT = Path(__file__).parent.parent.parent


@dataclass
class LayerStatus:
    """Status of a single bootstrap layer."""
    name: str
    score: float  # 0.0 to 1.0
    checks: dict[str, bool] = field(default_factory=dict)
    blocking: list[str] = field(default_factory=list)
    measured_fps: Optional[float] = None

    @property
    def passed(self) -> int:
        return sum(1 for v in self.checks.values() if v)

    @property
    def total(self) -> int:
        return len(self.checks)


def check_layer_0_substrate() -> LayerStatus:
    """Layer 0: PixelRTS binary↔.rts.png encoding."""
    checks = {}

    # Check pixel_compiler module exists
    pixel_compiler = ROOT / "systems" / "pixel_compiler"
    checks["pixel_compiler/ exists"] = pixel_compiler.exists()

    # Check PixelRTS encoder
    encoder = pixel_compiler / "pixel_rts_encoder.py"
    checks["pixel_rts_encoder.py exists"] = encoder.exists()

    # Check PixelRTS decoder
    decoder = pixel_compiler / "pixel_rts_decoder.py"
    checks["pixel_rts_decoder.py exists"] = decoder.exists()

    # Check tests exist
    tests = ROOT / "tests" / "test_pixel_rts.py"
    checks["test_pixel_rts.py exists"] = tests.exists()

    blocking = []
    if not checks.get("pixel_compiler/ exists"):
        blocking.append("Create systems/pixel_compiler/")
    if not checks.get("pixel_rts_encoder.py exists"):
        blocking.append("Implement pixel_rts_encoder.py")
    if not checks.get("pixel_rts_decoder.py exists"):
        blocking.append("Implement pixel_rts_decoder.py")

    score = sum(checks.values()) / len(checks) if checks else 0.0
    return LayerStatus("Layer 0: Substrate", score, checks, blocking)


def check_layer_1_visual_shell() -> LayerStatus:
    """Layer 1: PixiJS infinite map compositor."""
    checks = {}

    # Check visual_shell exists
    visual_shell = ROOT / "systems" / "visual_shell"
    checks["visual_shell/ exists"] = visual_shell.exists()

    # Check PixiJS integration
    package_json = visual_shell / "package.json"
    checks["package.json exists"] = package_json.exists()

    # Check compositor entry point
    compositor = visual_shell / "src" / "compositor.ts"
    checks["compositor.ts exists"] = compositor.exists()

    # Check infinite map
    infinite_map = visual_shell / "src" / "infinite_map.ts"
    checks["infinite_map.ts exists"] = infinite_map.exists()

    # Check Rust infinite_map_rs compiles
    infinite_map_rs = ROOT / "systems" / "infinite_map_rs"
    checks["infinite_map_rs/ exists"] = infinite_map_rs.exists()
    cargo_toml = infinite_map_rs / "Cargo.toml"
    checks["infinite_map_rs/Cargo.toml exists"] = cargo_toml.exists()

    blocking = []
    if not checks.get("visual_shell/ exists"):
        blocking.append("Create systems/visual_shell/")
    if not checks.get("package.json exists"):
        blocking.append("Initialize npm project with PixiJS")

    score = sum(checks.values()) / len(checks) if checks else 0.0
    return LayerStatus("Layer 1: Visual Shell", score, checks, blocking)


def check_layer_2_neural_bridge() -> LayerStatus:
    """Layer 2: Neural Event Bus, Swarm agents, Senses."""
    checks = {}

    # Add ROOT to path for imports
    sys.path.insert(0, str(ROOT))

    # Check NEB (Neural Event Bus)
    try:
        from systems.evolution_daemon.neural_event import NeuralEvent, EventType
        checks["NeuralEventBus importable"] = True
    except ImportError as e:
        checks["NeuralEventBus importable"] = False

    # Check Swarm agents
    try:
        from systems.swarm.daemon import SwarmDaemon
        checks["SwarmDaemon importable"] = True
    except ImportError:
        checks["SwarmDaemon importable"] = False

    # Check WorkerAgent base class
    worker_agent = ROOT / "systems" / "visual_shell" / "swarm" / "worker_agent.py"
    checks["WorkerAgent exists"] = worker_agent.exists()

    # Check Senses
    fs_sense = ROOT / "systems" / "pixel_compiler" / "filesystem_sense.py"
    checks["FilesystemSense exists"] = fs_sense.exists()

    web_sense = ROOT / "systems" / "pixel_compiler" / "web_sense.py"
    checks["WebSense exists"] = web_sense.exists()

    blocking = []
    if not checks.get("NeuralEventBus importable"):
        blocking.append("Fix NeuralEventBus import")
    if not checks.get("WorkerAgent exists"):
        blocking.append("Create WorkerAgent base class")
    if not checks.get("FilesystemSense exists"):
        blocking.append("Create FilesystemSense")
    if not checks.get("WebSense exists"):
        blocking.append("Create WebSense")

    score = sum(checks.values()) / len(checks) if checks else 0.0
    return LayerStatus("Layer 2: Neural Bridge", score, checks, blocking)


def check_layer_3_bootstrap_ui() -> LayerStatus:
    """Layer 3: Fonts, Terminal, GEOS commands."""
    checks = {}

    # Check fonts module
    fonts = ROOT / "systems" / "fonts"
    checks["fonts/ exists"] = fonts.exists()

    # Check font renderer
    font_renderer = fonts / "font_renderer.py" if fonts.exists() else None
    checks["font_renderer.py exists"] = font_renderer.exists() if font_renderer else False

    # Check terminal
    terminal = ROOT / "systems" / "terminal_emulator"
    checks["terminal_emulator/ exists"] = terminal.exists()

    # Check GEOS CLI
    geos_cli = ROOT / "systems" / "geos_cli"
    checks["geos_cli/ exists"] = geos_cli.exists()

    blocking = []
    if not checks.get("fonts/ exists"):
        blocking.append("Create systems/fonts/")
    if not checks.get("font_renderer.py exists"):
        blocking.append("Implement font_renderer.py with real FreeType")
    if not checks.get("terminal_emulator/ exists"):
        blocking.append("Create systems/terminal_emulator/")
    if not checks.get("geos_cli/ exists"):
        blocking.append("Create systems/geos_cli/")

    score = sum(checks.values()) / len(checks) if checks else 0.0
    return LayerStatus("Layer 3: Bootstrap UI", score, checks, blocking)


def check_layer_4_self_hosting() -> LayerStatus:
    """Layer 4: Evolution daemon, Sisyphus brain."""
    checks = {}

    # Check evolution daemon
    evolution = ROOT / "systems" / "evolution_daemon"
    checks["evolution_daemon/ exists"] = evolution.exists()

    # Check sisyphus
    sisyphus = ROOT / "systems" / "sisyphus"
    checks["sisyphus/ exists"] = sisyphus.exists()

    # Check sisyphus brain
    sisyphus_brain = sisyphus / "sisyphus_brain.py" if sisyphus.exists() else None
    checks["sisyphus_brain.py exists"] = sisyphus_brain.exists() if sisyphus_brain else False

    # Check tests
    evolution_tests = list(evolution.glob("**/test_*.py")) if evolution.exists() else []
    checks[f"evolution_daemon has {len(evolution_tests)} tests"] = len(evolution_tests) > 0

    blocking = []
    if not checks.get("evolution_daemon/ exists"):
        blocking.append("Create systems/evolution_daemon/")
    if not checks.get("sisyphus/ exists"):
        blocking.append("Create systems/sisyphus/")

    score = sum(checks.values()) / len(checks) if checks else 0.0
    return LayerStatus("Layer 4: Self-Hosting", score, checks, blocking)


def main():
    import argparse
    parser = argparse.ArgumentParser(description="Geometry OS Bootstrap Health Check")
    parser.add_argument("--json", action="store_true", help="JSON output for agents")
    args = parser.parse_args()

    # Check all layers
    layers = [
        check_layer_0_substrate(),
        check_layer_1_visual_shell(),
        check_layer_2_neural_bridge(),
        check_layer_3_bootstrap_ui(),
        check_layer_4_self_hosting(),
    ]

    # Calculate overall score
    overall = sum(l.score for l in layers) / len(layers)

    if args.json:
        output = {
            "overall_score": round(overall * 100, 1),
            "layers": [
                {
                    "name": l.name,
                    "score": round(l.score * 100, 1),
                    "passed": l.passed,
                    "total": l.total,
                    "blocking": l.blocking,
                }
                for l in layers
            ]
        }
        print(json.dumps(output, indent=2))
    else:
        print("\n" + "=" * 60)
        print("GEOMETRY OS BOOTSTRAP HEALTH CHECK")
        print("=" * 60 + "\n")

        for layer in layers:
            status = "✅" if layer.score == 1.0 else "⚠️" if layer.score > 0 else "❌"
            print(f"{status} {layer.name}")
            print(f"   Score: {layer.score * 100:.0f}% ({layer.passed}/{layer.total} checks)")

            if layer.blocking:
                print(f"   Blocking: {', '.join(layer.blocking)}")
            print()

        print("=" * 60)
        print(f"OVERALL: {overall * 100:.0f}%")
        print("=" * 60 + "\n")

    # Exit with error if not 100%
    sys.exit(0 if overall == 1.0 else 1)


if __name__ == "__main__":
    main()
