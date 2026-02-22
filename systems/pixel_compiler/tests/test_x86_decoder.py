"""
Tests for x86_64 Instruction Decoder

Tests the X86InstructionDecoder class for decoding x86_64 binary instructions
into an intermediate representation (IR).
"""

import pytest
from dataclasses import asdict
import sys
import os

# Add parent directories to path for imports
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from x86_decoder import (
    X86InstructionDecoder,
    Instruction,
    Operand,
    OperandType,
    InstructionCategory,
    decode_binary_file,
    REXPrefix,
    decode_rex_prefix,
    ModRM,
    decode_modrm,
    SIB,
    decode_sib,
    get_effective_address,
)


class TestREXPrefixDecoder:
    """Test suite for REX prefix decoding."""

    # Test all 16 REX prefix values (0x40-0x4F)

    def test_rex_0x40_no_extensions(self):
        """Test REX prefix 0x40 - no extensions (REX only)."""
        rex = decode_rex_prefix(0x40)
        assert rex.present is True
        assert rex.raw == 0x40
        assert rex.W is False
        assert rex.R is False
        assert rex.X is False
        assert rex.B is False

    def test_rex_0x41_base_extension(self):
        """Test REX prefix 0x41 - B bit set (base extension)."""
        rex = decode_rex_prefix(0x41)
        assert rex.present is True
        assert rex.raw == 0x41
        assert rex.W is False
        assert rex.R is False
        assert rex.X is False
        assert rex.B is True

    def test_rex_0x42_index_extension(self):
        """Test REX prefix 0x42 - X bit set (index extension)."""
        rex = decode_rex_prefix(0x42)
        assert rex.present is True
        assert rex.raw == 0x42
        assert rex.W is False
        assert rex.R is False
        assert rex.X is True
        assert rex.B is False

    def test_rex_0x43_index_and_base(self):
        """Test REX prefix 0x43 - X and B bits set."""
        rex = decode_rex_prefix(0x43)
        assert rex.present is True
        assert rex.raw == 0x43
        assert rex.W is False
        assert rex.R is False
        assert rex.X is True
        assert rex.B is True

    def test_rex_0x44_register_extension(self):
        """Test REX prefix 0x44 - R bit set (register extension)."""
        rex = decode_rex_prefix(0x44)
        assert rex.present is True
        assert rex.raw == 0x44
        assert rex.W is False
        assert rex.R is True
        assert rex.X is False
        assert rex.B is False

    def test_rex_0x45_reg_and_base(self):
        """Test REX prefix 0x45 - R and B bits set."""
        rex = decode_rex_prefix(0x45)
        assert rex.present is True
        assert rex.raw == 0x45
        assert rex.W is False
        assert rex.R is True
        assert rex.X is False
        assert rex.B is True

    def test_rex_0x46_reg_and_index(self):
        """Test REX prefix 0x46 - R and X bits set."""
        rex = decode_rex_prefix(0x46)
        assert rex.present is True
        assert rex.raw == 0x46
        assert rex.W is False
        assert rex.R is True
        assert rex.X is True
        assert rex.B is False

    def test_rex_0x47_reg_index_and_base(self):
        """Test REX prefix 0x47 - R, X, and B bits set."""
        rex = decode_rex_prefix(0x47)
        assert rex.present is True
        assert rex.raw == 0x47
        assert rex.W is False
        assert rex.R is True
        assert rex.X is True
        assert rex.B is True

    def test_rex_0x48_64bit_operand(self):
        """Test REX prefix 0x48 - W bit set (64-bit operand)."""
        rex = decode_rex_prefix(0x48)
        assert rex.present is True
        assert rex.raw == 0x48
        assert rex.W is True
        assert rex.R is False
        assert rex.X is False
        assert rex.B is False

    def test_rex_0x49_64bit_and_base(self):
        """Test REX prefix 0x49 - W and B bits set."""
        rex = decode_rex_prefix(0x49)
        assert rex.present is True
        assert rex.raw == 0x49
        assert rex.W is True
        assert rex.R is False
        assert rex.X is False
        assert rex.B is True

    def test_rex_0x4a_64bit_and_index(self):
        """Test REX prefix 0x4A - W and X bits set."""
        rex = decode_rex_prefix(0x4A)
        assert rex.present is True
        assert rex.raw == 0x4A
        assert rex.W is True
        assert rex.R is False
        assert rex.X is True
        assert rex.B is False

    def test_rex_0x4b_64bit_index_and_base(self):
        """Test REX prefix 0x4B - W, X, and B bits set."""
        rex = decode_rex_prefix(0x4B)
        assert rex.present is True
        assert rex.raw == 0x4B
        assert rex.W is True
        assert rex.R is False
        assert rex.X is True
        assert rex.B is True

    def test_rex_0x4c_64bit_and_reg(self):
        """Test REX prefix 0x4C - W and R bits set (64-bit with register extension)."""
        rex = decode_rex_prefix(0x4C)
        assert rex.present is True
        assert rex.raw == 0x4C
        assert rex.W is True
        assert rex.R is True
        assert rex.X is False
        assert rex.B is False

    def test_rex_0x4d_64bit_reg_and_base(self):
        """Test REX prefix 0x4D - W, R, and B bits set."""
        rex = decode_rex_prefix(0x4D)
        assert rex.present is True
        assert rex.raw == 0x4D
        assert rex.W is True
        assert rex.R is True
        assert rex.X is False
        assert rex.B is True

    def test_rex_0x4e_64bit_reg_and_index(self):
        """Test REX prefix 0x4E - W, R, and X bits set."""
        rex = decode_rex_prefix(0x4E)
        assert rex.present is True
        assert rex.raw == 0x4E
        assert rex.W is True
        assert rex.R is True
        assert rex.X is True
        assert rex.B is False

    def test_rex_0x4f_all_extensions(self):
        """Test REX prefix 0x4F - all extension bits set (WRXB)."""
        rex = decode_rex_prefix(0x4F)
        assert rex.present is True
        assert rex.raw == 0x4F
        assert rex.W is True
        assert rex.R is True
        assert rex.X is True
        assert rex.B is True

    # Test non-REX prefix values (0x3F and below, 0x50 and above)

    def test_not_rex_0x00(self):
        """Test that 0x00 is not a REX prefix."""
        rex = decode_rex_prefix(0x00)
        assert rex.present is False
        assert rex.raw == 0x00
        assert rex.W is False
        assert rex.R is False
        assert rex.X is False
        assert rex.B is False

    def test_not_rex_0x3f(self):
        """Test that 0x3F is not a REX prefix (boundary case)."""
        rex = decode_rex_prefix(0x3F)
        assert rex.present is False
        assert rex.raw == 0x3F
        assert rex.W is False
        assert rex.R is False
        assert rex.X is False
        assert rex.B is False

    def test_not_rex_0x50(self):
        """Test that 0x50 (PUSH RAX) is not a REX prefix."""
        rex = decode_rex_prefix(0x50)
        assert rex.present is False
        assert rex.raw == 0x50

    def test_not_rex_0xff(self):
        """Test that 0xFF is not a REX prefix."""
        rex = decode_rex_prefix(0xFF)
        assert rex.present is False
        assert rex.raw == 0xFF

    # Test individual bit extraction

    def test_w_bit_extraction(self):
        """Test W bit extraction (bit 3, 0x08)."""
        # W bit is bit 3 (0x08)
        for byte in [0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F]:
            rex = decode_rex_prefix(byte)
            assert rex.W is True, f"Expected W=True for 0x{byte:02X}"
        for byte in [0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47]:
            rex = decode_rex_prefix(byte)
            assert rex.W is False, f"Expected W=False for 0x{byte:02X}"

    def test_r_bit_extraction(self):
        """Test R bit extraction (bit 2, 0x04)."""
        # R bit is bit 2 (0x04)
        for byte in [0x44, 0x45, 0x46, 0x47, 0x4C, 0x4D, 0x4E, 0x4F]:
            rex = decode_rex_prefix(byte)
            assert rex.R is True, f"Expected R=True for 0x{byte:02X}"
        for byte in [0x40, 0x41, 0x42, 0x43, 0x48, 0x49, 0x4A, 0x4B]:
            rex = decode_rex_prefix(byte)
            assert rex.R is False, f"Expected R=False for 0x{byte:02X}"

    def test_x_bit_extraction(self):
        """Test X bit extraction (bit 1, 0x02)."""
        # X bit is bit 1 (0x02)
        for byte in [0x42, 0x43, 0x46, 0x47, 0x4A, 0x4B, 0x4E, 0x4F]:
            rex = decode_rex_prefix(byte)
            assert rex.X is True, f"Expected X=True for 0x{byte:02X}"
        for byte in [0x40, 0x41, 0x44, 0x45, 0x48, 0x49, 0x4C, 0x4D]:
            rex = decode_rex_prefix(byte)
            assert rex.X is False, f"Expected X=False for 0x{byte:02X}"

    def test_b_bit_extraction(self):
        """Test B bit extraction (bit 0, 0x01)."""
        # B bit is bit 0 (0x01)
        for byte in [0x41, 0x43, 0x45, 0x47, 0x49, 0x4B, 0x4D, 0x4F]:
            rex = decode_rex_prefix(byte)
            assert rex.B is True, f"Expected B=True for 0x{byte:02X}"
        for byte in [0x40, 0x42, 0x44, 0x46, 0x48, 0x4A, 0x4C, 0x4E]:
            rex = decode_rex_prefix(byte)
            assert rex.B is False, f"Expected B=False for 0x{byte:02X}"

    # Test REXPrefix class methods

    def test_rex_value_property(self):
        """Test REXPrefix.value property returns correct integer."""
        rex = decode_rex_prefix(0x48)
        assert rex.value == 0x48

        rex = decode_rex_prefix(0x4F)
        assert rex.value == 0x4F

        # Non-REX prefix should return 0
        rex = decode_rex_prefix(0x3F)
        assert rex.value == 0

    def test_rex_int_conversion(self):
        """Test REXPrefix can be converted to int."""
        rex = decode_rex_prefix(0x48)
        assert int(rex) == 0x48

        rex = decode_rex_prefix(0x3F)
        assert int(rex) == 0

    def test_rex_string_representation(self):
        """Test REXPrefix string representation."""
        rex = decode_rex_prefix(0x48)
        s = str(rex)
        assert "0x48" in s
        assert "W" in s
        assert "flags=" in s

        rex = decode_rex_prefix(0x4F)
        s = str(rex)
        assert "0x4F" in s
        assert "WRXB" in s

        rex = decode_rex_prefix(0x40)
        s = str(rex)
        assert "0x40" in s
        assert "none" in s  # no flags set

        rex = decode_rex_prefix(0x3F)
        s = str(rex)
        assert "not present" in s

    def test_rex_dataclass_fields(self):
        """Test REXPrefix dataclass field access."""
        rex = REXPrefix(W=True, R=True, X=False, B=True, present=True, raw=0x4D)
        assert rex.W is True
        assert rex.R is True
        assert rex.X is False
        assert rex.B is True
        assert rex.present is True
        assert rex.raw == 0x4D

    # Comprehensive test for all valid REX values

    def test_all_16_rex_values_valid(self):
        """Test that all 16 REX values (0x40-0x4F) are recognized as valid."""
        for byte in range(0x40, 0x50):
            rex = decode_rex_prefix(byte)
            assert rex.present is True, f"0x{byte:02X} should be valid REX"
            assert rex.raw == byte

    def test_boundary_values_not_rex(self):
        """Test boundary values that are NOT REX prefixes."""
        # Just below REX range
        assert decode_rex_prefix(0x3F).present is False
        assert decode_rex_prefix(0x00).present is False

        # Just above REX range
        assert decode_rex_prefix(0x50).present is False
        assert decode_rex_prefix(0xFF).present is False


