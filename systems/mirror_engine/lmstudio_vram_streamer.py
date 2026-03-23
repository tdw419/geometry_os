#!/usr/bin/env python3
"""
LM Studio VRAM Streamer - Direct LLM Token Injection to Frame Buffer

Pipes LLM tokens → /dev/fb0 for real-time visualization.
Every token becomes a pixel pattern on the infinite map.

Usage:
    sudo python3 lmstudio_vram_streamer.py --prompt "Draw a spiral"
    sudo python3 lmstudio_vram_streamer.py --interactive
"""

import os
import sys
import mmap
import struct
import argparse
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent))

try:
    import requests
except ImportError:
    print("Install: pip install requests")
    sys.exit(1)

# =============================================================================
# CONFIGURATION
# =============================================================================

LM_STUDIO_URL = "http://localhost:1234/v1/chat/completions"
FB_DEVICE = "/dev/fb0"
DEFAULT_MODEL = "local-model"

# Frame buffer defaults (adjust for your display)
FB_WIDTH = 2560
FB_HEIGHT = 1600
FB_BPP = 32  # Bits per pixel

# Token rendering settings
TOKEN_X_START = 10
TOKEN_Y_START = 10
TOKEN_LINE_HEIGHT = 20
MAX_LINES = FB_HEIGHT // TOKEN_LINE_HEIGHT

# Color palette for token types
COLORS = {
    "default": (64, 224, 208, 255),  # Cyan
    "command": (255, 105, 97, 255),  # Tomato red
    "number": (255, 215, 0, 255),  # Gold
    "string": (144, 238, 144, 255),  # Light green
    "keyword": (219, 112, 147, 255),  # Pink
}

# =============================================================================
# TOKEN CLASSIFIER
# =============================================================================


class TokenClassifier:
    """Classify tokens for color-coded rendering."""

    COMMANDS = {"RECT", "CIRC", "MOVE", "COLOR", "TEXT", "LINE", "FILL", "CLEAR"}
    KEYWORDS = {"def", "class", "if", "else", "for", "while", "return", "import"}

    @classmethod
    def classify(cls, token: str) -> str:
        """Return color key for token."""
        t = token.strip()

        if t.upper() in cls.COMMANDS:
            return "command"
        if t in cls.KEYWORDS:
            return "keyword"
        if t.isdigit() or (t.startswith("-") and t[1:].isdigit()):
            return "number"
        if t.startswith('"') or t.startswith("'"):
            return "string"

        return "default"


# =============================================================================
# VRAM STREAMER
# =============================================================================


