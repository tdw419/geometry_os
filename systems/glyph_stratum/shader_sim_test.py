import struct
import numpy as np

def simulate_shader_lcg(seed, threshold):
    """
    Simulates the LCG from the WGSL shader:
    let seed = state.cycles + state.pc + u32(glyph.p1 * 1000.0);
    let rand = f32((seed * 1103515245u + 12345u) & 0x7FFFFFFFu) / 2147483647.0;
    """
    m = 1103515245
    a = 12345
    mod = 0x80000000 # 2^31
    
    # Simulate u32 overflow and bitwise AND
    res = (seed * m + a) % (2**32)
    rand_val = (res & 0x7FFFFFFF) / 2147483647.0
    
    return rand_val, rand_val < threshold

def run_simulation_batch(count=1000):
    heads = 0
    tails = 0
    
    # Initial state simulation
    # Initial cycle = 0, initial PC = 0, p1 = 0.5
    for i in range(count):
        # We vary the 'cycle' to simulate time passing/consecutive runs
        seed = i + 0 + int(0.5 * 1000.0) 
        rand, is_heads = simulate_shader_lcg(seed, 0.5)
        if is_heads:
            heads += 1
        else:
            tails += 1
            
    print(f"Simulation of 1000 Coin Flips (Shader LCG):")
    print(f"Heads: {heads} ({(heads/count)*100:.1f}%)")
    print(f"Tails: {tails} ({(tails/count)*100:.1f}%)")
    print(f"Entropy: {'Pass' if 450 < heads < 550 else 'Low'}")

if __name__ == "__main__":
    run_simulation_batch()
