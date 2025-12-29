import unittest
import numpy as np
import logging
import os
import subprocess
from phase3_execution_engine_level6 import EnhancedNeuralExecutionEngine
from tools.llvm_to_rts import LLVMToRTSConverter

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class TestLevel6AdvancedCompiler(unittest.TestCase):
    def setUp(self):
        self.engine = EnhancedNeuralExecutionEngine(vector_dim=512)
        self.converter = LLVMToRTSConverter()

    def test_string_compilation(self):
        """Test compilation of string allocation and concatenation IR."""
        ll_content = """
define i32 @_start() {
  %s1 = call i8* @neural_str_alloc(i32 10)
  %s2 = call i8* @neural_str_alloc(i32 20)
  %res = call i8* @neural_str_concat(i8* %s1, i8* %s2)
  ret i32 0
}
"""
        with open("test_string.ll", "w") as f:
            f.write(ll_content)
            
        # Convert to RTS vectors
        vectors = self.converter.parse_file("test_string.ll")
        
        # Use engine's own logic to check opcodes
        op_names = []
        op_indices = list(self.engine.operation_map.keys())
        for v in vectors:
            v_sq = v.squeeze()
            op_values = v_sq[op_indices]
            max_idx = np.argmax(op_values)
            op_name = self.engine.operation_map[op_indices[max_idx]]
            op_names.append(op_name)
            
        logger.info(f"Generated Opcodes: {op_names}")
        
        self.assertIn('STR_ALLOC', op_names)
        self.assertIn('STR_CONCAT', op_names)
        
        # Clean up
        if os.path.exists("test_string.ll"):
            os.remove("test_string.ll")

    def test_string_execution(self):
        """Test execution of string operations in the simulation engine."""
        # Create vectors manually to skip compiler dependencies for this unit test
        
        # 0: MOV EAX, 10
        # Use the converter's emit_vector to be sure
        self.converter.vectors = []
        self.converter._emit_mov_reg_imm('rax', 10) # PC 0: MOV EAX, 10
        self.converter.emit_vector(371, rax=1.0)    # PC 1: STR_ALLOC (uses EAX=10)
        self.converter._emit_store_reg('s1', 'rax') # PC 2-3: Store result
        
        self.converter._emit_mov_reg_imm('rax', 20) # PC 4: MOV EAX, 20
        self.converter.emit_vector(371, rax=1.0)    # PC 5: STR_ALLOC (uses EAX=20)
        self.converter._emit_store_reg('s2', 'rax') # PC 6-7: Store result
        
        self.converter._emit_load_reg('s1', 'rax')  # PC 8-9: Load s1 to EAX
        self.converter._emit_load_reg('s2', 'rbx')  # PC 10-11: Load s2 to EBX
        self.converter.emit_vector(372, rax=1.0, src='rbx') # PC 12: STR_CONCAT (EAX, EBX)
        self.converter.emit_vector(98) # PC 13: HLT
        
        tensor = np.stack(self.converter.vectors)
        self.engine.simulate_program(tensor, max_cycles=50)
        
        # Check if the result is a sensible address and has correct info
        final_rax = self.engine.register_state.get('EAX')
        info = self.engine.memory_manager.get_allocation_info(final_rax)
        
        self.assertIsNotNone(info)
        self.assertEqual(info['type_info']['type'], 'string')
        self.assertEqual(info['size'], 30) # 10 + 20
        
        logger.info(f"String execution test passed! Final Addr: 0x{final_rax:08X}, Size: {info['size']}")

    def test_oop_compilation(self):
        """Test compilation of OOP IR instructions."""
        ll_content = """
define i32 @_start() {
  call void @neural_class_define(i32 1)
  %obj = call i8* @neural_class_inst(i32 1)
  %res = call i32 @neural_method_call(i8* %obj, i32 1)
  ret i32 0
}
"""
        with open("test_oop.ll", "w") as f:
            f.write(ll_content)
            
        vectors = self.converter.parse_file("test_oop.ll")
        
        op_names = []
        op_indices = list(self.engine.operation_map.keys())
        for v in vectors:
            v_sq = v.squeeze()
            op_values = v_sq[op_indices]
            max_idx = np.argmax(op_values)
            op_name = self.engine.operation_map[op_indices[max_idx]]
            op_names.append(op_name)
            
        logger.info(f"OOP Generated Opcodes: {op_names}")
        
        self.assertIn('CLASS_DEFINE', op_names)
        self.assertIn('CLASS_INST', op_names)
        self.assertIn('METHOD_CALL', op_names)
        
        if os.path.exists("test_oop.ll"):
            os.remove("test_oop.ll")

    def test_threading_compilation(self):
        """Test compilation of Level 7 threading IR instructions."""
        ll_content = """
define i32 @_start() {
  %tid = call i32 @neural_thread_spawn(i8* %thread_func)
  call void @neural_thread_join(i32 %tid)
  %mid = call i32 @neural_mutex_create()
  call void @neural_mutex_lock(i32 %mid)
  call void @neural_mutex_unlock(i32 %mid)
  ret i32 0
}
"""
        with open("test_thread.ll", "w") as f:
            f.write(ll_content)
            
        vectors = self.converter.parse_file("test_thread.ll")
        
        op_names = []
        op_indices = list(self.engine.operation_map.keys())
        for v in vectors:
            v_sq = v.squeeze()
            op_values = v_sq[op_indices]
            max_idx = np.argmax(op_values)
            op_name = self.engine.operation_map[op_indices[max_idx]]
            op_names.append(op_name)
            
        logger.info(f"Thread Generated Opcodes: {op_names}")
        
        self.assertIn('THREAD_SPAWN', op_names)
        self.assertIn('THREAD_JOIN', op_names)
        self.assertIn('MUTEX_CREATE', op_names)
        self.assertIn('MUTEX_LOCK', op_names)
        
        if os.path.exists("test_thread.ll"):
            os.remove("test_thread.ll")

if __name__ == '__main__':
    unittest.main()
