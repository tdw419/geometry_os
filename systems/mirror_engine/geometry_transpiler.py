#!/usr/bin/env python3
"""
Geometry Transpiler - Converts code to Geometry Standard tokens

Treats the frame buffer as executable space where:
- Code is stored as Spatial Tokens (0x80-0x8F)
- GPU reads and executes tokens directly
- Visual debugging - bugs show as corrupt pixels
- Self-modifying code - AI can rewrite tokens

Usage:
    transpiler = GeometryTranspiler()
    blob = transpiler.compile('''
        while True:
            draw_rect(10, 10, 100, 100, '#FF0000')
            sleep(60)
            draw_rect(10, 10, 100, 100, '#000000')
    ''')
    # blob = [0x84, 0x0A, 0x0A, 0x64, 0x64, 0xFF, 0x00, 0x00, 0xFF, 0x8E, 0x3C, ...]
"""

import re
from dataclasses import dataclass
from typing import List, Tuple, Optional, Union
from enum import IntEnum


class GeometryToken(IntEnum):
    """Geometry Standard Spatial Tokens"""
    # Core tokens
    MOVE = 0x80
    ZOOM = 0x81
    LINK = 0x82
    THREAD = 0x83
    RECT = 0x84
    CIRC = 0x85
    TEXT = 0x86
    SPRITE = 0x87
    LAYER = 0x88
    COLOR = 0x89
    ALPHA = 0x8A
    AGENT = 0x8B
    EMIT = 0x8C
    LISTEN = 0x8D
    FREEZE = 0x8E
    THAW = 0x8F
    
    # Extended tokens (0x90+)
    LOOP = 0x90
    ENDLOOP = 0x91
    IF = 0x92
    ENDIF = 0x93
    CALL = 0x94
    RETURN = 0x95
    WAIT = 0x96
    GOTO = 0x97


@dataclass
class Instruction:
    """A single Geometry instruction"""
    token: int
    params: List[Union[int, float, str]]
    
    def to_bytes(self) -> bytes:
        """Convert instruction to binary blob"""
        result = bytes([self.token])
        
        for param in self.params:
            if isinstance(param, int):
                # 4-byte integer
                result += param.to_bytes(4, 'little')
            elif isinstance(param, float):
                # 4-byte float
                import struct
                result += struct.pack('<f', param)
            elif isinstance(param, str):
                # Length-prefixed string
                encoded = param.encode('utf-8')
                result += len(encoded).to_bytes(2, 'little')
                result += encoded
        
        return result
    
    def to_hex_string(self) -> str:
        """Convert to hex string for display"""
        return self.to_bytes().hex()


