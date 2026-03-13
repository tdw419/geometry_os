"""
Neural City Colonization - Linux Kernel District (Phase 43)

The Linux Kernel District establishes a dedicated neighborhood for
Legible Linux - mapping kernel subsystems to GlyphStratum opcodes.

This creates a "kernel colonized" region on the brain map where:
- KERNEL_SCHEDULER → LOOP (Logic stratum) - process scheduling
- KERNEL_MEM → ALLOC (Memory stratum) - memory management
- KERNEL_FS → STORE (Memory stratum) - filesystem operations
- KERNEL_NET → CALL (Logic stratum) - network stack
- KERNEL_DRV → TYPE (Spec stratum) - device drivers
- USERSPACE → EXPORT (Intent stratum) - userland interface
"""

from typing import Dict, List, Tuple, TYPE_CHECKING
import logging
from pathlib import Path
import sys
import math

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

logger = logging.getLogger("LinuxKernelDistrict")


class KernelZone:
    """A specialized functional neighborhood within the Linux Kernel District."""
    def __init__(self, name: str, center_x: int, center_y: int, radius: int,
                 base_sector: int, base_activation: float, opcode: str,
                 description: str):
        self.name = name
        self.center_x = center_x
        self.center_y = center_y
        self.radius = radius
        self.base_sector = base_sector  # Maps to GlyphStratum opcodes
        self.base_activation = base_activation
        self.opcode = opcode
        self.description = description


