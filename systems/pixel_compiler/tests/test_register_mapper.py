"""
Test suite for x86_64 to WASM register mapping.

These tests verify that x86_64 registers are correctly mapped to WASM locals,
including handling of 32/16/8-bit forms and register preservation conventions.
"""

import unittest
import sys
from pathlib import Path

# Add parent directory to path to import modules
sys.path.insert(0, str(Path(__file__).parent.parent))
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from systems.pixel_compiler.register_mapper import (
    RegisterMapper,
    RegisterClass,
    RegisterSize,
    RegisterAlias,
    RegisterMappingError
)


class TestBasicRegisterMapping(unittest.TestCase):
    """Test basic x86_64 register to WASM local mapping."""

    def setUp(self):
        """Set up test fixtures."""
        self.mapper = RegisterMapper()

    def test_rax_mapping(self):
        """Test that RAX is mapped to a valid WASM local index."""
        idx = self.mapper.map_register("RAX")
        self.assertIsInstance(idx, int)
        self.assertGreaterEqual(idx, 0)

    def test_all_64_bit_registers_mapped(self):
        """Test that all 64-bit general purpose registers are mapped."""
        registers = ["RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "RBP", "RSP",
                     "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"]

        for reg in registers:
            idx = self.mapper.map_register(reg)
            self.assertIsInstance(idx, int, f"{reg} should map to an integer")
            self.assertGreaterEqual(idx, 0, f"{reg} index should be non-negative")

    def test_register_mappings_are_unique(self):
        """Test that each 64-bit register gets a unique WASM local index."""
        registers = ["RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "RBP", "RSP",
                     "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"]

        indices = [self.mapper.map_register(reg) for reg in registers]
        unique_indices = set(indices)

        self.assertEqual(len(unique_indices), len(registers),
                        "Each register should get a unique WASM local index")


class Test32BitRegisterMapping(unittest.TestCase):
    """Test 32-bit register forms (EAX, EBX, etc.)."""

    def setUp(self):
        """Set up test fixtures."""
        self.mapper = RegisterMapper()

    def test_eax_maps_to_rax_slot(self):
        """Test that EAX maps to the same WASM local as RAX."""
        rax_idx = self.mapper.map_register("RAX")
        eax_idx = self.mapper.map_register("EAX")

        self.assertEqual(eax_idx, rax_idx,
                        "EAX should map to same slot as RAX (zero-extend)")

    def test_all_32_bit_forms_map_correctly(self):
        """Test that all 32-bit forms map to their 64-bit counterparts."""
        mapping = {
            "EAX": "RAX", "EBX": "RBX", "ECX": "RCX", "EDX": "RDX",
            "ESI": "RSI", "EDI": "RDI", "EBP": "RBP", "ESP": "RSP",
            "R8D": "R8", "R9D": "R9", "R10D": "R10", "R11D": "R11",
            "R12D": "R12", "R13D": "R13", "R14D": "R14", "R15D": "R15"
        }

        for reg32, reg64 in mapping.items():
            idx32 = self.mapper.map_register(reg32)
            idx64 = self.mapper.map_register(reg64)
            self.assertEqual(idx32, idx64,
                           f"{reg32} should map to same slot as {reg64}")


class Test16BitRegisterMapping(unittest.TestCase):
    """Test 16-bit register forms (AX, BX, etc.)."""

    def setUp(self):
        """Set up test fixtures."""
        self.mapper = RegisterMapper()

    def test_ax_maps_to_rax_slot(self):
        """Test that AX maps to the same WASM local as RAX."""
        rax_idx = self.mapper.map_register("RAX")
        ax_idx = self.mapper.map_register("AX")

        self.assertEqual(ax_idx, rax_idx,
                        "AX should map to same slot as RAX (zero-extend)")

    def test_all_16_bit_forms_map_correctly(self):
        """Test that all 16-bit forms map to their 64-bit counterparts."""
        mapping = {
            "AX": "RAX", "BX": "RBX", "CX": "RCX", "DX": "RDX",
            "SI": "RSI", "DI": "RDI", "BP": "RBP", "SP": "RSP",
            "R8W": "R8", "R9W": "R9", "R10W": "R10", "R11W": "R11",
            "R12W": "R12", "R13W": "R13", "R14W": "R14", "R15W": "R15"
        }

        for reg16, reg64 in mapping.items():
            idx16 = self.mapper.map_register(reg16)
            idx64 = self.mapper.map_register(reg64)
            self.assertEqual(idx16, idx64,
                           f"{reg16} should map to same slot as {reg64}")


