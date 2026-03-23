#!/usr/bin/env python3
"""
Hex-Logic Runner - Shader-less execution of Geometry Standard

The frame buffer IS the instruction tape. No GPU shaders needed.
The "Read Head" moves through hex values sequentially.

Execution Model:
- Frame Buffer = Linear Instruction Tape
- Read Head = pointer that reads tokens
- 0x84 → next 4 bytes are RECT params → blit to memory
- 0x8E → FREEZE → stop execution immediately
- Visual debugging: crash = Read Head stops at specific hex

Why shader-less:
- Deterministic (no race conditions)
- Transparent (no hidden compiled code)
- AI-aligned (only understands 0x80-0x8F)
"""

from dataclasses import dataclass
from typing import List, Optional, Callable
from enum import IntEnum


class GeometryToken(IntEnum):
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
    # Self-Assembly tokens (0x90-0x93)
    READ_SELF = 0x90   # Read own bytecode at offset
    WRITE_SELF = 0x91  # Modify own bytecode at offset
    MUTATE = 0x92      # Transform byte (increment/decrement/flip)
    REPLICATE = 0x93   # Copy self to new coordinates


@dataclass
class ExecutionState:
    """State of the hex-logic runner"""
    cursor: int = 0
    running: bool = True
    current_layer: int = 0
    current_color: int = 0xFFFFFF
    current_alpha: int = 255
    listen_radius: int = 0
    error: Optional[str] = None


