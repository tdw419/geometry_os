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
    # Allocator
    "SpatialAllocator",
    # Task Manager
    "TaskManager",
    "TaskState",
    # Remote Control
    "RemoteControl",
    # MCP Tools
    "glyph_patch",
    "boot_sim",
    "vm_spawn",
    "geos_status",
    # Memory Bridge
    "mem_write",
    "mem_read",
    "store_context",
    "retrieve_context",
    # Firmware
    "crystallize_firmware",
    "extract_firmware",
    "crystallize_amdgpu_firmware",
    "FirmwareTexture",
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
from .allocator import SpatialAllocator
from .task_manager import TaskManager, TaskState
from .remote import RemoteControl
from .mcp import (
    glyph_patch,
    boot_sim,
    vm_spawn,
    geos_status,
)
from .memory_bridge import (
    mem_write,
    mem_read,
    store_context,
    retrieve_context,
)
from .firmware import (
    crystallize_firmware,
    extract_firmware,
    crystallize_amdgpu_firmware,
    FirmwareTexture,
)
