#!/usr/bin/env python3
"""
Atomic Apps - Pure hex-string applications for Geometry OS

These apps exist as static hex-strings in the buffer. No software needed.
They test different parts of the Geometry Standard before replacing the old OS.

Three "Hello World" Atomic Apps:
1. Spatial Clock (10, 10) - Tests 0x86 TEXT + 0x8E FREEZE timing
2. Security Radar (200, 200) - Tests 0x8D LISTEN + 0x89 COLOR proximity
3. Atomic Notepad (500, 500) - Tests 0x84 RECT + 0x80 MOVE input

Usage:
    clock_hex = SpatialClock.generate()
    # Paste into buffer at (10, 10), watch it tick
"""

import time
from datetime import datetime
from typing import List, Tuple


class GeometryToken:
    """Geometry Standard tokens"""
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


class AtomicApp:
    """Base class for atomic apps"""
    
    def __init__(self, position: Tuple[int, int], name: str):
        self.x, self.y = position
        self.name = name
        self.tokens = bytearray()
    
    def add_token(self, token: int) -> 'AtomicApp':
        """Add a single token"""
        self.tokens.append(token)
        return self
    
    def add_int16(self, value: int) -> 'AtomicApp':
        """Add 16-bit integer"""
        self.tokens.extend(value.to_bytes(2, 'little', signed=True))
        return self
    
    def add_uint16(self, value: int) -> 'AtomicApp':
        """Add unsigned 16-bit integer"""
        self.tokens.extend(value.to_bytes(2, 'little'))
        return self
    
    def add_uint32(self, value: int) -> 'AtomicApp':
        """Add 32-bit integer"""
        self.tokens.extend(value.to_bytes(4, 'little'))
        return self
    
    def add_text(self, text: str) -> 'AtomicApp':
        """Add length-prefixed text"""
        encoded = text.encode('utf-8')
        self.tokens.append(len(encoded))
        self.tokens.extend(encoded)
        return self
    
    def add_color(self, r: int, g: int, b: int, a: int = 255) -> 'AtomicApp':
        """Add RGBA color"""
        self.tokens.extend(bytes([r, g, b, a]))
        return self
    
    def build(self) -> bytes:
        """Build the final hex string"""
        return bytes(self.tokens)
    
    def hex_string(self) -> str:
        """Return as hex string"""
        return self.build().hex()
    
    def token_count(self) -> int:
        """Count tokens in app"""
        return len(self.tokens)


class SpatialClock(AtomicApp):
    """
    App A: Spatial Clock @ (10, 10)
    
    Tests:
    - 0x86 (TEXT) - rendering time string
    - 0x8E (FREEZE) - timing/pausing for 60 cycles
    - Basic update cycle
    
    The 5090 only "wakes up" for this pixel-cluster once per second.
    """
    
    def __init__(self, position: Tuple[int, int] = (10, 10)):
        super().__init__(position, "Spatial Clock")
    
    @staticmethod
    def generate(position: Tuple[int, int] = (10, 10), 
                 current_time: str = None) -> bytes:
        """
        Generate clock hex string.
        
        Args:
            position: (x, y) coordinates
            current_time: Time string (HH:MM:SS), defaults to now
        
        Returns:
            Hex string for clock app
        """
        if current_time is None:
            current_time = datetime.now().strftime("%H:%M:%S")
        
        app = AtomicApp(position, "Spatial Clock")
        
        # Layer - foreground
        app.add_token(GeometryToken.LAYER)
        app.add_uint16(100)
        
        # Background panel
        app.add_token(GeometryToken.COLOR)
        app.add_color(0x0A, 0x0A, 0x1A, 0xFF)  # Dark blue
        
        app.add_token(GeometryToken.RECT)
        app.add_int16(position[0])
        app.add_int16(position[1])
        app.add_uint16(200)  # width
        app.add_uint16(50)   # height
        app.add_color(0x0A, 0x0A, 0x1A, 0xFF)
        
        # Border
        app.add_token(GeometryToken.COLOR)
        app.add_color(0x00, 0xFF, 0xFF, 0xFF)  # Cyan
        
        app.add_token(GeometryToken.RECT)
        app.add_int16(position[0])
        app.add_int16(position[1])
        app.add_uint16(200)
        app.add_uint16(2)
        app.add_color(0x00, 0xFF, 0xFF, 0xFF)
        
        # Label "TIME:"
        app.add_token(GeometryToken.COLOR)
        app.add_color(0x88, 0x88, 0x88, 0xFF)  # Gray
        
        app.add_token(GeometryToken.TEXT)
        app.add_int16(position[0] + 10)
        app.add_int16(position[1] + 30)
        app.add_text("TIME:")
        app.add_color(0x88, 0x88, 0x88, 0xFF)
        
        # Time value
        app.add_token(GeometryToken.COLOR)
        app.add_color(0x00, 0xFF, 0x00, 0xFF)  # Green
        
        app.add_token(GeometryToken.TEXT)
        app.add_int16(position[0] + 70)
        app.add_int16(position[1] + 30)
        app.add_text(current_time)
        app.add_color(0x00, 0xFF, 0x00, 0xFF)
        
        # FREEZE for 60 cycles (1 second at 60fps)
        app.add_token(GeometryToken.FREEZE)
        app.add_uint16(60)  # cycles to wait
        
        # THAW to continue
        app.add_token(GeometryToken.THAW)
        
        return app.build()