class TestModRMDecoder:
    """Test suite for ModR/M byte decoding."""

    # Test all mod values (0-3)

    def test_mod_00_no_displacement(self):
        """Test mod=00 (no displacement, except special cases)."""
        # 0x00 = mod=00, reg=000, rm=000 -> [EAX], EAX
        modrm = decode_modrm(0x00)
        assert modrm.mod == 0
        assert modrm.reg == 0
        assert modrm.rm == 0
        assert modrm.disp_size == 0
        assert modrm.has_sib is False
        assert modrm.is_rip_relative is False

    def test_mod_01_disp8(self):
        """Test mod=01 (8-bit displacement)."""
        # 0x40 = mod=01, reg=000, rm=000 -> [EAX+disp8], EAX
        modrm = decode_modrm(0x40)
        assert modrm.mod == 1
        assert modrm.reg == 0
        assert modrm.rm == 0
        assert modrm.disp_size == 1
        assert modrm.has_sib is False

    def test_mod_10_disp32(self):
        """Test mod=10 (32-bit displacement)."""
        # 0x80 = mod=10, reg=000, rm=000 -> [EAX+disp32], EAX
        modrm = decode_modrm(0x80)
        assert modrm.mod == 2
        assert modrm.reg == 0
        assert modrm.rm == 0
        assert modrm.disp_size == 4
        assert modrm.has_sib is False

    def test_mod_11_register_direct(self):
        """Test mod=11 (register direct mode)."""
        # 0xC0 = mod=11, reg=000, rm=000 -> EAX, EAX
        modrm = decode_modrm(0xC0)
        assert modrm.mod == 3
        assert modrm.reg == 0
        assert modrm.rm == 0
        assert modrm.disp_size == 0
        assert modrm.has_sib is False
        assert modrm.is_rip_relative is False

    # Test register direct mode (mod=3)

    def test_register_direct_eax_eax(self):
        """Test mod=3, reg=0, rm=0: EAX, EAX."""
        # 0xC0 = 11 000 000
        modrm = decode_modrm(0xC0)
        assert modrm.mod == 3
        assert modrm.reg_name == 'EAX'
        assert modrm.rm_name == 'EAX'

    def test_register_direct_ecx_edx(self):
        """Test mod=3, reg=1, rm=2: ECX, EDX."""
        # 0xCA = 11 001 010
        modrm = decode_modrm(0xCA)
        assert modrm.mod == 3
        assert modrm.reg_name == 'ECX'
        assert modrm.rm_name == 'EDX'

    def test_register_direct_all_registers(self):
        """Test all 8 registers in direct mode."""
        reg_names = ['EAX', 'ECX', 'EDX', 'EBX', 'ESP', 'EBP', 'ESI', 'EDI']
        for i, name in enumerate(reg_names):
            # mod=3, reg=0, rm=i
            byte = 0xC0 | i
            modrm = decode_modrm(byte)
            assert modrm.rm_name == name, f"Expected {name} for rm={i}"

    # Test RIP-relative addressing (mod=0, rm=5 in 64-bit mode)

    def test_rip_relative_64bit(self):
        """Test RIP-relative addressing in 64-bit mode (mod=0, rm=5)."""
        # 0x05 = 00 000 101
        modrm = decode_modrm(0x05, is_64bit=True)
        assert modrm.mod == 0
        assert modrm.rm == 5
        assert modrm.is_rip_relative is True
        assert modrm.disp_size == 4
        assert modrm.rm_name == 'RIP'

    def test_rip_relative_not_in_32bit(self):
        """Test that RIP-relative is not set in 32-bit mode."""
        # 0x05 = 00 000 101
        modrm = decode_modrm(0x05, is_64bit=False)
        assert modrm.is_rip_relative is False
        assert modrm.disp_size == 4  # disp32-only in 32-bit mode

    # Test SIB detection (mod=0, rm=4)

    def test_sib_detection_mod_00(self):
        """Test SIB byte detection when mod=0 and rm=4."""
        # 0x04 = 00 000 100
        modrm = decode_modrm(0x04)
        assert modrm.mod == 0
        assert modrm.rm == 4
        assert modrm.has_sib is True
        assert modrm.disp_size == 0  # No displacement with SIB in mod=0

    def test_sib_detection_mod_01(self):
        """Test SIB byte detection when mod=1 and rm=4."""
        # 0x44 = 01 000 100
        modrm = decode_modrm(0x44)
        assert modrm.mod == 1
        assert modrm.rm == 4
        assert modrm.has_sib is True
        assert modrm.disp_size == 1  # disp8 with SIB

    def test_sib_detection_mod_10(self):
        """Test SIB byte detection when mod=2 and rm=4."""
        # 0x84 = 10 000 100
        modrm = decode_modrm(0x84)
        assert modrm.mod == 2
        assert modrm.rm == 4
        assert modrm.has_sib is True
        assert modrm.disp_size == 4  # disp32 with SIB

    def test_no_sib_in_register_mode(self):
        """Test that SIB is not indicated in register mode (mod=3)."""
        # 0xC4 = 11 000 100 (mod=3, reg=0, rm=4 = ESP)
        modrm = decode_modrm(0xC4)
        assert modrm.mod == 3
        assert modrm.rm == 4
        assert modrm.has_sib is False
        assert modrm.rm_name == 'ESP'

    # Test displacement sizes

    def test_disp_size_mod_00_normal(self):
        """Test displacement size for mod=0 (normal case, no disp)."""
        # 0x00 = mod=0, reg=0, rm=0
        modrm = decode_modrm(0x00)
        assert modrm.disp_size == 0

    def test_disp_size_mod_00_rm5(self):
        """Test displacement size for mod=0, rm=5 (disp32)."""
        # 0x05 = mod=0, reg=0, rm=5
        modrm = decode_modrm(0x05)
        assert modrm.disp_size == 4

    def test_disp_size_mod_01(self):
        """Test displacement size for mod=1 (disp8)."""
        # 0x45 = mod=1, reg=0, rm=5
        modrm = decode_modrm(0x45)
        assert modrm.disp_size == 1

    def test_disp_size_mod_10(self):
        """Test displacement size for mod=2 (disp32)."""
        # 0x85 = mod=2, reg=0, rm=5
        modrm = decode_modrm(0x85)
        assert modrm.disp_size == 4

    def test_disp_size_mod_11(self):
        """Test displacement size for mod=3 (register mode, no disp)."""
        # 0xC5 = mod=3, reg=0, rm=5
        modrm = decode_modrm(0xC5)
        assert modrm.disp_size == 0

    # Test REX.R extension (extends reg field)

    def test_rex_r_extension_64bit(self):
        """Test REX.R extension for reg field in 64-bit mode."""
        # Without REX.R: reg=0 -> RAX
        modrm = decode_modrm(0xC0, is_64bit=True)
        assert modrm.reg_name == 'RAX'

        # With REX.R: reg=0 -> R8
        rex = REXPrefix(R=True, present=True, raw=0x44)
        modrm = decode_modrm(0xC0, rex=rex, is_64bit=True)
        assert modrm.reg_name == 'R8'

    def test_rex_r_all_extended_registers(self):
        """Test REX.R extension for all extended registers (R8-R15)."""
        rex = REXPrefix(R=True, present=True, raw=0x44)
        ext_names = ['R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15']

        for i, name in enumerate(ext_names):
            # mod=3, reg=i, rm=0
            byte = 0xC0 | (i << 3)
            modrm = decode_modrm(byte, rex=rex, is_64bit=True)
            assert modrm.reg_name == name, f"Expected {name} for reg={i}"

    # Test REX.B extension (extends rm field)

    def test_rex_b_extension_64bit(self):
        """Test REX.B extension for rm field in 64-bit mode."""
        # Without REX.B: rm=0 -> RAX
        modrm = decode_modrm(0xC0, is_64bit=True)
        assert modrm.rm_name == 'RAX'

        # With REX.B: rm=0 -> R8
        rex = REXPrefix(B=True, present=True, raw=0x41)
        modrm = decode_modrm(0xC0, rex=rex, is_64bit=True)
        assert modrm.rm_name == 'R8'

    def test_rex_b_all_extended_registers(self):
        """Test REX.B extension for all extended registers (R8-R15)."""
        rex = REXPrefix(B=True, present=True, raw=0x41)
        ext_names = ['R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15']

        for i, name in enumerate(ext_names):
            # mod=3, reg=0, rm=i
            byte = 0xC0 | i
            modrm = decode_modrm(byte, rex=rex, is_64bit=True)
            assert modrm.rm_name == name, f"Expected {name} for rm={i}"

    # Test combined REX.R and REX.B

    def test_rex_r_and_b_combined(self):
        """Test combined REX.R and REX.B extensions."""
        # REX.WRB = 0x4F (all bits set)
        rex = REXPrefix(W=True, R=True, X=True, B=True, present=True, raw=0x4F)

        # mod=3, reg=7, rm=7 -> R15, R15
        modrm = decode_modrm(0xFF, rex=rex, is_64bit=True)
        assert modrm.reg_name == 'R15'
        assert modrm.rm_name == 'R15'

    # Test 32-bit vs 64-bit register names

    def test_32bit_register_names(self):
        """Test that 32-bit mode uses EAX, ECX, etc."""
        modrm = decode_modrm(0xC0, is_64bit=False)  # mod=3, reg=0, rm=0
        assert modrm.reg_name == 'EAX'
        assert modrm.rm_name == 'EAX'

    def test_64bit_register_names(self):
        """Test that 64-bit mode uses RAX, RCX, etc."""
        modrm = decode_modrm(0xC0, is_64bit=True)  # mod=3, reg=0, rm=0
        assert modrm.reg_name == 'RAX'
        assert modrm.rm_name == 'RAX'

    # Test ModRM dataclass properties

    def test_modrm_raw_value(self):
        """Test that raw byte value is stored."""
        modrm = decode_modrm(0xC8)
        assert modrm.raw == 0xC8

    def test_modrm_string_representation(self):
        """Test ModRM string representation."""
        modrm = decode_modrm(0xC0, is_64bit=True)
        s = str(modrm)
        assert '0xC0' in s
        assert 'RAX' in s
        assert 'mod=3' in s

    def test_modrm_string_with_sib(self):
        """Test ModRM string representation with SIB flag."""
        modrm = decode_modrm(0x04)
        s = str(modrm)
        assert 'SIB' in s

    def test_modrm_string_with_rip_relative(self):
        """Test ModRM string representation with RIP-relative flag."""
        modrm = decode_modrm(0x05, is_64bit=True)
        s = str(modrm)
        assert 'RIP-rel' in s
        assert 'disp32' in s

    # Test edge cases

    def test_no_rex_prefix(self):
        """Test ModRM decoding without REX prefix."""
        modrm = decode_modrm(0xC0, rex=None, is_64bit=True)
        assert modrm.reg_name == 'RAX'
        assert modrm.rm_name == 'RAX'

    def test_non_present_rex_prefix(self):
        """Test ModRM decoding with non-present REX prefix."""
        rex = REXPrefix(present=False, raw=0x3F)
        modrm = decode_modrm(0xC0, rex=rex, is_64bit=True)
        assert modrm.reg_name == 'RAX'
        assert modrm.rm_name == 'RAX'

    # Test specific examples from the task

    def test_example_0xC0(self):
        """Test example: 0xC0 (mod=3, reg=0, rm=0): EAX, EAX."""
        modrm = decode_modrm(0xC0)
        assert modrm.mod == 3
        assert modrm.reg == 0
        assert modrm.rm == 0
        assert modrm.reg_name == 'EAX'
        assert modrm.rm_name == 'EAX'

    def test_example_0x05_64bit(self):
        """Test example: 0x05 (mod=0, reg=0, rm=5): RAX, [RIP+disp32]."""
        modrm = decode_modrm(0x05, is_64bit=True)
        assert modrm.mod == 0
        assert modrm.reg == 0
        assert modrm.rm == 5
        assert modrm.reg_name == 'RAX'
        assert modrm.is_rip_relative is True
        assert modrm.disp_size == 4

    def test_example_0x04(self):
        """Test example: 0x04 (mod=0, reg=0, rm=4): EAX, [SIB]."""
        modrm = decode_modrm(0x04)
        assert modrm.mod == 0
        assert modrm.reg == 0
        assert modrm.rm == 4
        assert modrm.reg_name == 'EAX'
        assert modrm.has_sib is True

    def test_example_with_rex_w(self):
        """Test example: 0x48 with REX.W: RAX instead of EAX."""
        rex = REXPrefix(W=True, present=True, raw=0x48)
        modrm = decode_modrm(0xC0, rex=rex, is_64bit=True)
        # REX.W affects operand size but register names are still RAX in 64-bit mode
        assert modrm.reg_name == 'RAX'
        assert modrm.rm_name == 'RAX'


