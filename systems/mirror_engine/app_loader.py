#!/usr/bin/env python3
"""
Atomic App Loader — Parse hex strings and inject into running system

Loads 331 bytes of atomic apps into the frame buffer for execution.

Apps:
  A: Spatial Clock @ (10,10) - 86 bytes - TEXT+FREEZE timing
  B: Security Radar @ (200,200) - 58 bytes - LISTEN+COLOR proximity
  C: Atomic Notepad @ (500,500) - 126 bytes - RECT+LISTEN+MOVE input
"""

from dataclasses import dataclass
from typing import List, Optional
from enum import IntEnum


class Token(IntEnum):
    NULL = 0x80
    MOVE = 0x81
    ZOOM = 0x82
    LINK = 0x83
    THREAD = 0x84
    RECT = 0x85
    CIRC = 0x86
    TEXT = 0x87
    SPRITE = 0x88
    LAYER = 0x89
    COLOR = 0x8A
    ALPHA = 0x8B
    AGENT = 0x8C
    EMIT = 0x8D
    LISTEN = 0x8E
    FREEZE = 0x8F


# =============================================================================
# ATOMIC APP HEX STRINGS
# =============================================================================

APP_A_CLOCK = "886400890a0a1aff840a000a00c80032000a1a1aff8900ffffff860a000a000548454c4c4ffffff8e"
# Spatial Clock @ (10,10) - TEXT("HELLO") + FREEZE

APP_B_RADAR = "88640089ff0000ff84c800c80064006400ff0000ff8e32008900ff00ff8e"
# Security Radar @ (200,200) - RECT + FREEZE + COLOR change

APP_C_NOTEPAD = "886400891a1a2eff84f401f401e8012c011a1a2eff8900ffffff86f401f4010548454c4c4ffffff8e"
# Atomic Notepad @ (500,500) - RECT + TEXT("HELLO") + FREEZE

ALL_APPS = [
    ("clock", APP_A_CLOCK, (10, 10)),
    ("radar", APP_B_RADAR, (200, 200)),
    ("notepad", APP_C_NOTEPAD, (500, 500)),
]


# =============================================================================
# APP DATA STRUCTURE
# =============================================================================

@dataclass
class AtomicApp:
    """Parsed atomic app"""
    name: str
    hex_string: str
    bytes_data: bytes
    position: tuple[int, int]
    tokens: List[tuple]

    @property
    def size(self) -> int:
        return len(self.bytes_data)


# =============================================================================
# APP PARSER
# =============================================================================

class AppParser:
    """Parse hex strings into AtomicApp objects"""

    @staticmethod
    def parse_hex(hex_string: str, name: str = "app", position: tuple = (0, 0)) -> AtomicApp:
        """Parse hex string to AtomicApp"""
        # Clean hex string
        hex_clean = hex_string.strip().lower()
        if hex_clean.startswith('0x'):
            hex_clean = hex_clean[2:]

        # Convert to bytes
        bytes_data = bytes.fromhex(hex_clean)

        # Parse tokens
        tokens = AppParser._tokenize(bytes_data)

        return AtomicApp(
            name=name,
            hex_string=hex_clean,
            bytes_data=bytes_data,
            position=position,
            tokens=tokens
        )

    @staticmethod
    def _tokenize(data: bytes) -> List[tuple]:
        """Parse bytes into token list"""
        tokens = []
        i = 0

        while i < len(data):
            opcode = data[i]

            if opcode < 0x80:
                # ASCII or data byte
                tokens.append(('DATA', opcode, i))
                i += 1
                continue

            token_name = Token(opcode).name if opcode in Token._value2member_map_ else f"0x{opcode:02X}"

            if opcode == Token.LAYER:
                # LAYER: 1 byte param
                param = data[i + 1] if i + 1 < len(data) else 0
                tokens.append((token_name, param, i))
                i += 2

            elif opcode == Token.COLOR:
                # COLOR: 4 bytes param
                color = int.from_bytes(data[i+1:i+5], 'little') if i + 4 < len(data) else 0
                tokens.append((token_name, f"#{color:08X}", i))
                i += 5

            elif opcode == Token.RECT:
                # RECT: x(2) + y(2) + w(2) + h(2) + color(4) = 14 bytes
                x = int.from_bytes(data[i+1:i+3], 'little', signed=True)
                y = int.from_bytes(data[i+3:i+5], 'little', signed=True)
                w = int.from_bytes(data[i+5:i+7], 'little')
                h = int.from_bytes(data[i+7:i+9], 'little')
                color = int.from_bytes(data[i+9:i+13], 'little') if i + 12 < len(data) else 0
                tokens.append((token_name, (x, y, w, h, f"#{color:08X}"), i))
                i += 13

            elif opcode == Token.TEXT:
                # TEXT: x(2) + y(2) + len(1) + chars + color(4)
                x = int.from_bytes(data[i+1:i+3], 'little', signed=True)
                y = int.from_bytes(data[i+3:i+5], 'little', signed=True)
                length = data[i+5] if i + 5 < len(data) else 0
                text = data[i+6:i+6+length].decode('utf-8', errors='replace') if i + 6 + length <= len(data) else ""
                tokens.append((token_name, (x, y, f'"{text}"'), i))
                i += 6 + length + 4  # +4 for color

            elif opcode == Token.LISTEN:
                # LISTEN: 1-2 bytes param
                radius = data[i + 1] if i + 1 < len(data) else 0
                tokens.append((token_name, radius, i))
                i += 2

            elif opcode == Token.FREEZE:
                tokens.append((token_name, None, i))
                i += 1

            elif opcode == Token.MOVE:
                x = int.from_bytes(data[i+1:i+3], 'little', signed=True)
                y = int.from_bytes(data[i+3:i+5], 'little', signed=True)
                tokens.append((token_name, (x, y), i))
                i += 5

            else:
                # Unknown token, skip 1 byte
                tokens.append((token_name, "?", i))
                i += 1

        return tokens


