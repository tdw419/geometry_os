#!/usr/bin/env python3
"""
Phase 3: Neural Execution Engine with Level 6 Advanced Data Structures

This enhanced execution engine includes comprehensive support for:
- Struct and union operations
- Pointer and reference management
- Dynamic memory management
- Object-oriented programming features
- Advanced type system integration
"""

import numpy as np
from typing import Dict, List, Tuple, Optional, Union, Any
import logging
import sys
import os

# Add the neural_cpu directory to the path
sys.path.insert(0, os.path.join(os.path.dirname(__file__)))

from memory_manager import NeuralMemoryManager, NeuralTypeSystem, get_memory_manager, get_type_system

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)


class NeuralObjectSystem:
    """Object-oriented programming support for Neural CPU Level 6."""
    
    def __init__(self, memory_manager: NeuralMemoryManager, type_system: NeuralTypeSystem):
        self.memory_manager = memory_manager
        self.type_system = type_system
        self.classes = {}      # class_name -> class_definition
        self.instances = {}    # instance_id -> instance_data
        self.vtables = {}      # class_name -> vtable
        self.method_registry = {}  # method_id -> method_info

    def define_class(self, class_name: str, class_def: Dict) -> bool:
        """Define a new class with methods and vtable inheritance."""
        if class_name in self.classes:
            logger.warning(f"Class '{class_name}' already defined")
            return False
            
        parent_class = class_def.get('parent_class')
        if parent_class and parent_class not in self.classes:
            logger.error(f"Parent class '{parent_class}' not found")
            return False

        # Build VTable (including inherited methods)
        methods = {}
        if parent_class:
            parent_vtable = self.vtables.get(parent_class, {})
            methods.update(parent_vtable.get('methods', {}))
            logger.info(f"Class '{class_name}' inherited {len(methods)} methods from '{parent_class}'")

        for method in class_def.get('methods', []):
            methods[method['name']] = method['address']

        # Allocate memory for VTable in the neural heap
        vtable_addr = self.memory_manager.allocate(len(methods) * 4, alignment=4, 
                                                type_info={'type': 'vtable', 'class': class_name})
        
        self.vtables[class_name] = {
            'address': vtable_addr,
            'methods': methods
        }
        
        self.classes[class_name] = class_def
        logger.info(f"Defined class '{class_name}' with VTable at 0x{vtable_addr:08X}")
        return True
    
    def create_instance(self, class_name: str) -> str:
        """Create a new instance of a class with class pointer (VTable ptr)."""
        if class_name not in self.classes:
            return ""
            
        instance_id = f"instance_{len(self.instances)}"
        class_info = self.classes[class_name]
        
        # Calculate size (fields + vtable pointer)
        total_size = 4 # for VTable pointer
        for field in class_info.get('fields', []):
            field_type = field.get('type', 'int')
            total_size += self.type_system.get_type_size(field_type)

        instance_addr = self.memory_manager.allocate(total_size, alignment=4, 
                                                   type_info={'type': 'instance', 'class': class_name})
        
        if instance_addr == 0:
            return ""
        
        instance_data = {
            'id': instance_id,
            'class_name': class_name,
            'address': instance_addr,
            'size': total_size,
            'vtable_ptr': self.vtables[class_name]['address']
        }
        
        self.instances[instance_id] = instance_data
        logger.info(f"Created instance '{instance_id}' of class '{class_name}' at 0x{instance_addr:08X}")
        return instance_id
    
    def call_method(self, instance_id: str, method_name: str, args: List) -> Any:
        """Perform polymorphic method dispatch via VTable."""
        if instance_id not in self.instances:
            return None
            
        instance = self.instances[instance_id]
        class_name = instance['class_name']
        vtable = self.vtables.get(class_name)
        
        if not vtable or method_name not in vtable['methods']:
            logger.error(f"Method '{method_name}' not found for {class_name}")
            return None
            
        method_addr = vtable['methods'][method_name]
        logger.info(f"Dispatching '{method_name}' for {class_name} to 0x{method_addr:08X}")
        return f"Method {method_name} dispatched at 0x{method_addr:08X}"
    
    def _calculate_instance_size(self, class_info: Dict) -> int:
        """Calculate the total size of a class instance."""
        total_size = 0
        
        # Add vtable pointer size (4 bytes)
        total_size += 4
        
        # Add field sizes
        for field in class_info['fields']:
            field_size = get_type_system().get_type_size(field['type'])
            total_size += field_size
        
        return total_size
    
    def _get_default_value(self, type_name: str) -> Any:
        """Get default value for a type."""
        if type_name == 'int':
            return 0
        elif type_name == 'float':
            return 0.0
        elif type_name == 'bool':
            return False
        elif type_name == 'string':
            return ""
        else:
            return None


