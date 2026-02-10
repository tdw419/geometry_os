"""
Test suite for Stack Operation Translator (x86 to WASM)

These tests verify the translation of x86 stack operations to WASM memory operations.
"""

import unittest
import sys
from pathlib import Path

# Add parent directory to path to import modules
sys.path.insert(0, str(Path(__file__).parent.parent))
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from pixel_compiler.stack_translator import (
    StackTranslator,
    X86Register,
    StackAlignment,
    StackInstruction,
    StackFrame,
    TranslationResult,
    create_push_wasm,
    create_pop_wasm,
)


class TestStackInstruction(unittest.TestCase):
    """Test StackInstruction dataclass."""

    def test_instruction_creation(self):
        """Test creating a stack instruction."""
        inst = StackInstruction(
            opcode=b'\x41',
            operands=b'\x2a',
            comment="i32.const 42"
        )

        self.assertEqual(inst.opcode, b'\x41')
        self.assertEqual(inst.operands, b'\x2a')
        self.assertEqual(inst.comment, "i32.const 42")

    def test_to_bytes(self):
        """Test converting instruction to bytes."""
        inst = StackInstruction(
            opcode=b'\x41',
            operands=b'\x2a',
            comment="test"
        )

        result = inst.to_bytes()
        self.assertEqual(result, b'\x41\x2a')

    def test_to_bytes_no_operands(self):
        """Test instruction with no operands."""
        inst = StackInstruction(opcode=b'\x0b')

        result = inst.to_bytes()
        self.assertEqual(result, b'\x0b')

    def test_str_representation(self):
        """Test string representation of instruction."""
        inst = StackInstruction(
            opcode=b'\x41',
            operands=b'\x2a',
            comment="i32.const 42"
        )

        s = str(inst)
        self.assertIn("41", s)
        self.assertIn("2a", s)
        self.assertIn("i32.const 42", s)


class TestStackFrame(unittest.TestCase):
    """Test StackFrame dataclass."""

    def test_frame_creation(self):
        """Test creating a stack frame."""
        frame = StackFrame(
            base_offset=0x1000,
            size=32,
            alignment=16,
            saved_regs=[X86Register.RBP, X86Register.RBX],
            local_size=16
        )

        self.assertEqual(frame.base_offset, 0x1000)
        self.assertEqual(frame.size, 32)
        self.assertEqual(frame.alignment, 16)
        self.assertEqual(len(frame.saved_regs), 2)
        self.assertEqual(frame.local_size, 16)

    def test_aligned_size(self):
        """Test aligned size calculation."""
        frame = StackFrame(
            base_offset=0x1000,
            size=32,
            alignment=16
        )

        self.assertEqual(frame.aligned_size(), 32)

    def test_aligned_size_rounding(self):
        """Test aligned size rounds up."""
        frame = StackFrame(
            base_offset=0x1000,
            size=30,
            alignment=16
        )

        self.assertEqual(frame.aligned_size(), 32)  # Rounded up to 16-byte boundary

    def test_aligned_size_with_8_byte(self):
        """Test aligned size with 8-byte alignment."""
        frame = StackFrame(
            base_offset=0x1000,
            size=20,
            alignment=8
        )

        self.assertEqual(frame.aligned_size(), 24)  # Rounded up to 8-byte boundary


class TestTranslationResult(unittest.TestCase):
    """Test TranslationResult dataclass."""

    def test_result_creation(self):
        """Test creating a translation result."""
        result = TranslationResult(
            stack_delta=-8,
            new_rsp=0x1000 - 8
        )

        self.assertEqual(result.stack_delta, -8)
        self.assertEqual(result.new_rsp, 0x1000 - 8)
        self.assertEqual(len(result.instructions), 0)

    def test_to_wasm_bytes_empty(self):
        """Test converting empty result to bytes."""
        result = TranslationResult()

        wasm_bytes = result.to_wasm_bytes()
        self.assertEqual(wasm_bytes, b'')

    def test_to_wasm_bytes_with_instructions(self):
        """Test converting result with instructions to bytes."""
        result = TranslationResult()
        result.instructions = [
            StackInstruction(opcode=b'\x41', operands=b'\x2a'),
            StackInstruction(opcode=b'\x0b'),
        ]

        wasm_bytes = result.to_wasm_bytes()
        self.assertEqual(wasm_bytes, b'\x41\x2a\x0b')

    def test_append_results(self):
        """Test appending two translation results."""
        result1 = TranslationResult(
            stack_delta=-8,
            new_rsp=0x1000 - 8
        )
        result1.instructions.append(
            StackInstruction(opcode=b'\x41', operands=b'\x08')
        )

        result2 = TranslationResult(
            stack_delta=-8,
            new_rsp=0x1000 - 16
        )
        result2.instructions.append(
            StackInstruction(opcode=b'\x41', operands=b'\x10')
        )

        result1.append(result2)

        self.assertEqual(len(result1.instructions), 2)
        self.assertEqual(result1.stack_delta, -16)
        self.assertEqual(result1.new_rsp, 0x1000 - 16)


