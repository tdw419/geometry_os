#!/usr/bin/env python3
"""
LLM Mirror Bridge - Direct Neural Link from LM Studio to Frame Buffer

Pipes LLM token stream directly into Geometry Bonds and squirts to /dev/fb0.

Architecture:
  LM Studio (localhost:1234) → Token Stream → Geometry Bonds → /dev/fb0 → RTX 5090

Usage:
    python3 llm_mirror_bridge.py --prompt "Draw a rectangle at origin"
    python3 llm_mirror_bridge.py --stream  # Interactive mode
"""

import os
import sys
import json
import time
import mmap
import argparse
from pathlib import Path

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent))

try:
    import requests
    REQUESTS_AVAILABLE = True
except ImportError:
    REQUESTS_AVAILABLE = False
    print("Warning: requests not installed. Run: pip install requests")

from integrations.openspec.geometry_bridge import GeometryBridge

# Configuration
LM_STUDIO_URL = "http://localhost:1234/v1/chat/completions"
FB_DEVICE = "/dev/fb0"
DEFAULT_MODEL = "local-model"


class LLMMirrorBridge:
    """
    Direct Neural Link: LLM → Geometry Bonds → Frame Buffer
    
    The LLM's "thoughts" become visual geometry on the Infinite Map.
    """
    
    def __init__(self, fb_device: str = FB_DEVICE, width: int = 2560, height: int = 1600):
        self.bridge = GeometryBridge(width=width, height=height)
        self.fb_device = fb_device
        self.fb_fd = None
        self.fb_mmap = None
        self.y_offset = 0  # Scrolling position
        self.token_count = 0
    
    def open_framebuffer(self) -> bool:
        """Open frame buffer for direct injection"""
        try:
            self.fb_fd = os.open(self.fb_device, os.O_RDWR)
            self.fb_mmap = mmap.mmap(self.fb_fd, 0)
            return True
        except PermissionError:
            print(f"Permission denied: {self.fb_device}")
            print("Run with sudo or add user to 'video' group")
            return False
        except FileNotFoundError:
            print(f"Device not found: {self.fb_device}")
            return False
    
    def close_framebuffer(self):
        """Close frame buffer"""
        if self.fb_mmap:
            self.fb_mmap.close()
        if self.fb_fd:
            os.close(self.fb_fd)
    
    def token_to_bonds(self, token: str) -> bytes:
        """
        Convert LLM token to Geometry Bonds.
        
        If token looks like a command (RECT, MOVE, COLOR), parse it.
        Otherwise, render as TEXT.
        """
        # Check if token is a geometry command
        token_upper = token.strip().upper()
        
        if token_upper.startswith(('RECT', 'CIRC', 'MOVE', 'COLOR', 'TEXT')):
            # Try to parse as geometry spec
            try:
                spec_text = f"H: {token}\nT: llm_mirror_bridge.py\nM: rendered\nB: 1"
                bonds = self.bridge.spec_to_canvas(self.bridge.parse(spec_text), 0, self.y_offset)
                return bonds
            except:
                pass
        
        # Default: render as TEXT token
        bonds = bytearray()
        
        # MOVE to current position
        bonds.append(0x80)  # MOVE
        bonds.extend((0).to_bytes(2, 'little', signed=True))
        bonds.extend((self.y_offset).to_bytes(2, 'little', signed=True))
        
        # COLOR (cyan for LLM output)
        bonds.append(0x89)  # COLOR
        bonds.extend([0, 255, 255, 255])  # RGBA
        
        # TEXT with token
        bonds.append(0x86)  # TEXT
        token_bytes = token.encode('utf-8')[:255]
        bonds.append(len(token_bytes))
        bonds.extend(token_bytes)
        
        # Advance y_offset for next token (scrolling)
        self.y_offset += 1
        if self.y_offset > 1000:  # Reset after 1000 lines
            self.y_offset = 0
        
        return bytes(bonds)
    
    def squirt_to_buffer(self, bonds: bytes, offset: int = 0):
        """Write bonds directly to frame buffer"""
        if self.fb_mmap:
            self.fb_mmap.seek(offset)
            self.fb_mmap.write(bonds)
            self.fb_mmap.flush()
    
    def stream_to_buffer(self, prompt: str, model: str = DEFAULT_MODEL):
        """
        Stream LLM response directly to frame buffer.
        
        Each token becomes a Geometry Bond sequence.
        """
        if not REQUESTS_AVAILABLE:
            print("Error: requests library required")
            return
        
        print("=" * 60)
        print("LLM MIRROR BRIDGE - DIRECT NEURAL LINK")
        print("=" * 60)
        print(f"Target: {self.fb_device}")
        print(f"Model: {model}")
        print(f"Prompt: {prompt[:50]}...")
        print()
        
        payload = {
            "model": model,
            "messages": [{"role": "user", "content": prompt}],
            "stream": True
        }
        
        try:
            response = requests.post(LM_STUDIO_URL, json=payload, stream=True, timeout=60)
            
            if response.status_code != 200:
                print(f"Error: LM Studio returned {response.status_code}")
                return
            
            print("--- STREAMING TO BUFFER ---")
            
            for line in response.iter_lines():
                if line:
                    chunk = line.decode('utf-8').replace('data: ', '')
                    
                    if chunk == '[DONE]':
                        break
                    
                    try:
                        data = json.loads(chunk)
                        token = data['choices'][0]['delta'].get('content', '')
                        
                        if token:
                            # Convert token to bonds
                            bonds = self.token_to_bonds(token)
                            
                            # Squirt to buffer
                            self.squirt_to_buffer(bonds)
                            
                            self.token_count += 1
                            print(f"Token {self.token_count}: {token[:30]}...", end='\r')
                    
                    except json.JSONDecodeError:
                        continue
                    except Exception as e:
                        print(f"Error: {e}")
                        continue
            
            print()
            print("--- STREAM COMPLETE ---")
            print(f"Total tokens: {self.token_count}")
            
        except requests.exceptions.ConnectionError:
            print(f"Error: Cannot connect to LM Studio at {LM_STUDIO_URL}")
            print("Make sure LM Studio is running with local server enabled")
        except Exception as e:
            print(f"Error: {e}")
    
    def test_connection(self) -> bool:
        """Test connection to LM Studio"""
        if not REQUESTS_AVAILABLE:
            print("Error: requests library required")
            return False
        
        try:
            response = requests.get("http://localhost:1234/v1/models", timeout=5)
            if response.status_code == 200:
                models = response.json()
                print("✓ LM Studio connection successful")
                print(f"  Available models: {models.get('data', [])}")
                return True
        except:
            pass
        
        print("✗ LM Studio not reachable at localhost:1234")
        print("  Start LM Studio and enable local server")
        return False
    
    def demo_virtual(self, prompt: str):
        """Demo mode without hardware access"""
        print("=" * 60)
        print("LLM MIRROR BRIDGE - VIRTUAL DEMO MODE")
        print("=" * 60)
        
        # Simulate token stream
        simulated_tokens = [
            "RECT", " ", "100", " ", "100", " ", "50", " ", "50", "\n",
            "COLOR", " ", "0", " ", "255", " ", "0", "\n",
            "TEXT", " ", "Hello from LLM!", "\n",
            "MOVE", " ", "200", " ", "200", "\n",
        ]
        
        print(f"Simulating stream for: {prompt[:50]}...")
        print()
        
        for i, token in enumerate(simulated_tokens):
            bonds = self.token_to_bonds(token)
            print(f"Token {i+1}: '{token}' → {len(bonds)} bytes")
            time.sleep(0.1)
        
        print()
        print(f"Demo complete. Total tokens: {len(simulated_tokens)}")


