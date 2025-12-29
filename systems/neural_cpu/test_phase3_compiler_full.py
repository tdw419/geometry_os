import unittest
import numpy as np
import logging
import os
from phase3_execution_engine_level6 import EnhancedNeuralExecutionEngine
from tools.llvm_to_rts import LLVMToRTSConverter

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class TestPhase3CompilerFull(unittest.TestCase):
    def setUp(self):
        self.engine = EnhancedNeuralExecutionEngine(vector_dim=512)
        self.converter = LLVMToRTSConverter()

    def test_full_oop_pipeline(self):
        """Test inheritance, polymorphism and type casting in the complete pipeline."""
        ll_content = """
define i32 @_start() {
  ; 1. Define classes
  call void @neural_class_define(i32 1)
  call void @neural_class_define(i32 2)
  
  ; 2. Establish Inheritance: Class 2 inherits from Class 1
  call void @neural_class_inherit(i32 2, i32 1)
  
  ; 3. Instantiate Derived Class
  %obj = call i8* @neural_class_inst(i32 2)
  
  ; 4. Polymorphic Type Check
  %type = call i32 @neural_polymorph(i8* %obj)
  
  ; 5. Type Cast back to base
  %base_obj = call i8* @neural_type_cast(i8* %obj, i32 1)
  
  ret i32 0
}
"""
        with open("test_oop_full.ll", "w") as f:
            f.write(ll_content)
            
        vectors = self.converter.parse_file("test_oop_full.ll")
        tensor = np.stack(vectors)
        
        # Execute
        self.engine.simulate_program(tensor, max_cycles=100)
        
        # Verify results
        # Pointer check in EAX (final result of cast)
        final_ptr = self.engine.threads[0]['state'].get('EAX')
        self.assertGreater(final_ptr, 0)
        
        # Verify inheritance recorded in engine
        self.assertIn('Class_2', self.engine.object_system.classes)
        self.assertEqual(self.engine.object_system.classes['Class_2']['parent_class'], 'Class_1')
        
        logger.info("Full OOP pipeline test passed!")
        if os.path.exists("test_oop_full.ll"):
            os.remove("test_oop_full.ll")

    def test_advanced_concurrency_pipeline(self):
        """Test barriers, atomics, and shared memory in the complete pipeline."""
        ll_content = """
define i32 @_start() {
  ; 1. Initial shared counter at addr 8192
  %ptr = inttoptr i32 8192 to i32*
  store i32 100, i32* %ptr
  
  ; 2. Spawn worker
  %tid = call i32 @neural_thread_spawn(i8* @worker_func)
  
  ; 3. Use barrier to sync
  call void @neural_barrier_wait(i32 1, i32 2)
  
  ; 4. Atomic add in main thread
  %old1 = call i32 @neural_atomic_add(i32* %ptr, i32 10)
  
  ; 5. Join worker
  call void @neural_thread_join(i32 %tid)
  
  ret i32 0
}

define void @worker_func() {
  %ptr = inttoptr i32 8192 to i32*
  
  ; 1. Sync with main thread
  call void @neural_barrier_wait(i32 1, i32 2)
  
  ; 2. Atomic add in worker thread
  %old2 = call i32 @neural_atomic_add(i32* %ptr, i32 20)
  
  call void @neural_thread_exit(i32 0)
  ret void
}
"""
        # Note: llvm_to_rts.py needs to handle @worker_func label correctly for threading.
        # My current _compile_instruction handles it if it's an immediate.
        # We'll help the test by providing the labels.
        
        with open("test_thread_full.ll", "w") as f:
            f.write(ll_content)
            
        # We need to ensure @worker_func is resolved. 
        # In this simple converter, define void @worker_func() will create a label 'worker_func'.
        vectors = self.converter.parse_file("test_thread_full.ll")
        tensor = np.stack(vectors)
        
        # Execute
        self.engine.simulate_program(tensor, max_cycles=500)
        
        # Verify results
        final_val = self.engine.memory_manager.read_memory(8192)
        # 100 + 10 (main) + 20 (worker) = 130
        self.assertEqual(final_val, 130)
        
        logger.info(f"Advanced concurrency pipeline test passed! Final counter: {final_val}")
        if os.path.exists("test_thread_full.ll"):
            os.remove("test_thread_full.ll")

if __name__ == '__main__':
    unittest.main()
