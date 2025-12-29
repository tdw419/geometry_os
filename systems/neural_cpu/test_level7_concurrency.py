import unittest
import numpy as np
import logging
from phase3_execution_engine_level6 import EnhancedNeuralExecutionEngine
from semantic_isa import SIS_PRIMITIVES
from sis_extensions import SIS_EXTENSIONS

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class TestLevel7Concurrency(unittest.TestCase):
    def setUp(self):
        self.engine = EnhancedNeuralExecutionEngine(vector_dim=512)
        self.NAME_TO_IDX = {v: k for k, v in self.engine.operation_map.items()}
        self.REG_MAP = {
            'EAX': 72, 'ECX': 73, 'EDX': 74, 'EBX': 75,
            'ESP': 76, 'EBP': 77, 'ESI': 78, 'EDI': 79
        }
        self.SRC_REG_MAP = {
            'EAX': 160, 'ECX': 161, 'EDX': 162, 'EBX': 163,
            'ESP': 164, 'EBP': 165, 'ESI': 166, 'EDI': 167
        }

    def create_vector(self, op_name, dest=None, src=None, imm=None):
        v = np.zeros(512)
        v[self.NAME_TO_IDX[op_name]] = 1.0
        if dest and dest in self.REG_MAP:
            v[self.REG_MAP[dest]] = 1.0
        if src and src in self.SRC_REG_MAP:
            v[self.SRC_REG_MAP[src]] = 1.0
        if imm is not None:
            if imm == 0:
                v[104] = 1.0
            else:
                v[256] = float(imm)
        return v

    def test_recursive_function(self):
        """Test recursive factorial: fact(n) = n == 0 ? 1 : n * fact(n-1)"""
        # [0] fact(3):
        program = [
            self.create_vector('CMP', dest='EAX', imm=0),    # 0: CMP EAX, 0
            self.create_vector('JNE', imm=4),                # 1: JNE 4
            self.create_vector('MOV', dest='EAX', imm=1),    # 2: MOV EAX, 1
            self.create_vector('RET'),                       # 3: RET
            self.create_vector('PUSH', src='EAX'),           # 4: PUSH EAX
            self.create_vector('SUB', dest='EAX', imm=1),    # 5: SUB EAX, 1
            self.create_vector('CALL', imm=0),               # 6: CALL 0
            self.create_vector('POP', dest='EBX'),           # 7: POP EBX
            self.create_vector('MUL', dest='EAX', src='EBX'),# 8: MUL EAX, EBX
            self.create_vector('RET'),                       # 9: RET
            self.create_vector('MOV', dest='EAX', imm=3),    # 10: Start: MOV EAX, 3
            self.create_vector('CALL', imm=0),               # 11: CALL fact
            self.create_vector('HLT')                        # 12: HLT
        ]
        
        tensor = np.stack(program)
        self.engine.threads[0]['pc'] = 10
        traces = self.engine.simulate_program(tensor, max_cycles=100)
        
        final_eax = self.engine.threads[0]['state'].get('EAX')
        self.assertEqual(final_eax, 6) # 3! = 6
        logger.info(f"Recursive factorial test passed! 3! = {final_eax}")

    def test_multi_threading_basic(self):
        """Test thread spawning and parallel execution."""
        v_spawn = self.create_vector('THREAD_SPAWN', imm=10)
        v_main = self.create_vector('MOV', dest='EBX', imm=1)
        v_spin = self.create_vector('JMP', imm=2)
        
        v_work = self.create_vector('MOV', dest='EAX', imm=42)
        v_exit = self.create_vector('THREAD_EXIT')

        program = [v_spawn, v_main, v_spin] + [np.zeros(512)]*7 + [v_work, v_exit]
        
        tensor = np.stack(program)
        self.engine.threads[0]['pc'] = 0
        traces = self.engine.simulate_program(tensor, max_cycles=50)
        
        # Verify both threads executed
        thread_ids = set(t['thread_id'] for t in traces)
        self.assertIn(0, thread_ids)
        self.assertIn(1, thread_ids)
        
        # Verify worker work
        final_eax = self.engine.threads[1]['state'].get('EAX')
        self.assertEqual(final_eax, 42)
        logger.info("Multi-threading basic test passed!")

    def test_mutex_contention(self):
        """Test mutex lock contention with shared memory."""
        # Shared memory addr 4096 will be our counter
        
        program = [
            # 0: MUTEX_CREATE
            self.create_vector('MUTEX_CREATE'),
            # 1: MOV EDI, EAX (Store mutex ID)
            self.create_vector('MOV', dest='EDI', src='EAX'),
            # 2: THREAD_SPAWN(20)
            self.create_vector('THREAD_SPAWN', imm=20),
            # 3: MUTEX_LOCK EDI
            self.create_vector('MUTEX_LOCK', dest='EDI'),
            # 4: MOV EAX, 1000 (Addr)
            self.create_vector('MOV', dest='EAX', imm=4096),
            # 5: MOV ECX, 42 (Value)
            self.create_vector('MOV', dest='ECX', imm=42),
            # 6: MEM_STORE (Write 42 to 4096)
            self.create_vector('MEM_STORE'),
            # 7-8: Delay loop to ensure worker tries to lock
            self.create_vector('MOV', dest='EBX', imm=10),
            self.create_vector('DEC', dest='EBX'),
            self.create_vector('JNE', imm=8),
            # 10: MUTEX_UNLOCK EDI
            self.create_vector('MUTEX_UNLOCK', dest='EDI'),
            # 11-12: Join worker
            self.create_vector('MOV', dest='EAX', imm=1),
            self.create_vector('THREAD_JOIN'),
            # 14: HLT
            self.create_vector('HLT'),
            
            # ... filler ...
            np.zeros(512), # 14
            np.zeros(512), # 15
            np.zeros(512), # 16
            np.zeros(512), # 17
            np.zeros(512), # 18
            np.zeros(512), # 19
            np.zeros(512), # 20 (Align to index 20)
            
            # 21: Worker Thread Start (at PC 21? Wait, 14+7=21... No 14+7=21, so 21st item is index 21)
            # Actually, I'll just use THREAD_SPAWN(21) to be safe.
            # 21: MUTEX_LOCK EDI
            self.create_vector('MUTEX_LOCK', dest='EDI'),
            # 22: MEM_LOAD (Addr 4096)
            self.create_vector('MOV', dest='EAX', imm=4096),
            self.create_vector('MEM_LOAD'),
            # 23: SUB EAX, 2 (42 -> 40)
            self.create_vector('SUB', dest='EAX', imm=2),
            # 24: MEM_STORE (Write 40 to 4096)
            self.create_vector('MOV', dest='ECX', src='EAX'), # Val to ECX
            self.create_vector('MOV', dest='EAX', imm=4096), # Addr to EAX
            self.create_vector('MEM_STORE'),
            # 27: MUTEX_UNLOCK EDI
            self.create_vector('MUTEX_UNLOCK', dest='EDI'),
            # 28: THREAD_EXIT
            self.create_vector('THREAD_EXIT')
        ]
        
        # Adjust THREAD_SPAWN to point to index 21
        program[2] = self.create_vector('THREAD_SPAWN', imm=21)
        
        tensor = np.stack(program)
        self.engine.threads[0]['pc'] = 0
        self.engine.simulate_program(tensor, max_cycles=500)
        
        # Verify final memory value
        final_val = self.engine.memory_manager.read_memory(4096)
        self.assertEqual(final_val, 40)
        logger.info(f"Advanced Mutex test passed! Shared memory at 4096: {final_val}")

if __name__ == '__main__':
    unittest.main()
