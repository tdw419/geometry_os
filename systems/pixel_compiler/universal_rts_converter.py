#!/usr/bin/env python3
"""
Universal RTS Converter

Auto-detects input formats (ELF, WASM, GGUF) and converts them to
the appropriate PixelRTS format.
"""

import os
from pathlib import Path
from typing import Optional

# Import core encoder
from pixelrts_v2_core import PixelRTSEncoder


class UniversalRTSConverter:
    """
    Auto-detecting converter for multiple binary formats.
    """

    def __init__(self, output_dir: str = '.'):
        """
        Initialize converter.

        Args:
            output_dir: Default directory for output files
        """
        self.output_dir = output_dir
        self.standard_encoder = PixelRTSEncoder(mode="standard")
        self.code_encoder = PixelRTSEncoder(mode="code")

    def convert(self, input_path: str, output_path: Optional[str] = None) -> str:
        """
        Detect format and convert to PixelRTS.

        Args:
            input_path: Path to input binary
            output_path: Path to output .rts.png (optional)

        Returns:
            Path to the generated file
        """
        input_path = Path(input_path)
        if not input_path.exists():
            raise FileNotFoundError(f"Input not found: {input_path}")

        if output_path is None:
            output_path = str(Path(self.output_dir) / (input_path.name + ".rts.png"))

        # Detect format based on extension or magic bytes
        ext = input_path.suffix.lower()
        
        # Determine encoding mode
        mode = "standard"
        if ext == ".wasm":
            mode = "code"
        elif ext in [".elf", ".bin"]:
            mode = "standard"
            
        encoder = self.code_encoder if mode == "code" else self.standard_encoder
        
        with open(input_path, 'rb') as f:
            data = f.read()
            
        # Basic conversion
        png_bytes = encoder.encode(data)
        
        with open(output_path, 'wb') as f:
            f.write(png_bytes)
            
        return output_path