class HexLogicRunner:
    """
    Executes Geometry Standard tokens directly from buffer.
    No shaders - pure sequential hex processing.
    """
    
    def __init__(self, buffer: bytearray, width: int, height: int):
        self.buffer = buffer
        self.width = width
        self.height = height
        self.state = ExecutionState()
        self.blit_callbacks: List[Callable] = []
    
    def execute(self, start: int = 0, max_instructions: int = 10000) -> ExecutionState:
        """
        Execute buffer logic starting at position.
        
        Args:
            start: Starting position in buffer
            max_instructions: Safety limit to prevent infinite loops
            
        Returns:
            Final execution state
        """
        self.state = ExecutionState(cursor=start)
        instruction_count = 0
        
        while self.state.running and instruction_count < max_instructions:
            if self.state.cursor >= len(self.buffer):
                break
            
            token = self.buffer[self.state.cursor]
            
            try:
                self._execute_token(token)
            except Exception as e:
                self.state.running = False
                self.state.error = f"Error at cursor {self.state.cursor}: {e}"
                break
            
            instruction_count += 1
        
        return self.state
    
    def _execute_token(self, token: int):
        """Execute a single token"""
        
        # 0x80 = MOVE
        if token == GeometryToken.MOVE:
            x, y = self._read_int16(1), self._read_int16(3)
            self.state.cursor += 5
            self._on_move(x, y)
        
        # 0x84 = RECT
        elif token == GeometryToken.RECT:
            x = self._read_int16(1)
            y = self._read_int16(3)
            w = self._read_int16(5)
            h = self._read_int16(7)
            color = self._read_int32(9)
            self.state.cursor += 13
            self._blit_rect(x, y, w, h, color)
        
        # 0x85 = CIRC
        elif token == GeometryToken.CIRC:
            x = self._read_int16(1)
            y = self._read_int16(3)
            r = self.buffer[5]
            color = self._read_int32(6)
            self.state.cursor += 10
            self._blit_circle(x, y, r, color)
        
        # 0x86 = TEXT
        elif token == GeometryToken.TEXT:
            x = self._read_int16(1)
            y = self._read_int16(3)
            length = self.buffer[5]
            text = self.buffer[6:6+length].decode('utf-8', errors='replace')
            color = self._read_int32(6 + length)
            self.state.cursor += 10 + length
            self._blit_text(x, y, text, color)
        
        # 0x88 = LAYER
        elif token == GeometryToken.LAYER:
            self.state.current_layer = self.buffer[1]
            self.state.cursor += 2
        
        # 0x89 = COLOR
        elif token == GeometryToken.COLOR:
            self.state.current_color = self._read_int32(1)
            self.state.cursor += 5
        
        # 0x8A = ALPHA
        elif token == GeometryToken.ALPHA:
            self.state.current_alpha = self.buffer[1]
            self.state.cursor += 2
        
        # 0x8D = LISTEN
        elif token == GeometryToken.LISTEN:
            self.state.listen_radius = self.buffer[1]
            self.state.cursor += 2
            self._on_listen(self.state.listen_radius)
        
        # 0x8E = FREEZE - Stop execution immediately
        elif token == GeometryToken.FREEZE:
            self.state.running = False
            self._on_freeze()
        
        # 0x8F = THAW
        elif token == GeometryToken.THAW:
            self.state.running = True
            self.state.cursor += 1
            self._on_thaw()

        # 0x90 = READ_SELF - Read own bytecode at offset
        elif token == GeometryToken.READ_SELF:
            offset = self._read_int16(1)
            length = self.buffer[self.state.cursor + 3] if self.state.cursor + 3 < len(self.buffer) else 1
            result = self.buffer[self.state.cursor + 4:self.state.cursor + 4 + length]
            self.state.cursor += 4 + length
            self._on_read_self(offset, length, result)

        # 0x91 = WRITE_SELF - Modify own bytecode
        elif token == GeometryToken.WRITE_SELF:
            offset = self._read_int16(1)
            new_byte = self.buffer[self.state.cursor + 3]
            if 0 <= offset < len(self.buffer):
                self.buffer[self.state.start_pos + offset] = new_byte
            self.state.cursor += 4
            self._on_write_self(offset, new_byte)

        # 0x92 = MUTATE - Transform byte
        elif token == GeometryToken.MUTATE:
            offset = self._read_int16(1)
            mutate_type = self.buffer[self.state.cursor + 3]  # 0=inc, 1=dec, 2=flip, 3=random
            if 0 <= offset < len(self.buffer):
                current = self.buffer[self.state.start_pos + offset]
                if mutate_type == 0:
                    self.buffer[self.state.start_pos + offset] = (current + 1) & 0xFF
                elif mutate_type == 1:
                    self.buffer[self.state.start_pos + offset] = (current - 1) & 0xFF
                elif mutate_type == 2:
                    self.buffer[self.state.start_pos + offset] = ~current & 0xFF
                elif mutate_type == 3:
                    self.buffer[self.state.start_pos + offset] = (current ^ 0b10101010) & 0xFF
            self.state.cursor += 4
            self._on_mutate(offset, mutate_type)

        # 0x93 = REPLICATE - Copy self to new location
        elif token == GeometryToken.REPLICATE:
            dest_x = self._read_int16(1)
            dest_y = self._read_int16(3)
            # Copy entire app from start position to new location
            # (Implementation copies from cursor-params.end to destination)
            self.state.cursor += 5
            self._on_replicate(dest_x, dest_y)

        # Unknown token - skip
        else:
            self.state.cursor += 1
    
    def _read_int16(self, offset: int) -> int:
        """Read 16-bit integer from buffer at cursor + offset"""
        pos = self.state.cursor + offset
        if pos + 1 >= len(self.buffer):
            return 0
        return int.from_bytes(self.buffer[pos:pos+2], 'little', signed=True)
    
    def _read_int32(self, offset: int) -> int:
        """Read 32-bit integer from buffer at cursor + offset"""
        pos = self.state.cursor + offset
        if pos + 3 >= len(self.buffer):
            return 0
        return int.from_bytes(self.buffer[pos:pos+4], 'little')
    
    def _blit_rect(self, x: int, y: int, w: int, h: int, color: int):
        """Blit rectangle directly to buffer memory"""
        r = (color >> 16) & 0xFF
        g = (color >> 8) & 0xFF
        b = color & 0xFF
        a = self.state.current_alpha
        
        for dy in range(h):
            for dx in range(w):
                px = x + dx
                py = y + dy
                if 0 <= px < self.width and 0 <= py < self.height:
                    pos = (py * self.width + px) * 4
                    if pos + 3 < len(self.buffer):
                        self.buffer[pos] = r
                        self.buffer[pos + 1] = g
                        self.buffer[pos + 2] = b
                        self.buffer[pos + 3] = a
        
        for callback in self.blit_callbacks:
            callback('rect', x, y, w, h, color)
    
    def _blit_circle(self, cx: int, cy: int, r: int, color: int):
        """Blit circle directly to buffer memory"""
        for dy in range(-r, r + 1):
            for dx in range(-r, r + 1):
                if dx * dx + dy * dy <= r * r:
                    px = cx + dx
                    py = cy + dy
                    if 0 <= px < self.width and 0 <= py < self.height:
                        pos = (py * self.width + px) * 4
                        if pos + 3 < len(self.buffer):
                            self.buffer[pos] = (color >> 16) & 0xFF
                            self.buffer[pos + 1] = (color >> 8) & 0xFF
                            self.buffer[pos + 2] = color & 0xFF
                            self.buffer[pos + 3] = self.state.current_alpha
        
        for callback in self.blit_callbacks:
            callback('circle', cx, cy, r, color)
    
    def _blit_text(self, x: int, y: int, text: str, color: int):
        """Blit text using 8x8 bitmap font"""
        # Simplified - just call callbacks
        for callback in self.blit_callbacks:
            callback('text', x, y, text, color)
    
    def _on_move(self, x: int, y: int):
        """Called when MOVE token executes"""
        for callback in self.blit_callbacks:
            callback('move', x, y)
    
    def _on_listen(self, radius: int):
        """Called when LISTEN token executes"""
        for callback in self.blit_callbacks:
            callback('listen', radius)
    
    def _on_freeze(self):
        """Called when FREEZE token stops execution"""
        for callback in self.blit_callbacks:
            callback('freeze')
    
    def _on_thaw(self):
        """Called when THAW token resumes execution"""
        for callback in self.blit_callbacks:
            callback('thaw')
    
    def add_callback(self, callback: Callable):
        """Add callback for blit events"""
        self.blit_callbacks.append(callback)


