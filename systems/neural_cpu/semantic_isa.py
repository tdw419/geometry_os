
import numpy as np

# Canonical mapping of x86 Semantic Primitives
# This defines the "Basis Vectors" of the Neural CPU.
# Each primitive maps to a unique index in the 256-dim semantic space.

SIS_PRIMITIVES = {
    # == DATA MOVEMENT (0-31) ==
    "MOV_R_R":    0,   # MOV reg, reg
    "MOV_R_IMM":  1,   # MOV reg, imm
    "MOV_R_MEM":  2,   # MOV reg, [mem]
    "MOV_MEM_R":  3,   # MOV [mem], reg
    "PUSH_R":     4,   # PUSH reg
    "POP_R":      5,   # POP reg
    "XCHG":       6,   # XCHG
    "LEA":        7,   # LEA
    
    # == ARITHMETIC (32-63) ==
    "ADD":        32,
    "SUB":        33,
    "INC":        34,
    "DEC":        35,
    "XOR":        36,
    "AND":        37,
    "OR":         38,
    "CMP":        39,
    "TEST":       40,
    "SHL":        41,
    "SHR":        42,
    "NOT":        43,
    "NEG":        44,
    "MUL":        45,
    "IMUL":       46,
    "DIV":        47,
    "IDIV":       48,
    "IDIV":       48,
    "SAR":        49,
    "ADC":        50,
    "SBB":        51,
    "ENTER":      52,
    "LEAVE":      53,
    "PUSHA":      54,
    "POPA":       55,
    
    # == CONTROL FLOW (64-95) ==
    "JMP_REL":    64,  # JMP relative
    "JMP_ABS":    65,  # JMP absolute
    "JE":         66,  # Jump Equal
    "JNE":        67,  # Jump Not Equal
    "JG":         68,  # Jump Greater
    "JL":         69,  # Jump Less
    "CALL":       70,
    "RET":        71,
    
    # == SYSTEM / MISC (96-127) ==
    "NOP":        96,
    "INT":        97,
    "HLT":        98,
    "CLI":        99,  # Clear Interrupts
    "STI":        100, # Set Interrupts
    "CLD":        101, # Clear Direction Flag
    "STD":        102, # Set Direction Flag
    "PUSH_ES":    112,
    "POP_ES":     113,
    "PUSH_CS":    114,
    "PUSH_SS":    115,
    "PUSH_DS":    116,
    "PUSH_FS":    117,
    "PUSH_GS":    118,
    "POP_SS":     119,
    "POP_DS":     120,
    "POP_FS":     121,
    "POP_GS":     122,
    "PUSHF":      128,
    "POPF":       129,
    "PUSHFQ":     130, # 64-bit flags
    "POPFQ":      131,
    
    # == KERNEL / IO (150-199) ==
    "SYSCALL":    150, # Generic System Call
    "EXIT":       151, # Terminate program
    "OPEN":       152, # File Open
    "READ":       153, # File Read
    "WRITE":      154, # File Write
    "CLOSE":      155, # File Close
    
    "UNKNOWN":    255  # Fallback
}

# Load extensions
try:
    from systems.neural_cpu.sis_extensions import SIS_EXTENSIONS
    # Merge extensions (simple update, strictly speaking we should ensure no ID collisions if we care about compact space)
    # The generator started at 256, so it's safe.
    SIS_PRIMITIVES.update(SIS_EXTENSIONS)
except ImportError:
    pass

class SemanticEncoder:
    def __init__(self):
        # Dynamically size vector dim based on primitive count
        max_id = max(SIS_PRIMITIVES.values())
        self.vector_dim = max(256, max_id + 1)
        self.basis_vectors = self._build_basis()

    def _build_basis(self):
        """Creates orthogonal vectors for each primitive."""
        basis = {}
        for name, idx in SIS_PRIMITIVES.items():
            vec = np.zeros(self.vector_dim, dtype=np.float32)
            # One-hot component
            vec[idx] = 1.0 
            # Positional encoding component for robustness
            # (Simplified for large space - just use sparse one-hot for perfect fidelity test)
            basis[name] = vec
        return basis

    def get_vector(self, primitive_name):
        return self.basis_vectors.get(primitive_name, self.basis_vectors["UNKNOWN"])

    def decode_vector(self, vector):
        """Finds nearest semantic primitive"""
        best_name = "UNKNOWN"
        best_score = -1.0
        
        # Optimize: Dot product against all basis vectors
        # For prototype, linear scan is fine
        for name, basis in self.basis_vectors.items():
            score = np.dot(vector, basis)
            if score > best_score:
                best_score = score
                best_name = name
                
        return best_name