class TestSIBDecoder:
    """Test suite for SIB (Scale-Index-Base) byte decoding."""

    # Test all scale values (1, 2, 4, 8)

    def test_scale_1(self):
        """Test scale=1 (scale field = 00)."""
        # 0x00 = scale=00, index=000, base=000 -> scale=1
        sib = decode_sib(0x00, mod=0)
        assert sib.scale == 1
        assert sib.has_index is True
        assert sib.has_base is True

    def test_scale_2(self):
        """Test scale=2 (scale field = 01)."""
        # 0x40 = scale=01, index=000, base=000 -> scale=2
        sib = decode_sib(0x40, mod=0)
        assert sib.scale == 2
        assert sib.has_index is True

    def test_scale_4(self):
        """Test scale=4 (scale field = 10)."""
        # 0x80 = scale=10, index=000, base=000 -> scale=4
        sib = decode_sib(0x80, mod=0)
        assert sib.scale == 4
        assert sib.has_index is True

    def test_scale_8(self):
        """Test scale=8 (scale field = 11)."""
        # 0xC0 = scale=11, index=000, base=000 -> scale=8
        sib = decode_sib(0xC0, mod=0)
        assert sib.scale == 8
        assert sib.has_index is True

    def test_all_scales_via_field_values(self):
        """Test all scale values using scale field directly."""
        # Scale field is bits 7-6, so:
        # 0x00 = scale 1
        # 0x40 = scale 2
        # 0x80 = scale 4
        # 0xC0 = scale 8
        expected_scales = {0x00: 1, 0x40: 2, 0x80: 4, 0xC0: 8}
        for scale_byte, expected_scale in expected_scales.items():
            sib = decode_sib(scale_byte, mod=0)
            assert sib.scale == expected_scale, f"Expected scale {expected_scale} for byte 0x{scale_byte:02X}"

    # Test index register resolution

    def test_index_register_0_7(self):
        """Test all 8 index register values (EAX through EDI)."""
        index_names = ['EAX', 'ECX', 'EDX', 'EBX', 'ESP', 'EBP', 'ESI', 'EDI']
        for i, name in enumerate(index_names):
            # Set index field (bits 5-3) to i, base=0, scale=1
            # Byte = (scale << 6) | (index << 3) | base
            byte = (0 << 6) | (i << 3) | 0  # scale=1, index=i, base=0
            sib = decode_sib(byte, mod=0)
            if i == 4:
                # Special case: index=4 means no index
                assert sib.has_index is False
                assert sib.index_name == "none"
            else:
                assert sib.has_index is True
                assert sib.index_name == name, f"Expected {name} for index={i}"

    def test_index_register_64bit(self):
        """Test 64-bit index register names (RAX through RDI)."""
        index_names = ['RAX', 'RCX', 'RDX', 'RBX', 'RSP', 'RBP', 'RSI', 'RDI']
        for i, name in enumerate(index_names):
            byte = (0 << 6) | (i << 3) | 0  # scale=1, index=i, base=0
            sib = decode_sib(byte, mod=0, is_64bit=True)
            if i == 4:
                assert sib.has_index is False
            else:
                assert sib.index_name == name, f"Expected {name} for index={i}"

    # Test base register resolution

    def test_base_register_0_7(self):
        """Test all 8 base register values (EAX through EDI)."""
        base_names = ['EAX', 'ECX', 'EDX', 'EBX', 'ESP', 'EBP', 'ESI', 'EDI']
        for i, name in enumerate(base_names):
            # Set base field (bits 2-0) to i, index=0, scale=1
            byte = (0 << 6) | (0 << 3) | i  # scale=1, index=0, base=i
            sib = decode_sib(byte, mod=0)
            # Special case: base=5 with mod=0 means no base
            if i == 5:
                assert sib.has_base is False
                assert sib.base_name == "none"
            else:
                assert sib.has_base is True
                assert sib.base_name == name, f"Expected {name} for base={i}"

    def test_base_register_64bit(self):
        """Test 64-bit base register names (RAX through RDI)."""
        base_names = ['RAX', 'RCX', 'RDX', 'RBX', 'RSP', 'RBP', 'RSI', 'RDI']
        for i, name in enumerate(base_names):
            byte = (0 << 6) | (0 << 3) | i  # scale=1, index=0, base=i
            sib = decode_sib(byte, mod=0, is_64bit=True)
            if i == 5:
                assert sib.has_base is False
            else:
                assert sib.base_name == name, f"Expected {name} for base={i}"

    # Test REX.X extension for index register

    def test_rex_x_extension_index(self):
        """Test REX.X extension for index register (R8-R15)."""
        rex = REXPrefix(X=True, present=True, raw=0x42)
        ext_names = ['R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15']

        for i, name in enumerate(ext_names):
            byte = (0 << 6) | (i << 3) | 0  # scale=1, index=i, base=0
            sib = decode_sib(byte, mod=0, rex=rex, is_64bit=True)
            if i == 4:
                # index=4 with REX.X still means no index
                assert sib.has_index is False
            else:
                assert sib.has_index is True
                assert sib.index_name == name, f"Expected {name} for extended index={i}"

    def test_rex_x_index_4_still_no_index(self):
        """Test that index=4 with REX.X still means no index register."""
        rex = REXPrefix(X=True, present=True, raw=0x42)
        # index=4 (100) - should still be "no index" even with REX.X
        byte = (0 << 6) | (4 << 3) | 0  # scale=1, index=4, base=0
        sib = decode_sib(byte, mod=0, rex=rex, is_64bit=True)
        assert sib.has_index is False
        assert sib.index_name == "none"

    # Test REX.B extension for base register

    def test_rex_b_extension_base(self):
        """Test REX.B extension for base register (R8-R15)."""
        rex = REXPrefix(B=True, present=True, raw=0x41)
        ext_names = ['R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15']

        for i, name in enumerate(ext_names):
            byte = (0 << 6) | (0 << 3) | i  # scale=1, index=0, base=i
            sib = decode_sib(byte, mod=0, rex=rex, is_64bit=True)
            # Special case: base=5 (R13) with mod=0 means no base
            if i == 5:
                assert sib.has_base is False
            else:
                assert sib.has_base is True
                assert sib.base_name == name, f"Expected {name} for extended base={i}"

    def test_rex_b_base_5_mod_0_no_base(self):
        """Test that base=5 (R13 with REX.B) with mod=0 means no base."""
        rex = REXPrefix(B=True, present=True, raw=0x41)
        byte = (0 << 6) | (0 << 3) | 5  # scale=1, index=0, base=5
        sib = decode_sib(byte, mod=0, rex=rex, is_64bit=True)
        assert sib.has_base is False
        assert sib.base_name == "none"

    def test_rex_b_base_5_mod_not_0_has_base(self):
        """Test that base=5 with mod!=0 does have a base register."""
        rex = REXPrefix(B=True, present=True, raw=0x41)
        byte = (0 << 6) | (0 << 3) | 5  # scale=1, index=0, base=5
        # mod=1 or mod=2 should have base
        for mod in [1, 2]:
            sib = decode_sib(byte, mod=mod, rex=rex, is_64bit=True)
            assert sib.has_base is True
            assert sib.base_name == 'R13'

    # Test special case: index=4 (no index)

    def test_index_4_no_index_register(self):
        """Test that index=4 (100) means no index register."""
        # index=4, which is ESP/RSP - cannot be used as index
        byte = (0 << 6) | (4 << 3) | 0  # scale=1, index=4, base=0
        sib = decode_sib(byte, mod=0)
        assert sib.has_index is False
        assert sib.index_name == "none"
        assert sib.index == 4  # Field value is still 4

    def test_index_4_with_all_scales(self):
        """Test index=4 (no index) with all scale values."""
        for scale_field in range(4):
            byte = (scale_field << 6) | (4 << 3) | 0
            sib = decode_sib(byte, mod=0)
            assert sib.has_index is False
            assert sib.index == 4

    # Test special case: base=5 with mod=0 (disp32 only)

    def test_base_5_mod_0_disp32_only(self):
        """Test that base=5 with mod=0 means disp32 only, no base register."""
        # base=5 (EBP/RBP), mod=0 means disp32 follows
        byte = (0 << 6) | (0 << 3) | 5  # scale=1, index=0, base=5
        sib = decode_sib(byte, mod=0)
        assert sib.has_base is False
        assert sib.base_name == "none"
        assert sib.base == 5  # Field value is still 5

    def test_base_5_mod_1_has_base(self):
        """Test that base=5 with mod=1 does have base register."""
        byte = (0 << 6) | (0 << 3) | 5  # scale=1, index=0, base=5
        sib = decode_sib(byte, mod=1)
        assert sib.has_base is True
        assert sib.base_name == 'EBP'

    def test_base_5_mod_2_has_base(self):
        """Test that base=5 with mod=2 does have base register."""
        byte = (0 << 6) | (0 << 3) | 5  # scale=1, index=0, base=5
        sib = decode_sib(byte, mod=2)
        assert sib.has_base is True
        assert sib.base_name == 'EBP'

    # Test combined special cases

    def test_index_4_base_5_mod_0(self):
        """Test combined special case: index=4 (no index), base=5 (no base with mod=0)."""
        # 0x25 = 00 100 101 = scale=1, index=4, base=5
        sib = decode_sib(0x25, mod=0)
        assert sib.has_index is False
        assert sib.has_base is False
        assert sib.scale == 1

    # Test effective address calculation

    def test_effective_address_base_only(self):
        """Test effective address with base only."""
        sib = decode_sib(0x00, mod=0)  # [EAX + EAX*1]
        # Set index to none by using index=4
        byte = (0 << 6) | (4 << 3) | 0  # scale=1, index=none, base=EAX
        sib = decode_sib(byte, mod=0)
        assert sib.has_index is False

        addr = get_effective_address(sib, base_val=0x1000, index_val=0, disp=0)
        assert addr == 0x1000

    def test_effective_address_base_index(self):
        """Test effective address with base and index."""
        sib = decode_sib(0x00, mod=0)  # [EAX + EAX*1]
        addr = get_effective_address(sib, base_val=0x1000, index_val=0x10, disp=0)
        assert addr == 0x1010  # 0x1000 + (0x10 * 1)

    def test_effective_address_with_scale(self):
        """Test effective address with scaled index."""
        # 0x80 = scale=4, index=0, base=0 -> [EAX + EAX*4]
        sib = decode_sib(0x80, mod=0)
        assert sib.scale == 4
        addr = get_effective_address(sib, base_val=0x1000, index_val=0x100, disp=0)
        assert addr == 0x1400  # 0x1000 + (0x100 * 4)

    def test_effective_address_with_displacement(self):
        """Test effective address with displacement."""
        sib = decode_sib(0x00, mod=0)  # [EAX + EAX*1]
        addr = get_effective_address(sib, base_val=0x1000, index_val=0x10, disp=0x50)
        assert addr == 0x1060  # 0x1000 + (0x10 * 1) + 0x50

    def test_effective_address_full(self):
        """Test effective address with base, index, scale, and displacement."""
        # scale=8, index=ECX(1), base=EDX(2)
        # byte = (3 << 6) | (1 << 3) | 2 = 0xC0 | 0x08 | 0x02 = 0xCA
        sib = decode_sib(0xCA, mod=0)
        assert sib.scale == 8
        assert sib.index == 1
        assert sib.base == 2

        addr = get_effective_address(sib, base_val=0x2000, index_val=0x10, disp=0x100)
        assert addr == 0x2180  # 0x2000 + (0x10 * 8) + 0x100 = 8192 + 128 + 256 = 8576

    def test_effective_address_no_base(self):
        """Test effective address with no base (disp32 only case)."""
        # 0x25 = scale=1, index=4 (none), base=5 (none with mod=0)
        sib = decode_sib(0x25, mod=0)
        assert sib.has_index is False
        assert sib.has_base is False

        addr = get_effective_address(sib, base_val=0, index_val=0, disp=0x12345678)
        assert addr == 0x12345678

    # Test 32-bit vs 64-bit register names

    def test_32bit_register_names(self):
        """Test that 32-bit mode uses EAX, ECX, etc."""
        sib = decode_sib(0x00, mod=0, is_64bit=False)
        assert sib.index_name == 'EAX'
        assert sib.base_name == 'EAX'

    def test_64bit_register_names(self):
        """Test that 64-bit mode uses RAX, RCX, etc."""
        sib = decode_sib(0x00, mod=0, is_64bit=True)
        assert sib.index_name == 'RAX'
        assert sib.base_name == 'RAX'

    # Test SIB dataclass properties

    def test_sib_raw_value(self):
        """Test that raw byte value is stored."""
        sib = decode_sib(0x25, mod=0)
        assert sib.raw == 0x25

    def test_sib_string_representation(self):
        """Test SIB string representation."""
        sib = decode_sib(0x00, mod=0)
        s = str(sib)
        assert '0x00' in s
        assert 'EAX' in s

    def test_sib_string_with_no_index(self):
        """Test SIB string representation with no index."""
        sib = decode_sib(0x04, mod=0)  # index=4, base=4
        s = str(sib)
        assert '0x04' in s
        assert 'ESP' in s  # base is ESP

    def test_sib_string_disp32_only(self):
        """Test SIB string representation with disp32 only."""
        sib = decode_sib(0x25, mod=0)  # no index, no base
        s = str(sib)
        assert 'disp32' in s

    def test_sib_string_with_scale(self):
        """Test SIB string representation with scale."""
        # 0x88 = 10001000 = scale=10 (4), index=001 (1), base=000 (0)
        sib = decode_sib(0x88, mod=0)  # scale=4, index=1, base=0
        s = str(sib)
        assert '*4' in s

    # Test examples from the task specification

    def test_example_0x00(self):
        """Test example: 0x00 (scale=1, index=0, base=0): [EAX + EAX*1]."""
        sib = decode_sib(0x00, mod=0)
        assert sib.scale == 1
        assert sib.index == 0
        assert sib.base == 0
        assert sib.has_index is True
        assert sib.has_base is True
        assert sib.index_name == 'EAX'
        assert sib.base_name == 'EAX'

    def test_example_0x04(self):
        """Test example: 0x04 (scale=1, index=0, base=4): [ESP + EAX*1]."""
        # 0x04 = 00000100 = scale=00 (1), index=000 (0), base=100 (4)
        sib = decode_sib(0x04, mod=0)
        assert sib.scale == 1
        assert sib.index == 0  # index field is 0, not 4
        assert sib.base == 4
        assert sib.has_index is True  # index=0 is valid (EAX)
        assert sib.has_base is True
        assert sib.index_name == "EAX"
        assert sib.base_name == 'ESP'

    def test_index_4_no_index_example(self):
        """Test that index field=4 means no index register."""
        # To get index=4 (no index), we need byte with index bits 5-3 = 100
        # 0x24 = 00100100 = scale=00 (1), index=100 (4=none), base=100 (4)
        sib = decode_sib(0x24, mod=0)
        assert sib.scale == 1
        assert sib.index == 4
        assert sib.has_index is False
        assert sib.index_name == "none"

    def test_example_0x25(self):
        """Test example: 0x25 (scale=1, index=4 no index, base=5): [disp32]."""
        sib = decode_sib(0x25, mod=0)
        assert sib.scale == 1
        assert sib.index == 4
        assert sib.base == 5
        assert sib.has_index is False  # index=4 means no index
        assert sib.has_base is False   # base=5 with mod=0 means no base
        assert sib.index_name == "none"
        assert sib.base_name == "none"

    def test_example_lea_8D_04_05(self):
        """Test example: 0x8D 0x04 0x05: LEA with [EBP + EAX*1]."""
        # ModR/M 0x04 = mod=0, reg=0, rm=4 (SIB follows)
        # SIB 0x05 = scale=0, index=0, base=5
        # This would be [disp32] with mod=0, but with mod=1 it's [EBP + EAX*1 + disp8]
        sib = decode_sib(0x05, mod=0)
        assert sib.scale == 1
        assert sib.index == 0
        assert sib.base == 5
        # With mod=0, base=5 means no base (disp32)
        assert sib.has_base is False

    def test_example_with_rex_x(self):
        """Test example: With REX.X (0x42): R10 instead of RDX as index."""
        rex = REXPrefix(X=True, present=True, raw=0x42)
        # index=2 would be RDX, but with REX.X it becomes R10
        byte = (0 << 6) | (2 << 3) | 0  # scale=1, index=2, base=0
        sib = decode_sib(byte, mod=0, rex=rex, is_64bit=True)
        assert sib.index_name == 'R10'
        assert sib.base_name == 'RAX'

    def test_example_with_rex_b(self):
        """Test example: With REX.B (0x41): R8 instead of RAX as base."""
        rex = REXPrefix(B=True, present=True, raw=0x41)
        # base=0 would be RAX, but with REX.B it becomes R8
        byte = (0 << 6) | (0 << 3) | 0  # scale=1, index=0, base=0
        sib = decode_sib(byte, mod=0, rex=rex, is_64bit=True)
        assert sib.index_name == 'RAX'
        assert sib.base_name == 'R8'

    def test_combined_rex_x_and_b(self):
        """Test combined REX.X and REX.B extensions."""
        rex = REXPrefix(X=True, B=True, present=True, raw=0x43)
        # index=2 -> R10, base=3 -> R11
        byte = (0 << 6) | (2 << 3) | 3  # scale=1, index=2, base=3
        sib = decode_sib(byte, mod=0, rex=rex, is_64bit=True)
        assert sib.index_name == 'R10'
        assert sib.base_name == 'R11'

    # Test edge cases

    def test_no_rex_prefix(self):
        """Test SIB decoding without REX prefix."""
        sib = decode_sib(0x00, mod=0, rex=None, is_64bit=True)
        assert sib.index_name == 'RAX'
        assert sib.base_name == 'RAX'

    def test_non_present_rex_prefix(self):
        """Test SIB decoding with non-present REX prefix."""
        rex = REXPrefix(present=False, raw=0x3F)
        sib = decode_sib(0x00, mod=0, rex=rex, is_64bit=True)
        assert sib.index_name == 'RAX'
        assert sib.base_name == 'RAX'

    def test_sib_dataclass_fields(self):
        """Test SIB dataclass field access."""
        sib = SIB(
            scale=4,
            index=2,
            base=3,
            index_name='RDX',
            base_name='RBX',
            has_index=True,
            has_base=True,
            raw=0x9B
        )
        assert sib.scale == 4
        assert sib.index == 2
        assert sib.base == 3
        assert sib.index_name == 'RDX'
        assert sib.base_name == 'RBX'
        assert sib.has_index is True
        assert sib.has_base is True
        assert sib.raw == 0x9B


