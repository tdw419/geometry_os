# Add synthetic_vram to sys.path
import sys

sys.path.append("/home/jericho/zion/projects/geometry_os/geometry_os/systems/infinite_map_rs/src/")

import synthetic_vram as vram


def create_calculator_buttons():
    # Define button positions and labels
    buttons = {
        (10, 10): "7",
        (20, 10): "8",
        (30, 10): "9",
        (40, 10): "/",
        (10, 20): "4",
        (20, 20): "5",
        (30, 20): "6",
        (40, 20): "*",
        (10, 30): "1",
        (20, 30): "2",
        (30, 30): "3",
        (40, 30): "-",
        (10, 40): "C",
        (20, 40): "0",
        (30, 40): "=",
        (40, 40): "+",
    }
    return buttons


if __name__ == "__main__":
    # Create calculator buttons on synthetic VRAM
    buttons = create_calculator_buttons()
    for addr, label in buttons.items():
        vram.poke(addr, glyph(0x204, 0x10, ord(label), 0))
