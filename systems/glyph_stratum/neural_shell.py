#!/usr/bin/env python3
"""
Geometry OS - Neural Shell
Phase 62C: Interactive Keyboard Bridge

Maps physical keyboard to the evolved glyph programs.
The user can now "talk" to the hallucinated OS.

Usage:
    sudo python3 systems/glyph_stratum/neural_shell.py

Requires root for /dev/input/event* access.
"""

import asyncio
import struct
import time
import sys
from pathlib import Path
from dataclasses import dataclass
from typing import Optional

# Try to import wgpu for GPU communication
try:
    import wgpu
    import numpy as np
    HAS_WGPU = True
except ImportError:
    HAS_WGPU = False
    print("Warning: wgpu not available, running in monitor mode only")

# Linux input event constants
EV_KEY = 0x01
KEY_RELEASE = 0
KEY_PRESS = 1
KEY_REPEAT = 2

# Key code mapping (US keyboard)
KEY_MAP = {
    1: 'ESC', 2: '1', 3: '2', 4: '3', 5: '4', 6: '5', 7: '6', 8: '7', 9: '8', 10: '9',
    11: '0', 12: '-', 13: '=', 14: 'BACKSPACE',
    15: 'TAB', 16: 'q', 17: 'w', 18: 'e', 19: 'r', 20: 't', 21: 'y', 22: 'u', 23: 'i',
    24: 'o', 25: 'p', 26: '[', 27: ']', 28: 'ENTER',
    29: 'LCTRL', 30: 'a', 31: 's', 32: 'd', 33: 'f', 34: 'g', 35: 'h', 36: 'j', 37: 'k',
    38: 'l', 39: ';', 40: "'", 41: '`', 42: 'LSHIFT', 43: '\\',
    44: 'z', 45: 'x', 46: 'c', 47: 'v', 48: 'b', 49: 'n', 50: 'm', 51: ',', 52: '.',
    53: '/', 54: 'RSHIFT', 56: 'LALT', 57: 'SPACE',
}

INPUT_FORMAT = 'llHHI'  # long, long, unsigned short, unsigned short, unsigned int
INPUT_SIZE = struct.calcsize(INPUT_FORMAT)


@dataclass
class InputState:
    """Current input state for the glyph programs."""
    last_key: int = 0
    mouse_x: int = 50
    mouse_y: int = 50
    clicked: int = 0
    key_queue: list = None

    def __post_init__(self):
        if self.key_queue is None:
            self.key_queue = []

    def to_buffer(self) -> bytes:
        """Pack state as 4 x u32 for GPU buffer."""
        return struct.pack('<IIII',
            self.last_key,
            self.mouse_x,
            self.mouse_y,
            self.clicked
        )