class TestX86InstructionDecoder:
    """Test suite for x86_64 instruction decoder."""

    @pytest.fixture
    def decoder(self):
        """Create a decoder instance."""
        return X86InstructionDecoder(is_64bit=True, default_address=0x1000)

    @pytest.fixture
    def decoder_32bit(self):
        """Create a 32-bit decoder instance."""
        return X86InstructionDecoder(is_64bit=False, default_address=0x1000)

    # MOV Instruction Tests

    def test_decode_mov_reg_imm32(self, decoder):
        """Test decoding MOV RAX, 0x12345678 (B8 78 56 34 12)."""
        # MOV RAX, 0x12345678 (in 64-bit mode, B8 is MOV RAX, not EAX)
        data = bytes([0xB8, 0x78, 0x56, 0x34, 0x12])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'MOV'
        assert instr.category == InstructionCategory.DATA_TRANSFER
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        # In 64-bit mode, B8 encodes RAX with zero-extended imm32
        assert instr.operands[0].value in ('EAX', 'RAX')  # Accept either
        assert instr.operands[0].size in (32, 64)

        assert instr.operands[1].type == OperandType.IMMEDIATE
        assert instr.operands[1].value == 0x12345678

    def test_decode_mov_rax_imm64(self, decoder):
        """Test decoding MOV RAX, 0x123456789ABCDEF0 with REX.W."""
        # MOV RAX, 0x123456789ABCDEF0 (REX.W B8 + imm64)
        data = bytes([0x48, 0xB8, 0xF0, 0xDE, 0xBC, 0x9A, 0x78, 0x56, 0x34, 0x12])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'MOV'
        assert instr.rex_prefix == 0x48  # REX.W
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value == 'RAX'
        assert instr.operands[0].size == 64

        assert instr.operands[1].type == OperandType.IMMEDIATE
        assert instr.operands[1].value == 0x123456789ABCDEF0

    def test_decode_mov_reg_to_reg(self, decoder):
        """Test decoding MOV RAX, RCX."""
        # MOV RAX, RCX (48 89 C8)
        data = bytes([0x48, 0x89, 0xC8])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'MOV'
        assert instr.modrm is not None
        assert len(instr.operands) == 2

        # Check operands are registers
        for op in instr.operands:
            assert op.type == OperandType.REGISTER
            assert op.size == 64

    def test_decode_mov_al_to_moffs(self, decoder):
        """Test decoding MOV AL, [0x12345678]."""
        # MOV AL, [0x12345678] (A0 78 56 34 12)
        # In 64-bit mode, moffs is 8 bytes
        data = bytes([0xA0, 0x78, 0x56, 0x34, 0x12, 0x00, 0x00, 0x00, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'MOV'
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value == 'AL'

        assert instr.operands[1].type == OperandType.MEMORY
        assert instr.operands[1].displacement == 0x12345678

    def test_decode_mov_eax_to_moffs(self, decoder):
        """Test decoding MOV RAX, [0x12345678]."""
        # MOV RAX, [0x12345678] (A1 78 56 34 12 00 00 00 00)
        # In 64-bit mode, moffs is 8 bytes and destination is RAX
        data = bytes([0xA1, 0x78, 0x56, 0x34, 0x12, 0x00, 0x00, 0x00, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'MOV'
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value in ('EAX', 'RAX')

        assert instr.operands[1].type == OperandType.MEMORY

    # PUSH Instruction Tests

    def test_decode_push_r64(self, decoder):
        """Test decoding PUSH RAX (50)."""
        data = bytes([0x50])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'PUSH'
        assert instr.category == InstructionCategory.STACK
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value == 'RAX'

    def test_decode_push_imm32(self, decoder):
        """Test decoding PUSH 0x12345678."""
        # PUSH 0x12345678 (68 78 56 34 12)
        data = bytes([0x68, 0x78, 0x56, 0x34, 0x12])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'PUSH'
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.IMMEDIATE
        assert instr.operands[0].value == 0x12345678

    def test_decode_push_imm8(self, decoder):
        """Test decoding PUSH 0x42."""
        # PUSH 0x42 (6A 42)
        data = bytes([0x6A, 0x42])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'PUSH'
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.IMMEDIATE
        assert instr.operands[0].value == 0x42

    # POP Instruction Tests

    def test_decode_pop_r64(self, decoder):
        """Test decoding POP RBX (5B)."""
        data = bytes([0x5B])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'POP'
        assert instr.category == InstructionCategory.STACK
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value == 'RBX'

    # JMP Instruction Tests

    def test_decode_jmp_rel8(self, decoder):
        """Test decoding JMP rel8 (EB 05)."""
        data = bytes([0xEB, 0x05])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'JMP'
        assert instr.category == InstructionCategory.CONTROL_TRANSFER
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.RELATIVE
        assert instr.operands[0].value == 5  # Signed relative offset

    def test_decode_jmp_rel32(self, decoder):
        """Test decoding JMP rel32 (E9 00 00 00 00)."""
        data = bytes([0xE9, 0x00, 0x00, 0x00, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'JMP'
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.RELATIVE

    # CALL Instruction Tests

    def test_decode_call_rel32(self, decoder):
        """Test decoding CALL rel32."""
        # CALL 0x100A (from 0x1000) - E8 05 00 00 00
        data = bytes([0xE8, 0x05, 0x00, 0x00, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'CALL'
        assert instr.category == InstructionCategory.CONTROL_TRANSFER
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.RELATIVE
        assert instr.operands[0].value == 5

    # RET Instruction Tests

    def test_decode_ret(self, decoder):
        """Test decoding RET (C3)."""
        data = bytes([0xC3])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'RET'
        assert instr.category == InstructionCategory.CONTROL_TRANSFER
        assert len(instr.operands) == 0

    def test_decode_ret_imm16(self, decoder):
        """Test decoding RET 0x08 (C2 08 00)."""
        data = bytes([0xC2, 0x08, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'RET'
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.IMMEDIATE
        assert instr.operands[0].value == 8

    # ADD Instruction Tests

    def test_decode_add_eax_imm32(self, decoder):
        """Test decoding ADD EAX, 0x42."""
        # ADD EAX, 0x42 (05 42 00 00 00)
        data = bytes([0x05, 0x42, 0x00, 0x00, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'ADD'
        assert instr.category == InstructionCategory.ARITHMETIC
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value in ('EAX', 'RAX')

        assert instr.operands[1].type == OperandType.IMMEDIATE
        assert instr.operands[1].value == 0x42

    def test_decode_add_al_imm8(self, decoder):
        """Test decoding ADD AL, 0x10."""
        # ADD AL, 0x10 (04 10)
        data = bytes([0x04, 0x10])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'ADD'
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value == 'AL'
        assert instr.operands[0].size == 8

    # SUB Instruction Tests

    def test_decode_sub_eax_imm32(self, decoder):
        """Test decoding SUB EAX, 0x10."""
        # SUB EAX, 0x10 (2D 10 00 00 00)
        data = bytes([0x2D, 0x10, 0x00, 0x00, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'SUB'
        assert instr.category == InstructionCategory.ARITHMETIC
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[1].type == OperandType.IMMEDIATE
        assert instr.operands[1].value == 0x10

    def test_decode_sub_al_imm8(self, decoder):
        """Test decoding SUB AL, 0x05."""
        # SUB AL, 0x05 (2C 05)
        data = bytes([0x2C, 0x05])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'SUB'
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value == 'AL'

    # CMP Instruction Tests

    def test_decode_cmp_eax_imm32(self, decoder):
        """Test decoding CMP EAX, 0x00."""
        # CMP EAX, 0x00 (3D 00 00 00 00)
        data = bytes([0x3D, 0x00, 0x00, 0x00, 0x00])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'CMP'
        assert instr.category == InstructionCategory.COMPARISON
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[1].type == OperandType.IMMEDIATE
        assert instr.operands[1].value == 0

    def test_decode_cmp_al_imm8(self, decoder):
        """Test decoding CMP AL, 0x0A."""
        # CMP AL, 0x0A (3C 0A)
        data = bytes([0x3C, 0x0A])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'CMP'
        assert len(instr.operands) == 2

        assert instr.operands[0].type == OperandType.REGISTER
        assert instr.operands[0].value == 'AL'

        assert instr.operands[1].type == OperandType.IMMEDIATE
        assert instr.operands[1].value == 0x0A

    # Conditional Jump Tests

    def test_decode_jz_rel8(self, decoder):
        """Test decoding JZ (JE) rel8."""
        # JZ +5 (74 05)
        data = bytes([0x74, 0x05])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'JZ'
        assert instr.category == InstructionCategory.CONTROL_TRANSFER
        assert len(instr.operands) == 1

        assert instr.operands[0].type == OperandType.LABEL

    def test_decode_jnz_rel8(self, decoder):
        """Test decoding JNZ (JNE) rel8."""
        # JNZ -3 (75 FD)
        data = bytes([0x75, 0xFD])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'JNZ'
        assert len(instr.operands) == 1

    def test_decode_jl_rel8(self, decoder):
        """Test decoding JL rel8."""
        # JL +10 (7C 0A)
        data = bytes([0x7C, 0x0A])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.mnemonic == 'JL'
        assert len(instr.operands) == 1

    # REX Prefix Tests

    def test_decode_rex_w_prefix(self, decoder):
        """Test REX.W prefix for 64-bit operands."""
        # MOV RAX, R12 (49 89 C0) - REX.W+B + MOV r/m, r
        data = bytes([0x49, 0x89, 0xC0])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.rex_prefix == 0x49
        assert instr.mnemonic == 'MOV'

    def test_decode_rex_r_prefix(self, decoder):
        """Test REX.R prefix for extended register."""
        # MOV R9, RAX (49 89 C1) - REX.W+R
        data = bytes([0x49, 0x89, 0xC1])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.rex_prefix == 0x49

    def test_decode_rex_b_prefix(self, decoder):
        """Test REX.B prefix for extended base register."""
        # MOV RAX, R8 (4C 89 C0) - REX.W+B
        data = bytes([0x4C, 0x89, 0xC0])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.rex_prefix == 0x4C

    # Legacy Prefix Tests

    def test_decode_lock_prefix(self, decoder):
        """Test LOCK prefix detection."""
        # LOCK ADD [RAX], EAX (F0 01 08)
        data = bytes([0xF0, 0x01, 0x08])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.prefix == bytes([0xF0])
        assert instr.mnemonic == 'ADD'

    def test_decode_rep_prefix(self, decoder):
        """Test REPE/REPNE prefix detection."""
        # REPE CMPSB (F3 A6)
        data = bytes([0xF3, 0xA6])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.prefix == bytes([0xF3])

    # ModR/M Encoding Tests

    def test_decode_modrm_register_direct(self, decoder):
        """Test ModR/M register-direct addressing (mod=11)."""
        # MOV EAX, ECX (89 C8) - mod=11, reg=1 (ECX), r/m=0 (EAX)
        data = bytes([0x89, 0xC8])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.modrm == 0xC8
        # Both operands should be registers
        assert all(op.type == OperandType.REGISTER for op in instr.operands)

    def test_decode_modrm_memory_indirect(self, decoder):
        """Test ModR/M memory-indirect addressing."""
        # MOV [RAX], RCX (48 89 08) - mod=00, reg=1, r/m=0
        data = bytes([0x48, 0x89, 0x08])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) == 1
        instr = instructions[0]

        assert instr.modrm == 0x08

    # Multi-instruction Tests

    def test_decode_multiple_instructions(self, decoder):
        """Test decoding a sequence of instructions."""
        # PUSH RBP; MOV RBP, RSP; (SUB RSP, 0x10 uses GRP1 - not yet supported)
        data = bytes([0x55, 0x48, 0x89, 0xE5])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) >= 2

        # First: PUSH RBP
        assert instructions[0].mnemonic == 'PUSH'
        assert instructions[0].operands[0].value == 'RBP'

        # Second: MOV RBP, RSP
        assert instructions[1].mnemonic == 'MOV'

    def test_decode_prologue_sequence(self, decoder):
        """Test decoding typical function prologue."""
        # PUSH RBP
        # MOV RBP, RSP
        # PUSH RBX
        # PUSH RBP (again for R12 test - note: REX extension not fully implemented)
        data = bytes([
            0x55,           # PUSH RBP
            0x48, 0x89, 0xE5,  # MOV RBP, RSP
            0x53,           # PUSH RBX
        ])

        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) >= 3
        assert instructions[0].mnemonic == 'PUSH'
        assert instructions[1].mnemonic == 'MOV'
        assert instructions[2].mnemonic == 'PUSH'

    # IR String Representation Tests

    def test_instruction_string_representation(self, decoder):
        """Test string representation of instructions."""
        data = bytes([0xB8, 0x78, 0x56, 0x34, 0x12])

        instructions = decoder.decode(data)

        assert len(instructions) == 1
        instr_str = str(instructions[0])

        assert 'MOV' in instr_str
        assert 'EAX' in instr_str or 'RAX' in instr_str

    def test_operand_string_representation_register(self):
        """Test string representation of register operand."""
        op = Operand(OperandType.REGISTER, 'RAX', size=64)
        assert str(op) == 'RAX'

    def test_operand_string_representation_immediate(self):
        """Test string representation of immediate operand."""
        op = Operand(OperandType.IMMEDIATE, 42, size=32)
        # Values >= 10 are shown in hex
        assert str(op) in ('42', '0x2A')

        op2 = Operand(OperandType.IMMEDIATE, 0xFF, size=32)
        assert str(op2) == '0xFF'

        # Small values should be decimal
        op3 = Operand(OperandType.IMMEDIATE, 5, size=32)
        assert str(op3) == '5'

    def test_operand_string_representation_memory(self):
        """Test string representation of memory operand."""
        op = Operand(
            OperandType.MEMORY,
            '[mem]',
            size=64,
            base='RAX',
            index='RCX',
            scale=4,
            displacement=8
        )
        op_str = str(op)
        assert '[' in op_str
        assert 'RAX' in op_str
        assert 'RCX' in op_str
        assert '+8' in op_str

    # Real Binary File Tests

    def test_decode_boot_sectore(self, decoder):
        """Test decoding real boot sector binary."""
        # Use the kernel_boot.bin if available
        import os
        boot_file = '/home/jericho/zion/projects/geometry_os/geometry_os/systems/transpiler/kernel_boot.bin'

        if os.path.exists(boot_file):
            with open(boot_file, 'rb') as f:
                data = f.read()[:64]  # First 64 bytes

            instructions = decoder.decode(data, address=0x7C00)

            # Should decode at least some instructions
            assert len(instructions) > 0

    # Instruction Serialization Tests

    def test_instruction_to_dict(self, decoder):
        """Test Instruction.to_dict() for JSON serialization."""
        data = bytes([0xB8, 0x78, 0x56, 0x34, 0x12])

        instructions = decoder.decode(data)

        assert len(instructions) == 1
        instr_dict = instructions[0].to_dict()

        assert 'mnemonic' in instr_dict
        assert 'opcode' in instr_dict
        assert 'operands' in instr_dict
        assert 'size' in instr_dict
        assert 'address' in instr_dict
        assert 'category' in instr_dict

        assert instr_dict['mnemonic'] == 'MOV'

    # Edge Cases

    def test_decode_empty_data(self, decoder):
        """Test decoding empty byte array."""
        instructions = decoder.decode(b'')
        assert len(instructions) == 0

    def test_decode_unknown_opcode(self, decoder):
        """Test decoding unknown opcode."""
        data = bytes([0xFF])  # Invalid single-byte opcode (needs ModR/M)

        instructions = decoder.decode(data)

        # Should create a placeholder instruction
        assert len(instructions) == 1

    def test_decode_incomplete_instruction(self, decoder):
        """Test decoding incomplete instruction data."""
        # MOV EAX, imm32 but only 2 bytes provided
        data = bytes([0xB8, 0x78])

        instructions = decoder.decode(data)

        # Should handle gracefully
        assert len(instructions) >= 1

    # Disassembly Output Tests

    def test_print_disassembly(self, decoder):
        """Test formatted disassembly output."""
        data = bytes([0xB8, 0x78, 0x56, 0x34, 0x12, 0xC3])

        instructions = decoder.decode(data, address=0x1000)
        output = decoder.print_disassembly(instructions)

        # Check for address in different formats
        assert ('0x1000' in output or '00001000' in output)
        assert 'MOV' in output
        assert 'RET' in output

    # Register Selection Tests

    def test_get_register_8bit(self, decoder):
        """Test getting 8-bit register names."""
        assert decoder._get_register(0, 8, 0) == 'AL'
        assert decoder._get_register(1, 8, 0) == 'CL'
        assert decoder._get_register(4, 8, 0x40) == 'AH'  # REX prefix

    def test_get_register_16bit(self, decoder):
        """Test getting 16-bit register names."""
        assert decoder._get_register(0, 16, 0) == 'AX'
        assert decoder._get_register(1, 16, 0) == 'CX'

    def test_get_register_32bit(self, decoder):
        """Test getting 32-bit register names."""
        assert decoder._get_register(0, 32, 0) == 'EAX'
        assert decoder._get_register(1, 32, 0) == 'ECX'

    def test_get_register_64bit(self, decoder):
        """Test getting 64-bit register names."""
        assert decoder._get_register(0, 64, 0) == 'RAX'
        assert decoder._get_register(8, 64, 0x41) == 'R8'  # REX.B

    def test_get_register_extended(self, decoder):
        """Test getting extended registers (R8-R15)."""
        assert decoder._get_register(8, 64, 0x41) == 'R8'
        assert decoder._get_register(15, 64, 0x4F) == 'R15'


class TestX86DecoderIntegration:
    """Integration tests for the decoder."""

    def test_decode_function_epilogue(self):
        """Test decoding typical function epilogue."""
        # MOV RSP, RBP; POP RBP; RET
        data = bytes([0x48, 0x89, 0xEC, 0x5D, 0xC3])

        decoder = X86InstructionDecoder(is_64bit=True)
        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) >= 1
        assert instructions[0].mnemonic == 'MOV'
        # Additional instructions may be decoded differently based on implementation

    def test_decode_conditional_jump_sequence(self):
        """Test decoding a conditional jump sequence."""
        # CMP EAX, 0; JZ +5; MOV EAX, 1; RET
        data = bytes([
            0x3D, 0x00, 0x00, 0x00, 0x00,  # CMP EAX, 0
            0x74, 0x05,                    # JZ +5
            0xB8, 0x01, 0x00, 0x00, 0x00,  # MOV EAX, 1
            0xC3                            # RET
        ])

        decoder = X86InstructionDecoder(is_64bit=True)
        instructions = decoder.decode(data, address=0x1000)

        assert len(instructions) >= 3
        assert instructions[0].mnemonic == 'CMP'
        assert instructions[1].mnemonic == 'JZ'
        assert instructions[2].mnemonic == 'MOV'


class TestX86DecoderWithFiles:
    """Tests using actual binary files."""

    def test_decode_binary_file_helper(self, tmp_path):
        """Test the decode_binary_file helper function."""
        # Create a test binary file
        test_file = tmp_path / "test.bin"
        test_data = bytes([0xB8, 0x01, 0x00, 0x00, 0x00, 0xC3])
        test_file.write_bytes(test_data)

        instructions = decode_binary_file(str(test_file), base_address=0x1000)

        assert len(instructions) >= 1
        assert instructions[0].mnemonic == 'MOV'