class SecurityRadar(AtomicApp):
    """
    App B: Security Radar @ (200, 200)
    
    Tests:
    - 0x8D (LISTEN) - proximity detection
    - 0x89 (COLOR) - state change based on detection
    
    The app "senses" agents. Changes green when agent detected, red otherwise.
    """
    
    def __init__(self, position: Tuple[int, int] = (200, 200)):
        super().__init__(position, "Security Radar")
    
    @staticmethod
    def generate(position: Tuple[int, int] = (200, 200),
                 agent_detected: bool = False) -> bytes:
        """
        Generate radar hex string.
        
        Args:
            position: (x, y) coordinates
            agent_detected: Whether an agent is in range
        
        Returns:
            Hex string for radar app
        """
        app = AtomicApp(position, "Security Radar")
        
        # Layer - foreground
        app.add_token(GeometryToken.LAYER)
        app.add_uint16(100)
        
        # Radar circle (changes color based on detection)
        color = (0x00, 0xFF, 0x00, 0xFF) if agent_detected else (0xFF, 0x00, 0x00, 0xFF)
        
        app.add_token(GeometryToken.COLOR)
        app.add_color(*color)
        
        app.add_token(GeometryToken.CIRC)
        app.add_int16(position[0])
        app.add_int16(position[1])
        app.add_uint16(50)  # radius
        app.add_color(*color)
        
        # Border ring
        app.add_token(GeometryToken.COLOR)
        app.add_color(0xFF, 0xFF, 0xFF, 0x80)  # Semi-transparent white
        
        app.add_token(GeometryToken.CIRC)
        app.add_int16(position[0])
        app.add_int16(position[1])
        app.add_uint16(55)
        app.add_color(0xFF, 0xFF, 0xFF, 0x80)
        
        # Label
        status = "AGENT DETECTED" if agent_detected else "CLEAR"
        
        app.add_token(GeometryToken.COLOR)
        app.add_color(0xFF, 0xFF, 0xFF, 0xFF)
        
        app.add_token(GeometryToken.TEXT)
        app.add_int16(position[0] - 50)
        app.add_int16(position[1] + 80)
        app.add_text(status)
        app.add_color(0xFF, 0xFF, 0xFF, 0xFF)
        
        # LISTEN with radius 50
        app.add_token(GeometryToken.LISTEN)
        app.add_uint16(50)
        
        return app.build()


