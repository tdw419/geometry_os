import unittest
import numpy as np
import logging
from phase3_execution_engine_level6 import EnhancedNeuralExecutionEngine

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class TestLevel7ConcurrencyAdvanced(unittest.TestCase):
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
        logger.info(f"NAME_TO_IDX: {self.NAME_TO_IDX}")

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

    def test_mutex_contention(self):
        """Test mutex lock contention with shared memory."""
        # Shared memory addr 0x1000 will be our counter
        
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
            np.zeros(512), # 15
            np.zeros(512), # 16
            np.zeros(512), # 17
            np.zeros(512), # 18
            np.zeros(512), # 19
            np.zeros(512), # 20 (Wait, 14+6=20, so index 20 is the 21st item)
            
            # 20: Worker Thread Start
            # 20: MUTEX_LOCK EDI
            self.create_vector('MUTEX_LOCK', dest='EDI'),
            # 21: MEM_LOAD (Addr 4096)
            self.create_vector('MOV', dest='EAX', imm=4096),
            self.create_vector('MEM_LOAD'),
            # 22: SUB EAX, 2 (42 -> 40)
            self.create_vector('SUB', dest='EAX', imm=2),
            # 23: MEM_STORE (Write 40 to 4096)
            self.create_vector('MOV', dest='ECX', src='EAX'), # Val to ECX
            self.create_vector('MOV', dest='EAX', imm=4096), # Addr to EAX
            self.create_vector('MEM_STORE'),
            # 26: MUTEX_UNLOCK EDI
            self.create_vector('MUTEX_UNLOCK', dest='EDI'),
            # 27: THREAD_EXIT
            self.create_vector('THREAD_EXIT')
        ]
        
        tensor = np.stack(program)
        self.engine.threads[0]['pc'] = 0
        self.engine.simulate_program(tensor, max_cycles=500)
        
        # Verify final memory value
        final_val = self.engine.memory_manager.read_memory(4096)
        self.assertEqual(final_val, 40)
        logger.info(f"Advanced Mutex test passed! Shared memory at 4096: {final_val}")

if __name__ == '__main__':
    unittest.main()