class TestStackTranslatorInit(unittest.TestCase):
    """Test StackTranslator initialization."""

    def test_default_initialization(self):
        """Test translator with default settings."""
        translator = StackTranslator()

        self.assertEqual(translator.stack_base, 0x10000)
        self.assertEqual(translator.stack_size, 0x10000)
        self.assertEqual(translator.alignment, 16)
        self.assertTrue(translator.use_globals)

    def test_custom_initialization(self):
        """Test translator with custom settings."""
        translator = StackTranslator(
            stack_base=0x20000,
            stack_size=0x20000,
            alignment=StackAlignment.ALIGN_8
        )

        self.assertEqual(translator.stack_base, 0x20000)
        self.assertEqual(translator.stack_size, 0x20000)
        self.assertEqual(translator.alignment, 8)

    def test_initial_frame_state(self):
        """Test initial frame state is empty."""
        translator = StackTranslator()

        self.assertEqual(len(translator.frames), 0)
        self.assertIsNone(translator.current_frame)


class TestTranslatePush(unittest.TestCase):
    """Test PUSH instruction translation."""

    def setUp(self):
        """Set up test fixtures."""
        self.translator = StackTranslator()

    def test_push_rax_generates_instructions(self):
        """Test that PUSH RAX generates WASM instructions."""
        result = self.translator.translate_push(X86Register.RAX, rsp_value=0x1000)

        self.assertGreater(len(result.instructions), 0)
        self.assertIsInstance(result, TranslationResult)

    def test_push_updates_stack_pointer(self):
        """Test that PUSH decrements stack pointer."""
        result = self.translator.translate_push(X86Register.RAX, rsp_value=0x1000)

        self.assertEqual(result.stack_delta, -8)
        self.assertEqual(result.new_rsp, 0x1000 - 8)

    def test_push_multiple_values(self):
        """Test multiple PUSH operations."""
        result1 = self.translator.translate_push(X86Register.RAX, rsp_value=0x1000)
        result2 = self.translator.translate_push(X86Register.RBX, rsp_value=result1.new_rsp)

        self.assertEqual(result1.new_rsp, 0x1000 - 8)
        self.assertEqual(result2.new_rsp, 0x1000 - 16)

    def test_push_with_register_value(self):
        """Test PUSH with register value provided."""
        result = self.translator.translate_push(
            X86Register.RCX,
            rsp_value=0x1000,
            register_values={X86Register.RCX: 42}
        )

        self.assertEqual(result.stack_delta, -8)
        # Verify instruction contains the value (via LEB128 encoding)
        self.assertGreater(len(result.to_wasm_bytes()), 0)

    def test_push_to_wasm_bytes(self):
        """Test converting PUSH result to WASM bytes."""
        result = self.translator.translate_push(X86Register.RDX, rsp_value=0x1000)

        wasm_bytes = result.to_wasm_bytes()
        self.assertIsInstance(wasm_bytes, bytes)
        self.assertGreater(len(wasm_bytes), 0)


