"""
Geometry OS Substrate Library
Unified Python SDK for Glyph, VM, MCP Bridge, and Spatial Computing.
"""

__version__ = "0.1.0"
__author__ = "Geometry OS Team"

__all__ = [
    # Core
    "hilbert_d2xy",
    "hilbert_xy2d",
    "HilbertCurve",
    "calculate_sls",
    # Types
    "Opcode",
    "Stratum",
    "VMState",
    "GlyphInstruction",
    "Texture",
    # Compiler
    "RISCVToGeometricJIT",
    "crystallize",
    "linux_to_glyph",
    # Benchmarks
    "benchmark_sls",
    # MCP Tools
    "glyph_patch",
    "boot_sim",
    "vm_spawn",
    "geos_status",
]

from .core import (
    hilbert_d2xy,
    hilbert_xy2d,
    HilbertCurve,
    calculate_sls,
)
from .types import (
    Opcode,
    Stratum,
    VMState,
    GlyphInstruction,
    Texture,
)
from .compiler import (
    RISCVToGeometricJIT,
    crystallize,
    linux_to_glyph,
)
from .benchmarks import benchmark_sls
from .mcp import (
    glyph_patch,
    boot_sim,
    vm_spawn,
    geos_status,
)