class Test8BitRegisterMapping(unittest.TestCase):
    """Test 8-bit register forms (AL, AH, BL, etc.)."""

    def setUp(self):
        """Set up test fixtures."""
        self.mapper = RegisterMapper()

    def test_al_maps_to_rax_slot(self):
        """Test that AL maps to the same WASM local as RAX."""
        rax_idx = self.mapper.map_register("RAX")
        al_idx = self.mapper.map_register("AL")

        self.assertEqual(al_idx, rax_idx,
                        "AL should map to same slot as RAX (zero-extend)")

    def test_all_8_bit_low_forms_map_correctly(self):
        """Test that all 8-bit low forms map to their 64-bit counterparts."""
        mapping = {
            "AL": "RAX", "BL": "RBX", "CL": "RCX", "DL": "RDX",
            "SIL": "RSI", "DIL": "RDI", "BPL": "RBP", "SPL": "RSP",
            "R8B": "R8", "R9B": "R9", "R10B": "R10", "R11B": "R11",
            "R12B": "R12", "R13B": "R13", "R14B": "R14", "R15B": "R15"
        }

        for reg8, reg64 in mapping.items():
            idx8 = self.mapper.map_register(reg8)
            idx64 = self.mapper.map_register(reg64)
            self.assertEqual(idx8, idx64,
                           f"{reg8} should map to same slot as {reg64}")

    def test_high_8_bit_registers_mapped(self):
        """Test that high 8-bit registers (AH, BH, etc.) are handled."""
        # AH, BH, CH, DH are special - they access bits 8-15 of the parent register
        # In WASM, we need special handling for these
        for reg in ["AH", "BH", "CH", "DH"]:
            idx = self.mapper.map_register(reg)
            self.assertIsInstance(idx, int, f"{reg} should return an index")


class TestRegisterSemantics(unittest.TestCase):
    """Test register semantics and conventions."""

    def setUp(self):
        """Set up test fixtures."""
        self.mapper = RegisterMapper()

    def test_callee_saved_registers(self):
        """Test identification of callee-saved registers."""
        callee_saved = self.mapper.get_callee_saved_registers()

        # RBX, RBP, R12, R13, R14, R15 are typically callee-saved in System V AMD64 ABI
        expected_callee = ["RBX", "RBP", "R12", "R13", "R14", "R15"]
        for reg in expected_callee:
            self.assertIn(reg, callee_saved,
                         f"{reg} should be marked as callee-saved")

    def test_caller_saved_registers(self):
        """Test identification of caller-saved registers."""
        caller_saved = self.mapper.get_caller_saved_registers()

        # RAX, RCX, RDX, RSI, RDI, R8-R11 are typically caller-saved
        expected_caller = ["RAX", "RCX", "RDX", "RSI", "RDI", "R8", "R9", "R10", "R11"]
        for reg in expected_caller:
            self.assertIn(reg, caller_saved,
                         f"{reg} should be marked as caller-saved")

    def test_register_class(self):
        """Test register classification."""
        self.assertEqual(self.mapper.get_register_class("RAX"), RegisterClass.GENERAL_PURPOSE)
        self.assertEqual(self.mapper.get_register_class("RSP"), RegisterClass.STACK_POINTER)
        self.assertEqual(self.mapper.get_register_class("RBP"), RegisterClass.FRAME_POINTER)


class TestLiveRegisterTracking(unittest.TestCase):
    """Test tracking of live (actively used) registers."""

    def setUp(self):
        """Set up test fixtures."""
        self.mapper = RegisterMapper()

    def test_initially_no_live_registers(self):
        """Test that no registers are marked live initially."""
        live = self.mapper.get_live_registers()
        self.assertEqual(len(live), 0, "Initially no registers should be live")

    def test_mark_register_live(self):
        """Test marking a register as live."""
        self.mapper.mark_live("RAX")
        live = self.mapper.get_live_registers()

        self.assertIn("RAX", live, "RAX should be marked as live")

    def test_mark_register_dead(self):
        """Test marking a register as dead."""
        self.mapper.mark_live("RAX")
        self.mapper.mark_dead("RAX")
        live = self.mapper.get_live_registers()

        self.assertNotIn("RAX", live, "RAX should not be live after marking dead")

    def test_clear_live_registers(self):
        """Test clearing all live registers."""
        self.mapper.mark_live("RAX")
        self.mapper.mark_live("RBX")
        self.mapper.clear_live_registers()

        live = self.mapper.get_live_registers()
        self.assertEqual(len(live), 0, "All registers should be cleared")