def transpile_security_to_hex() -> bytes:
    """
    Transpile security.py logic into pure hex instruction stream.
    This is the "Self-Executing" security kernel.
    """
    instructions = bytearray()
    
    # Security Patrol Agent Logic in Hex:
    
    # 1. LISTEN for encroachment (radius 50)
    instructions.append(GeometryToken.LISTEN)
    instructions.append(50)
    
    # 2. IF violation detected, COLOR red
    instructions.append(GeometryToken.COLOR)
    instructions.extend((0xFF0000).to_bytes(4, 'little'))  # Red
    
    # 3. FREEZE the violating agent
    instructions.append(GeometryToken.FREEZE)
    
    # 4. Otherwise, COLOR green
    instructions.append(GeometryToken.COLOR)
    instructions.extend((0x00FF00).to_bytes(4, 'little'))  # Green
    
    # 5. Continue patrol
    instructions.append(GeometryToken.MOVE)
    instructions.extend((100).to_bytes(2, 'little'))  # x
    instructions.extend((100).to_bytes(2, 'little'))  # y
    
    return bytes(instructions)


# Example usage
if __name__ == "__main__":
    # Create buffer (1920x1080 RGBA)
    width, height = 1920, 1080
    buffer = bytearray(width * height * 4)
    
    # Inject Geometry Standard code into buffer
    # This is "executable" hex at position 0
    code = bytearray([
        GeometryToken.COLOR, 0x00, 0xFF, 0x00, 0xFF,  # Green
        GeometryToken.RECT, 
        0x64, 0x00,  # x = 100
        0x64, 0x00,  # y = 100
        0x80, 0x00,  # w = 128
        0x80, 0x00,  # h = 128
        0xFF, 0x00, 0x00, 0xFF,  # Red color
        GeometryToken.FREEZE,  # Stop execution
    ])
    
    # Copy code to start of buffer
    buffer[:len(code)] = code
    
    # Create runner
    runner = HexLogicRunner(buffer, width, height)
    
    # Add callback to see what's happening
    def on_blit(event, *args):
        print(f"[BLIT] {event}: {args}")
    
    runner.add_callback(on_blit)
    
    # Execute!
    print("Executing hex-logic...")
    state = runner.execute(start=0)
    
    print(f"\nExecution complete:")
    print(f"  Cursor: {state.cursor}")
    print(f"  Running: {state.running}")
    print(f"  Error: {state.error}")
    print(f"  Final color: #{state.current_color:06X}")
    
    # Generate security kernel hex
    print("\n\nSecurity Kernel Hex:")
    security_hex = transpile_security_to_hex()
    print(f"  {security_hex.hex()}")
    print(f"  Tokens: {list(security_hex)}")