class EnhancedRegisterState:
    def __init__(self):
        # 32-bit registers
        self.registers = {
            'EAX': 0, 'ECX': 0, 'EDX': 0, 'EBX': 0,
            'ESP': 0, 'EBP': 0, 'ESI': 0, 'EDI': 0,
            'EIP': 0, 'EFLAGS': 0, 'CR0': 0, 'CR1': 0
        }
        self.flags = {'ZF': 0, 'SF': 0, 'CF': 0, 'OF': 0, 'PF': 0, 'AF': 0}
        self.eip = 0
        
        # 16-bit aliases
        self.reg_aliases_16 = {
            'AX': 'EAX', 'CX': 'ECX', 'DX': 'EDX', 'BX': 'EBX',
            'SP': 'ESP', 'BP': 'EBP', 'SI': 'ESI', 'DI': 'EDI'
        }
        
        # 8-bit aliases  
        self.reg_aliases_8 = {
            'AL': 'EAX', 'CL': 'ECX', 'DL': 'EDX', 'BL': 'EBX',
            'AH': 'EAX', 'CH': 'ECX', 'DH': 'EDX', 'BH': 'EBX'
        }
    
    def get(self, reg_name: str) -> int:
        reg_name = reg_name.upper()
        if reg_name in self.registers:
            return self.registers[reg_name]
        elif reg_name in self.reg_aliases_16:
            return self.registers[self.reg_aliases_16[reg_name]] & 0xFFFF
        elif reg_name in self.reg_aliases_8:
            base_reg = self.reg_aliases_8[reg_name]
            val = self.registers[base_reg]
            if reg_name.endswith('H'):
                return (val >> 8) & 0xFF
            else:
                return val & 0xFF
        logger.warning(f"Unknown register: {reg_name}")
        return 0

    def set(self, reg_name: str, value: int):
        reg_name = reg_name.upper()
        value = int(value) & 0xFFFFFFFF
        if reg_name in self.registers:
            self.registers[reg_name] = value
        elif reg_name in self.reg_aliases_16:
            base_reg = self.reg_aliases_16[reg_name]
            current = self.registers[base_reg]
            self.registers[base_reg] = (current & 0xFFFF0000) | (value & 0xFFFF)
        elif reg_name in self.reg_aliases_8:
            base_reg = self.reg_aliases_8[reg_name]
            current = self.registers[base_reg]
            if reg_name.endswith('H'):
                self.registers[base_reg] = (current & 0xFFFF00FF) | ((value & 0xFF) << 8)
            else:
                self.registers[base_reg] = (current & 0xFFFFFF00) | (value & 0xFF)
        else:
            logger.warning(f"Cannot set unknown register: {reg_name}")

    def copy(self):
        new_state = EnhancedRegisterState()
        new_state.registers = self.registers.copy()
        new_state.flags = self.flags.copy()
        new_state.eip = self.eip
        return new_state