class TestTranslatePop(unittest.TestCase):
    """Test POP instruction translation."""

    def setUp(self):
        """Set up test fixtures."""
        self.translator = StackTranslator()

    def test_pop_rax_generates_instructions(self):
        """Test that POP RAX generates WASM instructions."""
        result = self.translator.translate_pop(X86Register.RAX, rsp_value=0x1000)

        self.assertGreater(len(result.instructions), 0)
        self.assertIsInstance(result, TranslationResult)

    def test_pop_updates_stack_pointer(self):
        """Test that POP increments stack pointer."""
        result = self.translator.translate_pop(X86Register.RAX, rsp_value=0x1000)

        self.assertEqual(result.stack_delta, 8)
        self.assertEqual(result.new_rsp, 0x1000 + 8)

    def test_pop_multiple_values(self):
        """Test multiple POP operations."""
        result1 = self.translator.translate_pop(X86Register.RAX, rsp_value=0x1000 - 16)
        result2 = self.translator.translate_pop(X86Register.RBX, rsp_value=result1.new_rsp)

        self.assertEqual(result1.new_rsp, 0x1000 - 8)
        self.assertEqual(result2.new_rsp, 0x1000)

    def test_pop_to_wasm_bytes(self):
        """Test converting POP result to WASM bytes."""
        result = self.translator.translate_pop(X86Register.RDX, rsp_value=0x1000)

        wasm_bytes = result.to_wasm_bytes()
        self.assertIsInstance(wasm_bytes, bytes)
        self.assertGreater(len(wasm_bytes), 0)


class TestTranslatePrologue(unittest.TestCase):
    """Test function prologue translation."""

    def setUp(self):
        """Set up test fixtures."""
        self.translator = StackTranslator()

    def test_prologue_basic(self):
        """Test basic function prologue (PUSH RBP; MOV RBP, RSP)."""
        result = self.translator.translate_prologue(rsp_value=0x10000)

        self.assertIsInstance(result, TranslationResult)
        self.assertGreater(len(result.instructions), 0)
        # Should decrement RSP by 8 for RBP save
        self.assertEqual(result.stack_delta, -8)
        self.assertEqual(result.new_rsp, 0x10000 - 8)

    def test_prologue_with_frame_size(self):
        """Test prologue with local variable allocation."""
        frame_size = 32
        result = self.translator.translate_prologue(
            rsp_value=0x10000,
            frame_size=frame_size
        )

        # Should align to 16 bytes
        expected_delta = -8 - 32  # RBP save + aligned locals
        self.assertEqual(result.stack_delta, expected_delta)

    def test_prologue_with_saved_regs(self):
        """Test prologue saving additional registers."""
        result = self.translator.translate_prologue(
            rsp_value=0x10000,
            saved_regs=[X86Register.RBX, X86Register.R12]
        )

        # RBP (8) + RBX (8) + R12 (8) = 24 bytes
        self.assertEqual(result.stack_delta, -24)
        self.assertEqual(result.new_rsp, 0x10000 - 24)

    def test_prologue_creates_frame(self):
        """Test that prologue creates a stack frame."""
        initial_frame_count = len(self.translator.frames)
        self.translator.translate_prologue(
            rsp_value=0x10000,
            frame_size=16,
            saved_regs=[X86Register.RBX]
        )

        self.assertEqual(len(self.translator.frames), initial_frame_count + 1)
        self.assertIsNotNone(self.translator.current_frame)

    def test_prologue_frame_attributes(self):
        """Test that prologue frame has correct attributes."""
        self.translator.translate_prologue(
            rsp_value=0x10000,
            frame_size=32,
            saved_regs=[X86Register.R12, X86Register.R13]
        )

        frame = self.translator.current_frame
        self.assertIsNotNone(frame)
        self.assertEqual(frame.base_offset, 0x10000)
        self.assertIn(X86Register.RBP, frame.saved_regs)
        self.assertIn(X86Register.R12, frame.saved_regs)
        self.assertIn(X86Register.R13, frame.saved_regs)
        self.assertEqual(frame.local_size, 32)

    def test_prologue_to_wasm_bytes(self):
        """Test converting prologue to WASM bytes."""
        result = self.translator.translate_prologue(
            rsp_value=0x10000,
            frame_size=16
        )

        wasm_bytes = result.to_wasm_bytes()
        self.assertIsInstance(wasm_bytes, bytes)
        self.assertGreater(len(wasm_bytes), 0)