class GeometryTranspiler:
    """
    Transpiles Python-like code to Geometry Standard tokens.
    
    Supported constructs:
    - draw_rect(x, y, w, h, color) → RECT
    - draw_circle(x, y, r, color) → CIRC
    - draw_text(x, y, text, color) → TEXT
    - move_to(x, y) → MOVE
    - sleep(frames) → WAIT
    - set_color(hex) → COLOR
    - set_alpha(value) → ALPHA
    - set_layer(z) → LAYER
    - while True: → LOOP
    - freeze() → FREEZE
    - thaw() → THAW
    """
    
    def __init__(self):
        self.instructions: List[Instruction] = []
        self.current_color = '#FFFFFF'
        self.current_alpha = 1.0
        self.current_layer = 0
    
    def compile(self, code: str) -> bytes:
        """
        Compile code string to Geometry binary blob.
        
        Args:
            code: Python-like code
            
        Returns:
            Binary blob of Geometry tokens
        """
        self.instructions = []
        lines = code.strip().split('\n')
        
        for line in lines:
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            
            self._parse_line(line)
        
        # Combine all instructions
        blob = b''.join(inst.to_bytes() for inst in self.instructions)
        return blob
    
    def compile_to_hex(self, code: str) -> str:
        """Compile and return as hex string"""
        return self.compile(code).hex()
    
    def compile_to_tokens(self, code: str) -> List[int]:
        """Compile and return as token list"""
        blob = self.compile(code)
        return list(blob)
    
    def _parse_line(self, line: str):
        """Parse a single line of code"""
        
        # draw_rect(x, y, w, h, color)
        match = re.match(r'draw_rect\s*\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*(?:,\s*["\'](#?[0-9A-Fa-f]+)["\']\s*)?\)', line)
        if match:
            x, y, w, h = int(match.group(1)), int(match.group(2)), int(match.group(3)), int(match.group(4))
            color = match.group(5) or self.current_color
            self._emit_rect(x, y, w, h, color)
            return
        
        # draw_circle(x, y, r, color)
        match = re.match(r'draw_circle\s*\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*(?:,\s*["\'](#?[0-9A-Fa-f]+)["\']\s*)?\)', line)
        if match:
            x, y, r = int(match.group(1)), int(match.group(2)), int(match.group(3))
            color = match.group(4) or self.current_color
            self._emit_circle(x, y, r, color)
            return
        
        # draw_text(x, y, text, color)
        match = re.match(r'draw_text\s*\(\s*(\d+)\s*,\s*(\d+)\s*,\s*["\'](.+?)["\']\s*(?:,\s*["\'](#?[0-9A-Fa-f]+)["\']\s*)?\)', line)
        if match:
            x, y = int(match.group(1)), int(match.group(2))
            text = match.group(3)
            color = match.group(4) or self.current_color
            self._emit_text(x, y, text, color)
            return
        
        # move_to(x, y)
        match = re.match(r'move_to\s*\(\s*(\d+)\s*,\s*(\d+)\s*\)', line)
        if match:
            x, y = int(match.group(1)), int(match.group(2))
            self._emit_move(x, y)
            return
        
        # sleep(frames) or wait(frames)
        match = re.match(r'(?:sleep|wait)\s*\(\s*(\d+)\s*\)', line)
        if match:
            frames = int(match.group(1))
            self._emit_wait(frames)
            return
        
        # set_color(hex)
        match = re.match(r'set_color\s*\(\s*["\'](#?[0-9A-Fa-f]+)["\']\s*\)', line)
        if match:
            color = match.group(1)
            self._emit_color(color)
            return
        
        # set_alpha(value)
        match = re.match(r'set_alpha\s*\(\s*([0-9.]+)\s*\)', line)
        if match:
            alpha = float(match.group(1))
            self._emit_alpha(alpha)
            return
        
        # set_layer(z)
        match = re.match(r'set_layer\s*\(\s*(\d+)\s*\)', line)
        if match:
            z = int(match.group(1))
            self._emit_layer(z)
            return
        
        # while True:
        if line.startswith('while True:') or line == 'while True:':
            self._emit_loop_start()
            return
        
        # freeze()
        if line == 'freeze()':
            self._emit_freeze()
            return
        
        # thaw()
        if line == 'thaw()':
            self._emit_thaw()
            return
    
    def _emit_rect(self, x: int, y: int, w: int, h: int, color: str):
        """Emit RECT instruction"""
        r, g, b, a = self._parse_color(color)
        self.instructions.append(Instruction(
            token=GeometryToken.RECT,
            params=[x, y, w, h, r, g, b, a]
        ))
    
    def _emit_circle(self, x: int, y: int, r: int, color: str):
        """Emit CIRC instruction"""
        r_col, g, b, a = self._parse_color(color)
        self.instructions.append(Instruction(
            token=GeometryToken.CIRC,
            params=[x, y, r, r_col, g, b, a]
        ))
    
    def _emit_text(self, x: int, y: int, text: str, color: str):
        """Emit TEXT instruction"""
        r, g, b, a = self._parse_color(color)
        self.instructions.append(Instruction(
            token=GeometryToken.TEXT,
            params=[x, y, text, r, g, b, a]
        ))
    
    def _emit_move(self, x: int, y: int):
        """Emit MOVE instruction"""
        self.instructions.append(Instruction(
            token=GeometryToken.MOVE,
            params=[x, y]
        ))
    
    def _emit_wait(self, frames: int):
        """Emit WAIT instruction"""
        self.instructions.append(Instruction(
            token=GeometryToken.WAIT,
            params=[frames]
        ))
    
    def _emit_color(self, color: str):
        """Emit COLOR instruction"""
        r, g, b, a = self._parse_color(color)
        self.current_color = color
        self.instructions.append(Instruction(
            token=GeometryToken.COLOR,
            params=[r, g, b, a]
        ))
    
    def _emit_alpha(self, alpha: float):
        """Emit ALPHA instruction"""
        self.current_alpha = alpha
        self.instructions.append(Instruction(
            token=GeometryToken.ALPHA,
            params=[int(alpha * 255)]
        ))
    
    def _emit_layer(self, z: int):
        """Emit LAYER instruction"""
        self.current_layer = z
        self.instructions.append(Instruction(
            token=GeometryToken.LAYER,
            params=[z]
        ))
    
    def _emit_loop_start(self):
        """Emit LOOP instruction"""
        self.instructions.append(Instruction(
            token=GeometryToken.LOOP,
            params=[]
        ))
    
    def _emit_loop_end(self):
        """Emit ENDLOOP instruction"""
        self.instructions.append(Instruction(
            token=GeometryToken.ENDLOOP,
            params=[]
        ))
    
    def _emit_freeze(self):
        """Emit FREEZE instruction"""
        self.instructions.append(Instruction(
            token=GeometryToken.FREEZE,
            params=[]
        ))
    
    def _emit_thaw(self):
        """Emit THAW instruction"""
        self.instructions.append(Instruction(
            token=GeometryToken.THAw,
            params=[]
        ))
    
    def _parse_color(self, color: str) -> Tuple[int, int, int, int]:
        """Parse hex color to RGBA"""
        color = color.lstrip('#')
        if len(color) == 6:
            color += 'FF'
        elif len(color) == 8:
            pass
        else:
            color = 'FFFFFF' + 'FF'
        
        r = int(color[0:2], 16)
        g = int(color[2:4], 16)
        b = int(color[4:6], 16)
        a = int(color[6:8], 16) if len(color) >= 8 else 255
        
        return (r, g, b, a)