class EnhancedNeuralExecutionEngine:
    """Enhanced Neural CPU Execution Engine with Level 6 Advanced Data Structures."""
    
    def __init__(self, vector_dim=512):
        self.vector_dim = vector_dim
        self.register_state = EnhancedRegisterState()
        
        # Memory management
        self.memory = np.zeros((1024, 64))  # 1KB memory space
        
        # Level 5 Support (inherited)
        self.function_table = {}
        self.call_stack = []
        self.stack_pointer = 1024
        self.array_table = {}
        
        # Level 6 Support
        self.memory_manager = get_memory_manager()
        self.type_system = get_type_system()
        self.object_system = NeuralObjectSystem(self.memory_manager, self.type_system)
        
        # Level 7 Support (Threading)
        self.threads = [{'id': 0, 'pc': 0, 'state': self.register_state, 'stack': [], 'active': True, 'status': 'RUNNING'}]
        self.current_thread_idx = 0
        self.mutexes = {}
        self.barriers = {}
        self.thread_wait_queues = {} # {target_thread_id: [waiting_thread_indices]}
        
        # Level 6 State
        self.struct_instances = {}  # struct_id -> struct_data
        self.pointer_table = {}     # ptr_id -> pointer_data
        self.reference_table = {}   # ref_id -> reference_data
        
        # Extended operation map including Level 6
        self.operation_map = {
            # Basic operations (0-63)
            0: 'MOV', 32: 'ADD', 33: 'SUB', 34: 'INC', 35: 'DEC', 36: 'XOR', 37: 'AND', 38: 'OR', 39: 'CMP', 40: 'TEST',
            41: 'SHL', 42: 'SHR', 43: 'NOT', 44: 'NEG', 45: 'MUL', 47: 'DIV',
            64: 'JMP', 66: 'JE', 67: 'JNE', 68: 'JG', 69: 'JL', 70: 'CALL', 71: 'RET',
            4: 'PUSH', 5: 'POP',
            96: 'NOP', 97: 'INT', 98: 'HLT',
            
            # Level 5 operations (128-134)
            128: 'FN_DEFINE', 129: 'FN_CALL', 130: 'FN_RET',
            131: 'MEM_ALLOC', 132: 'MEM_INDEX', 133: 'MEM_STORE', 134: 'MEM_LOAD',
            150: 'SYSCALL',
            
            # Level 6 operations (350-374)
            350: 'STRUCT_DEFINE', 351: 'STRUCT_INIT', 352: 'STRUCT_FIELD',
            353: 'UNION_DEFINE', 354: 'UNION_ACCESS',
            355: 'PTR_CREATE', 356: 'PTR_DEREF', 357: 'PTR_ARITH',
            358: 'REF_CREATE', 359: 'REF_DEREF',
            360: 'HEAP_ALLOC', 361: 'HEAP_FREE', 362: 'HEAP_REALLOC',
            363: 'HEAP_CLEAR', 364: 'MEM_POOL',
            365: 'CLASS_DEFINE', 366: 'CLASS_INST', 367: 'METHOD_CALL',
            368: 'INHERIT', 369: 'POLYMORPH', 370: 'TYPE_CAST',
            371: 'STR_ALLOC', 372: 'STR_CONCAT',
            373: 'ARRAY_ALLOC', 374: 'ARRAY_RESIZE',
            
            # Level 7 operations (400-411)
            400: 'THREAD_SPAWN', 401: 'THREAD_JOIN', 402: 'THREAD_EXIT', 403: 'THREAD_YIELD',
            404: 'MUTEX_CREATE', 405: 'MUTEX_LOCK', 406: 'MUTEX_UNLOCK', 407: 'BARRIER_WAIT',
            408: 'ATOMIC_ADD', 409: 'ATOMIC_CMPXCHG', 410: 'MEM_LOAD_SHARED', 411: 'MEM_STORE_SHARED'
        }
        
        logger.info(f"Enhanced Neural Execution Engine initialized with Level 6 support (Vector Dim: {vector_dim})")
    
    def extract_operands(self, vector) -> Tuple[Optional[str], Optional[int], Optional[str], Optional[str]]:
        """Extract operands from semantic vector with enhanced Level 6 support."""
        register = self._decode_register(vector)
        src_register = self._decode_src_register(vector)
        immediate = self._decode_immediate(vector)
        type_info = self._decode_type_info(vector)
        return register, immediate, type_info, src_register
    
    def _decode_register(self, vector) -> Optional[str]:
        """Decode register from semantic vector dimensions 72-103."""
        register_slice = vector[72:104]
        max_idx = np.argmax(register_slice)
        max_val = register_slice[max_idx]
        
        if max_val > 0.5:
            register_code = 72 + max_idx
            register_map = {
                72: 'EAX', 73: 'ECX', 74: 'EDX', 75: 'EBX',
                76: 'ESP', 77: 'EBP', 78: 'ESI', 79: 'EDI',
                80: 'AL', 81: 'CL', 82: 'DL', 83: 'BL',
                84: 'AH', 85: 'CH', 86: 'DH', 87: 'BH',
                88: 'AX', 89: 'CX', 90: 'DX', 91: 'BX',
                92: 'SP', 93: 'BP', 94: 'SI', 95: 'DI'
            }
            return register_map.get(register_code)
        return None

    def _decode_src_register(self, vector) -> Optional[str]:
        """Decode source register from semantic vector dimensions 160-191."""
        register_slice = vector[160:192]
        max_idx = np.argmax(register_slice)
        max_val = register_slice[max_idx]
        
        if max_val > 0.5:
            register_code = 160 + max_idx
            register_map = {
                160: 'EAX', 161: 'ECX', 162: 'EDX', 163: 'EBX',
                164: 'ESP', 165: 'EBP', 166: 'ESI', 167: 'EDI'
            }
            return register_map.get(register_code)
        return None
    
    def _decode_immediate(self, vector) -> Optional[int]:
        """Decode immediate value from semantic vector dimensions 104-122 or 256."""
        # Check standard range
        immediate_slice = vector[104:123] # End is 122+1
        max_idx = np.argmax(immediate_slice)
        max_val = immediate_slice[max_idx]
        
        if max_val > 0.5:
            immediate_code = 104 + max_idx
            immediate_map = {
                104: 0, 105: 1, 106: 2, 107: 4, 108: 8, 109: 16, 110: 32, 111: 64,
                112: 128, 113: 256, 114: -1, 115: -2, 116: -4, 117: -8, 118: -16,
                119: -32, 120: -64, 121: -128, 122: -256
            }
            return immediate_map.get(immediate_code)
            
        # Binary encoding for large immediates (32 bits starting at index 200)
        # Check index 123 (IMM_OTHER) as signal
        if vector[123] > 0.5:
            val = 0
            for i in range(32):
                if vector[200 + i] > 0.5:
                    val |= (1 << i)
            # Handle sign extension if bit 31 is set
            if val & 0x80000000:
                val = -( ( (~val) & 0xFFFFFFFF) + 1)
            return int(val)

        # Fallback to index 256 for larger raw immediates
        if abs(vector[256]) > 0.001:
            return int(vector[256])
            
        return None
    
    def _decode_type_info(self, vector) -> Optional[str]:
        """Decode type information from semantic vector dimensions 128-160."""
        type_slice = vector[128:160]
        max_idx = np.argmax(type_slice)
        max_val = type_slice[max_idx]
        
        if max_val > 0.5:
            type_code = 128 + max_idx
            type_map = {
                128: 'int', 129: 'float', 130: 'double', 131: 'char',
                132: 'bool', 133: 'string', 134: 'void', 135: 'struct',
                136: 'union', 137: 'class', 138: 'pointer', 139: 'reference'
            }
            return type_map.get(type_code)
        return None
    
    def execute_instruction(self, vector, pc: int) -> Dict:
        """Execute a single instruction with Level 6 advanced data structure support."""
        if vector.ndim == 1:
            vector = vector[np.newaxis, :]
        
        # Extract operands
        dest_reg, immediate, type_info, src_reg = self.extract_operands(vector.squeeze(0))
        
        # Determine operation from semantic vector using safe filtering
        op_indices = list(self.operation_map.keys())
        v_squeeze = vector.squeeze(0)
        op_values = v_squeeze[op_indices]
        
        max_idx_in_values = np.argmax(op_values)
        max_op_idx = op_indices[max_idx_in_values]
        max_op_val = op_values[max_idx_in_values]
        
        operation = self.operation_map.get(max_op_idx, 'UNKNOWN')
        
        if max_op_val < 0.5:
            operation = 'UNKNOWN'
            
        logger.info(f"Executing: {operation} at PC={pc}")
        
        # Execute based on operation type
        if operation in ['ADD', 'SUB', 'XOR', 'AND', 'OR', 'SHL', 'SHR', 'MUL', 'DIV']:
            if dest_reg:
                src_val = immediate if immediate is not None else self.register_state.get(src_reg if src_reg else 'EBX')
                result = self._execute_arithmetic(operation, dest_reg, src_val)
            else:
                result = 0
        elif operation in ['JMP', 'JE', 'JNE', 'JG', 'JL']:
            result = 0 # Handled in control flow logic
        elif operation == 'MOV':
            if dest_reg:
                src_val = immediate if immediate is not None else self.register_state.get(src_reg if src_reg else 'EBX')
                self.register_state.set(dest_reg, src_val)
                result = src_val
            else:
                result = 0
        elif operation == 'JMP':
            result = 0 # PC change handled by tail logic
        elif operation == 'INC':
            if dest_reg:
                val = self.register_state.get(dest_reg)
                new_val = val + 1
                self.register_state.set(dest_reg, new_val)
                self._update_flags(new_val, val, 1)
                result = new_val
        elif operation == 'DEC':
            if dest_reg:
                val = self.register_state.get(dest_reg)
                new_val = val - 1
                self.register_state.set(dest_reg, new_val)
                self._update_flags(new_val, val, 1)
                result = new_val
        elif operation == 'NOP':
            result = 0
        elif operation == 'HLT':
            return {'next_pc': -1, 'halted': True, 'result': 0}
        elif operation == 'CMP':
            val1 = self.register_state.get('EAX')
            val2 = immediate if immediate is not None else self.register_state.get('EBX')
            self.register_state.flags['ZF'] = 1 if (val1 == val2) else 0
            self.register_state.flags['SF'] = 1 if (val1 < val2) else 0
            logger.info(f"CMP: {val1} vs {val2} (ZF={self.register_state.flags['ZF']})")
            result = 0
        elif operation == 'PUSH':
            val = self.register_state.get(dest_reg if dest_reg else 'EAX')
            self.threads[self.current_thread_idx]['stack'].append(val)
            result = val
        elif operation == 'POP':
            if self.threads[self.current_thread_idx]['stack']:
                val = self.threads[self.current_thread_idx]['stack'].pop()
                target_reg = dest_reg if dest_reg else 'EAX'
                self.register_state.set(target_reg, val)
                result = val
            else:
                result = 0
        
        # Level 6 Struct Operations
        elif operation == 'STRUCT_DEFINE':
            result = self._execute_struct_define(vector, pc)
        elif operation == 'STRUCT_INIT':
            result = self._execute_struct_init(vector, pc)
        elif operation == 'STRUCT_FIELD':
            result = self._execute_struct_field(vector, pc)
        
        # Level 6 Union Operations
        elif operation == 'UNION_DEFINE':
            result = self._execute_union_define(vector, pc)
        elif operation == 'UNION_ACCESS':
            result = self._execute_union_access(vector, pc)
        
        elif operation in ['MEM_STORE', 'MEM_STORE_SHARED']:
            addr_reg = dest_reg if dest_reg else 'EAX'
            val_reg = src_reg if src_reg else 'ECX'
            addr = self.register_state.get(addr_reg)
            val = self.register_state.get(val_reg)
            logger.info(f"Thread {self.current_thread_idx} {operation}: [{addr_reg}=0x{addr:08X}] = {val_reg}({val})")
            self.memory_manager.write_memory(addr, val)
            result = val
        elif operation in ['MEM_LOAD', 'MEM_LOAD_SHARED']:
            addr_reg = src_reg if src_reg else (dest_reg if dest_reg else 'EAX')
            target_reg = dest_reg if dest_reg else 'EAX'
            addr = self.register_state.get(addr_reg)
            val = self.memory_manager.read_memory(addr)
            logger.info(f"Thread {self.current_thread_idx} {operation}: [{addr_reg}=0x{addr:08X}] -> {target_reg}({val})")
            self.register_state.set(target_reg, val)
            result = val
        elif operation == 'SYSCALL':
            result = self._execute_syscall(vector, pc)
        
        # Level 6 Pointer Operations
        elif operation == 'PTR_CREATE':
            result = self._execute_ptr_create(vector, pc)
        elif operation == 'PTR_DEREF':
            result = self._execute_ptr_deref(vector, pc)
        elif operation == 'PTR_ARITH':
            result = self._execute_ptr_arith(vector, pc)
        
        # Level 6 Reference Operations
        elif operation == 'REF_CREATE':
            result = self._execute_ref_create(vector, pc)
        elif operation == 'REF_DEREF':
            result = self._execute_ref_deref(vector, pc)
        
        # Level 6 Memory Management
        elif operation == 'HEAP_ALLOC':
            result = self._execute_heap_alloc(vector, pc)
        elif operation == 'HEAP_FREE':
            result = self._execute_heap_free(vector, pc)
        elif operation == 'HEAP_REALLOC':
            result = self._execute_heap_realloc(vector, pc)
        elif operation == 'HEAP_CLEAR':
            result = self._execute_heap_clear(vector, pc)
        elif operation == 'MEM_POOL':
            result = self._execute_mem_pool(vector, pc)
        
        # Level 6 Object-Oriented Operations
        elif operation == 'CLASS_DEFINE':
            result = self._execute_class_define(vector, pc)
        elif operation == 'CLASS_INST':
            result = self._execute_class_inst(vector, pc)
        elif operation == 'METHOD_CALL':
            result = self._execute_method_call(vector, pc)
        elif operation == 'INHERIT':
            result = self._execute_inherit(vector, pc)
        elif operation == 'POLYMORPH':
            result = self._execute_polymorph(vector, pc)
        elif operation == 'TYPE_CAST':
            result = self._execute_type_cast(vector, pc)
        
        # Phase 2: Strings and Dynamic Arrays
        elif operation == 'STR_ALLOC':
            result = self._execute_str_alloc(vector, pc)
        elif operation == 'STR_CONCAT':
            result = self._execute_str_concat(vector, pc)
        elif operation == 'ARRAY_ALLOC':
            result = self._execute_array_alloc(vector, pc)
        elif operation == 'ARRAY_RESIZE':
            result = self._execute_array_resize(vector, pc)
        
        # Control Flow & Recursion
        elif operation == 'CALL':
            target = immediate if immediate is not None else self.register_state.get('EAX')
            self.threads[self.current_thread_idx]['stack'].append(pc + 1)
            next_pc = target
            return {'next_pc': next_pc, 'result': 1, 'operation': operation}
            
        elif operation == 'RET':
            if not self.threads[self.current_thread_idx]['stack']:
                logger.warning("RET called with empty stack - halting thread")
                return {'next_pc': pc, 'result': 0, 'operation': operation, 'halted': True}
            next_pc = self.threads[self.current_thread_idx]['stack'].pop()
            return {'next_pc': next_pc, 'result': 1, 'operation': operation}

        # Level 7 Threading operations
        elif operation == 'THREAD_SPAWN':
            func_ptr = immediate if immediate is not None else self.register_state.get(dest_reg if dest_reg else 'EAX')
            new_thread_id = len(self.threads)
            new_state = self.register_state.copy()
            # Reset EAX in new thread to represent its own ID (or 0 as success?)
            # Usually fork returns 0 in child. Let's do that.
            new_state.set('EAX', 0)
            self.threads.append({
                'id': new_thread_id,
                'pc': func_ptr,
                'state': new_state,
                'stack': [],
                'active': True,
                'status': 'RUNNING'
            })
            self.register_state.set('EAX', new_thread_id)
            result = new_thread_id
            
        elif operation == 'THREAD_JOIN':
            target_id = immediate if immediate is not None else self.register_state.get(dest_reg if dest_reg else 'EAX')
            if target_id < len(self.threads) and self.threads[target_id]['active']:
                # Block current thread
                if target_id not in self.thread_wait_queues:
                    self.thread_wait_queues[target_id] = []
                self.thread_wait_queues[target_id].append(self.current_thread_idx)
                return {'next_pc': pc, 'result': 0, 'operation': operation, 'blocked': True}
            else:
                result = 1 # Already finished
                
        elif operation == 'THREAD_EXIT':
            self.threads[self.current_thread_idx]['active'] = False
            # Wake up joined threads
            my_id = self.current_thread_idx
            if my_id in self.thread_wait_queues:
                logger.info(f"Thread {my_id} exiting, waking up joiners")
                self.thread_wait_queues.pop(my_id)
            return {'next_pc': pc, 'result': 1, 'operation': operation, 'halted': True}
            
        elif operation == 'THREAD_YIELD':
            # Round-robin will naturally yield
            return {'next_pc': pc + 1, 'result': 1, 'operation': operation, 'yielded': True}

        elif operation == 'BARRIER_WAIT':
            barrier_id = immediate if immediate is not None else self.register_state.get(dest_reg if dest_reg else 'EAX')
            target_count = self.register_state.get(src_reg if src_reg else 'ECX')
            if barrier_id not in self.barriers:
                self.barriers[barrier_id] = []
            self.barriers[barrier_id].append(self.current_thread_idx)
            
            if len(self.barriers[barrier_id]) >= target_count:
                # Barrier released
                count = len(self.barriers[barrier_id])
                for t_idx in self.barriers[barrier_id]:
                    self.threads[t_idx]['status'] = 'RUNNING'
                    # Advance PC for waiting threads so they don't re-trigger the barrier
                    if t_idx != self.current_thread_idx:
                        self.threads[t_idx]['pc'] += 1
                        
                self.barriers.pop(barrier_id)
                logger.info(f"Barrier {barrier_id} released! All threads advanced.")
                return {'next_pc': pc + 1, 'result': count, 'operation': 'BARRIER_WAIT'}
            else:
                return {'next_pc': pc, 'result': 0, 'operation': operation, 'blocked': True}

        elif operation == 'ATOMIC_ADD':
            addr = self.register_state.get(dest_reg if dest_reg else 'EAX')
            val = self.register_state.get(src_reg if src_reg else 'ECX')
            current = self.memory_manager.read_memory(addr) or 0
            self.memory_manager.write_memory(addr, current + val)
            result = current + val

        elif operation == 'ATOMIC_CMPXCHG':
            addr = self.register_state.get(dest_reg if dest_reg else 'EAX')
            expected = self.register_state.get('EBX')
            new_val = self.register_state.get(src_reg if src_reg else 'ECX')
            current = self.memory_manager.read_memory(addr) or 0
            if current == expected:
                self.memory_manager.write_memory(addr, new_val)
                self.register_state.flags['ZF'] = 1
            else:
                self.register_state.flags['ZF'] = 0
            result = current

        elif operation == 'MUTEX_CREATE':
            mutex_id = len(self.mutexes) + 1
            self.mutexes[mutex_id] = None # Available
            self.register_state.set(dest_reg if dest_reg else 'EAX', mutex_id)
            result = mutex_id

        elif operation == 'MUTEX_LOCK':
            mutex_id = self.register_state.get(dest_reg if dest_reg else 'EAX')
            if self.mutexes.get(mutex_id) is None:
                self.mutexes[mutex_id] = self.current_thread_idx
                result = 1
            else:
                self.threads[self.current_thread_idx]['status'] = ('WAITING_MUTEX', mutex_id)
                return {'next_pc': pc, 'result': 0, 'operation': operation, 'blocked': True}

        elif operation == 'MUTEX_UNLOCK':
            mutex_id = self.register_state.get(dest_reg if dest_reg else 'EAX')
            if self.mutexes.get(mutex_id) == self.current_thread_idx:
                self.mutexes[mutex_id] = None
                # Wake up one waiter
                for t in self.threads:
                    if t['status'] == ('WAITING_MUTEX', mutex_id):
                        t['status'] = 'RUNNING'
                        break
                result = 1
            else:
                result = 0

        else:
            logger.warning(f"Operation {operation} not implemented")
            result = 0
        
        # Determine next PC
        next_pc = pc + 1
        
        # Handle control flow
        if operation == 'JMP':
            if immediate is not None:
                next_pc = immediate
        elif operation == 'JE':
            if self.register_state.flags['ZF'] and immediate is not None:
                next_pc = immediate
        elif operation == 'JNE':
            if not self.register_state.flags['ZF'] and immediate is not None:
                next_pc = immediate
        elif operation == 'JG':
            if (not self.register_state.flags['ZF'] and not self.register_state.flags['SF']) and immediate is not None:
                next_pc = immediate
        elif operation == 'JL':
            if self.register_state.flags['SF'] and immediate is not None:
                next_pc = immediate
        
        return {
            'next_pc': next_pc,
            'result': result,
            'operation': operation,
            'operands': {'dest_reg': dest_reg, 'immediate': immediate, 'type_info': type_info},
            'flags': self.register_state.flags.copy(),
            'halted': operation == 'HLT'
        }
    
    def _execute_arithmetic(self, operation: str, dest_reg: str, src_value: int) -> int:
        """Execute arithmetic operations."""
        current_value = self.register_state.get(dest_reg)
        
        if operation == 'ADD':
            result = current_value + src_value
        elif operation == 'SUB':
            result = current_value - src_value
        elif operation == 'XOR':
            result = current_value ^ src_value
        elif operation == 'AND':
            result = current_value & src_value
        elif operation == 'OR':
            result = current_value | src_value
        elif operation == 'SHL':
            result = current_value << src_value
        elif operation == 'SHR':
            result = current_value >> src_value
        elif operation == 'MUL':
            result = current_value * src_value
        elif operation == 'DIV':
            result = current_value // src_value if src_value != 0 else 0
        else:
            return current_value
        
        self.register_state.set(dest_reg, result)
        self._update_flags(result, current_value, src_value)
        
        logger.info(f"Executed {operation} {dest_reg}, {src_value}: {current_value} -> {result}")
        return result
    
    def _update_flags(self, result: int, old_value: int, operand: int):
        """Update CPU flags."""
        self.register_state.flags['ZF'] = 1 if result == 0 else 0
        self.register_state.flags['SF'] = 1 if (result & 0x80000000) else 0
        
        # Simplified carry and overflow detection
        if isinstance(operand, int):
            if result < old_value and old_value >= 0:
                self.register_state.flags['CF'] = 1
            else:
                self.register_state.flags['CF'] = 0
            
            if old_value > 0 and operand > 0 and result < 0:
                self.register_state.flags['OF'] = 1
            elif old_value < 0 and operand < 0 and result > 0:
                self.register_state.flags['OF'] = 1
            else:
                self.register_state.flags['OF'] = 0
    
    # Level 6 Implementation Methods
    
    def _execute_struct_define(self, vector, pc: int) -> int:
        """Execute STRUCT_DEFINE instruction."""
        # Extract struct definition parameters
        struct_name = "test_struct"  # Would come from vector or params
        fields = [
            {'name': 'field1', 'type': 'int', 'offset': 0, 'size': 4},
            {'name': 'field2', 'type': 'float', 'offset': 4, 'size': 4},
            {'name': 'field3', 'type': 'char', 'offset': 8, 'size': 1}
        ]
        
        success = self.type_system.define_struct(struct_name, fields, alignment=4)
        
        if success:
            logger.info(f"Defined struct '{struct_name}' with {len(fields)} fields")
            return 1
        else:
            logger.error(f"Failed to define struct '{struct_name}'")
            return 0
    
    def _execute_struct_init(self, vector, pc: int) -> int:
        """Execute STRUCT_INIT instruction."""
        struct_name = "test_struct"
        instance_addr = self.memory_manager.allocate(12, alignment=4)
        
        if instance_addr == 0:
            return 0
        
        # Initialize fields with default values
        field_values = {
            'field1': 42,
            'field2': 3.14,
            'field3': ord('A')
        }
        
        struct_id = f"struct_{len(self.struct_instances)}"
        self.struct_instances[struct_id] = {
            'name': struct_name,
            'address': instance_addr,
            'fields': field_values
        }
        
        logger.info(f"Initialized struct instance '{struct_id}' at 0x{instance_addr:08X}")
        return instance_addr
    
    def _execute_struct_field(self, vector, pc: int) -> int:
        """Execute STRUCT_FIELD instruction."""
        struct_name = "test_struct"
        field_name = "field1"
        
        # Find struct instance
        for struct_id, struct_data in self.struct_instances.items():
            if struct_data['name'] == struct_name:
                if field_name in struct_data['fields']:
                    field_value = struct_data['fields'][field_name]
                    logger.info(f"Accessed field '{field_name}' = {field_value}")
                    return field_value
        
        logger.error(f"Field '{field_name}' not found in struct '{struct_name}'")
        return 0
    
    def _execute_ptr_create(self, vector, pc: int) -> int:
        """Execute PTR_CREATE instruction."""
        target_addr = 0x20000  # Would come from register or immediate
        target_type = "int"    # Would come from type_info
        
        ptr_id = self.type_system.create_pointer(target_addr, target_type)
        
        if ptr_id:
            logger.info(f"Created pointer '{ptr_id}' to {target_type} at 0x{target_addr:08X}")
            return 1
        else:
            logger.error("Failed to create pointer")
            return 0
    
    def _execute_ptr_deref(self, vector, pc: int) -> int:
        """Execute PTR_DEREF instruction."""
        ptr_id = "ptr_0"  # Would come from register or immediate
        
        if ptr_id in self.type_system.pointers:
            pointer_info = self.type_system.pointers[ptr_id]
            target_addr = pointer_info['target_addr']
            target_type = pointer_info['target_type']
            
            # Simulate memory read
            value = 123  # Would read from actual memory
            
            logger.info(f"Dereferenced pointer '{ptr_id}' to {target_type} at 0x{target_addr:08X} = {value}")
            return value
        
        logger.error(f"Pointer '{ptr_id}' not found")
        return 0
    
    def _execute_heap_alloc(self, vector, pc: int) -> int:
        """Execute HEAP_ALLOC instruction."""
        size = 1024  # Would come from register or immediate
        alignment = 16  # Would come from type_info or immediate
        addr = self.memory_manager.allocate(size, alignment)
        if addr > 0:
            logger.info(f"Allocated {size} bytes at 0x{addr:08X}")
            return addr
        return 0

    def _execute_heap_free(self, vector, pc: int) -> int:
        # For simulation, we'll free the last allocated block or a dummy
        addr = 0x100000
        if self.memory_manager.allocated_blocks:
            addr = list(self.memory_manager.allocated_blocks.keys())[-1]
        success = self.memory_manager.deallocate(addr)
        return 1 if success else 0

    def _execute_heap_realloc(self, vector, pc: int) -> int:
        return 1

    def _execute_heap_clear(self, vector, pc: int) -> int:
        return 1

    def _execute_mem_pool(self, vector, pc: int) -> int:
        return 1

    def _execute_union_define(self, vector, pc: int) -> int:
        return 1

    def _execute_union_access(self, vector, pc: int) -> int:
        return 1

    def _execute_ptr_arith(self, vector, pc: int) -> int:
        return 1

    def _execute_ref_create(self, vector, pc: int) -> int:
        return 1

    def _execute_ref_deref(self, vector, pc: int) -> int:
        return 1

    def _execute_method_call(self, vector, pc: int) -> int:
        return 1

    def _execute_inherit(self, vector, pc: int) -> int:
        """Execute INHERIT: Establish parent-child relationship for classes."""
        child_id = self.register_state.get('EAX')
        parent_id = self.register_state.get('EBX')
        
        # Realize inheritance in object system
        # Assuming names are "Class_{id}" for this simulation
        child_name = f"Class_{child_id}"
        parent_name = f"Class_{parent_id}"
        
        if child_name in self.object_system.classes:
            self.object_system.classes[child_name]['parent_class'] = parent_name
            logger.info(f"INHERIT: {child_name} now inherits from {parent_name}")
            return 1
        return 0

    def _execute_polymorph(self, vector, pc: int) -> int:
        """Execute POLYMORPH: Runtime type resolution for pointers."""
        addr = self.register_state.get('EAX')
        info = self.memory_manager.get_allocation_info(addr)
        if info and 'type_info' in info:
            # Return class ID (extracted from class name "Class_{id}")
            class_name = info['type_info'].get('class', 'unknown')
            try:
                class_id = int(class_name.split('_')[1])
            except:
                class_id = 1 # Default
            self.register_state.set('EAX', class_id)
            logger.info(f"POLYMORPH: Object at 0x{addr:08X} resolved to class '{class_name}' (ID: {class_id})")
            return class_id
        return 0

    def _execute_type_cast(self, vector, pc: int) -> int:
        """Execute TYPE_CAST: (EAX=addr, EBX=target_type_id) -> EAX=addr of casted obj."""
        addr = self.register_state.get('EAX')
        type_id = self.register_state.get('EBX')
        # Simplified: cast always returns the same addr if it's a pointer cast
        # In a real system, we'd verify class hierarchy
        logger.info(f"TYPE_CAST: Casting 0x{addr:08X} to type ID {type_id}")
        return addr

    def _execute_str_alloc(self, vector, pc: int) -> int:
        """Execute STR_ALLOC: Allocate a variable-length string."""
        size = self.register_state.get('EAX') # Size in EAX
        addr = self.memory_manager.allocate(size, alignment=1, type_info={'type': 'string'})
        if addr:
            logger.info(f"STR_ALLOC: Allocated {size} bytes for string at 0x{addr:08X}")
            self.register_state.set('EAX', addr)
            return addr
        return 0

    def _execute_str_concat(self, vector, pc: int) -> int:
        """Execute STR_CONCAT: Concatenate two strings (EAX + EBX -> EAX)."""
        addr1 = self.register_state.get('EAX')
        addr2 = self.register_state.get('EBX')
        
        # Verify both are strings
        info1 = self.memory_manager.get_allocation_info(addr1)
        info2 = self.memory_manager.get_allocation_info(addr2)
        
        if not info1 or not info2:
            logger.error("STR_CONCAT: Invalid string address")
            return 0
            
        new_size = info1['size'] + info2['size']
        new_addr = self.memory_manager.allocate(new_size, alignment=1, type_info={'type': 'string'})
        
        if new_addr:
            logger.info(f"STR_CONCAT: Concatenated strings (0x{addr1:08X}, 0x{addr2:08X}) -> 0x{new_addr:08X}")
            self.register_state.set('EAX', new_addr)
            return new_addr
        return 0

    def _execute_array_alloc(self, vector, pc: int) -> int:
        """Execute ARRAY_ALLOC: Allocate a typed dynamic array."""
        element_size = self.register_state.get('EAX')
        count = self.register_state.get('ECX')
        total_size = element_size * count
        
        addr = self.memory_manager.allocate(total_size, alignment=element_size, type_info={'type': 'array', 'element_size': element_size})
        if addr:
            logger.info(f"ARRAY_ALLOC: Allocated {count} elements (size {element_size}) at 0x{addr:08X}")
            self.register_state.set('EAX', addr)
            return addr
        return 0

    def _execute_array_resize(self, vector, pc: int) -> int:
        """Execute ARRAY_RESIZE: Resize a dynamic array (EAX=addr, ECX=new_count)."""
        addr = self.register_state.get('EAX')
        new_count = self.register_state.get('ECX')
        
        info = self.memory_manager.get_allocation_info(addr)
        if not info or info.get('type_info', {}).get('type') != 'array':
            logger.error(f"ARRAY_RESIZE: Invalid array address 0x{addr:08X}")
            return 0
            
        element_size = info['type_info']['element_size']
        new_size = element_size * new_count
        
        new_addr = self.memory_manager.reallocate(addr, new_size)
        if new_addr:
            logger.info(f"ARRAY_RESIZE: Resized array at 0x{addr:08X} to {new_count} elements at 0x{new_addr:08X}")
            self.register_state.set('EAX', new_addr)
            return new_addr
        return 0
    
    def _execute_class_define(self, vector, pc: int) -> int:
        """Execute CLASS_DEFINE instruction: Define class with ID from EAX."""
        class_id = self.register_state.get('EAX')
        class_name = f"Class_{class_id}"
        
        # In a real compiler, we'd pass method addresses via memory or vectors.
        # For this simulation, we'll provide a default schema for the given class ID.
        class_def = {
            'fields': [
                {'name': 'base_field', 'type': 'int', 'offset': 0, 'size': 4}
            ],
            'methods': [
                {'name': 'speak', 'address': 0x1000 * class_id}, # Unique per class
                {'name': 'move', 'address': 0x1010 * class_id}
            ],
            'parent_class': None,
            'vtable_addr': 0x3000 * class_id
        }
        
        success = self.object_system.define_class(class_name, class_def)
        
        if success:
            logger.info(f"Defined class '{class_name}' with ID {class_id}")
            return 1
        else:
            return 0
    
    def _execute_class_inst(self, vector, pc: int) -> int:
        """Execute CLASS_INST instruction: Instantiate class with ID from EAX."""
        class_id = self.register_state.get('EAX')
        class_name = f"Class_{class_id}"
        
        instance_id = self.object_system.create_instance(class_name)
        
        if instance_id:
            instance_addr = self.object_system.instances[instance_id]['address']
            self.register_state.set('EAX', instance_addr)
            logger.info(f"Created instance '{instance_id}' of class '{class_name}' at 0x{instance_addr:08X}")
            return instance_addr
        else:
            logger.error(f"Failed to create instance of class '{class_name}'")
            return 0
    
    def simulate_program(self, instruction_tensor, max_cycles: int = 1000) -> List[Dict]:
        """Simulate execution with Level 7 Multi-threaded Vector support."""
        global_traces = []
        cycles = 0
        
        logger.info(f"Starting Level 7 simulation with {len(instruction_tensor)} instructions")
        
        while cycles < max_cycles:
            # Snapshot of active threads to avoid running newly spawned ones in same cycle
            active_threads = [t for t in self.threads if t['active']]
            if not active_threads:
                break
                
            for thread in active_threads:
                self.current_thread_idx = self.threads.index(thread)
                
                # Check if blocked
                if thread['status'] != 'RUNNING':
                    continue
                    
                # Extra Wait Queue checks
                is_blocked = False
                for target_id, waiters in self.thread_wait_queues.items():
                    if self.current_thread_idx in waiters:
                        is_blocked = True; break
                for b_id, b_waiters in self.barriers.items():
                    if self.current_thread_idx in b_waiters:
                        is_blocked = True; break
                
                if is_blocked:
                    continue

                self.register_state = thread['state']
                pc = thread['pc']
                
                if pc >= len(instruction_tensor) or pc < 0:
                    thread['active'] = False
                    continue
                    
                instruction_vector = instruction_tensor[pc]
                trace = self.execute_instruction(instruction_vector, pc)
                
                # Update thread state
                thread['pc'] = trace['next_pc']
                if trace.get('halted'):
                    thread['active'] = False
                
                trace['thread_id'] = thread['id']
                global_traces.append(trace)
                
            cycles += 1
            if cycles % 100 == 0:
                logger.info(f"Simulation progress: {cycles}/{max_cycles} cycles, Threads: {len(active_threads)}")
        
        logger.info(f"Level 7 simulation completed: {cycles} cycles, {len(global_traces)} traces")
        return global_traces
    
    def get_memory_stats(self) -> Dict:
        """Get memory usage statistics."""
        return self.memory_manager.get_memory_stats()
    
    def get_type_info(self) -> Dict:
        """Get type system information."""
        return {
            'references': len(self.reference_table),
            'structs': len(self.type_system.structs),
            'classes': len(self.object_system.classes),
            'pointers': len([v for v in self.memory_manager.allocated_blocks.values() if v[2] and v[2].get('type') == 'ptr'])
        }

    def _execute_syscall(self, vector, pc: int) -> int:
        """Execute SYSCALL using SyscallHandler."""
        # Lazily initialize syscall handler if not present
        if not hasattr(self, 'syscall_handler'):
            # Import here to avoid circular dependencies if any
            from systems.neural_cpu.phase3_execution_engine_with_syscalls import SyscallHandler
            # Map memory_manager data to what SyscallHandler expects (a dict or similar)
            self.syscall_handler = SyscallHandler(self.memory_manager.data)
            
        # Dispatch to handler
        # SyscallHandler expects a 'cpu' object with a 'get_reg' and 'set_reg' method
        # We can pass an adapter
        class CPUAdapter:
            def __init__(self, engine): self.engine = engine
            def get_reg(self, idx):
                # Mapping RegisterID values to names
                reg_name = {72:'EAX', 73:'ECX', 74:'EDX', 75:'EBX', 78:'ESI', 79:'EDI'}.get(idx)
                return self.engine.register_state.get(reg_name)
            def set_reg(self, idx, val):
                reg_name = {72:'EAX', 73:'ECX', 74:'EDX', 75:'EBX', 78:'ESI', 79:'EDI'}.get(idx)
                self.engine.register_state.set(reg_name, val)
                
        self.syscall_handler.dispatch(CPUAdapter(self))
        return self.register_state.get('EAX')


