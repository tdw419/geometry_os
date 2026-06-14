import ast
import numpy as np
from PIL import Image
import os
import sys

# Geometry OS - Phase 43 Glyph VM Spec
# Red: Activation (Value/Magnitude)
# Green: Entropy (Conditionality/Uncertainty)
# Blue: Sector (Opcode Family)

# Opcode Mapping from glyph_vm.wgsl
OP_DATA = 0.0    # Blue Sector 0.0 - 0.2
OP_CALL = 0.2    # Blue Sector 0.2 - 0.4
OP_LOAD = 0.4    # Blue Sector 0.4 - 0.6
OP_STORE = 0.6   # Blue Sector 0.6 - 0.8
OP_NOP = 0.8     # Blue Sector 0.8 - 1.0

class SpatialJIT:
    """
    Geometry OS Spatial JIT Interpreter.
    Converts standard Python AST to 2D Spatial Glyphs (PixelRTS v2).
    """

    def __init__(self, grid_size=512):
        self.grid_size = grid_size
        self.pixels = np.zeros((grid_size, grid_size, 4), dtype=np.float32)
        self.cursor_x = 0
        self.cursor_y = 0

    def next_pos(self):
        """Move cursor in a 2D grid."""
        self.cursor_x += 1
        if self.cursor_x >= self.grid_size:
            self.cursor_x = 0
            self.cursor_y += 1
        if self.cursor_y >= self.grid_size:
            raise RuntimeError("Infinite Map sub-grid overflow!")

    def emit_glyph(self, r=0.0, g=0.0, b=0.0, a=1.0):
        """Place a glyph on the spatial substrate."""
        self.pixels[self.cursor_y, self.cursor_x] = [r, g, b, a]
        self.next_pos()

    def translate_script(self, source_code):
        """Translate Python source to a 2D Spatial Glyph Brick."""
        tree = ast.parse(source_code)
        self._visit(tree)
        return self.pixels

    def _visit(self, node):
        """Recursive AST walker that 'paints' logic onto the screen."""
        
        # Mapping AST Nodes to Spatial Opcodes
        if isinstance(node, ast.Module):
            for stmt in node.body:
                self._visit(stmt)
                
        elif isinstance(node, ast.Assign):
            # Assignment is a STORE operation
            # Value -> R, Opcode -> B
            val = 0.5 # Default magnitude
            if isinstance(node.value, ast.Constant):
                val = float(node.value.value) / 255.0 # Normalize 8-bit values
            
            self.emit_glyph(r=val, g=0.0, b=OP_STORE)
            self._visit(node.value)
            
        elif isinstance(node, ast.BinOp):
            # Binary operations (ADD, SUB, etc.) are CALL operations
            # Opcode -> B
            self.emit_glyph(r=1.0, g=0.0, b=OP_CALL)
            self._visit(node.left)
            self._visit(node.right)
            
        elif isinstance(node, ast.Constant):
            # Constants are DATA
            val = float(node.value) / 255.0 if isinstance(node.value, (int, float)) else 0.5
            self.emit_glyph(r=val, g=0.0, b=OP_DATA)

        elif isinstance(node, (ast.If, ast.While)):
            # Conditionals introduce ENTROPY (Green)
            self.emit_glyph(r=1.0, g=0.8, b=OP_CALL) # High entropy branch
            self._visit(node.test)
            for stmt in node.body:
                self._visit(stmt)

        else:
            # Unhandled nodes become NOPs for now
            self.emit_glyph(r=0.1, g=0.1, b=OP_NOP)

    def save_brick(self, output_path):
        """Save the spatial program as a .rts.png Brick."""
        # Convert 0-1 float32 to 0-255 uint8 for PNG
        img_data = (self.pixels * 255).astype(np.uint8)
        img = Image.fromarray(img_data, 'RGBA')
        img.save(output_path)
        print(f"✅ Crystallized Spatial Brick: {output_path}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 spatial_jit_v1.py <script.py>")
        sys.exit(1)

    with open(sys.argv[1], 'r') as f:
        source = f.read()

    jit = SpatialJIT(grid_size=128) # Small 128x128 grid for demo
    jit.translate_script(source)
    
    output_fn = sys.argv[1] + ".brick.rts.png"
    jit.save_brick(output_fn)