# Example usage
if __name__ == "__main__":
    transpiler = GeometryTranspiler()
    
    # Example 1: Blinking alert
    code1 = '''
        while True:
            draw_rect(10, 10, 100, 100, '#FF0000')
            sleep(60)
            draw_rect(10, 10, 100, 100, '#000000')
            sleep(60)
    '''
    
    blob1 = transpiler.compile(code1)
    print("Blinking Alert:")
    print(f"  Hex: {blob1.hex()}")
    print(f"  Tokens: {list(blob1)}")
    print()
    
    # Example 2: Moving circle
    code2 = '''
        set_color('#00FF00')
        draw_circle(50, 50, 20)
        move_to(100, 100)
        draw_circle(100, 100, 20)
    '''
    
    blob2 = transpiler.compile(code2)
    print("Moving Circle:")
    print(f"  Hex: {blob2.hex()}")
    print(f"  Tokens: {list(blob2)}")
    print()
    
    # Example 3: Layered text
    code3 = '''
        set_layer(0)
        set_color('#FF0000')
        draw_rect(0, 0, 200, 100)
        set_layer(100)
        set_color('#FFFFFF')
        draw_text(10, 20, 'Hello Geometry OS')
    '''
    
    blob3 = transpiler.compile(code3)
    print("Layered Text:")
    print(f"  Hex: {blob3.hex()}")
    print(f"  Tokens: {list(blob3)}")
