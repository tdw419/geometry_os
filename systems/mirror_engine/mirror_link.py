#!/usr/bin/env python3
"""
Mirror Link - Bi-Directional Text-to-Geometry Bridge

The "Split-Pane" Execution:
- Text Side (Left): Human-readable code (RECT 100 100 #FF0000)
- Translation Layer: SAL converts text → Geometry tokens
- Frame Buffer Side (Right): Tokens become executable matter

Real-Time Feedback:
- Change "RECT" to "CIRC" → square morphs to circle instantly
- Text is the "Shadow" (plan), buffer is the "Body" (reality)

Usage:
    link = MirrorLink(text_coord=(0,0), target_coord=(100,0))
    link.sync()  # Mirror text → geometry
"""

import re
from typing import Tuple, Optional
from dataclasses import dataclass


@dataclass
class MirrorConfig:
    """Configuration for a mirror link"""
    text_coord: Tuple[int, int]
    target_coord: Tuple[int, int]
    offset_x: int = 100
    offset_y: int = 0
    auto_sync: bool = True


class MirrorLink:
    """
    Bi-Directional Mirror between text and geometry.
    
    Watches text at one coordinate, converts to Geometry tokens,
    writes to target coordinate. Real-time visual IDE.
    """
    
    def __init__(self, config: MirrorConfig):
        self.config = config
        self.last_text = ""
        self.geometry_assembler = None  # Would import from geometry_assembler
    
    def read_text(self, coord: Tuple[int, int]) -> str:
        """
        Read text from buffer coordinate.
        
        In full implementation, this reads from the actual frame buffer.
        For now, returns placeholder.
        """
        # TODO: Read from actual buffer at coord
        return ""
    
    def write_geometry(self, coord: Tuple[int, int], blob: bytes):
        """
        Write geometry blob to buffer coordinate.
        
        In full implementation, this writes to the actual frame buffer.
        """
        # TODO: Write to actual buffer at coord
        pass
    
    def parse_text_command(self, text: str) -> bytes:
        """
        Parse human-readable text into Geometry tokens.
        
        Supported commands:
        - RECT x y w h #COLOR
        - CIRC x y r #COLOR
        - TEXT x y "string" #COLOR
        - MOVE x y
        - COLOR #HEX
        - FREEZE frames
        - THAW
        
        Example:
            "RECT 100 100 50 50 #FF0000" → 0x84 + params
        """
        tokens = bytearray()
        text = text.strip()
        
        # RECT x y w h #COLOR
        match = re.match(r'RECT\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(#[0-9A-Fa-f]+)', text)
        if match:
            x, y, w, h = int(match.group(1)), int(match.group(2)), int(match.group(3)), int(match.group(4))
            color = self._parse_color(match.group(5))
            
            tokens.append(0x89)  # COLOR
            tokens.extend(color)
            tokens.append(0x84)  # RECT
            tokens.extend(x.to_bytes(2, 'little', signed=True))
            tokens.extend(y.to_bytes(2, 'little', signed=True))
            tokens.extend(w.to_bytes(2, 'little'))
            tokens.extend(h.to_bytes(2, 'little'))
            tokens.extend(color)
            return bytes(tokens)
        
        # CIRC x y r #COLOR
        match = re.match(r'CIRC\s+(\d+)\s+(\d+)\s+(\d+)\s+(#[0-9A-Fa-f]+)', text)
        if match:
            x, y, r = int(match.group(1)), int(match.group(2)), int(match.group(3))
            color = self._parse_color(match.group(4))
            
            tokens.append(0x89)
            tokens.extend(color)
            tokens.append(0x85)  # CIRC
            tokens.extend(x.to_bytes(2, 'little', signed=True))
            tokens.extend(y.to_bytes(2, 'little', signed=True))
            tokens.extend(r.to_bytes(2, 'little'))
            tokens.extend(color)
            return bytes(tokens)
        
        # TEXT x y "string" #COLOR
        match = re.match(r'TEXT\s+(\d+)\s+(\d+)\s+"(.+?)"\s*(#[0-9A-Fa-f]+)?', text)
        if match:
            x, y = int(match.group(1)), int(match.group(2))
            text_content = match.group(3)
            color = self._parse_color(match.group(4) or "#FFFFFF")
            
            tokens.append(0x89)
            tokens.extend(color)
            tokens.append(0x86)  # TEXT
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
            tokens.append(0x80)  # MOVE
            tokens.extend(x.to_bytes(2, 'little', signed=True))
            tokens.extend(y.to_bytes(2, 'little', signed=True))
            return bytes(tokens)
        
        # COLOR #HEX
        match = re.match(r'COLOR\s+(#[0-9A-Fa-f]+)', text)
        if match:
            color = self._parse_color(match.group(1))
            tokens.append(0x89)  # COLOR
            tokens.extend(color)
            return bytes(tokens)
        
        # FREEZE frames
        match = re.match(r'FREEZE\s+(\d+)', text)
        if match:
            frames = int(match.group(1))
            tokens.append(0x8E)  # FREEZE
            tokens.extend(frames.to_bytes(2, 'little'))
            return bytes(tokens)
        
        # THAW
        if text == "THAW":
            tokens.append(0x8F)  # THAW
            return bytes(tokens)
        
        # Unknown command
        return b''
    
    def sync(self) -> bool:
        """
        Sync text to geometry.
        
        Reads text from source, converts to tokens, writes to target.
        Returns True if sync happened, False if no change.
        """
        # Read current text
        current_text = self.read_text(self.config.text_coord)
        
        # Check if changed
        if current_text == self.last_text:
            return False
        
        self.last_text = current_text
        
        # Parse text to geometry
        geometry_blob = self.parse_text_command(current_text)
        
        if not geometry_blob:
            return False
        
        # Write to target
        self.write_geometry(self.config.target_coord, geometry_blob)
        
        return True
    
    def sync_continuous(self, interval_ms: int = 100):
        """
        Continuously sync text to geometry.
        
        In full implementation, this would run in a loop,
        watching for text changes and mirroring them.
        """
        import time
        while True:
            self.sync()
            time.sleep(interval_ms / 1000)
    
    def _parse_color(self, color: str) -> bytes:
        """Parse hex color to RGBA bytes"""
        color = color.lstrip('#')
        if len(color) == 6:
            color += 'FF'
        return bytes.fromhex(color)