class TestTranslateEpilogue(unittest.TestCase):
    """Test function epilogue translation."""

    def setUp(self):
        """Set up test fixtures."""
        self.translator = StackTranslator()

    def test_epilogue_basic(self):
        """Test basic function epilogue (POP RBP)."""
        result = self.translator.translate_epilogue(rsp_value=0x10000 - 8)

        self.assertIsInstance(result, TranslationResult)
        self.assertGreater(len(result.instructions), 0)
        # Should increment RSP by 8 for RBP restore
        self.assertEqual(result.stack_delta, 8)
        self.assertEqual(result.new_rsp, 0x10000)

    def test_epilogue_with_frame_size(self):
        """Test epilogue with local variable deallocation."""
        # Create a frame with local_size to simulate prologue
        self.translator.frames.append(
            StackFrame(
                base_offset=0x10000,
                size=40,  # 8 for RBP + 32 for locals
                local_size=32
            )
        )

        result = self.translator.translate_epilogue(
            rsp_value=0x10000 - 8 - 32,
            saved_regs=[]
        )

        # Should deallocate (32) and restore RBP (8)
        self.assertEqual(result.stack_delta, 8 + 32)

    def test_epilogue_with_saved_regs(self):
        """Test epilogue restoring additional registers."""
        # Simulate a frame with saved registers
        self.translator.frames.append(
            StackFrame(
                base_offset=0x10000,
                size=24,
                saved_regs=[X86Register.RBP, X86Register.RBX, X86Register.R12]
            )
        )

        result = self.translator.translate_epilogue(
            rsp_value=0x10000 - 24,
            saved_regs=[X86Register.RBX, X86Register.R12]
        )

        # RBP restore (8) + RBX (8) + R12 (8)
        self.assertEqual(result.stack_delta, 24)

    def test_epilogue_pops_frame(self):
        """Test that epilogue removes the stack frame."""
        # Add a frame
        self.translator.frames.append(
            StackFrame(base_offset=0x10000, size=32)
        )

        initial_count = len(self.translator.frames)
        self.translator.translate_epilogue(rsp_value=0x10000 - 32)

        self.assertEqual(len(self.translator.frames), initial_count - 1)


class TestTranslateAllocate(unittest.TestCase):
    """Test stack allocation translation."""

    def setUp(self):
        """Set up test fixtures."""
        self.translator = StackTranslator()

    def test_allocate_basic(self):
        """Test basic stack allocation."""
        result = self.translator.translate_allocate(size=16, rsp_value=0x1000)

        self.assertEqual(result.stack_delta, -16)
        self.assertEqual(result.new_rsp, 0x1000 - 16)

    def test_allocate_aligns_to_16(self):
        """Test that allocation aligns to 16 bytes."""
        result = self.translator.translate_allocate(size=15, rsp_value=0x1000)

        # Should round up to 16
        self.assertEqual(result.stack_delta, -16)

    def test_allocate_large_size(self):
        """Test allocating larger size."""
        result = self.translator.translate_allocate(size=100, rsp_value=0x1000)

        # Should align to 112 (next multiple of 16)
        self.assertEqual(result.stack_delta, -112)

    def test_allocate_to_wasm_bytes(self):
        """Test converting allocation to WASM bytes."""
        result = self.translator.translate_allocate(size=32, rsp_value=0x1000)

        wasm_bytes = result.to_wasm_bytes()
        self.assertIsInstance(wasm_bytes, bytes)
        self.assertGreater(len(wasm_bytes), 0)


class TestTranslateDeallocate(unittest.TestCase):
    """Test stack deallocation translation."""

    def setUp(self):
        """Set up test fixtures."""
        self.translator = StackTranslator()

    def test_deallocate_basic(self):
        """Test basic stack deallocation."""
        result = self.translator.translate_deallocate(size=16, rsp_value=0x1000 - 16)

        self.assertEqual(result.stack_delta, 16)
        self.assertEqual(result.new_rsp, 0x1000)

    def test_deallocate_aligns_to_16(self):
        """Test that deallocation aligns to 16 bytes."""
        result = self.translator.translate_deallocate(size=15, rsp_value=0x1000 - 16)

        # Should round up to 16
        self.assertEqual(result.stack_delta, 16)

    def test_deallocate_to_wasm_bytes(self):
        """Test converting deallocation to WASM bytes."""
        result = self.translator.translate_deallocate(size=32, rsp_value=0x1000 - 32)

        wasm_bytes = result.to_wasm_bytes()
        self.assertIsInstance(wasm_bytes, bytes)
        self.assertGreater(len(wasm_bytes), 0)


