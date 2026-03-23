#!/usr/bin/env python3
"""
Bootloader Hex - Genesis Block of the Geometry OS

The First 256 Pixels of the infinite map = System Bootloader.
This hex string initializes:
- Global Origin (0,0)
- Primary Terminal at (0,0)
- Security Heartbeat for Human Admin (0x100)
- System Daemons (0x300+)
- Panic Button coordinate (-9999,-9999)

This is the "Genesis Block" - the seed from which the entire spatial world grows.
"""

from enum import IntEnum
from typing import List


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


class BootloaderBuilder:
    """Builds the Genesis Block bootloader hex"""
    
    def __init__(self):
        self.bytes = bytearray()
    
    def token(self, t: int) -> 'BootloaderBuilder':
        """Add a single token"""
        self.bytes.append(t)
        return self
    
    def int16(self, value: int) -> 'BootloaderBuilder':
        """Add 16-bit integer"""
        self.bytes.extend(value.to_bytes(2, 'little', signed=True))
        return self
    
    def uint16(self, value: int) -> 'BootloaderBuilder':
        """Add unsigned 16-bit integer"""
        self.bytes.extend(value.to_bytes(2, 'little'))
        return self
    
    def int32(self, value: int) -> 'BootloaderBuilder':
        """Add 32-bit integer"""
        self.bytes.extend(value.to_bytes(4, 'little', signed=True))
        return self
    
    def uint32(self, value: int) -> 'BootloaderBuilder':
        """Add unsigned 32-bit integer"""
        self.bytes.extend(value.to_bytes(4, 'little'))
        return self
    
    def color(self, r: int, g: int, b: int, a: int = 255) -> 'BootloaderBuilder':
        """Add RGBA color"""
        self.bytes.extend(bytes([r, g, b, a]))
        return self
    
    def hex_color(self, hex_str: str) -> 'BootloaderBuilder':
        """Add hex color (#RRGGBB or #RRGGBBAA)"""
        hex_str = hex_str.lstrip('#')
        if len(hex_str) == 6:
            hex_str += 'FF'
        for i in range(0, 8, 2):
            self.bytes.append(int(hex_str[i:i+2], 16))
        return self
    
    def text(self, text: str) -> 'BootloaderBuilder':
        """Add length-prefixed text"""
        encoded = text.encode('utf-8')
        self.bytes.append(len(encoded))
        self.bytes.extend(encoded)
        return self
    
    def build(self) -> bytes:
        """Build the final bootloader"""
        return bytes(self.bytes)
    
    def hex_string(self) -> str:
        """Return as hex string"""
        return self.build().hex()
    
    def tokens_list(self) -> List[int]:
        """Return as list of token values"""
        return list(self.bytes)


def build_genesis_block() -> bytes:
    """
    Build the Genesis Block bootloader.
    
    Structure:
    1. Header (4 bytes): Magic number "GEO1"
    2. Version (2 bytes): 0x0001
    3. Global Origin Setup
    4. Primary Terminal Spawn
    5. Security Heartbeat Init
    6. System Daemons
    7. Panic Button Setup
    """
    b = BootloaderBuilder()
    
    # ============================================================
    # HEADER - Magic number "GEO1" + Version
    # ============================================================
    b.bytes.extend(b'GEO1')  # Magic: "GEO1"
    b.uint16(0x0001)          # Version: 1
    
    # ============================================================
    # GLOBAL ORIGIN - Set (0,0) as world center
    # ============================================================
    b.token(GeometryToken.MOVE)
    b.int16(0)    # x = 0
    b.int16(0)    # y = 0
    
    # ============================================================
    # SECURITY HEARTBEAT - Initialize for Human Admin (0x100)
    # ============================================================
    b.token(GeometryToken.AGENT)
    b.uint16(0x0100)   # Agent signature: Human Admin
    b.int16(0)         # x position
    b.int16(0)         # y position
    b.uint16(0x00FF)   # Agent type: 0x00FF = Human
    
    # ============================================================
    # PRIMARY TERMINAL - Spawn at (0, 0)
    # ============================================================
    b.token(GeometryToken.LAYER)
    b.uint16(100)      # Z-depth: 100 (foreground)
    
    b.token(GeometryToken.COLOR)
    b.hex_color('#1A1A2E')  # Terminal background
    
    b.token(GeometryToken.RECT)
    b.int16(0)         # x = 0
    b.int16(0)         # y = 0
    b.uint16(800)      # width = 800
    b.uint16(600)      # height = 600
    
    # Terminal border
    b.token(GeometryToken.COLOR)
    b.hex_color('#00FFFF')  # Cyan border
    
    b.token(GeometryToken.RECT)
    b.int16(0)
    b.int16(0)
    b.uint16(802)      # width + 2 for border
    b.uint16(2)        # top border
    
    # Terminal title
    b.token(GeometryToken.COLOR)
    b.hex_color('#FFFFFF')  # White text
    
    b.token(GeometryToken.TEXT)
    b.int16(10)
    b.int16(20)
    b.text('GEOMETRY OS TERMINAL v0.1')
    
    # ============================================================
    # SYSTEM DAEMONS - Spawn at reserved coordinates
    # ============================================================
    
    # File Watcher Daemon (0x300)
    b.token(GeometryToken.AGENT)
    b.uint16(0x0300)   # System daemon
    b.int16(1000)      # x = 1000
    b.int16(0)         # y = 0
    b.uint16(0x0001)   # Type: File Watcher
    
    # AI Librarian Daemon (0x301)
    b.token(GeometryToken.AGENT)
    b.uint16(0x0301)
    b.int16(1000)
    b.int16(1000)
    b.uint16(0x0002)   # Type: Librarian
    
    # ============================================================
    # LISTEN - Terminal listens for input
    # ============================================================
    b.token(GeometryToken.LISTEN)
    b.uint16(100)      # Radius: 100 pixels
    
    # ============================================================
    # PANIC BUTTON - Coordinate (-9999, -9999)
    # ============================================================
    b.token(GeometryToken.MOVE)
    b.int16(-9999)     # x = -9999
    b.int16(-9999)     # y = -9999
    
    b.token(GeometryToken.COLOR)
    b.hex_color('#FF0000')  # Red = danger zone
    
    b.token(GeometryToken.CIRC)
    b.int16(-9999)
    b.int16(-9999)
    b.uint16(100)      # radius = 100
    
    b.token(GeometryToken.FREEZE)  # Quarantine zone - frozen
    
    # ============================================================
    # RETURN TO ORIGIN - Ready for user interaction
    # ============================================================
    b.token(GeometryToken.MOVE)
    b.int16(0)
    b.int16(0)
    
    b.token(GeometryToken.THAW)  # System ready
    
    return b.build()


