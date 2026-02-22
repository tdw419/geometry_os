#!/usr/bin/env python3
"""
PixelRTS v2 WASM Code Visualizer

Implements semantic visualization for WASM bytecode per OpenSpec 004.

Features:
- WASM magic number detection (\0asm)
- Opcode categorization (control flow, arithmetic, memory)
- Semantic coloring with RGBA encoding
- Entropy-based complexity visualization

Color Mapping:
- Red: Control flow entropy (hot = complex)
- Green: Operand 1 value
- Blue: Operand 2 value / immediate
- Alpha: Execution mask (255 = executable, 0 = data/padding)

Author: PixelRTS v2 Implementation
Date: 2026-02-08
"""

import numpy as np
from typing import Dict, List, Tuple, Optional
from enum import IntEnum


class WASMOpcodeCategory(IntEnum):
    """WASM opcode categories for semantic analysis"""
    CONTROL_FLOW = 1
    ARITHMETIC = 2
    MEMORY = 3
    PARAMETRIC = 4
    VARIABLE = 5
    TABLE = 6
    GLOBAL = 7


class WASMCodeVisualizer:
    """
    Visualizes WASM bytecode with semantic coloring.

    Responsibilities:
    - Detect WASM files via magic number
    - Categorize opcodes by type
    - Apply entropy-based semantic coloring
    - Calculate opcode complexity scores

    Example:
        >>> visualizer = WASMCodeVisualizer()
        >>> is_wasm = visualizer.is_wasm(wasm_bytes)
        >>> rgba_pixels = visualizer.visualize(wasm_bytes)
    """

    # WASM magic number: \0asm
    WASM_MAGIC = b'\x00\x61\x73\x6d'

    # WASM version (current: 1)
    WASM_VERSION = b'\x01\x00\x00\x00'

    # Control flow opcodes (high entropy = complex branching)
    CONTROL_FLOW_OPCODES = {
        0x00: 'unreachable',
        0x01: 'nop',
        0x02: 'block',
        0x03: 'loop',
        0x04: 'if',
        0x05: 'else',
        0x0b: 'end',
        0x0c: 'br',
        0x0d: 'br_if',
        0x0e: 'br_table',
        0x0f: 'return',
        0x10: 'call',
        0x11: 'call_indirect',
    }

    # Arithmetic opcodes
    ARITHMETIC_OPCODES = {
        # i32
        0x45: 'i32.eqz',
        0x46: 'i32.eq',
        0x47: 'i32.ne',
        0x48: 'i32.lt_s',
        0x49: 'i32.lt_u',
        0x4a: 'i32.gt_s',
        0x4b: 'i32.gt_u',
        0x4c: 'i32.le_s',
        0x4d: 'i32.le_u',
        0x4e: 'i32.ge_s',
        0x4f: 'i32.ge_u',
        0x6a: 'i32.add',
        0x6b: 'i32.sub',
        0x6c: 'i32.mul',
        0x6d: 'i32.div_s',
        0x6e: 'i32.div_u',
        0x6f: 'i32.rem_s',
        0x70: 'i32.rem_u',
        0x71: 'i32.and',
        0x72: 'i32.or',
        0x73: 'i32.xor',
        0x74: 'i32.shl',
        0x75: 'i32.shr_s',
        0x76: 'i32.shr_u',
        0x77: 'i32.rotl',
        0x78: 'i32.rotr',
        # i64
        0x50: 'i64.eqz',
        0x51: 'i64.eq',
        0x52: 'i64.ne',
        0x53: 'i64.lt_s',
        0x54: 'i64.lt_u',
        0x55: 'i64.gt_s',
        0x56: 'i64.gt_u',
        0x57: 'i64.le_s',
        0x58: 'i64.le_u',
        0x59: 'i64.ge_s',
        0x5a: 'i64.ge_u',
        0x7c: 'i64.add',
        0x7d: 'i64.sub',
        0x7e: 'i64.mul',
        0x7f: 'i64.div_s',
        0x80: 'i64.div_u',
        0x81: 'i64.rem_s',
        0x82: 'i64.rem_u',
        0x83: 'i64.and',
        0x84: 'i64.or',
        0x85: 'i64.xor',
        0x86: 'i64.shl',
        0x87: 'i64.shr_s',
        0x88: 'i64.shr_u',
        0x89: 'i64.rotl',
        0x8a: 'i64.rotr',
        # f32
        0x5b: 'f32.eq',
        0x5c: 'f32.ne',
        0x5d: 'f32.lt',
        0x5e: 'f32.gt',
        0x5f: 'f32.le',
        0x60: 'f32.ge',
        0x92: 'f32.add',
        0x93: 'f32.sub',
        0x94: 'f32.mul',
        0x95: 'f32.div',
        0x96: 'f32.min',
        0x97: 'f32.max',
        # f64
        0x61: 'f64.eq',
        0x62: 'f64.ne',
        0x63: 'f64.lt',
        0x64: 'f64.gt',
        0x65: 'f64.le',
        0x66: 'f64.ge',
        0xa0: 'f64.add',
        0xa1: 'f64.sub',
        0xa2: 'f64.mul',
        0xa3: 'f64.div',
        0xa4: 'f64.min',
        0xa5: 'f64.max',
    }

    # Memory opcodes
    MEMORY_OPCODES = {
        0x20: 'local.get',
        0x21: 'local.set',
        0x22: 'local.tee',
        0x23: 'global.get',
        0x24: 'global.set',
        0x28: 'i32.load',
        0x29: 'i64.load',
        0x2a: 'f32.load',
        0x2b: 'f64.load',
        0x2c: 'i32.load8_s',
        0x2d: 'i32.load8_u',
        0x2e: 'i32.load16_s',
        0x2f: 'i32.load16_u',
        0x30: 'i64.load8_s',
        0x31: 'i64.load8_u',
        0x32: 'i64.load16_s',
        0x33: 'i64.load16_u',
        0x34: 'i64.load32_s',
        0x35: 'i64.load32_u',
        0x36: 'i32.store',
        0x37: 'i64.store',
        0x38: 'f32.store',
        0x39: 'f64.store',
        0x3a: 'i32.store8',
        0x3b: 'i32.store16',
        0x3c: 'i64.store8',
        0x3d: 'i64.store16',
        0x3e: 'i64.store32',
        0x3f: 'memory.size',
        0x40: 'memory.grow',
    }

    # Parametric opcodes
    PARAMETRIC_OPCODES = {
        0x0a: 'drop',
        0x1b: 'select',
        0x1c: 'select_t',
    }

    # Variable access opcodes
    VARIABLE_OPCODES = {
        0x20: 'local.get',
        0x21: 'local.set',
        0x22: 'local.tee',
        0x23: 'global.get',
        0x24: 'global.set',
    }

    # Constant opcodes
    CONSTANT_OPCODES = {
        0x41: 'i32.const',
        0x42: 'i64.const',
        0x43: 'f32.const',
        0x44: 'f64.const',
    }

    def __init__(self):
        """Initialize the WASM code visualizer"""
        self.entropy_cache = {}

    def is_wasm(self, data: bytes) -> bool:
        """
        Detect WASM magic number.

        Args:
            data: Binary data to check

        Returns:
            True if data starts with WASM magic number (\0asm)

        Example:
            >>> visualizer = WASMCodeVisualizer()
            >>> visualizer.is_wasm(b'\\x00asm...')
            True
        """
        if len(data) < 4:
            return False
        return data[:4] == self.WASM_MAGIC

    def get_opcode_category(self, opcode: int) -> Optional[WASMOpcodeCategory]:
        """
        Categorize an opcode by type.

        Args:
            opcode: Byte value of the opcode

        Returns:
            WASMOpcodeCategory or None if unknown
        """
        if opcode in self.CONTROL_FLOW_OPCODES:
            return WASMOpcodeCategory.CONTROL_FLOW
        elif opcode in self.ARITHMETIC_OPCODES:
            return WASMOpcodeCategory.ARITHMETIC
        elif opcode in self.MEMORY_OPCODES:
            return WASMOpcodeCategory.MEMORY
        elif opcode in self.PARAMETRIC_OPCODES:
            return WASMOpcodeCategory.PARAMETRIC
        elif opcode in self.VARIABLE_OPCODES:
            return WASMOpcodeCategory.VARIABLE
        elif opcode in self.CONSTANT_OPCODES:
            return WASMOpcodeCategory.GLOBAL
        else:
            return None

    def calculate_control_flow_entropy(self, data: bytes, window_size: int = 256) -> np.ndarray:
        """
        Calculate control flow entropy for visualization.

        Higher entropy = more complex branching patterns.

        Args:
            data: WASM bytecode
            window_size: Window size for entropy calculation

        Returns:
            Array of entropy values (0-255) per byte
        """
        data_array = np.frombuffer(data, dtype=np.uint8)
        entropy = np.zeros(len(data_array), dtype=np.uint8)

        # Scan for control flow opcodes
        for i in range(len(data_array)):
            opcode = data_array[i]

            # Control flow contributes to entropy
            if opcode in self.CONTROL_FLOW_OPCODES:
                # Different control flow opcodes have different weights
                if opcode == 0x00:  # unreachable - high entropy
                    entropy[i] = 255
                elif opcode in [0x02, 0x03, 0x04]:  # block, loop, if - medium-high
                    entropy[i] = 200
                elif opcode in [0x0c, 0x0d]:  # br, br_if - medium
                    entropy[i] = 150
                elif opcode == 0x0f:  # return - medium
                    entropy[i] = 150
                elif opcode == 0x10:  # call - low-medium
                    entropy[i] = 100
                elif opcode == 0x01:  # nop - zero entropy
                    entropy[i] = 0
                else:
                    entropy[i] = 100

            # Arithmetic operations contribute some entropy
            elif opcode in self.ARITHMETIC_OPCODES:
                entropy[i] = 80

            # Memory operations are lower entropy
            elif opcode in self.MEMORY_OPCODES:
                entropy[i] = 50

            # Constants are low entropy
            elif opcode in self.CONSTANT_OPCODES:
                entropy[i] = 30

        # Apply window smoothing only if window_size > 1
        # Note: window_size=1 means no smoothing (raw per-byte values)
        if window_size > 1:
            smoothed = np.zeros_like(entropy, dtype=np.float32)
            for i in range(len(entropy)):
                start = max(0, i - window_size // 2)
                end = min(len(entropy), i + window_size // 2 + 1)  # +1 for inclusive end
                # Average reduces the peak value for isolated opcodes
                smoothed[i] = np.mean(entropy[start:end])
            entropy = smoothed.astype(np.uint8)

        return entropy

    def _get_default_entropy(self, opcode: int) -> int:
        """
        Get default entropy value for an opcode.

        Args:
            opcode: The opcode byte

        Returns:
            Default entropy value (0-255)
        """
        # Control flow opcodes have high entropy
        if opcode == 0x00:  # unreachable - maximum entropy
            return 255
        elif opcode in [0x02, 0x03, 0x04]:  # block, loop, if - high entropy
            return 200
        elif opcode in [0x0c, 0x0d]:  # br, br_if - medium-high
            return 150
        elif opcode in [0x0f, 0x10]:  # return, call - medium
            return 150
        elif opcode == 0x01:  # nop - zero entropy
            return 0
        elif opcode in self.CONTROL_FLOW_OPCODES:
            return 100
        elif opcode in self.ARITHMETIC_OPCODES:
            return 80
        elif opcode in self.MEMORY_OPCODES:
            return 50
        elif opcode in self.CONSTANT_OPCODES:
            return 30
        else:
            return 0

    def color_opcode(self, opcode: int, operand1: int = 0, operand2: int = 0,
                    entropy: Optional[int] = None) -> Tuple[int, int, int, int]:
        """
        Apply semantic coloring to an opcode.

        Color Mapping:
        - Red: Control flow entropy (hot = complex, 0-255)
        - Green: Operand 1 value (0-255)
        - Blue: Operand 2 value / immediate (0-255)
        - Alpha: Execution mask (255 = executable, 0 = data/padding)

        Args:
            opcode: The opcode byte
            operand1: First operand value
            operand2: Second operand value or immediate
            entropy: Control flow entropy value (0-255), or None to use default

        Returns:
            Tuple of (R, G, B, A) values

        Example:
            >>> visualizer = WASMCodeVisualizer()
            >>> rgba = visualizer.color_opcode(0x02, operand1=64, operand2=0, entropy=200)
            >>> rgba
            (200, 64, 0, 255)
        """
        # Use default entropy if not provided
        if entropy is None:
            entropy = self._get_default_entropy(opcode)

        # Red: Control flow entropy (hot = high complexity)
        red = min(255, max(0, entropy))

        # Green: Operand 1 value (clamped to 0-255)
        green = operand1 & 0xFF

        # Blue: Operand 2 value / immediate (clamped to 0-255)
        blue = operand2 & 0xFF

        # Alpha: Execution mask
        # 255 if this is a known executable opcode
        # 0 if this is data/padding
        if opcode in self.CONTROL_FLOW_OPCODES or \
           opcode in self.ARITHMETIC_OPCODES or \
           opcode in self.MEMORY_OPCODES or \
           opcode in self.PARAMETRIC_OPCODES or \
           opcode in self.VARIABLE_OPCODES or \
           opcode in self.CONSTANT_OPCODES:
            alpha = 255  # Executable code
        else:
            alpha = 0    # Data/padding

        return (red, green, blue, alpha)

    def visualize(self, data: bytes) -> np.ndarray:
        """
        Visualize WASM bytecode with semantic coloring.

        Encoding format (for code-mode):
        - Red: Entropy value (0-255, ignored for decoding)
        - Green: Byte at even position (0, 2, 4, ...)
        - Blue: Byte at odd position (1, 3, 5, ...)
        - Alpha: 255 if executable, 0 if padding

        Each pixel encodes 2 bytes of WASM data in the G and B channels.
        The R channel stores entropy for visualization purposes.
        The A channel indicates whether the pixel represents executable code.

        Args:
            data: WASM bytecode

        Returns:
            RGBA pixel array as numpy array (N, 4)

        Example:
            >>> visualizer = WASMCodeVisualizer()
            >>> rgba_pixels = visualizer.visualize(wasm_bytes)
        """
        if not self.is_wasm(data):
            raise ValueError("Input is not a valid WASM file (missing magic number)")

        # Calculate entropy for visualization
        entropy = self.calculate_control_flow_entropy(data)

        # Pad data to multiple of 2 (since each pixel holds 2 bytes)
        padding_needed = (2 - len(data) % 2) % 2
        if padding_needed:
            data = data + b'\x00' * padding_needed
            entropy = np.pad(entropy, (0, padding_needed), 'constant')

        data_array = np.frombuffer(data, dtype=np.uint8)
        total_bytes = len(data_array)
        total_pixels = (total_bytes + 1) // 2  # Each pixel holds 2 bytes

        rgba_pixels = np.zeros((total_pixels, 4), dtype=np.uint8)

        # Process each 2-byte pair as a pixel
        for i in range(total_pixels):
            byte_idx = i * 2

            # Get the two bytes for this pixel
            byte0 = data_array[byte_idx]
            byte1 = data_array[byte_idx + 1] if byte_idx + 1 < total_bytes else 0

            # R = entropy of first byte (for visualization)
            rgba_pixels[i, 0] = entropy[byte_idx]

            # G = byte at even position
            rgba_pixels[i, 1] = byte0

            # B = byte at odd position
            rgba_pixels[i, 2] = byte1

            # A = 255 if executable opcode, 0 if padding
            if byte0 in self.CONTROL_FLOW_OPCODES or \
               byte0 in self.ARITHMETIC_OPCODES or \
               byte0 in self.MEMORY_OPCODES or \
               byte0 in self.PARAMETRIC_OPCODES or \
               byte0 in self.VARIABLE_OPCODES or \
               byte0 in self.CONSTANT_OPCODES:
                rgba_pixels[i, 3] = 255  # Executable
            else:
                rgba_pixels[i, 3] = 0    # Data/padding

        return rgba_pixels

    def decode_rgba(self, rgba_pixels: np.ndarray, expected_size: int) -> bytes:
        """
        Decode RGBA pixels back to original WASM bytes.

        This is the inverse of visualize() - it recovers WASM bytecode
        from semantic RGBA coloring.

        Encoding format (from visualize()):
        - Red: Entropy (ignored for decoding)
        - Green: Byte at even position (0, 2, 4, ...)
        - Blue: Byte at odd position (1, 3, 5, ...)
        - Alpha: 255 if executable, 0 if padding

        Args:
            rgba_pixels: RGBA pixel array as numpy array (N, 4) or (H, W, 4)
            expected_size: Expected size of decoded WASM data in bytes

        Returns:
            Decoded WASM bytecode

        Raises:
            ValueError: If decoded data is not valid WASM (missing magic number)

        Example:
            >>> visualizer = WASMCodeVisualizer()
            >>> rgba = visualizer.visualize(wasm_bytes)
            >>> decoded = visualizer.decode_rgba(rgba, len(wasm_bytes))
            >>> decoded == wasm_bytes
            True
        """
        if not isinstance(rgba_pixels, np.ndarray):
            raise ValueError("rgba_pixels must be a numpy array")

        # Handle both 1D (N, 4) and 2D (H, W, 4) arrays
        if len(rgba_pixels.shape) == 3 and rgba_pixels.shape[2] == 4:
            # 2D grid array (H, W, 4) - flatten to (H*W, 4)
            rgba_pixels = rgba_pixels.reshape(-1, 4)
        elif len(rgba_pixels.shape) != 2 or rgba_pixels.shape[1] != 4:
            raise ValueError("rgba_pixels must have shape (N, 4) or (H, W, 4)")

        # Check for empty array
        if rgba_pixels.shape[0] == 0:
            raise ValueError("Decoded data is not valid WASM (empty input)")

        decoded_bytes = bytearray()

        # Iterate through RGBA pixels and extract bytes from G and B channels
        for pixel in rgba_pixels:
            r, g, b, a = pixel

            # Extract bytes from G (even position) and B (odd position) channels
            decoded_bytes.append(g)  # byte at even position
            decoded_bytes.append(b)  # byte at odd position

        # Trim to expected size
        decoded_bytes = decoded_bytes[:expected_size]

        # Verify WASM magic number
        if len(decoded_bytes) >= 4 and decoded_bytes[:4] != self.WASM_MAGIC:
            raise ValueError(
                f"Decoded data is not valid WASM (missing magic number {self.WASM_MAGIC!r}, "
                f"got {bytes(decoded_bytes[:4])!r})"
            )

        return bytes(decoded_bytes)

    def get_opcode_name(self, opcode: int) -> Optional[str]:
        """
        Get the mnemonic name for an opcode.

        Args:
            opcode: Byte value of the opcode

        Returns:
            Mnemonic name or None if unknown
        """
        if opcode in self.CONTROL_FLOW_OPCODES:
            return self.CONTROL_FLOW_OPCODES[opcode]
        elif opcode in self.ARITHMETIC_OPCODES:
            return self.ARITHMETIC_OPCODES[opcode]
        elif opcode in self.MEMORY_OPCODES:
            return self.MEMORY_OPCODES[opcode]
        elif opcode in self.PARAMETRIC_OPCODES:
            return self.PARAMETRIC_OPCODES[opcode]
        elif opcode in self.CONSTANT_OPCODES:
            return self.CONSTANT_OPCODES[opcode]
        else:
            return None

    def analyze_complexity(self, data: bytes) -> Dict[str, float]:
        """
        Analyze the complexity of WASM bytecode.

        Args:
            data: WASM bytecode

        Returns:
            Dictionary with complexity metrics
        """
        if not self.is_wasm(data):
            raise ValueError("Input is not a valid WASM file")

        data_array = np.frombuffer(data, dtype=np.uint8)

        # Count opcodes by category
        control_flow_count = 0
        arithmetic_count = 0
        memory_count = 0
        unknown_count = 0

        for byte in data_array[8:]:  # Skip 8-byte header
            cat = self.get_opcode_category(byte)
            if cat == WASMOpcodeCategory.CONTROL_FLOW:
                control_flow_count += 1
            elif cat == WASMOpcodeCategory.ARITHMETIC:
                arithmetic_count += 1
            elif cat == WASMOpcodeCategory.MEMORY:
                memory_count += 1
            else:
                unknown_count += 1

        total_opcodes = control_flow_count + arithmetic_count + memory_count + unknown_count

        # Calculate complexity score (0-100)
        # More control flow = higher complexity
        if total_opcodes > 0:
            control_flow_ratio = control_flow_count / total_opcodes
            complexity = min(100, control_flow_ratio * 200)  # Scale up for visibility
        else:
            complexity = 0

        return {
            'complexity_score': complexity,
            'control_flow_count': control_flow_count,
            'arithmetic_count': arithmetic_count,
            'memory_count': memory_count,
            'unknown_count': unknown_count,
            'total_opcodes': total_opcodes,
        }


# Utility functions

def create_test_wasm() -> bytes:
    """
    Create a minimal valid WASM file for testing.

    Returns:
        Minimal WASM bytecode with a simple function
    """
    # WASM header + version
    header = b'\x00\x61\x73\x6d\x01\x00\x00\x00'

    # Type section (empty)
    type_section = b'\x01\x04\x01\x60\x00\x00'

    # Function section (1 function)
    func_section = b'\x03\x02\x01\x00'

    # Export section (export "main")
    export_section = b'\x07\x0b\x01\x04main\x00\x00'

    # Code section (simple function: end)
    code_section = b'\x0a\x06\x01\x04\x00\x0b\x0b'

    wasm = header + type_section + func_section + export_section + code_section
    return wasm


def visualize_wasm_file(input_path: str, output_path: str) -> None:
    """
    Visualize a WASM file to PNG.

    Args:
        input_path: Path to input WASM file
        output_path: Path to output PNG file
    """
    from PIL import Image

    visualizer = WASMCodeVisualizer()

    with open(input_path, 'rb') as f:
        wasm_data = f.read()

    if not visualizer.is_wasm(wasm_data):
        print(f"Error: {input_path} is not a valid WASM file")
        return

    # Analyze complexity
    complexity = visualizer.analyze_complexity(wasm_data)
    print(f"WASM Analysis:")
    print(f"  Complexity Score: {complexity['complexity_score']:.1f}/100")
    print(f"  Control Flow: {complexity['control_flow_count']}")
    print(f"  Arithmetic: {complexity['arithmetic_count']}")
    print(f"  Memory: {complexity['memory_count']}")

    # Visualize
    rgba_pixels = visualizer.visualize(wasm_data)

    # Calculate grid size (power of 2)
    import math
    total_pixels = len(rgba_pixels)
    order = math.ceil(math.log2(math.sqrt(total_pixels)))
    grid_size = 2 ** order

    # Create image
    img_array = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)

    # Map pixels to grid
    for i in range(min(total_pixels, grid_size * grid_size)):
        y = i // grid_size
        x = i % grid_size
        img_array[y, x] = rgba_pixels[i]

    # Save PNG
    img = Image.fromarray(img_array, mode='RGBA')
    img.save(output_path)
    print(f"Saved visualization to {output_path}")


if __name__ == "__main__":
    import sys

    if len(sys.argv) < 3:
        print("Usage: python3 pixelrts_v2_wasm.py <input.wasm> <output.png>")
        print("\nExample:")
        print("  python3 pixelrts_v2_wasm.py hello_world.wasm hello_world.png")
        sys.exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2]

    visualize_wasm_file(input_path, output_path)