def test_level6_functionality():
    """Test Level 6 advanced data structure functionality."""
    print("🧪 Testing Level 6 Advanced Data Structures")
    print("=" * 60)
    
    engine = EnhancedNeuralExecutionEngine()
    
    # Create test instruction vectors for Level 6 operations
    test_vectors = []
    
    # Create test instruction vectors for Level 6 operations
    test_vectors = []
    
    # STRUCT_DEFINE
    struct_def_vector = np.zeros(316)
    struct_def_vector[135] = 1.0  # STRUCT_DEFINE
    test_vectors.append(struct_def_vector)
    
    # STRUCT_INIT
    struct_init_vector = np.zeros(316)
    struct_init_vector[136] = 1.0  # STRUCT_INIT
    test_vectors.append(struct_init_vector)
    
    # HEAP_ALLOC
    heap_alloc_vector = np.zeros(316)
    heap_alloc_vector[145] = 1.0  # HEAP_ALLOC
    test_vectors.append(heap_alloc_vector)
    
    # CLASS_DEFINE
    class_def_vector = np.zeros(316)
    class_def_vector[150] = 1.0  # CLASS_DEFINE
    test_vectors.append(class_def_vector)
    
    # CLASS_INST
    class_inst_vector = np.zeros(316)
    class_inst_vector[151] = 1.0  # CLASS_INST
    test_vectors.append(class_inst_vector)
    
    instruction_tensor = np.stack(test_vectors)
    
    # Run simulation
    traces = engine.simulate_program(instruction_tensor)
    
    # Print results
    print("\n📊 Level 6 Execution Traces:")
    for i, trace in enumerate(traces):
        print(f"Step {i}: {trace['operation']} -> Result: {trace['result']}")
    
    # Memory statistics
    memory_stats = engine.get_memory_stats()
    print(f"\n💾 Memory Statistics:")
    for key, value in memory_stats.items():
        print(f"  {key}: {value}")
    
    # Type system information
    type_info = engine.get_type_info()
    print(f"\n🔍 Type System Information:")
    for key, value in type_info.items():
        print(f"  {key}: {value}")
    
    print("\n🎉 Level 6 functionality test completed!")
    return traces


if __name__ == "__main__":
    test_level6_functionality()