def create_mirror_portal(text_coord: Tuple[int, int] = (0, 0),
                          offset: int = 100) -> MirrorLink:
    """
    Create a Mirror Portal at specified coordinates.
    
    Whatever you type at text_coord appears as geometry at
    text_coord + offset.
    
    Example:
        Type "RECT 10 10 50 50 #FF0000" at (0, 0)
        → Red rectangle appears at (100, 0)
    """
    config = MirrorConfig(
        text_coord=text_coord,
        target_coord=(text_coord[0] + offset, text_coord[1] + offset),
        offset_x=offset,
        offset_y=0
    )
    return MirrorLink(config)


if __name__ == "__main__":
    print("=" * 60)
    print("MIRROR LINK - Bi-Directional Text-to-Geometry Bridge")
    print("=" * 60)
    
    link = create_mirror_portal((0, 0), offset=100)
    
    # Test parsing
    print("\n" + "=" * 60)
    print("Text → Geometry Conversion")
    print("=" * 60)
    
    test_commands = [
        'RECT 100 100 50 50 #FF0000',
        'CIRC 200 200 30 #00FF00',
        'TEXT 300 300 "Hello World" #FFFFFF',
        'MOVE 500 500',
        'COLOR #00FFFF',
        'FREEZE 60',
        'THAW',
    ]
    
    for cmd in test_commands:
        blob = link.parse_text_command(cmd)
        print(f"\nCommand: {cmd}")
        print(f"  Bytes: {len(blob)}")
        print(f"  Hex: {blob.hex()}")
    
    print("\n" + "=" * 60)
    print("MIRROR PORTAL READY")
    print("=" * 60)
    print("\nText Side (Left): Human-readable commands")
    print("Translation: SAL converts text → Geometry tokens")
    print("Frame Buffer (Right): Tokens become executable matter")
    print("\nReal-Time Feedback:")
    print("  Change 'RECT' → 'CIRC' → square morphs to circle")
    print("  Text = Shadow (plan), Buffer = Body (reality)")
    print("\n🔷🔒 Mirror Link Active")
