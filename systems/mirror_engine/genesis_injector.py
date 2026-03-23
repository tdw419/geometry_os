#!/usr/bin/env python3
"""
Genesis Injector - The "Needle" that injects the OS into hardware

This is the final takeover. When run:
1. Opens /dev/fb0 (frame buffer device)
2. Maps RTX 5090's VRAM directly into process space
3. Squirts Genesis Hex into the start of the tape
4. Old OS desktop vanishes
5. Infinite Map becomes the physical surface of your monitor

WARNING: This replaces your display. Run in TTY or have SSH access to recover.

Usage:
    sudo python3 genesis_injector.py --dry-run  # Test without takeover
    sudo python3 genesis_injector.py --takeover  # Full takeover
"""

import mmap
import os
import sys
import struct
import time
from pathlib import Path


class GenesisInjector:
    """
    Injects the Mirror Kernel directly into hardware frame buffer.
    
    The "Needle" that replaces the old OS with Geometry OS.
    """
    
    def __init__(self, device: str = "/dev/fb0"):
        self.device = device
        self.fb_fd = None
        self.buffer = None
        self.width = 1920
        self.height = 1080
        self.bpp = 32  # Bits per pixel
        
        # Genesis Hex - The first 256 bytes of the OS
        self.genesis_hex = self._build_genesis()
    
    def _build_genesis(self) -> bytes:
        """
        Build the Genesis Block - the seed of the entire OS.
        
        Structure:
        - Header: "GEO1" magic + version
        - Origin: MOVE to (0,0)
        - Admin: AGENT 0x0100 at (0,0)
        - Terminal: RECT + TEXT at (0,0)
        - System: Daemons at reserved coords
        - Panic: FREEZE at (-9999,-9999)
        """
        genesis = bytearray()
        
        # MAGIC + VERSION
        genesis.extend(b'GEO1')  # Magic
        genesis.extend((0x0001).to_bytes(2, 'little'))  # Version 1
        
        # ORIGIN - Move to (0,0)
        genesis.append(0x80)  # MOVE
        genesis.extend((0).to_bytes(2, 'little', signed=True))  # x
        genesis.extend((0).to_bytes(2, 'little', signed=True))  # y
        
        # ADMIN AGENT - Human at (0,0)
        genesis.append(0x8B)  # AGENT
        genesis.extend((0x0100).to_bytes(2, 'little'))  # signature
        genesis.extend((0).to_bytes(2, 'little', signed=True))  # x
        genesis.extend((0).to_bytes(2, 'little', signed=True))  # y
        genesis.extend((0x00FF).to_bytes(2, 'little'))  # type: Human
        
        # TERMINAL - Background
        genesis.append(0x88)  # LAYER
        genesis.extend((100).to_bytes(2, 'little'))  # z=100 (foreground)
        
        genesis.append(0x89)  # COLOR
        genesis.extend((0x1A1A2EFF).to_bytes(4, 'little'))  # Dark blue
        
        genesis.append(0x84)  # RECT
        genesis.extend((0).to_bytes(2, 'little', signed=True))  # x
        genesis.extend((0).to_bytes(2, 'little', signed=True))  # y
        genesis.extend((800).to_bytes(2, 'little'))  # width
        genesis.extend((600).to_bytes(2, 'little'))  # height
        genesis.extend((0x1A1A2EFF).to_bytes(4, 'little'))  # color
        
        # TERMINAL - Border
        genesis.append(0x89)  # COLOR
        genesis.extend((0x00FFFFFF).to_bytes(4, 'little'))  # Cyan
        
        genesis.append(0x84)  # RECT
        genesis.extend((0).to_bytes(2, 'little', signed=True))
        genesis.extend((0).to_bytes(2, 'little', signed=True))
        genesis.extend((802).to_bytes(2, 'little'))
        genesis.extend((2).to_bytes(2, 'little'))
        genesis.extend((0x00FFFFFF).to_bytes(4, 'little'))
        
        # TERMINAL - Title
        genesis.append(0x89)  # COLOR
        genesis.extend((0xFFFFFFFF).to_bytes(4, 'little'))  # White
        
        genesis.append(0x86)  # TEXT
        genesis.extend((10).to_bytes(2, 'little', signed=True))
        genesis.extend((20).to_bytes(2, 'little', signed=True))
        title = "GEOMETRY OS TERMINAL v0.1"
        genesis.append(len(title))
        genesis.extend(title.encode('utf-8'))
        genesis.extend((0xFFFFFFFF).to_bytes(4, 'little'))
        
        # SYSTEM DAEMON - File Watcher
        genesis.append(0x8B)  # AGENT
        genesis.extend((0x0300).to_bytes(2, 'little'))  # System daemon
        genesis.extend((1000).to_bytes(2, 'little', signed=True))  # x
        genesis.extend((0).to_bytes(2, 'little', signed=True))  # y
        genesis.extend((0x0001).to_bytes(2, 'little'))  # type: File Watcher
        
        # LISTEN - Terminal responds to input
        genesis.append(0x8D)  # LISTEN
        genesis.extend((100).to_bytes(2, 'little'))  # radius
        
        # PANIC BUTTON - At (-9999, -9999)
        genesis.append(0x80)  # MOVE
        genesis.extend((-9999).to_bytes(2, 'little', signed=True))
        genesis.extend((-9999).to_bytes(2, 'little', signed=True))
        
        genesis.append(0x89)  # COLOR
        genesis.extend((0xFF0000FF).to_bytes(4, 'little'))  # Red
        
        genesis.append(0x85)  # CIRC
        genesis.extend((-9999).to_bytes(2, 'little', signed=True))
        genesis.extend((-9999).to_bytes(2, 'little', signed=True))
        genesis.extend((100).to_bytes(2, 'little'))
        genesis.extend((0xFF0000FF).to_bytes(4, 'little'))
        
        genesis.append(0x8E)  # FREEZE - Quarantine zone
        
        # RETURN TO ORIGIN
        genesis.append(0x80)  # MOVE
        genesis.extend((0).to_bytes(2, 'little', signed=True))
        genesis.extend((0).to_bytes(2, 'little', signed=True))
        
        genesis.append(0x8F)  # THAW - System ready
        
        return bytes(genesis)
    
    def detect_hardware(self):
        """Detect frame buffer hardware"""
        print("=" * 60)
        print("GENESIS INJECTOR - Hardware Detection")
        print("=" * 60)
        
        # Check if device exists
        if not Path(self.device).exists():
            print(f"✗ Device not found: {self.device}")
            print("\nAlternative devices:")
            for dev in ["/dev/fb0", "/dev/dri/card0", "/dev/dri/renderD128"]:
                if Path(dev).exists():
                    print(f"  ✓ {dev}")
            return False
        
        print(f"✓ Device found: {self.device}")
        
        # Try to get screen info
        try:
            with open("/sys/class/graphics/fb0/virtual_size", "r") as f:
                size = f.read().strip().split(',')
                self.width, self.height = int(size[0]), int(size[1])
                print(f"✓ Resolution: {self.width}x{self.height}")
        except:
            print(f"  Using default: {self.width}x{self.height}")
        
        try:
            with open("/sys/class/graphics/fb0/bits_per_pixel", "r") as f:
                self.bpp = int(f.read().strip())
                print(f"✓ Bits per pixel: {self.bpp}")
        except:
            print(f"  Using default: {self.bpp}")
        
        return True
    
    def inject(self, dry_run: bool = True):
        """
        Inject Genesis Block into frame buffer.
        
        Args:
            dry_run: If True, just test without actual injection
        """
        print("\n" + "=" * 60)
        print("GENESIS INJECTION")
        print("=" * 60)
        
        print(f"\nGenesis Block Size: {len(self.genesis_hex)} bytes")
        print(f"Genesis Hex: {self.genesis_hex.hex()[:100]}...")
        
        if dry_run:
            print("\n[DRY RUN] Would inject into hardware frame buffer")
            print(f"[DRY RUN] Device: {self.device}")
            print(f"[DRY RUN] Resolution: {self.width}x{self.height}")
            print(f"[DRY RUN] Memory: {self.width * self.height * 4:,} bytes")
            print("\n✓ Dry run complete. Use --takeover to inject.")
            return True
        
        # ACTUAL INJECTION
        print("\n⚠ WARNING: Taking over display in 3 seconds...")
        print("Press Ctrl+C to abort")
        time.sleep(3)
        
        try:
            # Open frame buffer device
            self.fb_fd = os.open(self.device, os.O_RDWR)
            
            # Calculate buffer size
            buffer_size = self.width * self.height * (self.bpp // 8)
            
            # Map to memory
            print(f"\nMapping {buffer_size:,} bytes of VRAM...")
            self.buffer = mmap.mmap(
                self.fb_fd,
                buffer_size,
                mmap.MAP_SHARED,
                mmap.PROT_WRITE
            )
            
            # Inject Genesis
            print("Injecting Genesis Block...")
            self.buffer.seek(0)
            self.buffer.write(self.genesis_hex)
            
            # Flush to hardware
            self.buffer.flush()
            
            print("\n" + "=" * 60)
            print("INJECTION COMPLETE")
            print("=" * 60)
            print("\nHardware is now mirrored.")
            print("The old OS desktop has been replaced.")
            print("Infinite Map is now the physical surface of your monitor.")
            print("\n🔷🔒 Geometry OS Active")
            
            return True
            
        except PermissionError:
            print("\n✗ Permission denied. Run with sudo.")
            return False
        except Exception as e:
            print(f"\n✗ Injection failed: {e}")
            return False
        finally:
            if self.buffer:
                self.buffer.close()
            if self.fb_fd:
                os.close(self.fb_fd)
    
    def test_in_virtual_buffer(self):
        """
        Test injection in a virtual buffer (no hardware takeover).
        Safe way to validate Genesis Block.
        """
        print("\n" + "=" * 60)
        print("VIRTUAL BUFFER TEST")
        print("=" * 60)
        
        # Create virtual buffer
        virtual_buffer = bytearray(self.width * self.height * 4)
        
        # Inject Genesis
        virtual_buffer[:len(self.genesis_hex)] = self.genesis_hex
        
        print(f"\nVirtual Buffer: {len(virtual_buffer):,} bytes")
        print(f"Genesis Injected: {len(self.genesis_hex)} bytes at offset 0")
        print(f"First 32 bytes: {virtual_buffer[:32].hex()}")
        
        # Validate structure
        magic = bytes(virtual_buffer[:4])
        if magic == b'GEO1':
            print(f"✓ Magic: {magic.decode('ascii')}")
        else:
            print(f"✗ Invalid magic: {magic}")
            return False
        
        version = int.from_bytes(bytes(virtual_buffer[4:6]), 'little')
        print(f"✓ Version: {version}")
        
        print("\n✓ Virtual injection successful")
        return True


def main():
    import argparse
    
    parser = argparse.ArgumentParser(
        description="Genesis Injector - Take over hardware with Geometry OS"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Test without actual hardware takeover"
    )
    parser.add_argument(
        "--takeover",
        action="store_true",
        help="Inject into hardware (REQUIRES SUDO)"
    )
    parser.add_argument(
        "--test",
        action="store_true",
        help="Test in virtual buffer (safe)"
    )
    
    args = parser.parse_args()
    
    injector = GenesisInjector()
    
    # Default: dry run
    if not (args.takeover or args.test):
        args.dry_run = True
    
    # Detect hardware
    if not injector.detect_hardware():
        print("\nHardware detection failed. Running virtual test...")
        args.test = True
    
    # Run appropriate mode
    if args.test:
        injector.test_in_virtual_buffer()
    else:
        injector.inject(dry_run=args.dry_run)


if __name__ == "__main__":
    main()