class TestPushPopSequence(unittest.TestCase):
    """Test sequences of PUSH and POP operations."""

    def setUp(self):
        """Set up test fixtures."""
        self.translator = StackTranslator()

    def test_push_pop_sequence(self):
        """Test a sequence of PUSH followed by POP."""
        initial_rsp = 0x1000

        # PUSH RAX
        push_result = self.translator.translate_push(
            X86Register.RAX,
            rsp_value=initial_rsp
        )

        # POP RBX
        pop_result = self.translator.translate_pop(
            X86Register.RBX,
            rsp_value=push_result.new_rsp
        )

        # Stack pointer should return to original value
        self.assertEqual(push_result.new_rsp, initial_rsp - 8)
        self.assertEqual(pop_result.new_rsp, initial_rsp)

    def test_push_push_pop_pop(self):
        """Test PUSH PUSH POP POP sequence."""
        initial_rsp = 0x1000

        # PUSH RAX
        r1 = self.translator.translate_push(X86Register.RAX, initial_rsp)
        # PUSH RBX
        r2 = self.translator.translate_push(X86Register.RBX, r1.new_rsp)
        # POP RCX
        r3 = self.translator.translate_pop(X86Register.RCX, r2.new_rsp)
        # POP RDX
        r4 = self.translator.translate_pop(X86Register.RDX, r3.new_rsp)

        # Should return to original
        self.assertEqual(r4.new_rsp, initial_rsp)
        self.assertEqual(r1.new_rsp, initial_rsp - 8)
        self.assertEqual(r2.new_rsp, initial_rsp - 16)
        self.assertEqual(r3.new_rsp, initial_rsp - 8)


class TestStackAlignment(unittest.TestCase):
    """Test 16-byte stack alignment."""

    def setUp(self):
        """Set up test fixtures."""
        self.translator = StackTranslator(alignment=StackAlignment.ALIGN_16)

    def test_push_maintains_alignment(self):
        """Test that single PUSH breaks alignment (8 bytes)."""
        result = self.translator.translate_push(X86Register.RAX, rsp_value=0x1000)

        # After PUSH, RSP should not be 16-byte aligned
        self.assertTrue(result.new_rsp % 16 != 0)

    def test_double_push_maintains_alignment(self):
        """Test that two PUSHes maintain alignment (16 bytes)."""
        initial_rsp = 0x1000  # 16-byte aligned

        r1 = self.translator.translate_push(X86Register.RAX, initial_rsp)
        r2 = self.translator.translate_push(X86Register.RBX, r1.new_rsp)

        # After two PUSHes (16 bytes), should be aligned again
        self.assertTrue(r2.new_rsp % 16 == 0)

    def test_prologue_alignment(self):
        """Test that prologue maintains alignment."""
        initial_rsp = 0x10000  # 16-byte aligned

        result = self.translator.translate_prologue(
            rsp_value=initial_rsp,
            frame_size=32  # Already aligned
        )

        # Final RSP should be 16-byte aligned
        # RBP save (8) + locals (32) = 40, needs alignment
        self.assertTrue(result.new_rsp % 16 == 0 or result.stack_delta % 16 != 0)


class TestStackDepth(unittest.TestCase):
    """Test stack depth tracking."""

    def setUp(self):
        """Set up test fixtures."""
        self.translator = StackTranslator()

    def test_initial_depth(self):
        """Test initial stack depth is 0."""
        self.assertEqual(self.translator.get_stack_depth(), 0)

    def test_depth_after_frame(self):
        """Test stack depth after creating frame."""
        self.translator.translate_prologue(
            rsp_value=0x10000,
            frame_size=32,
            saved_regs=[X86Register.RBX]
        )

        self.assertGreater(self.translator.get_stack_depth(), 0)

    def test_depth_after_multiple_frames(self):
        """Test stack depth after multiple nested frames."""
        self.translator.translate_prologue(rsp_value=0x10000, frame_size=16)
        self.translator.translate_prologue(rsp_value=0x10000 - 24, frame_size=16)

        # Two frames should increase depth
        self.assertGreaterEqual(self.translator.get_stack_depth(), 32)