# =============================================================================
# APP LOADER
# =============================================================================

class AppLoader:
    """
    Load atomic apps into the running system.

    Injects app hex into frame buffer at correct position.
    The HexLogicRunner then executes them.
    """

    def __init__(self, buffer: bytearray, width: int, height: int):
        self.buffer = buffer
        self.width = width
        self.height = height
        self.loaded_apps: List[AtomicApp] = []

    def load_app(self, app: AtomicApp, inject_at: int = None) -> bool:
        """
        Load an app into the system.

        Args:
            app: AtomicApp to load
            inject_at: Position in buffer to inject (None = append to end)

        Returns:
            True if loaded successfully
        """
        if inject_at is None:
            # Find next free position in buffer
            inject_at = len(self.buffer) - len(app.bytes_data)
            if inject_at < 0:
                return False

        # Inject app bytes
        for i, byte in enumerate(app.bytes_data):
            if inject_at + i < len(self.buffer):
                self.buffer[inject_at + i] = byte

        self.loaded_apps.append(app)
        return True

    def load_all_apps(self, start_offset: int = 0) -> int:
        """
        Load all atomic apps sequentially.

        Returns:
            Total bytes loaded
        """
        total = 0
        offset = start_offset

        for name, hex_str, position in ALL_APPS:
            app = AppParser.parse_hex(hex_str, name, position)
            if self.load_app(app, offset):
                print(f"Loaded: {app.name} @ buffer[{offset}] ({app.size} bytes)")
                offset += app.size
                total += app.size

        return total

    def get_app_map(self) -> str:
        """Generate map showing app positions"""
        lines = ["ATOMIC APP MAP", "=" * 40, ""]

        for app in self.loaded_apps:
            x, y = app.position
            lines.append(f"{app.name:12} @ ({x:4}, {y:4}) - {app.size:3} bytes")

            # Show first few tokens
            for token in app.tokens[:5]:
                lines.append(f"    {token[0]}: {token[1]}")

            if len(app.tokens) > 5:
                lines.append(f"    ... ({len(app.tokens) - 5} more)")

            lines.append("")

        return "\n".join(lines)


# =============================================================================
# INTEGRATION WITH HEX LOGIC RUNNER
# =============================================================================

def create_loaded_system(width: int = 1920, height: int = 1080) -> tuple:
    """
    Create a fully loaded system with all atomic apps.

    Returns:
        (buffer, loader, runner)
    """
    from hex_logic_runner import HexLogicRunner

    # Create buffer
    buffer = bytearray(width * height * 4)

    # Create loader and load apps
    loader = AppLoader(buffer, width, height)
    loader.load_all_apps(start_offset=0)

    # Create runner
    runner = HexLogicRunner(buffer, width, height)

    return buffer, loader, runner


# =============================================================================
# DEMO
# =============================================================================

def demo():
    print("=" * 50)
    print("ATOMIC APP LOADER")
    print("=" * 50)
    print()

    # Parse and display each app
    for name, hex_str, position in ALL_APPS:
        app = AppParser.parse_hex(hex_str, name, position)

        print(f"App: {app.name}")
        print(f"  Position: {app.position}")
        print(f"  Size: {app.size} bytes")
        print(f"  Hex: {app.hex_string[:40]}...")
        print(f"  Tokens ({len(app.tokens)}):")

        for token in app.tokens:
            print(f"    {token[0]}: {token[1]}")

        print()

    # Total size
    total = sum(len(bytes.fromhex(h)) for _, h, _ in ALL_APPS)
    print(f"Total: {len(ALL_APPS)} apps, {total} bytes")

    # Load into system
    print()
    print("=" * 50)
    print("LOADING INTO SYSTEM")
    print("=" * 50)

    buffer = bytearray(1920 * 1080 * 4)
    loader = AppLoader(buffer, 1920, 1080)
    loaded = loader.load_all_apps(start_offset=0)

    print(f"\nLoaded {loaded} bytes into buffer")
    print()
    print(loader.get_app_map())


if __name__ == "__main__":
    demo()
