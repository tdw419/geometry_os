"""
GlyphStratum Rust FFI - Python bindings to the Rust backend.

Uses ctypes to call the native Rust library for high-performance
glyph operations.
"""
import ctypes
from ctypes import c_uint8, c_uint32, c_char_p, c_void_p, POINTER, Structure
from pathlib import Path
from typing import Optional, Dict, List, Any
import json
import os


class RustGlyphInfo(Structure):
    """C-compatible glyph info structure."""
    _fields_ = [
        ("index", c_uint32),
        ("stratum", c_uint8),
        ("opcode", c_uint8),
        ("x", c_uint32),
        ("y", c_uint32),
        ("width", c_uint32),
        ("height", c_uint32),
    ]


class RustGlyphStratum:
    """Python wrapper for the Rust GlyphStratum library."""

    def __init__(self):
        self._lib = None
        self._load_library()

    def _load_library(self):
        """Load the Rust shared library."""
        # Find the library - it's libinfinite_map_rs.so (crate name)
        # Path from this file: .../agent-harness/cli_anything/glyph_stratum/core/
        # Need to go up 6 levels to reach geometry_os root
        base_path = Path(__file__).resolve().parent.parent.parent.parent.parent.parent
        lib_paths = [
            base_path / "systems" / "infinite_map_rs" / "target" / "debug" / "libinfinite_map_rs.so",
            base_path / "systems" / "infinite_map_rs" / "target" / "release" / "libinfinite_map_rs.so",
            Path("/usr/local/lib/libinfinite_map_rs.so"),
        ]

        for lib_path in lib_paths:
            if lib_path.exists():
                self._lib = ctypes.CDLL(str(lib_path))
                self._setup_functions()
                return

        # Library not found - use Python fallback
        self._lib = None

    def _setup_functions(self):
        """Set up function signatures."""
        if not self._lib:
            return

        # glyph_stratum_create_registry
        self._lib.glyph_stratum_create_registry.restype = c_void_p

        # glyph_stratum_destroy_registry
        self._lib.glyph_stratum_destroy_registry.argtypes = [c_void_p]

        # glyph_stratum_add_glyph
        self._lib.glyph_stratum_add_glyph.argtypes = [
            c_void_p,  # registry
            c_uint8,   # stratum
            c_uint8,   # opcode
            c_char_p,  # rationale
        ]
        self._lib.glyph_stratum_add_glyph.restype = c_uint32

        # glyph_stratum_get_glyph
        self._lib.glyph_stratum_get_glyph.argtypes = [
            c_void_p,        # registry
            c_uint32,        # index
            POINTER(RustGlyphInfo),  # out_glyph
        ]
        self._lib.glyph_stratum_get_glyph.restype = c_uint8  # bool

        # glyph_stratum_query_dependents
        self._lib.glyph_stratum_query_dependents.argtypes = [
            c_void_p,  # registry
            c_uint32,  # index
            POINTER(c_uint32),  # out_indices
            c_uint32,  # max_count
        ]
        self._lib.glyph_stratum_query_dependents.restype = c_uint32

    @property
    def available(self) -> bool:
        """Check if Rust backend is available."""
        return self._lib is not None

    def create_registry(self) -> c_void_p:
        """Create a new glyph registry."""
        if self._lib:
            return self._lib.glyph_stratum_create_registry()
        return None

    def destroy_registry(self, registry: c_void_p):
        """Destroy a glyph registry."""
        if self._lib and registry:
            self._lib.glyph_stratum_destroy_registry(registry)

    def add_glyph(
        self,
        registry: c_void_p,
        stratum: int,
        opcode: int,
        rationale: str = ""
    ) -> int:
        """Add a glyph to the registry."""
        if self._lib and registry:
            rationale_bytes = rationale.encode('utf-8')
            return self._lib.glyph_stratum_add_glyph(
                registry,
                c_uint8(stratum),
                c_uint8(opcode),
                rationale_bytes
            )
        return 0

    def get_glyph(self, registry: c_void_p, index: int) -> Optional[Dict]:
        """Get glyph info by index."""
        if not self._lib or not registry:
            return None

        glyph_info = RustGlyphInfo()
        success = self._lib.glyph_stratum_get_glyph(
            registry,
            c_uint32(index),
            ctypes.byref(glyph_info)
        )

        if success:
            return {
                "index": glyph_info.index,
                "stratum": glyph_info.stratum,
                "opcode": glyph_info.opcode,
                "x": glyph_info.x,
                "y": glyph_info.y,
                "width": glyph_info.width,
                "height": glyph_info.height,
            }
        return None

    def query_dependents(self, registry: c_void_p, index: int) -> List[int]:
        """Query glyphs that depend on the given glyph."""
        if not self._lib or not registry:
            return []

        # Allocate buffer for results
        max_count = 256
        indices = (c_uint32 * max_count)()

        count = self._lib.glyph_stratum_query_dependents(
            registry,
            c_uint32(index),
            indices,
            c_uint32(max_count)
        )

        return [indices[i] for i in range(count)]


# Singleton instance
_rust_backend: Optional[RustGlyphStratum] = None


def get_rust_backend() -> RustGlyphStratum:
    """Get the Rust backend instance."""
    global _rust_backend
    if _rust_backend is None:
        _rust_backend = RustGlyphStratum()
    return _rust_backend
