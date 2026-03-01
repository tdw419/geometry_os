
import numpy as np

def hadamard_matrix(n):
    """Generates a 1D Walsh-Hadamard matrix of size n."""
    if n == 1:
        return np.array([[1]])
    else:
        h_n_minus_1 = hadamard_matrix(n // 2)
        top = np.concatenate((h_n_minus_1, h_n_minus_1), axis=1)
        bottom = np.concatenate((h_n_minus_1, -h_n_minus_1), axis=1)
        return np.concatenate((top, bottom), axis=0)

# Fixed Basis Map for 16x16 Hadamard (32 unique index pairs)
# Avoiding (0,0) DC component. Picking patterns with good spatial distribution.
BASIS_MAP = [
    (1,1), (1,2), (1,3), (1,4), (1,5), (1,6), (1,7), (1,8), (1,9), (1,10), (1,11), (1,12),
    (2,1), (2,2), (2,3), (2,4), (2,5), (2,6), (2,7), (2,8), (2,9), (2,10), (2,11), (2,12),
    (3,1), (3,2), (3,3), (3,4), (3,5), (3,6), (3,7), (3,8), (3,9), (3,10), (3,11), (3,12),
    (4,1), (4,2), (4,3), (4,4), (4,5), (4,6), (4,7), (4,8), (4,9), (4,10), (4,11), (4,12),
    (5,1), (5,2), (5,3), (5,4), (5,5), (5,6), (5,7), (5,8), (5,9), (5,10), (5,11), (5,12),
    (6,1), (6,2), (6,3), (6,4) # Total 64
]

def generate_2d_basis(size=16, count=64):
    """Generates count unique 2D orthogonal basis patterns using the fixed map."""
    h = hadamard_matrix(size)
    basis = []
    
    for k in range(count):
        row_idx, col_idx = BASIS_MAP[k]
        pattern = np.outer(h[row_idx], h[col_idx])
        basis.append(pattern)
            
    return np.array(basis)

def encode_instruction(instr_u32, basis):
    """Encodes 32 bits into a 16x16 interference pattern."""
    # Convert 32-bit uint to bit array (-1, 1)
    bits = np.array([(1 if (instr_u32 >> i) & 1 else -1) for i in range(32)])
    
    # Superposition: Multiply each bit by its basis pattern
    pattern = np.sum(bits[:, None, None] * basis, axis=0)
    
    # Normalize to [0, 1] range for image storage
    # The max possible range is [-32, 32]. 
    # We scale it to be centered at 0.5.
    normalized = (pattern / 32.0) + 0.5
    return np.clip(normalized, 0, 1)

if __name__ == "__main__":
    # Test encoding
    basis = generate_2d_basis()
    instr = 0x13050513 # RISC-V: addi x10, x10, 80
    
    # RGB Phase Shifted Encoding
    # R uses basis 0-31
    # G uses basis 1-32 (circular shift)
    # B uses basis 2-33
    # This creates the "Phase-Locked Color Fringe"
    
    r_pattern = encode_instruction(instr, basis)
    print(f"Encoded 32 bits into 16x16 pattern. Mean: {np.mean(r_pattern)}")
