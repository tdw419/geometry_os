"""
x86_64 to WASM Register Mapper

Maps x86_64 registers to WebAssembly locals, handling:
- 64-bit registers (RAX-R15)
- 32-bit forms (EAX, EBX, etc.) - zero-extend to 64-bit
- 16-bit forms (AX, BX, etc.)
- 8-bit forms (AL, AH, BL, etc.)
- Register preservation conventions (callee-saved vs caller-saved)
- Special registers (RSP, RBP, ST0-ST7, XMM0-XMM15)

Usage:
    mapper = RegisterMapper()
    idx = mapper.map_register("RAX")  # Returns WASM local index

    # For size handling
    if mapper.needs_zero_extend("EAX"):
        # Generate i32.extend_u/i64.extend_u instructions
        pass
"""

from enum import Enum, auto
from typing import Dict, List, Set, Optional
from dataclasses import dataclass


class RegisterSize(Enum):
    """Size of a register in bits."""
    BITS_8 = 8
    BITS_16 = 16
    BITS_32 = 32
    BITS_64 = 64
    BITS_80 = 80  # x87 registers
    BITS_128 = 128  # XMM registers
    BITS_256 = 256  # YMM registers
    BITS_512 = 512  # ZMM registers


class RegisterClass(Enum):
    """Classification of a register."""
    GENERAL_PURPOSE = auto()
    STACK_POINTER = auto()
    FRAME_POINTER = auto()
    FLOATING_POINT = auto()  # x87 ST0-ST7
    SIMD = auto()  # XMM/YMM/ZMM
    SEGMENT = auto()
    CONTROL = auto()


@dataclass
class RegisterAlias:
    """Represents an alias relationship between registers."""
    name: str
    base_register: str
    size: RegisterSize
    offset: int = 0  # Byte offset from base (for AH, BH, etc.)


class RegisterMappingError(Exception):
    """Raised when an invalid register mapping is requested."""
    pass