class LinuxKernelDistrict:
    """
    The Linux Kernel District manages the Legible Linux colony.

    It contains 6 zones mapping kernel subsystems to GlyphStratum:

    Sector Mapping (B channel -> sector):
    - 0: DATA (Embeddings) -> USERSPACE (input/output)
    - 1: CALL (Attention) -> KERNEL_NET (network calls)
    - 2: LOAD/STORE (FFN) -> KERNEL_MEM, KERNEL_FS (data movement)
    - 3: TYPE (Norm) -> KERNEL_DRV (device types/interfaces)
    - 4: EXPORT (Head) -> USERSPACE (system call interface)

    Opcode Mapping:
    - KERNEL_SCHEDULER -> LOOP (Logic stratum)
    - KERNEL_MEM -> ALLOC (Memory stratum)
    - KERNEL_FS -> STORE (Memory stratum)
    - KERNEL_NET -> CALL (Logic stratum)
    - KERNEL_DRV -> TYPE (Spec stratum)
    - USERSPACE -> EXPORT (Intent stratum)
    """

    def __init__(self, repair_engine):
        """Initialize with a repair engine."""
        self.engine = repair_engine

        # Define the spatial layout on the 1024x1024 atlas
        # Placed in the southern hemisphere (y > 512) to avoid overlap with Syntactic District
        self.zones = {
            "SCHEDULER": KernelZone(
                "Scheduler", 150, 700, 50,
                base_sector=1, base_activation=0.85,
                opcode="LOOP",
                description="Process scheduling - the heartbeat of the kernel"
            ),
            "MEM": KernelZone(
                "Memory", 350, 700, 60,
                base_sector=2, base_activation=0.75,
                opcode="ALLOC",
                description="Memory management - alloc/free zones"
            ),
            "FS": KernelZone(
                "Filesystem", 550, 700, 55,
                base_sector=2, base_activation=0.70,
                opcode="STORE",
                description="Filesystem operations - persistent storage"
            ),
            "NET": KernelZone(
                "Network", 750, 700, 45,
                base_sector=1, base_activation=0.80,
                opcode="CALL",
                description="Network stack - packet processing"
            ),
            "DRV": KernelZone(
                "Drivers", 250, 850, 65,
                base_sector=3, base_activation=0.65,
                opcode="TYPE",
                description="Device drivers - hardware abstraction"
            ),
            "USERSPACE": KernelZone(
                "Userspace", 650, 850, 70,
                base_sector=4, base_activation=0.90,
                opcode="EXPORT",
                description="System call interface - userspace boundary"
            ),
        }

        # Kernel-wide statistics
        self.stats = {
            "colonization_passes": 0,
            "total_zones_seeded": 0,
            "total_pixels_written": 0,
            "syscalls_handled": 0
        }

    def seed_zone(self, zone_name: str) -> Dict[str, any]:
        """
        Physically writes the functional pattern of a kernel zone into the substrate.
        This represents the 'construction' of the kernel neighborhood.
        """
        if zone_name not in self.zones:
            return {"success": False, "error": f"Unknown zone: {zone_name}"}

        zone = self.zones[zone_name]

        if not self.engine.atlas_data and not self.engine.load_atlas():
            return {"success": False, "error": "No atlas loaded"}

        logger.info(f"Seeding Kernel Zone: {zone.name} ({zone.opcode}) at ({zone.center_x}, {zone.center_y})")

        pixels_modified = 0

        # Write the specialized pattern to the atlas
        # Use a more structured pattern for kernel zones (lower entropy = more deterministic)
        for dy in range(-zone.radius, zone.radius + 1):
            for dx in range(-zone.radius, zone.radius + 1):
                dist = math.sqrt(dx * dx + dy * dy)
                if dist > zone.radius:
                    continue

                x = zone.center_x + dx
                y = zone.center_y + dy

                # Structural falloff (kernel code is highly structured)
                structure_density = 1.0 - (dist / zone.radius) ** 1.5  # Sharper falloff

                # Activation: high in center (running code), fading at edges
                r = min(1.0, zone.base_activation * structure_density + 0.15)

                # Very low entropy (kernel code is deterministic)
                # Add slight variation based on opcode type
                opcode_entropy = {
                    "LOOP": 0.05,   # Schedulers have loops
                    "ALLOC": 0.08,  # Memory has some variability
                    "STORE": 0.06,  # Filesystem is predictable
                    "CALL": 0.10,   # Network has more variance
                    "TYPE": 0.07,   # Drivers are structured
                    "EXPORT": 0.12  # Userspace has most variance
                }
                base_entropy = opcode_entropy.get(zone.opcode, 0.08)
                g = base_entropy + (0.05 * (1 - structure_density))

                # Sector mapping (determines the functional opcode family)
                b = (zone.base_sector + 0.5) / 5.0

                self.engine.write_pixel(x, y, r, g, b)
                pixels_modified += 1

        self.engine.save_atlas()

        return {
            "success": True,
            "zone": zone.name,
            "opcode": zone.opcode,
            "description": zone.description,
            "pixels_modified": pixels_modified,
            "coords": {"x": zone.center_x, "y": zone.center_y, "radius": zone.radius}
        }

    def colonize_all(self) -> Dict[str, any]:
        """Deploy all zones in the Linux Kernel District."""
        results = {}
        total_pixels = 0

        logger.info("=== LINUX KERNEL COLONIZATION PASS ===")

        for zone_name in self.zones.keys():
            res = self.seed_zone(zone_name)
            results[zone_name] = res
            if res["success"]:
                total_pixels += res["pixels_modified"]
                self.stats["total_zones_seeded"] += 1

        self.stats["colonization_passes"] += 1
        self.stats["total_pixels_written"] += total_pixels

        return {
            "success": True,
            "district": "LinuxKernel",
            "zones_seeded": len(self.zones),
            "total_pixels_modified": total_pixels,
            "stats": self.stats,
            "details": results
        }

    def get_zone_at_coords(self, x: int, y: int) -> Dict[str, any]:
        """Find which kernel zone (if any) contains these coordinates."""
        for zone_name, zone in self.zones.items():
            dist = math.sqrt((x - zone.center_x)**2 + (y - zone.center_y)**2)
            if dist <= zone.radius:
                return {
                    "in_zone": True,
                    "zone_name": zone_name,
                    "zone": zone.name,
                    "opcode": zone.opcode,
                    "description": zone.description,
                    "distance_from_center": dist
                }
        return {"in_zone": False}

    def get_opcode_mapping(self) -> Dict[str, str]:
        """Return the kernel subsystem to GlyphStratum opcode mapping."""
        return {
            "KERNEL_SCHEDULER": "LOOP",
            "KERNEL_MEM": "ALLOC",
            "KERNEL_FS": "STORE",
            "KERNEL_NET": "CALL",
            "KERNEL_DRV": "TYPE",
            "USERSPACE": "EXPORT"
        }

    def generate_syscall_dag(self, syscall_num: int, args: list) -> Dict:
        """
        Generate a GlyphStratum DAG for a syscall execution.

        This is called when userspace makes a syscall - it creates
        a visual execution path through the kernel zones.
        """
        # Map syscall numbers to execution paths
        syscall_paths = {
            # read/write go through USERSPACE -> FS
            0: ["EXPORT", "STORE"],   # read
            1: ["EXPORT", "STORE"],   # write
            # memory ops go through USERSPACE -> MEM
            9: ["EXPORT", "ALLOC"],   # mmap
            11: ["EXPORT", "ALLOC"],  # munmap
            # process ops go through USERSPACE -> SCHEDULER
            57: ["EXPORT", "LOOP"],   # fork
            59: ["EXPORT", "LOOP"],   # execve
            60: ["EXPORT", "LOOP"],   # exit
            # socket ops go through USERSPACE -> NET
            41: ["EXPORT", "CALL"],   # socket
            42: ["EXPORT", "CALL"],   # connect
            44: ["EXPORT", "CALL"],   # sendto
            45: ["EXPORT", "CALL"],   # recvfrom
        }

        path = syscall_paths.get(syscall_num, ["EXPORT"])
        syscall_name = {
            0: "read", 1: "write", 9: "mmap", 11: "munmap",
            57: "fork", 59: "execve", 60: "exit",
            41: "socket", 42: "connect", 44: "sendto", 45: "recvfrom"
        }.get(syscall_num, f"syscall_{syscall_num}")

        self.stats["syscalls_handled"] += 1

        return {
            "type": "SYSCALL_DAG",
            "syscall_num": syscall_num,
            "syscall_name": syscall_name,
            "execution_path": path,
            "args": args,
            "zones": [
                {
                    "zone": zone_name,
                    "coords": {
                        "x": self.zones[zone_name].center_x,
                        "y": self.zones[zone_name].center_y
                    }
                }
                for zone_name in path if zone_name in self.zones
            ]
        }