class AtomicNotepad(AtomicApp):
    """
    App C: Atomic Notepad @ (500, 500)
    
    Tests:
    - 0x84 (RECT) - defining bounds
    - 0x8D (LISTEN) - keyboard input
    - 0x80 (MOVE) - cursor movement
    
    A "Zero-Software" text editor using raw instruction tape.
    """
    
    def __init__(self, position: Tuple[int, int] = (500, 500)):
        super().__init__(position, "Atomic Notepad")
    
    @staticmethod
    def generate(position: Tuple[int, int] = (500, 500),
                 content: str = "",
                 cursor_pos: Tuple[int, int] = (0, 0)) -> bytes:
        """
        Generate notepad hex string.
        
        Args:
            position: (x, y) coordinates
            content: Text content
            cursor_pos: (col, row) cursor position
        
        Returns:
            Hex string for notepad app
        """
        app = AtomicApp(position, "Atomic Notepad")
        
        # Layer - foreground
        app.add_token(GeometryToken.LAYER)
        app.add_uint16(100)
        
        # White background
        app.add_token(GeometryToken.COLOR)
        app.add_color(0xFF, 0xFF, 0xFF, 0xFF)  # White
        
        app.add_token(GeometryToken.RECT)
        app.add_int16(position[0])
        app.add_int16(position[1])
        app.add_uint16(256)  # width
        app.add_uint16(256)  # height
        app.add_color(0xFF, 0xFF, 0xFF, 0xFF)
        
        # Border
        app.add_token(GeometryToken.COLOR)
        app.add_color(0x00, 0x00, 0x00, 0xFF)  # Black
        
        app.add_token(GeometryToken.RECT)
        app.add_int16(position[0])
        app.add_int16(position[1])
        app.add_uint16(258)
        app.add_uint16(2)
        app.add_color(0x00, 0x00, 0x00, 0xFF)
        
        # Title
        app.add_token(GeometryToken.COLOR)
        app.add_color(0x00, 0x00, 0x00, 0xFF)
        
        app.add_token(GeometryToken.TEXT)
        app.add_int16(position[0] + 10)
        app.add_int16(position[1] + 20)
        app.add_text("ATOMIC NOTEPAD")
        app.add_color(0x00, 0x00, 0x00, 0xFF)
        
        # Content
        if content:
            app.add_token(GeometryToken.COLOR)
            app.add_color(0x00, 0x00, 0x00, 0xFF)
            
            app.add_token(GeometryToken.TEXT)
            app.add_int16(position[0] + 10)
            app.add_int16(position[1] + 50)
            app.add_text(content[:100])  # Limit to 100 chars
            app.add_color(0x00, 0x00, 0x00, 0xFF)
        
        # Cursor
        cursor_x = position[0] + 10 + (cursor_pos[0] * 8)
        cursor_y = position[1] + 50 + (cursor_pos[1] * 12)
        
        app.add_token(GeometryToken.COLOR)
        app.add_color(0x00, 0x00, 0x00, 0xFF)
        
        app.add_token(GeometryToken.RECT)
        app.add_int16(cursor_x)
        app.add_int16(cursor_y)
        app.add_uint16(8)
        app.add_uint16(12)
        app.add_color(0x00, 0x00, 0x00, 0xFF)
        
        # LISTEN for keyboard input
        app.add_token(GeometryToken.LISTEN)
        app.add_uint16(128)
        
        # MOVE to cursor position (for next input)
        app.add_token(GeometryToken.MOVE)
        app.add_int16(cursor_x)
        app.add_int16(cursor_y)
        
        return app.build()


class HexRegistry:
    """
    Registry of Atomic App hex strings.
    Copy-paste anywhere on the infinite map.
    """
    
    @staticmethod
    def generate_all() -> dict:
        """Generate all atomic apps"""
        return {
            "spatial_clock": SpatialClock.generate(),
            "security_radar_clear": SecurityRadar.generate(agent_detected=False),
            "security_radar_detected": SecurityRadar.generate(agent_detected=True),
            "atomic_notepad": AtomicNotepad.generate(content="Hello World"),
        }


if __name__ == "__main__":
    print("=" * 60)
    print("ATOMIC APPS - Vehicles for Geometry OS")
    print("=" * 60)
    
    # App A: Spatial Clock
    print("\n" + "=" * 60)
    print("APP A: SPATIAL CLOCK @ (10, 10)")
    print("=" * 60)
    clock_hex = SpatialClock.generate()
    print(f"Size: {len(clock_hex)} bytes")
    print(f"Hex String:\n{clock_hex.hex()}")
    print(f"\nPaste into buffer at (10, 10)")
    print("The clock will tick once per second.")
    print("5090 only wakes up for this pixel-cluster once per second.")
    
    # App B: Security Radar
    print("\n" + "=" * 60)
    print("APP B: SECURITY RADAR @ (200, 200)")
    print("=" * 60)
    radar_clear = SecurityRadar.generate(agent_detected=False)
    radar_detected = SecurityRadar.generate(agent_detected=True)
    print(f"Size: {len(radar_clear)} bytes (each state)")
    print(f"\nClear (no agent):\n{radar_clear.hex()}")
    print(f"\nDetected (agent in range):\n{radar_detected.hex()}")
    print("\nThe app 'senses' you. Changes color as you approach.")
    
    # App C: Atomic Notepad
    print("\n" + "=" * 60)
    print("APP C: ATOMIC NOTEPAD @ (500, 500)")
    print("=" * 60)
    notepad = AtomicNotepad.generate(content="Hello Geometry OS")
    print(f"Size: {len(notepad)} bytes")
    print(f"Hex String:\n{notepad.hex()}")
    print("\nA 'Zero-Software' text editor.")
    print("Uses raw instruction tape - no program needed.")
    
    # Full Registry
    print("\n" + "=" * 60)
    print("HEX REGISTRY - All Apps")
    print("=" * 60)
    registry = HexRegistry.generate_all()
    total_size = sum(len(h) for h in registry.values())
    print(f"Total apps: {len(registry)}")
    print(f"Total size: {total_size} bytes")
    
    print("\n" + "=" * 60)
    print("ATOMIC APPS READY")
    print("=" * 60)
    print("\nThese apps exist as pure hex-strings.")
    print("Copy-paste anywhere on the infinite map.")
    print("No software needed - just Geometry Bonds.")
    print("\n🔷🔒 Geometry OS Atomic Apps Active")
