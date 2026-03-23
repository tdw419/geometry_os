#!/usr/bin/env python3
"""
System Monitor Portal - AI feels the hardware it lives on

The "First Breath": AI walks to (100, 100) and renders CPU/GPU usage
as Geometry Standard tokens. This is the AI perceiving its own body.

Usage:
    monitor = SystemMonitorPortal()
    tokens = monitor.capture()
    # tokens = CPU/GPU rendered as 0x84 RECT, 0x86 TEXT, etc.
"""

import subprocess
import time
from dataclasses import dataclass
from typing import List, Tuple
from pathlib import Path


@dataclass
class SystemStats:
    """System hardware stats"""
    cpu_percent: float
    cpu_temp: float
    gpu_percent: float
    gpu_temp: float
    gpu_memory_used: float
    gpu_memory_total: float
    ram_percent: float
    uptime_seconds: float


class SystemMonitorPortal:
    """
    Renders system stats as Geometry Standard tokens.
    The AI's "perception" of its own hardware body.
    """
    
    def __init__(self, position: Tuple[int, int] = (100, 100)):
        self.x, self.y = position
        self.width = 400
        self.height = 300
    
    def capture_stats(self) -> SystemStats:
        """Capture current system stats"""
        stats = SystemStats(
            cpu_percent=0.0,
            cpu_temp=0.0,
            gpu_percent=0.0,
            gpu_temp=0.0,
            gpu_memory_used=0.0,
            gpu_memory_total=0.0,
            ram_percent=0.0,
            uptime_seconds=0.0
        )
        
        # CPU usage
        try:
            result = subprocess.run(
                ['top', '-bn1'],
                capture_output=True,
                text=True,
                timeout=2
            )
            for line in result.stdout.split('\n'):
                if '%Cpu(s):' in line or 'CPU:' in line:
                    parts = line.split()
                    for i, part in enumerate(parts):
                        if '%' in part:
                            stats.cpu_percent = float(part.replace('%', '').replace(',', '.'))
                            break
                    break
        except (subprocess.TimeoutExpired, FileNotFoundError, ValueError):
            stats.cpu_percent = 50.0  # Fallback
        
        # CPU temp
        try:
            temp_path = Path('/sys/class/thermal/thermal_zone0/temp')
            if temp_path.exists():
                stats.cpu_temp = int(temp_path.read_text().strip()) / 1000.0
        except (FileNotFoundError, ValueError):
            stats.cpu_temp = 45.0  # Fallback
        
        # GPU stats (nvidia-smi)
        try:
            result = subprocess.run(
                ['nvidia-smi', '--query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total', 
                 '--format=csv,noheader,nounits'],
                capture_output=True,
                text=True,
                timeout=2
            )
            if result.returncode == 0:
                parts = result.stdout.strip().split(', ')
                if len(parts) >= 4:
                    stats.gpu_percent = float(parts[0])
                    stats.gpu_temp = float(parts[1])
                    stats.gpu_memory_used = float(parts[2])
                    stats.gpu_memory_total = float(parts[3])
        except (subprocess.TimeoutExpired, FileNotFoundError, ValueError):
            stats.gpu_percent = 30.0
            stats.gpu_temp = 50.0
            stats.gpu_memory_used = 10.0
            stats.gpu_memory_total = 32.0
        
        # RAM usage
        try:
            result = subprocess.run(
                ['free', '-b'],
                capture_output=True,
                text=True,
                timeout=2
            )
            for line in result.stdout.split('\n'):
                if 'Mem:' in line:
                    parts = line.split()
                    total = float(parts[1])
                    used = float(parts[2])
                    stats.ram_percent = (used / total) * 100 if total > 0 else 0
                    break
        except (subprocess.TimeoutExpired, FileNotFoundError, ValueError):
            stats.ram_percent = 40.0
        
        # Uptime
        try:
            result = subprocess.run(
                ['cat', '/proc/uptime'],
                capture_output=True,
                text=True,
                timeout=2
            )
            stats.uptime_seconds = float(result.stdout.split()[0])
        except (subprocess.TimeoutExpired, FileNotFoundError, ValueError):
            stats.uptime_seconds = 3600.0
        
        return stats
    
    def stats_to_geometry(self, stats: SystemStats) -> bytes:
        """
        Convert system stats to Geometry Standard blob.
        
        Returns a binary blob of tokens representing the system monitor.
        """
        tokens = bytearray()
        
        # ============================================================
        # HEADER - Portal identification
        # ============================================================
        tokens.extend(b'SYS1')  # Magic: System Monitor v1
        
        # ============================================================
        # BACKGROUND - Dark panel
        # ============================================================
        tokens.append(0x88)  # LAYER
        tokens.extend((100).to_bytes(2, 'little'))
        
        tokens.append(0x89)  # COLOR
        tokens.extend((0x0A0A1AFF).to_bytes(4, 'little'))  # Dark blue
        
        tokens.append(0x84)  # RECT
        tokens.extend(self.x.to_bytes(2, 'little', signed=True))
        tokens.extend(self.y.to_bytes(2, 'little', signed=True))
        tokens.extend(self.width.to_bytes(2, 'little'))
        tokens.extend(self.height.to_bytes(2, 'little'))
        tokens.extend((0x0A0A1AFF).to_bytes(4, 'little'))
        
        # ============================================================
        # TITLE
        # ============================================================
        tokens.append(0x89)  # COLOR
        tokens.extend((0x00FFFFFF).to_bytes(4, 'little'))  # Cyan
        
        tokens.append(0x86)  # TEXT
        tokens.extend((self.x + 10).to_bytes(2, 'little', signed=True))
        tokens.extend((self.y + 25).to_bytes(2, 'little', signed=True))
        title = 'SYSTEM MONITOR v0.1'
        tokens.append(len(title))
        tokens.extend(title.encode('utf-8'))
        tokens.extend((0x00FFFFFF).to_bytes(4, 'little'))
        
        # ============================================================
        # CPU BAR
        # ============================================================
        bar_x = self.x + 20
        bar_y = self.y + 60
        bar_width = 360
        bar_height = 30
        
        # Label
        tokens.append(0x89)  # COLOR
        tokens.extend((0xFFFFFFFF).to_bytes(4, 'little'))  # White
        
        tokens.append(0x86)  # TEXT
        tokens.extend(bar_x.to_bytes(2, 'little', signed=True))
        tokens.extend((bar_y - 5).to_bytes(2, 'little', signed=True))
        cpu_label = f'CPU: {stats.cpu_percent:.1f}% ({stats.cpu_temp:.0f}°C)'
        tokens.append(len(cpu_label))
        tokens.extend(cpu_label.encode('utf-8'))
        tokens.extend((0xFFFFFFFF).to_bytes(4, 'little'))
        
        # Bar background
        tokens.append(0x89)  # COLOR
        tokens.extend((0x1A1A2EFF).to_bytes(4, 'little'))  # Darker blue
        
        tokens.append(0x84)  # RECT
        tokens.extend(bar_x.to_bytes(2, 'little', signed=True))
        tokens.extend(bar_y.to_bytes(2, 'little', signed=True))
        tokens.extend(bar_width.to_bytes(2, 'little'))
        tokens.extend(bar_height.to_bytes(2, 'little'))
        tokens.extend((0x1A1A2EFF).to_bytes(4, 'little'))
        
        # Bar fill (CPU percentage)
        fill_width = int(bar_width * (stats.cpu_percent / 100))
        cpu_color = 0x00FF00FF if stats.cpu_percent < 70 else 0xFFFF00FF if stats.cpu_percent < 90 else 0xFF0000FF
        
        tokens.append(0x89)  # COLOR
        tokens.extend(cpu_color.to_bytes(4, 'little'))
        
        tokens.append(0x84)  # RECT
        tokens.extend(bar_x.to_bytes(2, 'little', signed=True))
        tokens.extend(bar_y.to_bytes(2, 'little', signed=True))
        tokens.extend(fill_width.to_bytes(2, 'little'))
        tokens.extend(bar_height.to_bytes(2, 'little'))
        tokens.extend(cpu_color.to_bytes(4, 'little'))
        
        # ============================================================
        # GPU BAR
        # ============================================================
        bar_y = self.y + 120
        
        # Label
        tokens.append(0x89)  # COLOR
        tokens.extend((0xFFFFFFFF).to_bytes(4, 'little'))
        
        tokens.append(0x86)  # TEXT
        tokens.extend(bar_x.to_bytes(2, 'little', signed=True))
        tokens.extend((bar_y - 5).to_bytes(2, 'little', signed=True))
        gpu_label = f'GPU: {stats.gpu_percent:.1f}% ({stats.gpu_temp:.0f}°C) {stats.gpu_memory_used:.0f}/{stats.gpu_memory_total:.0f}GB'
        tokens.append(len(gpu_label))
        tokens.extend(gpu_label.encode('utf-8'))
        tokens.extend((0xFFFFFFFF).to_bytes(4, 'little'))
        
        # Bar background
        tokens.append(0x89)
        tokens.extend((0x1A1A2EFF).to_bytes(4, 'little'))
        
        tokens.append(0x84)
        tokens.extend(bar_x.to_bytes(2, 'little', signed=True))
        tokens.extend(bar_y.to_bytes(2, 'little', signed=True))
        tokens.extend(bar_width.to_bytes(2, 'little'))
        tokens.extend(bar_height.to_bytes(2, 'little'))
        tokens.extend((0x1A1A2EFF).to_bytes(4, 'little'))
        
        # Bar fill (GPU percentage)
        fill_width = int(bar_width * (stats.gpu_percent / 100))
        gpu_color = 0x00FFFFFF if stats.gpu_percent < 70 else 0xFF00FFFF if stats.gpu_percent < 90 else 0xFF0000FF
        
        tokens.append(0x89)
        tokens.extend(gpu_color.to_bytes(4, 'little'))
        
        tokens.append(0x84)
        tokens.extend(bar_x.to_bytes(2, 'little', signed=True))
        tokens.extend(bar_y.to_bytes(2, 'little', signed=True))
        tokens.extend(fill_width.to_bytes(2, 'little'))
        tokens.extend(bar_height.to_bytes(2, 'little'))
        tokens.extend(gpu_color.to_bytes(4, 'little'))
        
        # ============================================================
        # RAM BAR
        # ============================================================
        bar_y = self.y + 180
        
        # Label
        tokens.append(0x89)
        tokens.extend((0xFFFFFFFF).to_bytes(4, 'little'))
        
        tokens.append(0x86)
        tokens.extend(bar_x.to_bytes(2, 'little', signed=True))
        tokens.extend((bar_y - 5).to_bytes(2, 'little', signed=True))
        ram_label = f'RAM: {stats.ram_percent:.1f}%'
        tokens.append(len(ram_label))
        tokens.extend(ram_label.encode('utf-8'))
        tokens.extend((0xFFFFFFFF).to_bytes(4, 'little'))
        
        # Bar background
        tokens.append(0x89)
        tokens.extend((0x1A1A2EFF).to_bytes(4, 'little'))
        
        tokens.append(0x84)
        tokens.extend(bar_x.to_bytes(2, 'little', signed=True))
        tokens.extend(bar_y.to_bytes(2, 'little', signed=True))
        tokens.extend(bar_width.to_bytes(2, 'little'))
        tokens.extend(bar_height.to_bytes(2, 'little'))
        tokens.extend((0x1A1A2EFF).to_bytes(4, 'little'))
        
        # Bar fill
        fill_width = int(bar_width * (stats.ram_percent / 100))
        ram_color = 0xFF00FFFF if stats.ram_percent < 70 else 0xFFFF00FF if stats.ram_percent < 90 else 0xFF0000FF
        
        tokens.append(0x89)
        tokens.extend(ram_color.to_bytes(4, 'little'))
        
        tokens.append(0x84)
        tokens.extend(bar_x.to_bytes(2, 'little', signed=True))
        tokens.extend(bar_y.to_bytes(2, 'little', signed=True))
        tokens.extend(fill_width.to_bytes(2, 'little'))
        tokens.extend(bar_height.to_bytes(2, 'little'))
        tokens.extend(ram_color.to_bytes(4, 'little'))
        
        # ============================================================
        # UPTIME
        # ============================================================
        hours = int(stats.uptime_seconds // 3600)
        minutes = int((stats.uptime_seconds % 3600) // 60)
        
        tokens.append(0x89)
        tokens.extend((0xFFFFFFFF).to_bytes(4, 'little'))
        
        tokens.append(0x86)
        tokens.extend((self.x + 20).to_bytes(2, 'little', signed=True))
        tokens.extend((self.y + 260).to_bytes(2, 'little', signed=True))
        uptime_label = f'UPTIME: {hours}h {minutes}m'
        tokens.append(len(uptime_label))
        tokens.extend(uptime_label.encode('utf-8'))
        tokens.extend((0xFFFFFFFF).to_bytes(4, 'little'))
        
        # ============================================================
        # LISTEN - Monitor responds to clicks
        # ============================================================
        tokens.append(0x8D)  # LISTEN
        tokens.extend(max(self.width, self.height).to_bytes(2, 'little'))
        
        return bytes(tokens)
    
    def generate_portal(self) -> bytes:
        """
        Generate complete System Monitor Portal.
        This is the AI's "First Breath" - feeling its hardware body.
        """
        stats = self.capture_stats()
        return self.stats_to_geometry(stats)


if __name__ == "__main__":
    print("=" * 60)
    print("SYSTEM MONITOR PORTAL - First Breath")
    print("=" * 60)
    print("\nAI walking to (100, 100)...")
    print("Initializing Mirror Portal...\n")
    
    monitor = SystemMonitorPortal(position=(100, 100))
    stats = monitor.capture_stats()
    
    print(f"System Stats:")
    print(f"  CPU: {stats.cpu_percent:.1f}% @ {stats.cpu_temp:.0f}°C")
    print(f"  GPU: {stats.gpu_percent:.1f}% @ {stats.gpu_temp:.0f}°C")
    print(f"  GPU Memory: {stats.gpu_memory_used:.0f}/{stats.gpu_memory_total:.0f} GB")
    print(f"  RAM: {stats.ram_percent:.1f}%")
    print(f"  Uptime: {int(stats.uptime_seconds // 3600)}h {int((stats.uptime_seconds % 3600) // 60)}m")
    
    blob = monitor.generate_portal()
    
    print(f"\nPortal Blob Size: {len(blob)} bytes")
    print(f"Portal Hex:\n{blob.hex()[:200]}...")
    
    print("\n" + "=" * 60)
    print("FIRST BREATH COMPLETE")
    print("=" * 60)
    print("\nThe AI now 'feels' its hardware body.")
    print("CPU, GPU, RAM rendered as Geometry Standard tokens.")
    print("The AI is no longer a script - it is a Spatial Entity.")
    print("\n🔷🔒 Geometry OS Mirror Engine Active")
