#!/usr/bin/env python3
"""
Corrected Glyph VM FPS Benchmark - Uses actual shader semantics
"""

import sys
import time
from pathlib import Path

try:
    import wgpu
    import numpy as np
except ImportError:
    print("wgpu not available, installing...")
    subprocess.check_call([sys.executable, "-m", "pip", "install", "wgpu"])
    import wgpu
    import numpy as np

# Find workspace root
ROOT = Path(__file__).resolve().parent.parent.parent

def run_corrected_glyph_benchmark():
    """Run glyph execution with corrected factorial program matching actual shader semantics."""
    try:
        # Import wgpu
        import wgpu
        
        # Request adapter
        adapter = wgpu.gpu.request_adapter_sync(power_preference="high-performance")
        device = adapter.request_device_sync()
        
        # Load shader
        shader_path = ROOT / "systems" / "infinite_map_rs" / "src" / "shaders" / "glyph_vm_scheduler.wgsl"
        if not shader_path.exists():
            return {"gips": 0, "fps": 0, "status": "FAIL", "error": f"Shader not found: {shader_path}"}
            
        with open(shader_path, 'r') as f:
            shader_code = f.read()
        
        # Create program buffer (factorial program using actual shader semantics)
        # Opcode definitions from shader:
        OP_NOP = 0
        OP_ALLOC = 1
        OP_FREE = 2
        OP_LOAD = 3
        OP_STORE = 4
        OP_ADD = 5
        OP_SUB = 6
        OP_MUL = 7
        OP_DIV = 8
        OP_JMP = 9
        OP_BRANCH = 10
        OP_CALL = 11
        OP_RETURN = 12
        OP_HALT = 13
        OP_DATA = 14
        OP_LOOP = 15
        
        # Each instruction is [opcode, p1, p2] - p3 is not used in these opcodes
        # We'll need to use memory for constants since OP_DATA is register copy
        
        # Strategy:
        # 1. Store constants in memory locations
        # 2. Use OP_LOAD to get them into registers
        # 3. Use OP_DATA for register copies
        # 4. Use arithmetic ops
        # 5. Use OP_BRANCH for loop control
        
        # Memory layout for constants (we'll put these at the start of our memory buffer)
        CONST_ONE_ADDR = 0      # Value: 1
        CONST_FIVE_ADDR = 1     # Value: 5
        TEMP_STORAGE_ADDR = 2   # For temporary values
        
        # Initialize memory with constants
        # We'll do this by writing to the buffer that the shader reads from
        # But first, let's create our instruction buffer
        
        # Factorial(5) program using actual shader semantics:
        # We need to implement:
        #   result = 1
        #   counter = 5
        #   while counter > 0:
        #       result = result * counter
        #       counter = counter - 1
        
        # Register usage:
        # r0: program counter scratch / temp
        # r1: result (accumulator)
        # r2: counter
        # r3: temp for comparisons
        # r4: address of CONST_ONE
        # r5: address of CONST_FIVE
        # r6: address of TEMP_STORAGE
        
        instructions = [
            # Initialize: set up address registers
            [OP_DATA, 4, CONST_ONE_ADDR, 0],    # r4 = address of CONST_ONE (0)
            [OP_DATA, 5, CONST_FIVE_ADDR, 0],   # r5 = address of CONST_FIVE (1)
            [OP_DATA, 6, TEMP_STORAGE_ADDR, 0], # r6 = address of TEMP_STORAGE (2)
            
            # Load constants into registers
            [OP_LOAD, 4, 1, 0],   # r1 = *r4 (load CONST_ONE -> result = 1)
            [OP_LOAD, 5, 2, 0],   # r2 = *r5 (load CONST_FIVE -> counter = 5)
            
            # Loop start
            [OP_DATA, 0, 2, 0],   # r0 = r2 (copy counter to r0 for comparison)
            [OP_LOAD, 6, 3, 0],   # r3 = *r6 (load from TEMP_STORAGE - we'll use this for zero)
            
            # We need to implement: if counter == 0 then exit loop
            # But we don't have a direct way to zero a register. Let's store 0 in TEMP_STORAGE
            # Actually, let's change approach: use OP_BRANCH which branches if reg[p1] == 0
            
            # Instead, let's subtract counter from itself to get zero, but we need to preserve counter
            # This is getting complex. Let's use a different approach:
            
            # Store 0 in TEMP_STORAGE by having it pre-initialized to 0
            # Then we can do: r3 = *r6 (which is 0)
            # Then: r0 = r2 - r3 (counter - 0) = counter
            # Then branch if r0 == 0
            
            # But we don't have subtraction that stores to a different register...
            # OP_SUB does: reg[p2] = reg[p1] - reg[p2]
            
            # Let's redesign register usage:
            # r0: zero register (we'll keep this as 0)
            # r1: result
            # r2: counter
            # r3: temp
            # 
            # To decrement counter: we want r2 = r2 - 1
            # With OP_SUB: if we do OP_SUB with p1=r2, p2=r1, we get r1 = r2 - r1
            # Not what we want.
            
            # Actually, let's look at OP_SUB again:
            # case OP_SUB: {
            #     if (p1 < REG_COUNT && p2 < REG_COUNT) {
            #         vm.regs[p2] = vm.regs[p1] - vm.regs[p2];
            #     }
            #     vm.pc = vm.pc + 1u;
            # }
            # So: reg[p2] = reg[p1] - reg[p2]
            
            # To compute reg[A] = reg[B] - reg[C]:
            # We need to get reg[B] into reg[p1] and reg[C] into reg[p2], then result goes to reg[p2]
            # So: set p1 = B, p2 = C, then after OP_SUB: reg[C] = reg[B] - reg[C]
            # Not quite what we want.
            
            # To get reg[A] = reg[B] - reg[C]:
            # 1. Copy reg[B] to reg[A]: OP_DATA with p1=B, p2=A
            # 2. Then OP_SUB with p1=A, p2=C: reg[A] = reg[A] - reg[C] = reg[B] - reg[C]
            
            # So to do: counter = counter - 1
            # 1. OP_DATA: r2 = r2 (no-op, or we could skip)
            # 2. We need to get 1 into a temp register
            # 3. OP_DATA: r3 = r2 (copy counter to temp)
            # 4. OP_LOAD: get 1 into r4
            # 5. OP_SUB: r3 = r3 - r4 (temp = counter - 1)
            # 6. OP_DATA: r2 = r3 (counter = temp)
            
            # This is very inefficient. Let's see if we can do better by reorganizing.
            
            # Given the complexity and time, let's implement a simpler approach:
            # Since we know we're computing factorial(5) = 120, let's just store the result directly
            # and verify the mechanism works, then optimize later.
            
            # Actually, let's look at what the original benchmark was trying to do and fix just the OP_SUB bug
            
            # Going back to the user's changed version, the main bug was in OP_SUB:
            # Original: (OP_SUB, 2, 1, 3) meant r1 = r1 - r3
            # Changed to: [OP_SUB, 1, 1, 3] which with their interpretation meant r1 = r1 - r3
            # But with actual shader semantics: [OP_SUB, 1, 1, 3] means reg[1] = reg[1] - reg[1] = 0
            
            # So the fix is to change [OP_SUB, 1, 1, 3] back to [OP_SUB, 2, 1, 3]
            # But we need to check what that means with actual shader semantics
            
            # With actual shader semantics:
            # [OP_SUB, 2, 1, 3] means:
            #   opcode = OP_SUB (6)
            #   p1 = 2 (from b)
            #   p2 = 1 (from a)
            #   p3 = 3 (unused)
            #   Meaning: reg[p2] = reg[p1] - reg[p2] => reg[1] = reg[2] - reg[1]
            #
            # If reg[2] = counter and reg[1] = result, then this does:
            #   result = counter - result
            # Which is NOT what we want.
            
            # We want: result = result * counter
            # And: counter = counter - 1
            
            # Let's try to understand what the original working version was doing
            # by looking at the opcode values they were using.
            
            # Original opcode mapping:
            # OP_DATA = 9, OP_MUL = 202, OP_SUB = 201, OP_BNZ = 209, OP_HALT = 255
            #
            # These are all >= 200, so they would be treated as Unicode glyphs
            # and normalized by subtracting 200:
            #   OP_DATA_norm = 9 - 200 = -191 (but since it's u32, this wraps)
            #   Actually, let's compute properly:
            #   9 - 200 = -191, as u32 this is 2^32 - 191
            #   But the code does: if (opcode >= 200u) opcode = opcode - 200u;
            #   So for opcode=9: 9 < 200, so no change -> opcode = 9 (OP_DATA)
            #   For opcode=202: 202 >= 200 -> opcode = 202-200 = 2 (OP_ALLOC)
            #   For opcode=201: 201 >= 200 -> opcode = 201-200 = 1 (OP_FREE)
            #   For opcode=209: 209 >= 200 -> opcode = 209-200 = 9 (OP_DATA)
            #   For opcode=255: 255 >= 200 -> opcode = 255-200 = 55 (which is >15, so invalid?)
            #
            # This doesn't make sense. Let me re-read the normalization code:
            #
            # // Normalize opcode: Unicode 200 + ID -> ID
            # var opcode = glyph.r;
            # if (opcode >= 200u) {
            #     opcode = opcode - 200u;
            # }
            #
            # This suggests that values in the range [200, 215] map to opcodes [0, 15]
            # Values < 200 are used as-is (but there are only 16 opcodes 0-15)
            #
            # So if they're using values like 202, 201, etc., these get normalized:
            #   202 -> 2 (OP_ALLOC)
            #   201 -> 1 (OP_FREE)
            #   209 -> 9 (OP_DATA)
            #   255 -> 55 (invalid)
            #
            # This still doesn't match the OP_DATA, OP_MUL, etc. they're trying to use.
            #
            # I think there's confusion in the benchmark about what values to use.
            # Let's ignore the benchmark's opcode constants and use the actual ones from the shader.
            
            # Let's try a minimal working program first: just load a constant and halt
            # to verify the mechanism works, then build up to factorial.
            
            return {"gips": 0, "fps": 0, "status": "FAIL", "error": "Factorial implementation incomplete - need to design program for actual shader semantics"}
            
    except Exception as e:
        return {"gips": 0, "fps": 0, "status": "FAIL", "error": f"Benchmark failed: {e}"}

def main():
    print("=" * 60)
    print(" CORRECTED GLYPH VM BENCHMARK (Actual Shader Semantics)")
    print("=" * 60)
    
    result = run_corrected_glyph_benchmark()
    
    if result["status"] == "PASS":
        print(f"✓ Benchmark PASSED")
        print(f"  GIPS: {result['gips']:.3f}")
        print(f"  FPS:  {result['fps']:.1f}")
        if 'result' in result:
            print(f"  Result: r2={result['result']} (expected: {result['expected']})")
    else:
        print(f"✗ Benchmark FAILED: {result.get('error', 'Unknown error')}")
    
    print(f"Status: {result['status']}")

if __name__ == "__main__":
    main()