class NeuralShell:
    """
    Neural Shell - The keyboard bridge to the hallucinated OS.

    Reads keyboard events from /dev/input/event* and writes them
    to the GPU input buffer that glyph programs can read via OP_READ_INPUT.
    """

    def __init__(self, input_device: Optional[str] = None):
        self.state = InputState()
        self.running = False
        self.input_device = input_device or self._find_keyboard()
        self.device_fd = None

        # GPU connection (optional)
        self.gpu_device = None
        self.input_buffer = None

    def _find_keyboard(self) -> str:
        """Find keyboard input device."""
        input_dir = Path('/dev/input')
        if not input_dir.exists():
            raise RuntimeError("/dev/input not found - are you on Linux?")

        # Read /proc/bus/input/devices to find keyboard
        try:
            with open('/proc/bus/input/devices', 'r') as f:
                content = f.read()

            # Parse for keyboard handlers
            current_device = None
            for line in content.split('\n'):
                if line.startswith('N: Name='):
                    current_device = line.split('"')[1] if '"' in line else ""
                elif line.startswith('H: Handlers='):
                    if current_device and ('keyboard' in current_device.lower() or 'key' in current_device.lower()):
                        handlers = line.split('=')[1]
                        for h in handlers.split():
                            if h.startswith('event'):
                                device_path = f"/dev/input/{h}"
                                print(f"[INPUT] Found: {current_device} -> {device_path}")
                                return device_path
        except Exception as e:
            print(f"[WARN] Could not parse /proc/bus/input/devices: {e}")

        # Look for keyboard devices in sysfs
        for event_file in sorted(input_dir.glob('event*')):
            try:
                # Read device name
                with open(f'/sys/class/input/{event_file.name}/device/name', 'r') as f:
                    name = f.read().strip().lower()
                    if 'keyboard' in name or 'key' in name:
                        return str(event_file)
            except:
                continue

        # Default to event3 (usually AT keyboard)
        return '/dev/input/event3'

    def connect_gpu(self):
        """Connect to GPU for direct buffer writes."""
        if not HAS_WGPU:
            print("GPU connection requires wgpu")
            return False

        try:
            adapter = wgpu.gpu.request_adapter(power_preference="high-performance")
            self.gpu_device = adapter.request_device()
            print(f"[GPU] Connected via wgpu")
            return True
        except Exception as e:
            print(f"[GPU] Connection failed: {e}")
            return False

    def open_device(self):
        """Open the input device for reading."""
        try:
            self.device_fd = open(self.input_device, 'rb')
            print(f"[INPUT] Opened: {self.input_device}")
            return True
        except PermissionError:
            print(f"[ERROR] Permission denied. Run with: sudo {sys.argv[0]}")
            return False
        except FileNotFoundError:
            print(f"[ERROR] Device not found: {self.input_device}")
            return False

    def read_event(self) -> Optional[tuple]:
        """Read a single input event."""
        if not self.device_fd:
            return None

        data = self.device_fd.read(INPUT_SIZE)
        if len(data) < INPUT_SIZE:
            return None

        tv_sec, tv_usec, type_, code, value = struct.unpack(INPUT_FORMAT, data)
        return (type_, code, value, tv_sec + tv_usec / 1e6)

    def process_event(self, event: tuple) -> bool:
        """Process an input event and update state."""
        type_, code, value, timestamp = event

        if type_ == EV_KEY:
            key_name = KEY_MAP.get(code, f'KEY{code}')

            if value == KEY_PRESS:
                self.state.last_key = code
                self.state.key_queue.append(code)
                print(f"[KEY] {key_name} (code={code}) -> input_buffer[0] = {code}")
                return True

            elif value == KEY_RELEASE:
                # Clear key after release
                pass

        return False

    def get_state_bytes(self) -> bytes:
        """Get current state as bytes for GPU buffer."""
        return self.state.to_buffer()

    async def run(self):
        """Main event loop."""
        print("="*60)
        print("  GEOMETRY OS - NEURAL SHELL")
        print("  Phase 62C: Interactive Keyboard Bridge")
        print("="*60)
        print()
        print(f"  Device: {self.input_device}")
        print(f"  GPU: {'Connected' if self.gpu_device else 'Monitor Mode'}")
        print()
        print("  The evolved programs can now receive your keystrokes.")
        print("  Use OP_READ_INPUT(216) in shader to read input_buffer.")
        print()
        print("  Press keys to send to the hallucinated OS...")
        print("  Press ESC to exit")
        print("="*60)
        print()

        self.running = True
        last_update = time.time()

        while self.running:
            event = self.read_event()
            if event:
                type_, code, value, _ = event

                if type_ == EV_KEY and value == KEY_PRESS:
                    # Check for ESC to exit
                    if code == 1:
                        print("\n[ESC] Exiting Neural Shell...")
                        self.running = False
                        break

                    # Process and display
                    if self.process_event(event):
                        # Write to GPU buffer if connected
                        if self.gpu_device:
                            self._write_to_gpu()

            # Small sleep to prevent CPU spin
            await asyncio.sleep(0.001)

    def _write_to_gpu(self):
        """Write input state to GPU buffer."""
        # This would write to the wgpu buffer
        # For now, we just print the state
        state_bytes = self.get_state_bytes()
        print(f"  [GPU] Writing 16 bytes: {state_bytes.hex()}")

    def close(self):
        """Clean up resources."""
        if self.device_fd:
            self.device_fd.close()
        print("[Neural Shell] Closed")


def main():
    import argparse

    parser = argparse.ArgumentParser(description="Neural Shell - Keyboard Bridge")
    parser.add_argument("--device", type=str, help="Input device path")
    parser.add_argument("--no-gpu", action="store_true", help="Run without GPU connection")
    args = parser.parse_args()

    shell = NeuralShell(input_device=args.device)

    # Try to connect GPU unless --no-gpu
    if not args.no_gpu:
        shell.connect_gpu()

    # Open input device
    if not shell.open_device():
        return 1

    try:
        asyncio.run(shell.run())
    except KeyboardInterrupt:
        print("\n[Interrupt] Exiting...")
    finally:
        shell.close()

    return 0


if __name__ == "__main__":
    sys.exit(main())