def build_minimal_bootloader() -> bytes:
    """
    Minimal bootloader for testing.
    Just sets up origin, terminal, and admin agent.
    """
    b = BootloaderBuilder()
    
    # Magic header
    b.bytes.extend(b'GEO1')
    b.uint16(0x0001)
    
    # Origin
    b.token(GeometryToken.MOVE)
    b.int16(0).int16(0)
    
    # Admin agent
    b.token(GeometryToken.AGENT)
    b.uint16(0x0100)
    b.int16(0).int16(0)
    b.uint16(0x00FF)
    
    # Terminal background
    b.token(GeometryToken.LAYER).uint16(100)
    b.token(GeometryToken.COLOR).hex_color('#1A1A2E')
    b.token(GeometryToken.RECT)
    b.int16(0).int16(0).uint16(800).uint16(600)
    
    # Terminal title
    b.token(GeometryToken.COLOR).hex_color('#FFFFFF')
    b.token(GeometryToken.TEXT)
    b.int16(10).int16(20)
    b.text('GEOMETRY OS')
    
    # Ready
    b.token(GeometryToken.THAW)
    
    return b.build()


if __name__ == "__main__":
    print("=" * 60)
    print("GEOMETRY OS - GENESIS BLOCK BOOTLOADER")
    print("=" * 60)
    
    # Full genesis block
    genesis = build_genesis_block()
    print(f"\nGenesis Block Size: {len(genesis)} bytes")
    print(f"Genesis Hex:\n{genesis.hex()}")
    
    print("\n" + "=" * 60)
    print("Token Breakdown:")
    print("=" * 60)
    
    tokens = list(genesis)
    i = 0
    while i < len(tokens):
        token = tokens[i]
        
        if token == 0x47 and i + 3 < len(tokens):  # 'G'
            if bytes(tokens[i:i+4]) == b'GEO1':
                print(f"[{i:04d}] MAGIC: GEO1")
                print(f"[{i+4:04d}] VERSION: {tokens[i+4]}{tokens[i+5]}")
                i += 6
                continue
        
        if 0x80 <= token <= 0x8F:
            token_name = GeometryToken(token).name
            print(f"[{i:04d}] TOKEN: 0x{token:02X} ({token_name})")
            # Skip parameters based on token type
            if token == GeometryToken.MOVE:
                print(f"        → x={int.from_bytes(bytes(tokens[i+1:i+3]), 'little', signed=True)}, y={int.from_bytes(bytes(tokens[i+3:i+5]), 'little', signed=True)}")
                i += 5
            elif token == GeometryToken.RECT:
                print(f"        → rect params...")
                i += 13
            elif token == GeometryToken.AGENT:
                print(f"        → agent params...")
                i += 9
            else:
                i += 1
        else:
            i += 1
    
    print("\n" + "=" * 60)
    print("Minimal Bootloader (for testing):")
    print("=" * 60)
    
    minimal = build_minimal_bootloader()
    print(f"Size: {len(minimal)} bytes")
    print(f"Hex: {minimal.hex()}")
    
    print("\n" + "=" * 60)
    print("BOOT COMPLETE - SYSTEM READY")
    print("=" * 60)
    print("\nCoordinates:")
    print("  Origin: (0, 0)")
    print("  Terminal: (0, 0)")
    print("  Admin: 0x0100 @ (0, 0)")
    print("  Panic: (-9999, -9999)")
    print("  File Watcher: 0x0300 @ (1000, 0)")
    print("  AI Librarian: 0x0301 @ (1000, 1000)")
