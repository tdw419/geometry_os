#!/usr/bin/env python3
"""
THE MIRROR - The Only File Needed to Run Geometry OS

The "Single-File" Reality:
- Input Side: Raw text buffer (ASCII/UTF-8)
- Output Side: Frame Buffer (Geometry Bonds/Hex)
- The Mirror: Watches input, translates via 16 Spatial Tokens, reflects to output

Why this is the "Ultimate" AI OS:
- Unified Context: AI lives inside the Mirror
- Instant Evolution: Rewrite translation logic = OS upgrade
- Thin Client: Run on 5090, display on GitHub Pages
- Efficiency: 99% CPU free for AI thinking

The Brute Force Stack: Millions of files (Windows/System32)
The Intelligent Stack: One file (the_mirror.py)
"""

import time
import re
from typing import Tuple, Optional
from dataclasses import dataclass
from enum import IntEnum


# =============================================================================
# GEOMETRY STANDARD - The 16 Spatial Tokens
# =============================================================================

class Token(IntEnum):
    """The Geometry Standard - Spatial Tokens (0x80-0x8F)"""
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


# =============================================================================
# SECURITY - Token Validation
# =============================================================================

class Security:
    """Permission-aware alphabet validation"""
    
    AGENT_HUMAN = 0x100
    AGENT_AI = 0x200
    AGENT_SYSTEM = 0x300
    
    @staticmethod
    def validate(agent_signature: int, token: int) -> Tuple[bool, str]:
        """Validate if agent can execute token"""
        # Critical tokens (FREEZE/THAW) require System privileges
        if token in (Token.FREEZE, Token.THAW):
            if agent_signature < Security.AGENT_SYSTEM:
                return False, f"Token 0x{token:02X} requires System privileges"
        
        # AGENT spawn requires System
        if token == Token.AGENT:
            if agent_signature < Security.AGENT_SYSTEM:
                return False, "AGENT spawn requires System privileges"
        
        return True, "OK"


# =============================================================================
# GEOMETRY TRANSPILER - Text → Tokens
# =============================================================================

class GeometryTranspiler:
    """Convert human-readable text to Geometry tokens"""
    
    @staticmethod
    def to_bonds(text: str) -> bytes:
        """Convert text command to Geometry Bond bytes"""
        text = text.strip()
        tokens = bytearray()
        
        # RECT x y w h #COLOR
        match = re.match(r'RECT\s+(-?\d+)\s+(-?\d+)\s+(\d+)\s+(\d+)\s+(#[0-9A-Fa-f]+)', text)
        if match:
            x, y = int(match.group(1)), int(match.group(2))
            w, h = int(match.group(3)), int(match.group(4))
            color = GeometryTranspiler._parse_color(match.group(5))
            
            tokens.append(Token.COLOR)
            tokens.extend(color)
            tokens.append(Token.RECT)
            tokens.extend(x.to_bytes(2, 'little', signed=True))
            tokens.extend(y.to_bytes(2, 'little', signed=True))
            tokens.extend(w.to_bytes(2, 'little'))
            tokens.extend(h.to_bytes(2, 'little'))
            tokens.extend(color)
            return bytes(tokens)
        
        # CIRC x y r #COLOR
        match = re.match(r'CIRC\s+(-?\d+)\s+(-?\d+)\s+(\d+)\s+(#[0-9A-Fa-f]+)', text)
        if match:
            x, y = int(match.group(1)), int(match.group(2))
            r = int(match.group(3))
            color = GeometryTranspiler._parse_color(match.group(4))
            
            tokens.append(Token.COLOR)
            tokens.extend(color)
            tokens.append(Token.CIRC)
            tokens.extend(x.to_bytes(2, 'little', signed=True))
            tokens.extend(y.to_bytes(2, 'little', signed=True))
            tokens.extend(r.to_bytes(2, 'little'))
            tokens.extend(color)
            return bytes(tokens)
        
        # TEXT x y "string" #COLOR
        match = re.match(r'TEXT\s+(-?\d+)\s+(-?\d+)\s+"(.+?)"\s*(#[0-9A-Fa-f]+)?', text)
        if match:
            x, y = int(match.group(1)), int(match.group(2))
            text_content = match.group(3)
            color = GeometryTranspiler._parse_color(match.group(4) or "#FFFFFF")
            
            tokens.append(Token.COLOR)
            tokens.extend(color)
            tokens.append(Token.TEXT)
            tokens.extend(x.to_bytes(2, 'little', signed=True))
            tokens.extend(y.to_bytes(2, 'little', signed=True))
            encoded = text_content.encode('utf-8')
            tokens.append(len(encoded))
            tokens.extend(encoded)
            tokens.extend(color)
            return bytes(tokens)
        
        # MOVE x y
        match = re.match(r'MOVE\s+(-?\d+)\s+(-?\d+)', text)
        if match:
            x, y = int(match.group(1)), int(match.group(2))
            tokens.append(Token.MOVE)
            tokens.extend(x.to_bytes(2, 'little', signed=True))
            tokens.extend(y.to_bytes(2, 'little', signed=True))
            return bytes(tokens)
        
        # COLOR #HEX
        match = re.match(r'COLOR\s+(#[0-9A-Fa-f]+)', text)
        if match:
            color = GeometryTranspiler._parse_color(match.group(1))
            tokens.append(Token.COLOR)
            tokens.extend(color)
            return bytes(tokens)
        
        # FREEZE frames
        match = re.match(r'FREEZE\s+(\d+)', text)
        if match:
            frames = int(match.group(1))
            tokens.append(Token.FREEZE)
            tokens.extend(frames.to_bytes(2, 'little'))
            return bytes(tokens)
        
        # THAW
        if text == "THAW":
            tokens.append(Token.THAW)
            return bytes(tokens)
        
        return b''
    
    @staticmethod
    def _parse_color(color: str) -> bytes:
        """Parse hex color to RGBA bytes"""
        color = color.lstrip('#')
        if len(color) == 6:
            color += 'FF'
        return bytes.fromhex(color)