class RegisterMapper:
    """
    Maps x86_64 registers to WASM local indices.

    WASM locals are indexed from 0, with function parameters first.
    This mapper reserves indices for all x86_64 registers that may be used.
    """

    # Standard mapping: GPRs to WASM locals 0-15
    _GPR_MAP: Dict[str, int] = {
        "RAX": 0, "RBX": 1, "RCX": 2, "RDX": 3,
        "RSI": 4, "RDI": 5, "RBP": 6, "RSP": 7,
        "R8": 8, "R9": 9, "R10": 10, "R11": 11,
        "R12": 12, "R13": 13, "R14": 14, "R15": 15,
    }

    # 32-bit forms (zero-extend to 64-bit parent)
    _GPR32_MAP: Dict[str, str] = {
        "EAX": "RAX", "EBX": "RBX", "ECX": "RCX", "EDX": "RDX",
        "ESI": "RSI", "EDI": "RDI", "EBP": "RBP", "ESP": "RSP",
        "R8D": "R8", "R9D": "R9", "R10D": "R10", "R11D": "R11",
        "R12D": "R12", "R13D": "R13", "R14D": "R14", "R15D": "R15",
    }

    # 16-bit forms (zero-extend to 64-bit parent)
    _GPR16_MAP: Dict[str, str] = {
        "AX": "RAX", "BX": "RBX", "CX": "RCX", "DX": "RDX",
        "SI": "RSI", "DI": "RDI", "BP": "RBP", "SP": "RSP",
        "R8W": "R8", "R9W": "R9", "R10W": "R10", "R11W": "R11",
        "R12W": "R12", "R13W": "R13", "R14W": "R14", "R15W": "R15",
    }

    # 8-bit low forms (zero-extend to 64-bit parent)
    _GPR8L_MAP: Dict[str, str] = {
        "AL": "RAX", "BL": "RBX", "CL": "RCX", "DL": "RDX",
        "SIL": "RSI", "DIL": "RDI", "BPL": "RBP", "SPL": "RSP",
        "R8B": "R8", "R9B": "R9", "R10B": "R10", "R11B": "R11",
        "R12B": "R12", "R13B": "R13", "R14B": "R14", "R15B": "R15",
    }

    # 8-bit high forms (bits 8-15 of parent, special handling needed)
    _GPR8H_MAP: Dict[str, str] = {
        "AH": "RAX", "BH": "RBX", "CH": "RCX", "DH": "RDX",
    }

    # x87 floating-point registers
    _X87_MAP: Dict[str, int] = {
        "ST0": 16, "ST1": 17, "ST2": 18, "ST3": 19,
        "ST4": 20, "ST5": 21, "ST6": 22, "ST7": 23,
    }

    # MMX registers (aliased with x87)
    _MMX_MAP: Dict[str, int] = {
        "MM0": 16, "MM1": 17, "MM2": 18, "MM3": 19,
        "MM4": 20, "MM5": 21, "MM6": 22, "MM7": 23,
    }

    # XMM registers (128-bit SIMD)
    _XMM_MAP: Dict[str, int] = {
        "XMM0": 24, "XMM1": 25, "XMM2": 26, "XMM3": 27,
        "XMM4": 28, "XMM5": 29, "XMM6": 30, "XMM7": 31,
        "XMM8": 32, "XMM9": 33, "XMM10": 34, "XMM11": 35,
        "XMM12": 36, "XMM13": 37, "XMM14": 38, "XMM15": 39,
    }

    # Callee-saved registers (System V AMD64 ABI)
    _CALLEE_SAVED: Set[str] = {"RBX", "RSP", "RBP", "R12", "R13", "R14", "R15"}

    # Register classifications
    _REGISTER_CLASSES: Dict[str, RegisterClass] = {
        "RAX": RegisterClass.GENERAL_PURPOSE,
        "RBX": RegisterClass.GENERAL_PURPOSE,
        "RCX": RegisterClass.GENERAL_PURPOSE,
        "RDX": RegisterClass.GENERAL_PURPOSE,
        "RSI": RegisterClass.GENERAL_PURPOSE,
        "RDI": RegisterClass.GENERAL_PURPOSE,
        "RBP": RegisterClass.FRAME_POINTER,
        "RSP": RegisterClass.STACK_POINTER,
        "R8": RegisterClass.GENERAL_PURPOSE,
        "R9": RegisterClass.GENERAL_PURPOSE,
        "R10": RegisterClass.GENERAL_PURPOSE,
        "R11": RegisterClass.GENERAL_PURPOSE,
        "R12": RegisterClass.GENERAL_PURPOSE,
        "R13": RegisterClass.GENERAL_PURPOSE,
        "R14": RegisterClass.GENERAL_PURPOSE,
        "R15": RegisterClass.GENERAL_PURPOSE,
    }

    # Register sizes
    _REGISTER_SIZES: Dict[str, RegisterSize] = {
        # 64-bit
        **{reg: RegisterSize.BITS_64 for reg in _GPR_MAP.keys()},
        **{reg: RegisterSize.BITS_80 for reg in _X87_MAP.keys()},
        **{reg: RegisterSize.BITS_64 for reg in _MMX_MAP.keys()},
        **{reg: RegisterSize.BITS_128 for reg in _XMM_MAP.keys()},
        # 32-bit
        **{reg: RegisterSize.BITS_32 for reg in _GPR32_MAP.keys()},
        # 16-bit
        **{reg: RegisterSize.BITS_16 for reg in _GPR16_MAP.keys()},
        # 8-bit low
        **{reg: RegisterSize.BITS_8 for reg in _GPR8L_MAP.keys()},
        # 8-bit high
        **{reg: RegisterSize.BITS_8 for reg in _GPR8H_MAP.keys()},
    }

    def __init__(self):
        """Initialize the register mapper with no live registers."""
        self._live_registers: Set[str] = set()
        self._next_local_index = 40  # Start after XMM15

    def map_register(self, register: str) -> int:
        """
        Map an x86_64 register to a WASM local index.

        Args:
            register: Register name (case-insensitive)

        Returns:
            WASM local index for this register

        Raises:
            RegisterMappingError: If the register is not recognized
        """
        reg_upper = register.upper()

        # Check direct GPR mappings
        if reg_upper in self._GPR_MAP:
            return self._GPR_MAP[reg_upper]

        # Check 32-bit forms
        if reg_upper in self._GPR32_MAP:
            base_reg = self._GPR32_MAP[reg_upper]
            return self._GPR_MAP[base_reg]

        # Check 16-bit forms
        if reg_upper in self._GPR16_MAP:
            base_reg = self._GPR16_MAP[reg_upper]
            return self._GPR_MAP[base_reg]

        # Check 8-bit low forms
        if reg_upper in self._GPR8L_MAP:
            base_reg = self._GPR8L_MAP[reg_upper]
            return self._GPR_MAP[base_reg]

        # Check 8-bit high forms
        if reg_upper in self._GPR8H_MAP:
            base_reg = self._GPR8H_MAP[reg_upper]
            return self._GPR_MAP[base_reg]

        # Check x87 registers
        if reg_upper in self._X87_MAP:
            return self._X87_MAP[reg_upper]

        # Check MMX registers
        if reg_upper in self._MMX_MAP:
            return self._MMX_MAP[reg_upper]

        # Check XMM registers
        if reg_upper in self._XMM_MAP:
            return self._XMM_MAP[reg_upper]

        raise RegisterMappingError(f"Unknown register: {register}")

    def get_register_size(self, register: str) -> RegisterSize:
        """
        Get the size of a register.

        Args:
            register: Register name (case-insensitive)

        Returns:
            RegisterSize enum value
        """
        reg_upper = register.upper()

        if reg_upper in self._REGISTER_SIZES:
            return self._REGISTER_SIZES[reg_upper]

        raise RegisterMappingError(f"Unknown register: {register}")

    def needs_zero_extend(self, register: str) -> bool:
        """
        Check if a register operation needs zero-extension.

        32-bit and smaller registers need zero-extension when stored
        in a 64-bit slot to maintain x86_64 semantics.

        Args:
            register: Register name (case-insensitive)

        Returns:
            True if zero-extension is needed
        """
        size = self.get_register_size(register)
        return size in (RegisterSize.BITS_8, RegisterSize.BITS_16, RegisterSize.BITS_32)

    def get_register_class(self, register: str) -> RegisterClass:
        """
        Get the classification of a register.

        Args:
            register: Register name (case-insensitive)

        Returns:
            RegisterClass enum value
        """
        reg_upper = register.upper()

        # Check direct classification
        if reg_upper in self._REGISTER_CLASSES:
            return self._REGISTER_CLASSES[reg_upper]

        # For aliases, get the base register class
        if reg_upper in self._GPR32_MAP:
            base = self._GPR32_MAP[reg_upper]
            return self._REGISTER_CLASSES[base]

        if reg_upper in self._GPR16_MAP:
            base = self._GPR16_MAP[reg_upper]
            return self._REGISTER_CLASSES[base]

        if reg_upper in self._GPR8L_MAP:
            base = self._GPR8L_MAP[reg_upper]
            return self._REGISTER_CLASSES[base]

        if reg_upper in self._GPR8H_MAP:
            base = self._GPR8H_MAP[reg_upper]
            return self._REGISTER_CLASSES[base]

        # Special registers
        if reg_upper in self._X87_MAP or reg_upper in self._MMX_MAP:
            return RegisterClass.FLOATING_POINT

        if reg_upper in self._XMM_MAP:
            return RegisterClass.SIMD

        raise RegisterMappingError(f"Unknown register: {register}")

    def get_callee_saved_registers(self) -> List[str]:
        """
        Get list of callee-saved registers (must be preserved across calls).

        Returns:
            List of register names
        """
        return list(self._CALLEE_SAVED)

    def get_caller_saved_registers(self) -> List[str]:
        """
        Get list of caller-saved registers (may be clobbered by calls).

        Returns:
            List of register names
        """
        all_gprs = set(self._GPR_MAP.keys())
        return sorted(all_gprs - self._CALLEE_SAVED)

    def mark_live(self, register: str):
        """
        Mark a register as live (actively containing a value).

        Args:
            register: Register name (case-insensitive)
        """
        reg_upper = register.upper()
        self._live_registers.add(reg_upper)

    def mark_dead(self, register: str):
        """
        Mark a register as dead (no longer containing a useful value).

        Args:
            register: Register name (case-insensitive)
        """
        reg_upper = register.upper()
        self._live_registers.discard(reg_upper)

    def get_live_registers(self) -> List[str]:
        """
        Get list of currently live registers.

        Returns:
            List of register names
        """
        return sorted(self._live_registers)

    def clear_live_registers(self):
        """Clear all live register markings."""
        self._live_registers.clear()

    def get_register_aliases(self, register: str) -> List[RegisterAlias]:
        """
        Get all aliases for a register.

        Args:
            register: Register name (case-insensitive)

        Returns:
            List of RegisterAlias objects
        """
        reg_upper = register.upper()
        aliases = []

        # Build alias relationships based on the register maps
        if reg_upper == "RAX":
            aliases.extend([
                RegisterAlias("EAX", "RAX", RegisterSize.BITS_32),
                RegisterAlias("AX", "RAX", RegisterSize.BITS_16),
                RegisterAlias("AL", "RAX", RegisterSize.BITS_8),
                RegisterAlias("AH", "RAX", RegisterSize.BITS_8, offset=1),
            ])
        elif reg_upper == "RBX":
            aliases.extend([
                RegisterAlias("EBX", "RBX", RegisterSize.BITS_32),
                RegisterAlias("BX", "RBX", RegisterSize.BITS_16),
                RegisterAlias("BL", "RBX", RegisterSize.BITS_8),
                RegisterAlias("BH", "RBX", RegisterSize.BITS_8, offset=1),
            ])
        # Similar patterns for other GPRs...

        return aliases

    def get_wasm_local_declarations(self) -> List[Dict[str, any]]:
        """
        Generate WASM local declarations for all mapped registers.

        Returns:
            List of dictionaries with 'index' and 'type' keys
        """
        declarations = []

        # GPRs (i64)
        for i in range(16):
            declarations.append({"index": i, "type": "i64"})

        # x87/MMX (f64 for simplicity, real x87 is 80-bit)
        for i in range(16, 24):
            declarations.append({"index": i, "type": "f64"})

        # XMM (v128)
        for i in range(24, 40):
            declarations.append({"index": i, "type": "v128"})

        return declarations

    def export_register_map(self) -> Dict[str, int]:
        """
        Export the complete register mapping as a dictionary.

        Returns:
            Dictionary mapping register names to WASM local indices
        """
        reg_map = {}

        # Add all GPRs
        reg_map.update(self._GPR_MAP)
        # Add 32-bit forms
        for reg32, base in self._GPR32_MAP.items():
            reg_map[reg32] = self._GPR_MAP[base]
        # Add 16-bit forms
        for reg16, base in self._GPR16_MAP.items():
            reg_map[reg16] = self._GPR_MAP[base]
        # Add 8-bit forms
        for reg8, base in self._GPR8L_MAP.items():
            reg_map[reg8] = self._GPR_MAP[base]
        for reg8, base in self._GPR8H_MAP.items():
            reg_map[reg8] = self._GPR_MAP[base]
        # Add x87/MMX
        reg_map.update(self._X87_MAP)
        reg_map.update(self._MMX_MAP)
        # Add XMM
        reg_map.update(self._XMM_MAP)

        return reg_map

    def allocate_local(self, wasm_type: str = "i64") -> int:
        """
        Allocate a new WASM local for temporary values.

        Args:
            wasm_type: WASM type (i32, i64, f32, f64, v128)

        Returns:
            Local index for the new temporary
        """
        idx = self._next_local_index
        self._next_local_index += 1
        return idx