class TestRegisterAliases(unittest.TestCase):
    """Test handling of register aliases."""

    def setUp(self):
        """Set up test fixtures."""
        self.mapper = RegisterMapper()

    def test_x87_register_aliases(self):
        """Test x87 floating point register aliases."""
        # ST0-ST7 are aliases for the x87 register stack
        for i in range(8):
            st_reg = f"ST{i}"
            idx = self.mapper.map_register(st_reg)
            self.assertIsInstance(idx, int, f"{st_reg} should map to an index")

    def test_mm_xmm_register_mapping(self):
        """Test MMX and XMM register mapping."""
        # MMX registers (MM0-MM7) and XMM registers (XMM0-XMM15)
        for i in range(8):
            mm_reg = f"MM{i}"
            idx = self.mapper.map_register(mm_reg)
            self.assertIsInstance(idx, int, f"{mm_reg} should map to an index")

        for i in range(16):
            xmm_reg = f"XMM{i}"
            idx = self.mapper.map_register(xmm_reg)
            self.assertIsInstance(idx, int, f"{xmm_reg} should map to an index")

    def test_get_register_aliases(self):
        """Test getting all aliases for a register."""
        aliases = self.mapper.get_register_aliases("RAX")

        # RAX should have EAX, AX, AL, AH as aliases
        expected_aliases = ["EAX", "AX", "AL", "AH"]
        for alias in expected_aliases:
            self.assertIn(alias, [a.name for a in aliases],
                         f"{alias} should be an alias of RAX")


class TestRegisterSizeExtension(unittest.TestCase):
    """Test size extension semantics for different register sizes."""

    def setUp(self):
        """Set up test fixtures."""
        self.mapper = RegisterMapper()

    def test_get_register_size(self):
        """Test getting the size of a register."""
        self.assertEqual(self.mapper.get_register_size("RAX"), RegisterSize.BITS_64)
        self.assertEqual(self.mapper.get_register_size("EAX"), RegisterSize.BITS_32)
        self.assertEqual(self.mapper.get_register_size("AX"), RegisterSize.BITS_16)
        self.assertEqual(self.mapper.get_register_size("AL"), RegisterSize.BITS_8)

    def test_zero_extension_required(self):
        """Test checking if zero-extension is needed for a register."""
        # 32-bit and smaller need zero-extension when stored in 64-bit slot
        self.assertTrue(self.mapper.needs_zero_extend("EAX"))
        self.assertTrue(self.mapper.needs_zero_extend("AX"))
        self.assertTrue(self.mapper.needs_zero_extend("AL"))

        # 64-bit registers don't need zero-extension
        self.assertFalse(self.mapper.needs_zero_extend("RAX"))


class TestErrorHandling(unittest.TestCase):
    """Test error handling for invalid inputs."""

    def setUp(self):
        """Set up test fixtures."""
        self.mapper = RegisterMapper()

    def test_invalid_register_raises_error(self):
        """Test that an invalid register name raises RegisterMappingError."""
        with self.assertRaises(RegisterMappingError):
            self.mapper.map_register("INVALID_REG")

    def test_case_insensitive_mapping(self):
        """Test that register mapping is case-insensitive."""
        idx_upper = self.mapper.map_register("RAX")
        idx_lower = self.mapper.map_register("rax")
        idx_mixed = self.mapper.map_register("Rax")

        self.assertEqual(idx_upper, idx_lower,
                        "Register mapping should be case-insensitive")
        self.assertEqual(idx_upper, idx_mixed,
                        "Register mapping should be case-insensitive")


class TestWASMGeneration(unittest.TestCase):
    """Test WASM local declaration generation."""

    def setUp(self):
        """Set up test fixtures."""
        self.mapper = RegisterMapper()

    def test_get_wasm_local_declarations(self):
        """Test generating WASM local declarations for mapped registers."""
        declarations = self.mapper.get_wasm_local_declarations()

        self.assertIsInstance(declarations, list)
        # Should have at least declarations for the 16 GPRs
        self.assertGreaterEqual(len(declarations), 16)

    def test_export_register_map(self):
        """Test exporting the register map as a dictionary."""
        reg_map = self.mapper.export_register_map()

        self.assertIsInstance(reg_map, dict)
        self.assertIn("RAX", reg_map)
        self.assertIn("R15", reg_map)


if __name__ == '__main__':
    unittest.main(verbosity=2)