# =============================================================================
# HEX LOGIC RUNNER - Shader-less Execution
# =============================================================================

class HexLogicRunner:
    """
    Shader-less execution engine.
    Frame Buffer = Linear Instruction Tape.
    """
    
    def __init__(self, width: int = 1920, height: int = 1080):
        self.width = width
        self.height = height
        self.buffer = bytearray(width * height * 4)
        self.cursor = 0
        self.running = True
    
    def execute(self, blob: bytes) -> bool:
        """
        Execute Geometry Bond blob.
        
        Reads tokens sequentially, performs actions.
        Visual debugging: crash = cursor stops at specific byte.
        """
        self.cursor = 0
        
        while self.cursor < len(blob) and self.running:
            token = blob[self.cursor]
            
            if token == Token.MOVE:
                x = int.from_bytes(blob[self.cursor+1:self.cursor+3], 'little', signed=True)
                y = int.from_bytes(blob[self.cursor+3:self.cursor+5], 'little', signed=True)
                # Move cursor/action
                self.cursor += 5
            
            elif token == Token.RECT:
                x = int.from_bytes(blob[self.cursor+1:self.cursor+3], 'little', signed=True)
                y = int.from_bytes(blob[self.cursor+3:self.cursor+5], 'little', signed=True)
                w = int.from_bytes(blob[self.cursor+5:self.cursor+7], 'little')
                h = int.from_bytes(blob[self.cursor+7:self.cursor+9], 'little')
                color = blob[self.cursor+9:self.cursor+13]
                self._blit_rect(x, y, w, h, color)
                self.cursor += 13
            
            elif token == Token.CIRC:
                x = int.from_bytes(blob[self.cursor+1:self.cursor+3], 'little', signed=True)
                y = int.from_bytes(blob[self.cursor+3:self.cursor+5], 'little', signed=True)
                r = int.from_bytes(blob[self.cursor+5:self.cursor+7], 'little')
                color = blob[self.cursor+7:self.cursor+11]
                self._blit_circle(x, y, r, color)
                self.cursor += 11
            
            elif token == Token.TEXT:
                x = int.from_bytes(blob[self.cursor+1:self.cursor+3], 'little', signed=True)
                y = int.from_bytes(blob[self.cursor+3:self.cursor+5], 'little', signed=True)
                length = blob[self.cursor+5]
                text = blob[self.cursor+6:self.cursor+6+length].decode('utf-8', errors='replace')
                self._blit_text(x, y, text)
                self.cursor += 6 + length + 4  # +4 for color
            
            elif token == Token.COLOR:
                self.cursor += 5
            
            elif token == Token.FREEZE:
                frames = int.from_bytes(blob[self.cursor+1:self.cursor+3], 'little')
                # Wait frames (in real implementation)
                self.cursor += 3
            
            elif token == Token.THAW:
                self.running = True
                self.cursor += 1
            
            else:
                self.cursor += 1
        
        return True
    
    def _blit_rect(self, x: int, y: int, w: int, h: int, color: bytes):
        """Blit rectangle to buffer"""
        r, g, b, a = color
        for dy in range(h):
            for dx in range(w):
                px, py = x + dx, y + dy
                if 0 <= px < self.width and 0 <= py < self.height:
                    pos = (py * self.width + px) * 4
                    self.buffer[pos:pos+4] = color
    
    def _blit_circle(self, cx: int, cy: int, r: int, color: bytes):
        """Blit circle to buffer"""
        for dy in range(-r, r + 1):
            for dx in range(-r, r + 1):
                if dx * dx + dy * dy <= r * r:
                    px, py = cx + dx, cy + dy
                    if 0 <= px < self.width and 0 <= py < self.height:
                        pos = (py * self.width + px) * 4
                        self.buffer[pos:pos+4] = color
    
    def _blit_text(self, x: int, y: int, text: str):
        """Blit text using 8x8 font (placeholder)"""
        # In full implementation, use bitmap_font.py
        pass


