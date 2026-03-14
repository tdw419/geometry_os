#!/usr/bin/env python3
"""
Geometry OS Status Dashboard
Comprehensive system overview for the Ouroboros Stack.
"""

import sys
import json
from pathlib import Path
from datetime import datetime

# Add geos to path
GEOS_PATH = Path(__file__).parent.parent / "geos"
sys.path.insert(0, str(GEOS_PATH.parent))

try:
    from geos import (
        hilbert_d2xy, hilbert_xy2d,
        benchmark_sls,
        glyph_patch, boot_sim, vm_spawn, geos_status
    )
    from geos.compiler import crystallize, linux_to_glyph
    from geos.types import Opcode, Texture
    GEOS_AVAILABLE = True
except ImportError:
    GEOS_AVAILABLE = False


def print_header(title: str):
    print(f"\n{'='*60}")
    print(f" {title}")
    print(f"{'='*60}\n")


def check_boot_chain():
    """Check boot chain components."""
    components = {}

    # Boot image
    boot_img = Path("kernel/boot/geometry_os_boot.img")
    if boot_img.exists():
        components["boot_image"] = {
            "status": "✅",
            "path": str(boot_img),
            "size": f"{boot_img.stat().st_size / (1024*1024):.1f}MB"
        }
    else:
        components["boot_image"] = {"status": "❌", "path": str(boot_img)}

    # EFI bootloader
    efi_file = Path("target/x86_64-unknown-uefi/debug/geometry_os_bootloader.efi")
    if efi_file.exists():
        components["efi_bootloader"] = {
            "status": "✅",
            "path": str(efi_file),
            "size": f"{efi_file.stat().st_size / 1024:.1f}KB"
        }
    else:
        components["efi_bootloader"] = {"status": "❌", "path": str(efi_file)}

    # Kernel
    kernel = Path("kernel/geos/geometry_os.kernel")
    if kernel.exists():
        components["kernel"] = {
            "status": "✅",
            "path": str(kernel),
            "size": f"{kernel.stat().st_size / 1024:.1f}KB"
        }
    else:
        components["kernel"] = {"status": "❌", "path": str(kernel)}

    # Window manager
    wm = Path("systems/glyph_stratum/programs/window_manager.rts.png")
    if wm.exists():
        components["window_manager"] = {
            "status": "✅",
            "path": str(wm),
            "size": f"{wm.stat().st_size / 1024:.1f}KB"
        }
    else:
        components["window_manager"] = {"status": "❌", "path": str(wm)}

    # Microcode
    spv = Path("/tmp/glyph_microcode.spv")
    if spv.exists():
        components["microcode"] = {
            "status": "✅",
            "path": str(spv),
            "size": f"{spv.stat().st_size / 1024:.1f}KB"
        }
    else:
        components["microcode"] = {"status": "⚠️", "path": str(spv), "note": "needs build"}

    return components


def check_textures():
    """Check available textures."""
    textures = []

    for pattern in ["**/*.rts.png", "**/busybox*.png"]:
        for p in Path(".").glob(pattern):
            if p.exists() and p.stat().st_size > 0:
                try:
                    tex = Texture.load(str(p))
                    textures.append({
                        "path": str(p),
                        "size": f"{p.stat().st_size / 1024:.1f}KB",
                        "grid": tex.grid_size,
                        "instructions": tex.instruction_count,
                        "density": f"{tex.density*100:.2f}%"
                    })
                except Exception:
                    textures.append({
                        "path": str(p),
                        "size": f"{p.stat().st_size / 1024:.1f}KB",
                        "error": "could not load"
                    })

    return textures


def main():
    print("\n╔════════════════════════════════════════════════════════════╗")
    print("║         GEOMETRY OS - SYSTEM STATUS DASHBOARD              ║")
    print("╚════════════════════════════════════════════════════════════╝")

    print(f"\n Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")

    # GEOS Library
    print_header("GEOS Library")
    print(f"  Available: {'✅ Yes' if GEOS_AVAILABLE else '❌ No'}")
    if GEOS_AVAILABLE:
        print("  Modules: core, types, compiler, benchmarks, mcp")
        print("  Functions: hilbert_d2xy, crystallize, benchmark_sls, glyph_patch")

    # Boot Chain
    print_header("Boot Chain")
    components = check_boot_chain()
    for name, info in components.items():
        status = info["status"]
        path = info.get("path", "?")
        size = info.get("size", "")
        note = info.get("note", "")
        print(f"  {status} {name}: {path}")
        if size:
            print(f"      Size: {size}")
        if note:
            print(f"      Note: {note}")

    # Textures
    print_header("Spatial Textures")
    textures = check_textures()
    if textures:
        for tex in textures[:5]:
            print(f"  📄 {tex['path']}")
            print(f"      Size: {tex.get('size', '?')}")
            if "grid" in tex:
                print(f"      Grid: {tex['grid']}x{tex['grid']}, Instructions: {tex['instructions']:,}")
    else:
        print("  No textures found")

    # MCP Status
    if GEOS_AVAILABLE:
        print_header("MCP Bridge")
        status = geos_status()
        print(f"  Status: {status['status']}")
        for comp, state in status['components'].items():
            print(f"  {comp}: {state}")

    # Boot Simulation
    if GEOS_AVAILABLE:
        print_header("Boot Simulation")
        boot = boot_sim()
        print(f"  Boot Ready: {'✅' if boot['boot_ready'] else '❌'}")
        for stage in boot['stages']:
            print(f"  {stage['stage']}: {stage['status']}")

    # Summary
    print_header("Summary")
    ready_count = sum(1 for c in components.values() if c["status"] == "✅")
    total_count = len(components)
    print(f"  Boot Chain: {ready_count}/{total_count} components ready")
    print(f"  Textures: {len(textures)} available")
    print(f"  GEOS SDK: {'Ready' if GEOS_AVAILABLE else 'Not available'}")

    if ready_count == total_count:
        print("\n  🚀 System ready for hardware boot!")
        print("  Insert USB and run: ./kernel/boot/flash_to_usb.sh --list")
    else:
        print("\n  ⚠️  Some components missing. Run ./kernel/boot/run_bare_metal.sh")


if __name__ == "__main__":
    main()