class LMStudioVRamStreamer:
    """
    Direct LLM → Frame Buffer pipeline.

    Architecture:
        LM Studio (127.0.0.1:1234) → Token Stream → /dev/fb0 → Display
    """

    def __init__(self, fb_device: str = FB_DEVICE):
        self.fb_device = fb_device
        self.fb_fd = None
        self.fb_mmap = None

        # Frame buffer properties (read from device)
        self.width = 0
        self.height = 0
        self.bpp = 0
        self.line_length = 0

        # Rendering state
        self.current_x = TOKEN_X_START
        self.current_y = TOKEN_Y_START
        self.token_count = 0
        self.wrap_x = FB_WIDTH - 50  # Wrap before right edge

    def open_framebuffer(self) -> bool:
        """Open /dev/fb0 for direct memory access."""
        try:
            print(f"Opening {self.fb_device}...")
            self.fb_fd = os.open(self.fb_device, os.O_RDWR)

            # Get framebuffer info via ioctl
            import fcntl
            import ctypes

            # FBIOGET_VSCREENINFO structure
            class fb_var_screeninfo(ctypes.Structure):
                _fields_ = [
                    ("xres", ctypes.c_uint32),
                    ("yres", ctypes.c_uint32),
                    ("xres_virtual", ctypes.c_uint32),
                    ("yres_virtual", ctypes.c_uint32),
                    ("xoffset", ctypes.c_uint16),
                    ("yoffset", ctypes.c_uint16),
                    ("bits_per_pixel", ctypes.c_uint16),
                    ("grayscale", ctypes.c_uint8),
                    ("red", fb_bitfield),
                    ("green", fb_bitfield),
                    ("blue", fb_bitfield),
                    ("transp", fb_bitfield),
                ]

            class fb_bitfield(ctypes.Structure):
                _fields_ = [
                    ("offset", ctypes.c_uint32),
                    ("length", ctypes.c_uint32),
                    ("msb_right", ctypes.c_uint32),
                    ("nonlinear", ctypes.c_uint32),
                ]

            # FBIOGET_FSCREENINFO structure
            class fb_fix_screeninfo(ctypes.Structure):
                _fields_ = [
                    ("id", (ctypes.c_char * 16)),
                    ("smem_start", ctypes.c_uint64),
                    ("smem_len", ctypes.c_uint32),
                    ("type", ctypes.c_uint32),
                    ("visual", ctypes.c_uint32),
                    ("xpanstep", ctypes.c_uint16),
                    ("ypanstep", ctypes.c_uint16),
                    ("ywrapstep", ctypes.c_uint16),
                    ("line_length", ctypes.c_uint32),
                ]

            # Get fixed info
            fix_info = fb_fix_screeninfo()
            fcntl.ioctl(self.fb_fd, 0x4600, fix_info)  # FBIOGET_FSCREENINFO

            # Get variable info
            var_info = fb_var_screeninfo()
            fcntl.ioctl(self.fb_fd, 0x4602, var_info)  # FBIOGET_VSCREENINFO

            self.width = var_info.xres
            self.height = var_info.yres
            self.bpp = var_info.bits_per_pixel
            self.line_length = fix_info.smem_len // self.height

            print(f"✓ Framebuffer opened: {self.width}x{self.height}@{self.bpp}bpp")
            print(f"  Line length: {self.line_length} bytes")

            # Memory map the framebuffer
            self.fb_mmap = mmap.mmap(self.fb_fd, fix_info.smem_len)

            return True

        except PermissionError:
            print("✗ Permission denied. Run with sudo or add user to 'video' group.")
            return False
        except FileNotFoundError:
            print(f"✗ Device not found: {self.fb_device}")
            print("  Check if framebuffer is available (e.g., /dev/fb0)")
            return False
        except Exception as e:
            print(f"✗ Error opening framebuffer: {e}")
            return False

    def close_framebuffer(self):
        """Close framebuffer resources."""
        if self.fb_mmap:
            self.fb_mmap.close()
        if self.fb_fd is not None:
            os.close(self.fb_fd)
        print("Framebuffer closed.")

    def clear_screen(self, color: tuple = (0, 0, 0)):
        """Clear entire screen to a solid color."""
        r, g, b = color
        # Fill with BGRA (little-endian)
        pixel = bytes([b, g, r, 255])
        self.fb_mmap.seek(0)
        self.fb_mmap.write(pixel * self.width * self.height)
        self.fb_mmap.flush()

    def draw_pixel(self, x: int, y: int, color: tuple):
        """Draw a single pixel at (x, y)."""
        if x < 0 or x >= self.width or y < 0 or y >= self.height:
            return

        r, g, b, a = color[:4] if len(color) == 4 else (*color, 255)
        offset = y * self.line_length + x * (self.bpp // 8)

        # Write BGRA
        self.fb_mmap.seek(offset)
        self.fb_mmap.write(bytes([b, g, r, a]))

    def draw_text_pixelated(self, text: str, x: int, y: int, color: tuple):
        """
        Draw text using simple pixel pattern.
        Each character is rendered as a block of pixels.
        """
        char_width = 12
        char_height = 18

        for i, char in enumerate(text):
            px = x + (i * char_width)
            py = y

            # Simple block rendering: fill a rectangle for each char
            if ord(char) > 32:  # Skip whitespace
                for dy in range(char_height):
                    for dx in range(char_width - 2):  # Leave spacing
                        self.draw_pixel(px + dx, py + dy, color)

    def render_token(self, token: str):
        """
        Render a single LLM token to the framebuffer.
        """
        # Classify token for color
        color_key = TokenClassifier.classify(token)
        color = COLORS[color_key]

        # Check if we need to wrap
        token_width = len(token) * 12
        if self.current_x + token_width > self.wrap_x:
            self.current_x = TOKEN_X_START
            self.current_y += TOKEN_LINE_HEIGHT

        # Check if we need to scroll (clear old lines)
        if self.current_y >= TOKEN_Y_START + MAX_LINES * TOKEN_LINE_HEIGHT:
            print("Scrolling...")
            self.clear_screen((0, 0, 0))
            self.current_y = TOKEN_Y_START

        # Draw the token
        self.draw_text_pixelated(token, self.current_x, self.current_y, color)

        # Advance position
        self.current_x += len(token) * 12
        if token.endswith(" "):
            self.current_x += 12  # Extra space for whitespace

        self.token_count += 1

    def stream_from_lmstudio(self, prompt: str, model: str = DEFAULT_MODEL):
        """
        Stream tokens from LM Studio and render to framebuffer.
        """
        print("=" * 60)
        print("LM STUDIO VRAM STREAMER")
        print("=" * 60)
        print(f"Target: {self.fb_device}")
        print(f"Resolution: {self.width}x{self.height}")
        print(f"Model: {model}")
        print(f"Prompt: {prompt[:60]}...")
        print()

        # Clear screen first
        self.clear_screen((0, 0, 0))

        payload = {
            "model": model,
            "messages": [
                {
                    "role": "system",
                    "content": "You are a creative coding assistant. Output short, visual descriptions and code snippets.",
                },
                {"role": "user", "content": prompt},
            ],
            "stream": True,
            "max_tokens": 500,
        }

        try:
            response = requests.post(LM_STUDIO_URL, json=payload, stream=True, timeout=120)

            if response.status_code != 200:
                print(f"✗ LM Studio error: {response.status_code}")
                return

            print("--- STREAMING TOKENS TO VRAM ---")
            print()

            full_text = ""
            for line in response.iter_lines():
                if line:
                    try:
                        chunk = line.decode("utf-8")
                        if chunk.startswith("data: "):
                            data = json.loads(chunk[6:])
                            token = data.get("choices", [{}])[0].get("delta", {}).get("content", "")

                            if token:
                                full_text += token
                                self.render_token(token)
                                self.fb_mmap.flush()

                                # Progress indicator
                                print(
                                    f"\rTokens: {self.token_count} | Last: '{token[:20]}'",
                                    end="",
                                    flush=True,
                                )
                    except json.JSONDecodeError:
                        continue

            print()  # Newline after progress
            print()
            print("=" * 60)
            print(f"STREAM COMPLETE")
            print(f"Total tokens rendered: {self.token_count}")
            print(f"Output length: {len(full_text)} chars")

        except requests.exceptions.ConnectionError:
            print("✗ Cannot connect to LM Studio at localhost:1234")
            print("  Start LM Studio and enable local server.")
        except Exception as e:
            print(f"✗ Error: {e}")

    def test_connection(self) -> bool:
        """Test connection to LM Studio."""
        try:
            response = requests.get("http://localhost:1234/v1/models", timeout=5)
            if response.status_code == 200:
                models = response.json().get("data", [])
                print("✓ LM Studio connected")
                print(f"  Models: {[m['id'] for m in models]}")
                return True
        except Exception as e:
            pass

        print("✗ Cannot reach LM Studio at localhost:1234")
        return False

    def demo_mode(self):
        """Demo without actual LLM - renders sample tokens."""
        print("=" * 60)
        print("LM STUDIO VRAM STREAMER - DEMO MODE")
        print("=" * 60)

        self.clear_screen((10, 10, 20))

        demo_tokens = [
            "def",
            " spiral(n):",
            "for",
            " i",
            "in",
            "range(n):",
            "RECT",
            "(100+*i*,",
            "100+i*2,",
            "50,",
            "50)",
            "COLOR",
            "(255,",
            "100,",
            "50)",
        ]

        for token in demo_tokens:
            self.render_token(token)
            self.fb_mmap.flush()

        print(f"Demo complete. Rendered {self.token_count} tokens.")


# =============================================================================
# MAIN
# =============================================================================


def main():
    parser = argparse.ArgumentParser(
        description="LM Studio VRAM Streamer - Pipe LLM tokens to /dev/fb0"
    )
    parser.add_argument("--prompt", "-p", type=str, help="Prompt for LLM")
    parser.add_argument("--interactive", "-i", action="store_true", help="Interactive mode")
    parser.add_argument("--demo", "-d", action="store_true", help="Demo mode (no LLM)")
    parser.add_argument("--test", "-t", action="store_true", help="Test LM Studio connection")
    parser.add_argument("--model", "-m", type=str, default=DEFAULT_MODEL, help="Model name")
    parser.add_argument("--device", type=str, default=FB_DEVICE, help="Framebuffer device")

    args = parser.parse_args()

    streamer = LMStudioVRamStreamer(fb_device=args.device)

    if args.test:
        success = streamer.test_connection()
        sys.exit(0 if success else 1)

    elif args.demo:
        if streamer.open_framebuffer():
            try:
                streamer.demo_mode()
            finally:
                streamer.close_framebuffer()

    elif args.prompt:
        if streamer.open_framebuffer():
            try:
                streamer.stream_from_lmstudio(args.prompt, args.model)
            finally:
                streamer.close_framebuffer()

    elif args.interactive:
        print("Interactive mode (Ctrl+C to exit)")
        print()

        if streamer.open_framebuffer():
            try:
                while True:
                    prompt = input("Prompt: ").strip()
                    if not prompt:
                        continue
                    streamer.stream_from_lmstudio(prompt, args.model)
                    streamer.clear_screen((0, 0, 0))
                    streamer.current_x = TOKEN_X_START
                    streamer.current_y = TOKEN_Y_START
            except KeyboardInterrupt:
                print()
                print("Exiting...")
            finally:
                streamer.close_framebuffer()

    else:
        parser.print_help()
        print()
        print("Examples:")
        print("  sudo python3 lmstudio_vram_streamer.py --test")
        print("  sudo python3 lmstudio_vram_streamer.py --demo")
        print('  sudo python3 lmstudio_vram_streamer.py --prompt "Draw a fractal"')


if __name__ == "__main__":
    main()