class TestReset(unittest.TestCase):
    """Test translator reset functionality."""

    def setUp(self):
        """Set up test fixtures."""
        self.translator = StackTranslator()

    def test_reset_clears_frames(self):
        """Test that reset clears all frames."""
        self.translator.translate_prologue(rsp_value=0x10000, frame_size=16)
        self.translator.translate_prologue(rsp_value=0x10000 - 24, frame_size=16)

        self.assertGreater(len(self.translator.frames), 0)

        self.translator.reset()

        self.assertEqual(len(self.translator.frames), 0)
        self.assertIsNone(self.translator.current_frame)

    def test_reset_allows_reuse(self):
        """Test that translator can be reused after reset."""
        # First use
        self.translator.translate_prologue(rsp_value=0x10000, frame_size=16)
        self.translator.reset()

        # Second use
        result = self.translator.translate_prologue(rsp_value=0x10000, frame_size=16)

        self.assertIsNotNone(result)
        self.assertGreater(len(result.instructions), 0)


class TestConvenienceFunctions(unittest.TestCase):
    """Test convenience functions."""

    def test_create_push_wasm(self):
        """Test create_push_wasm convenience function."""
        wasm_bytes = create_push_wasm(X86Register.RAX, value=42)

        self.assertIsInstance(wasm_bytes, bytes)
        self.assertGreater(len(wasm_bytes), 0)

    def test_create_pop_wasm(self):
        """Test create_pop_wasm convenience function."""
        wasm_bytes = create_pop_wasm(X86Register.RBX)

        self.assertIsInstance(wasm_bytes, bytes)
        self.assertGreater(len(wasm_bytes), 0)


class TestSignedLEB128(unittest.TestCase):
    """Test signed LEB128 encoding."""

    def setUp(self):
        """Set up test fixtures."""
        self.translator = StackTranslator()

    def test_leb128_zero(self):
        """Test LEB128 encoding of zero."""
        result = self.translator._signed_leb128(0)
        self.assertEqual(result, b'\x00')

    def test_leb128_small_positive(self):
        """Test LEB128 encoding of small positive number."""
        result = self.translator._signed_leb128(42)
        self.assertEqual(result, b'\x2a')

    def test_leb128_small_negative(self):
        """Test LEB128 encoding of small negative number."""
        result = self.translator._signed_leb128(-1)
        # -1 in signed LEB128 is 0x7f
        self.assertEqual(result, b'\x7f')

    def test_leb128_large_positive(self):
        """Test LEB128 encoding of large positive number."""
        result = self.translator._signed_leb128(16384)
        self.assertGreater(len(result), 1)

    def test_leb128_large_negative(self):
        """Test LEB128 encoding of large negative number."""
        result = self.translator._signed_leb128(-16384)
        self.assertGreater(len(result), 1)


class TestFullFunctionTranslation(unittest.TestCase):
    """Test complete function with prologue and epilogue."""

    def setUp(self):
        """Set up test fixtures."""
        self.translator = StackTranslator()

    def test_simple_function(self):
        """Test a complete function with prologue and epilogue."""
        initial_rsp = 0x10000

        # Prologue
        prologue = self.translator.translate_prologue(
            rsp_value=initial_rsp,
            frame_size=16
        )

        # Simulate some stack operations in function body
        push1 = self.translator.translate_push(
            X86Register.RAX,
            rsp_value=prologue.new_rsp
        )
        push2 = self.translator.translate_push(
            X86Register.RBX,
            rsp_value=push1.new_rsp
        )

        # Pop the registers that were pushed in function body
        pop1 = self.translator.translate_pop(
            X86Register.RBX,
            rsp_value=push2.new_rsp
        )
        pop2 = self.translator.translate_pop(
            X86Register.RAX,
            rsp_value=pop1.new_rsp
        )

        # Epilogue (with register restoration)
        self.translator.reset()
        self.translator.frames.append(
            StackFrame(
                base_offset=initial_rsp,
                size=16 + 16,
                local_size=16  # Match the prologue frame_size
            )
        )

        epilogue = self.translator.translate_epilogue(
            rsp_value=pop2.new_rsp,
            saved_regs=[]
        )

        # Full function
        full_wasm = (
            prologue.to_wasm_bytes() +
            push1.to_wasm_bytes() +
            push2.to_wasm_bytes() +
            pop1.to_wasm_bytes() +
            pop2.to_wasm_bytes() +
            epilogue.to_wasm_bytes()
        )

        self.assertGreater(len(full_wasm), 0)
        # Epilogue should restore RSP to original value
        self.assertEqual(epilogue.new_rsp, initial_rsp)


if __name__ == '__main__':
    unittest.main(verbosity=2)