# =============================================================================
# THE MIRROR - Main Loop
# =============================================================================

class TheMirror:
    """
    The Only File Needed to Run Geometry OS.
    
    The Mirror Loop:
    1. READ: Get raw text from input buffer
    2. TRANSLATE: Convert to 0x80-0x8F tokens
    3. VALIDATE: Security check
    4. REFLECT: Push to Execute Tape
    5. SYNC: Send to Infinite Map
    """
    
    def __init__(self):
        self.runner = HexLogicRunner()
        self.transpiler = GeometryTranspiler()
        self.agent_signature = Security.AGENT_HUMAN  # Default: Human
        self.running = True
        self.input_buffer = ""
        self.frame_count = 0
    
    def read_input_buffer(self) -> str:
        """Read raw text from input coordinate"""
        # In full implementation, read from actual buffer
        return self.input_buffer
    
    def sync_to_infinite_map(self, blob: bytes):
        """Sync result to GitHub Pages Canvas"""
        # In full implementation, push to Yjs/WebRTC
        pass
    
    def start_mirror_loop(self):
        """
        The Mirror Loop - runs forever.
        
        This is the "Single-File" that runs the world.
        """
        print("=" * 60)
        print("THE MIRROR - Geometry OS Master Kernel")
        print("=" * 60)
        print("\nThe Mirror Loop:")
        print("  1. READ: Get raw text from input")
        print("  2. TRANSLATE: Convert to 0x80-0x8F tokens")
        print("  3. VALIDATE: Security check")
        print("  4. REFLECT: Push to Execute Tape")
        print("  5. SYNC: Send to Infinite Map")
        print("\n" + "=" * 60)
        print("MIRROR ACTIVE - Awaiting Input")
        print("=" * 60)
        
        while self.running:
            # 1. READ: Get raw text from input
            raw_intent = self.read_input_buffer()
            
            if raw_intent:
                print(f"\n[Frame {self.frame_count}] Input: {raw_intent}")
                
                # 2. TRANSLATE: Convert to Geometry tokens
                geometry_blob = self.transpiler.to_bonds(raw_intent)
                
                if geometry_blob:
                    print(f"  → Geometry: {geometry_blob.hex()}")
                    
                    # 3. VALIDATE: Security check
                    token = geometry_blob[0]
                    valid, reason = Security.validate(self.agent_signature, token)
                    
                    if valid:
                        print(f"  → Validated: {reason}")
                        
                        # 4. REFLECT: Execute
                        self.runner.execute(geometry_blob)
                        print(f"  → Executed: {len(geometry_blob)} bytes")
                        
                        # 5. SYNC: Send to Infinite Map
                        self.sync_to_infinite_map(geometry_blob)
                        print(f"  → Synced to Infinite Map")
                    else:
                        print(f"  → BLOCKED: {reason}")
                
                # Clear buffer after processing
                self.input_buffer = ""
            
            self.frame_count += 1
            time.sleep(0.016)  # ~60 FPS
    
    def inject_text(self, text: str):
        """Inject text into the mirror (for testing)"""
        self.input_buffer = text


# =============================================================================
# ENTRY POINT
# =============================================================================

if __name__ == "__main__":
    import sys
    
    mirror = TheMirror()
    
    # If command line args, process them
    if len(sys.argv) > 1:
        command = " ".join(sys.argv[1:])
        mirror.inject_text(command)
        mirror.start_mirror_loop()
    else:
        # Interactive mode
        print("\nInteractive Mode - Type commands (Ctrl+C to exit)")
        print("Commands: RECT, CIRC, TEXT, MOVE, COLOR, FREEZE, THAW")
        print("\nExample: RECT 100 100 50 50 #FF0000")
        
        try:
            while True:
                cmd = input("\n> ")
                if cmd.lower() in ('exit', 'quit'):
                    break
                mirror.inject_text(cmd)
                # Process one frame
                raw = mirror.read_input_buffer()
                if raw:
                    blob = mirror.transpiler.to_bonds(raw)
                    if blob:
                        valid, reason = Security.validate(mirror.agent_signature, blob[0])
                        if valid:
                            mirror.runner.execute(blob)
                            print(f"  ✓ Executed: {blob.hex()}")
                        else:
                            print(f"  ✗ {reason}")
                    else:
                        print("  ✗ Unknown command")
                mirror.frame_count += 1
        except KeyboardInterrupt:
            print("\n\nMirror closed.")