def main():
    parser = argparse.ArgumentParser(description="LLM Mirror Bridge - Direct Neural Link to Frame Buffer")
    parser.add_argument("--prompt", "-p", type=str, help="Prompt to send to LLM")
    parser.add_argument("--stream", "-s", action="store_true", help="Interactive streaming mode")
    parser.add_argument("--demo", "-d", action="store_true", help="Virtual demo mode (no hardware)")
    parser.add_argument("--test", "-t", action="store_true", help="Test LM Studio connection")
    parser.add_argument("--model", "-m", type=str, default=DEFAULT_MODEL, help="Model name")
    
    args = parser.parse_args()
    
    bridge = LLMMirrorBridge()
    
    if args.test:
        bridge.test_connection()
    elif args.demo:
        bridge.demo_virtual(args.prompt or "Draw a rectangle")
    elif args.prompt:
        if bridge.open_framebuffer():
            try:
                bridge.stream_to_buffer(args.prompt, args.model)
            finally:
                bridge.close_framebuffer()
    elif args.stream:
        print("Interactive streaming mode")
        print("Type prompts (Ctrl+C to exit):")
        print()
        
        if bridge.open_framebuffer():
            try:
                while True:
                    try:
                        prompt = input("Prompt: ")
                        if prompt.strip():
                            bridge.stream_to_buffer(prompt, args.model)
                    except KeyboardInterrupt:
                        break
            finally:
                bridge.close_framebuffer()
    else:
        parser.print_help()


if __name__ == "__main__":
    main()
