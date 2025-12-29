#!/usr/bin/env python3
"""
LLVM IR to RTS Converter
========================

Converts LLVM Intermediate Representation (IR) to Neural CPU RTS format.

This provides a cleaner, platform-independent alternative to the x86 builder,
preserving semantic information and eliminating architecture-specific quirks.

LLVM IR Example:
    define void @_start() {
      call void asm "mov $60, %rax\0Amov $42, %rdi\0Asyscall"
      ret void
    }

Installation:
    sudo apt-get install clang llvm

Usage:
    clang -S -emit-llvm -O0 program.c -o program.ll
    python3 llvm_to_rts.py program.ll -o program.rts
"""

import sys
import os
import re
import struct
import numpy as np
from typing import List, Dict, Tuple, Optional

# Add project root
sys.path.append(os.getcwd())

try:
    from systems.neural_cpu.tensors.rts.format import RTSFormat, RTSHeader
except ImportError:
    # Fallback: create minimal header classes
    class RTSHeader:
        def __init__(self):
            self.instruction_count = 0
            self.vector_size = 400

    class RTSFormat:
        def __init__(self):
            self.header = RTSHeader()

# Semantic Primitive Mapping (from builder.c)
class Primitive:
    MOV = 0
    PUSH = 4
    POP = 5
    
    # Arithmetic
    ADD = 32
    SUB = 33
    INC = 34
    DEC = 35
    XOR = 36
    AND = 37
    OR = 38
    
    # Logic / Comparison
    CMP = 39
    TEST = 40
    SHL = 41
    SHR = 42
    NOT = 43
    NEG = 44
    MUL = 45
    DIV = 47
    
    # Control Flow
    JMP = 64
    JE = 66
    JNE = 67
    JG = 68
    JL = 69
    CALL = 70
    RET = 71
    
    # Int / Sys
    NOP = 96
    INT = 97
    HLT = 98
    SYSCALL = 150
    
    # Level 5/6: Functions & Memory
    FN_DEFINE = 128
    FN_CALL = 129
    FN_RET = 130
    MEM_ALLOC = 131
    MEM_INDEX = 132
    MEM_STORE = 133
    MEM_LOAD = 134
    
    # Level 6: Advanced Data Structures (350-374)
    STRUCT_DEFINE = 350
    STRUCT_INIT = 351
    STRUCT_FIELD = 352
    UNION_DEFINE = 353
    UNION_ACCESS = 354
    PTR_CREATE = 355
    PTR_DEREF = 356
    PTR_ARITH = 357
    REF_CREATE = 358
    REF_DEREF = 359
    HEAP_ALLOC = 360
    HEAP_FREE = 361
    HEAP_REALLOC = 362
    HEAP_CLEAR = 363
    MEM_POOL = 364
    CLASS_DEFINE = 365
    CLASS_INST = 366
    METHOD_CALL = 367
    INHERIT = 368
    POLYMORPH = 369
    TYPE_CAST = 370
    STR_ALLOC = 371
    STR_CONCAT = 372
    ARRAY_ALLOC = 373
    ARRAY_RESIZE = 374
    
    # Level 7: Multi-threaded Vector Execution (400-411)
    THREAD_SPAWN = 400
    THREAD_JOIN = 401
    THREAD_EXIT = 402
    THREAD_YIELD = 403
    MUTEX_CREATE = 404
    MUTEX_LOCK = 405
    MUTEX_UNLOCK = 406
    BARRIER_WAIT = 407
    ATOMIC_ADD = 408
    ATOMIC_CMPXCHG = 409
    MEM_LOAD_SHARED = 410
    MEM_STORE_SHARED = 411

# Register mapping (simplified for demo)
REGISTER_MAP = {
    'rax': 72, 'eax': 72,
    'rdi': 79, 'edi': 79,
    'rsi': 78, 'esi': 78,
    'rdx': 74, 'edx': 74,
    'rcx': 73, 'ecx': 73,
    'rbx': 75, 'ebx': 75,
    'rsp': 76, 'esp': 76,
    'rbp': 77, 'ebp': 77,
}

import sys
import os
import re
import struct
import numpy as np
from typing import List, Dict, Tuple, Optional

from systems.neural_cpu.tensors.rts.format import RTSHeader, save_rts


class LLVMToRTSConverter:
    """
    Advanced LLVM IR -> RTS Converter.
    Implements a stack-based virtual machine backend for Neural CPU.
    """

    def __init__(self):
        self.vectors = []
        self.vector_size = 512  # Expanded for Level 7+ opcodes (400-511)

        # Symbol Tables
        self.globals = {}     # name -> data_offset
        self.labels = {}      # basic_block_name -> instruction_index
        self.label_refs = []  # (instruction_index, target_label)

        # Stack Machine state
        self.stack_frame = {} # variable_name -> stack_offset (byte relative to BP)
        self.stack_top = 0    # Current top of stack relative to BP
        self.data_section = b""
        self.abs_label_refs = [] # (instruction_index, target_label)

        # Track variables that contain pointer values (from inttoptr)
        self.pointer_values = set()  # variables that hold addresses

    def parse_file(self, ll_path: str) -> List[np.ndarray]:
        """Parse LLVM IR file and generate RTS vectors."""
        with open(ll_path, 'r') as f:
            lines = f.readlines()
            
        # Pass 1: Global Data & Function Scanning
        self._parse_globals(lines)
        
        # Pass 2: Code Generation
        self._parse_code(lines)
        
        # Pass 3: Link (Resolve Jump Targets)
        self._link_labels()
        
        return self.vectors

    def _parse_globals(self, lines: List[str]):
        """Extract global constants to data section."""
        print("🔍 Pass 1: Global Data Extraction")
        for line in lines:
            line = line.strip()
            # @msg = constant [6 x i8] c"Hello\0A"
            match = re.match(r'@(\w+)\s*=\s*.*c"([^"]+)"', line)
            if match:
                name, content = match.groups()
                # Unescape content (simple version)
                content_bytes = content.encode('utf-8').decode('unicode_escape').encode('latin1') + b'\0'
                
                offset = len(self.data_section)
                self.globals[name] = offset
                self.data_section += content_bytes
                
                print(f"   data: @{name} -> offset {offset} ({content})")
                
    def _parse_code(self, lines: List[str]):
        """Generate code vectors."""
        print("🔍 Pass 2: Code Generation")
        
        # Pass 2: Generation and Label Identification
        for line in lines:
            line = line.strip()
            if not line or line.startswith(';') or line.startswith('}'): continue
            
            if line.startswith('define'):
                func_name = line.split('@')[1].split('(')[0].strip()
                self.labels[func_name] = len(self.vectors)
                continue
                
            if line.endswith(':'):
                label_name = line[:-1].strip()
                self.labels[label_name] = len(self.vectors)
                print(f"   label: {label_name} -> {len(self.vectors)}")
                continue
                
            self._compile_instruction(line)

    def _get_var_loc(self, var_name: str) -> int:
        """Get or create stack location for variable."""
        var_name = var_name.strip('%')
        if var_name not in self.stack_frame:
            # Allocate new slot (4 bytes)
            self.stack_frame[var_name] = self.stack_top
            self.stack_top += 4
        return 0x20000 - self.stack_frame[var_name] # 32-bit stack base to match registers

    def _compile_instruction(self, line: str):
        """Compile single LLVM instruction to Neural Vectors."""
        
        # 1. Syscall Intrinsics (Canonical Schema)
        if 'call void @sys_write' in line:
            match = re.search(r'i32 (\d+), i8\* %(\w+), i32 (\d+)', line)
            if match:
                fd, buf, length = match.groups()
                self._emit_syscall_write(int(fd), buf, int(length))
                return
                
        if 'call' in line and '@neural_str_alloc' in line:
            # %dest = call i8* @neural_str_alloc(i32 %size)
            match = re.search(r'%(\w+)\s*=\s*call\s+i8\*\s+@neural_str_alloc\s*\(i32\s+(%?\w+)\)', line)
            if match:
                dest, size_var = match.groups()
                # 1. Load size to RAX
                if size_var.startswith('%'): self._emit_load_reg(size_var, 'rax')
                else: self._emit_mov_reg_imm('rax', int(size_var))
                # 2. Emit STR_ALLOC
                self.emit_vector(Primitive.STR_ALLOC, rax=1.0)
                # 3. Store result to dest
                self._emit_store_reg(dest, 'rax')
                return

        if 'call' in line and '@neural_str_concat' in line:
            # %dest = call i8* @neural_str_concat(i8* %s1, i8* %s2)
            match = re.search(r'%(\w+)\s*=\s*call\s+i8\*\s+@neural_str_concat\s*\(i8\*\s+(%?\w+),\s+i8\*\s+(%?\w+)\)', line)
            if match:
                dest, s1, s2 = match.groups()
                # 1. Load S1 to RAX
                if s1.startswith('%'): self._emit_load_reg(s1, 'rax')
                else: self._emit_mov_reg_imm('rax', int(s1))
                # 2. Load S2 to RBX
                if s2.startswith('%'): self._emit_load_reg(s2, 'rbx')
                else: self._emit_mov_reg_imm('rbx', int(s2))
                # 3. Emit STR_CONCAT
                self.emit_vector(Primitive.STR_CONCAT, rax=1.0, src='rbx') # Engine expects RAX=s1, RBX=s2
                # 4. Store result to dest
                self._emit_store_reg(dest, 'rax')
                return

        if 'call' in line and '@neural_class_define' in line:
            # call void @neural_class_define(i32 %class_id)
            match = re.search(r'call\s+void\s+@neural_class_define\s*\(i32\s+(%?\w+)\)', line)
            if match:
                class_id = match.group(1)
                if class_id.startswith('%'): self._emit_load_reg(class_id, 'rax')
                else: self._emit_mov_reg_imm('rax', int(class_id))
                self.emit_vector(Primitive.CLASS_DEFINE, rax=1.0)
                return

        if 'call' in line and '@neural_class_inst' in line:
            # %obj = call i8* @neural_class_inst(i32 %class_id)
            match = re.search(r'%(\w+)\s*=\s*call\s+i8\*\s+@neural_class_inst\s*\(i32\s+(%?\w+)\)', line)
            if match:
                dest, class_id = match.groups()
                if class_id.startswith('%'): self._emit_load_reg(class_id, 'rax')
                else: self._emit_mov_reg_imm('rax', int(class_id))
                self.emit_vector(Primitive.CLASS_INST, rax=1.0)
                self._emit_store_reg(dest, 'rax')
                return

        if 'call' in line and '@neural_method_call' in line:
            # %res = call i32 @neural_method_call(i8* %obj, i32 %method_id)
            match = re.search(r'%(\w+)\s*=\s*call\s+i32\s+@neural_method_call\s*\(i8\*\s+(%?\w+),\s+i32\s+(%?\w+)\)', line)
            if match:
                dest, obj, method_id = match.groups()
                if obj.startswith('%'): self._emit_load_reg(obj, 'rax')
                else: self._emit_mov_reg_imm('rax', int(obj))
                if method_id.startswith('%'): self._emit_load_reg(method_id, 'rbx')
                else: self._emit_mov_reg_imm('rbx', int(method_id))
                self.emit_vector(Primitive.METHOD_CALL, rax=1.0, src='rbx')
                self._emit_store_reg(dest, 'rax')
                return

        if 'call' in line and '@neural_thread_spawn' in line:
            # %tid = call i32 @neural_thread_spawn(i8* %func_ptr) or (i8* @func)
            match = re.search(r'%(\w+)\s*=\s*call\s+i32\s+@neural_thread_spawn\s*\(i8\*\s+([%@]\w+)\)', line)
            if match:
                dest, func = match.groups()
                if func.startswith('%'): self._emit_load_reg(func, 'rax')
                elif func.startswith('@'): 
                    # Global function pointer resolution (ABSOLUTE)
                    self.abs_label_refs.append((len(self.vectors), func.strip('@')))
                    self._emit_mov_reg_imm('rax', 0) # Fixed up in Pass 3
                else: self._emit_mov_reg_imm('rax', int(func))
                self.emit_vector(Primitive.THREAD_SPAWN, rax=1.0)
                self._emit_store_reg(dest, 'rax')
                return

        if 'call' in line and '@neural_thread_join' in line:
            # call void @neural_thread_join(i32 %tid)
            match = re.search(r'call\s+void\s+@neural_thread_join\s*\(i32\s+(%?\w+)\)', line)
            if match:
                tid = match.group(1)
                if tid.startswith('%'): self._emit_load_reg(tid, 'rax')
                else: self._emit_mov_reg_imm('rax', int(tid))
                self.emit_vector(Primitive.THREAD_JOIN, rax=1.0)
                return

        if 'call' in line and '@neural_mutex_create' in line:
            # %mid = call i32 @neural_mutex_create()
            match = re.search(r'%(\w+)\s*=\s*call\s+i32\s+@neural_mutex_create\s*\(\)', line)
            if match:
                dest = match.group(1)
                self.emit_vector(Primitive.MUTEX_CREATE, rax=1.0)
                self._emit_store_reg(dest, 'rax')
                return

        if 'call' in line and '@neural_mutex_lock' in line:
            # call void @neural_mutex_lock(i32 %mid)
            match = re.search(r'call\s+void\s+@neural_mutex_lock\s*\(i32\s+(%?\w+)\)', line)
            if match:
                mid = match.group(1)
                if mid.startswith('%'): self._emit_load_reg(mid, 'rax')
                else: self._emit_mov_reg_imm('rax', int(mid))
                self.emit_vector(Primitive.MUTEX_LOCK, rax=1.0)
                return

        if 'call' in line and '@neural_mutex_unlock' in line:
            # call void @neural_mutex_unlock(i32 %mid)
            match = re.search(r'call\s+void\s+@neural_mutex_unlock\s*\(i32\s+(%?\w+)\)', line)
            if match:
                mid = match.group(1)
                if mid.startswith('%'): self._emit_load_reg(mid, 'rax')
                else: self._emit_mov_reg_imm('rax', int(mid))
                self.emit_vector(Primitive.MUTEX_UNLOCK, rax=1.0)
                return

        # Phase 3 OOP Extensions
        if 'call' in line and '@neural_class_inherit' in line:
            # call void @neural_class_inherit(i32 %child_id, i32 %parent_id)
            match = re.search(r'call\s+void\s+@neural_class_inherit\s*\(i32\s+(%?\w+),\s+i32\s+(%?\w+)\)', line)
            if match:
                child, parent = match.groups()
                if child.startswith('%'): self._emit_load_reg(child, 'rax')
                else: self._emit_mov_reg_imm('rax', int(child))
                if parent.startswith('%'): self._emit_load_reg(parent, 'rbx')
                else: self._emit_mov_reg_imm('rbx', int(parent))
                self.emit_vector(Primitive.INHERIT, rax=1.0, src='rbx')
                return

        if 'call' in line and '@neural_polymorph' in line:
            # %class_id = call i32 @neural_polymorph(i8* %obj_ptr)
            match = re.search(r'%(\w+)\s*=\s*call\s+i32\s+@neural_polymorph\s*\(i8\*\s+(%?\w+)\)', line)
            if match:
                dest, obj = match.groups()
                if obj.startswith('%'): self._emit_load_reg(obj, 'rax')
                else: self._emit_mov_reg_imm('rax', int(obj))
                self.emit_vector(Primitive.POLYMORPH, rax=1.0)
                self._emit_store_reg(dest, 'rax')
                return

        if 'call' in line and '@neural_type_cast' in line:
            # %new_ptr = call i8* @neural_type_cast(i8* %obj_ptr, i32 %type_id)
            match = re.search(r'%(\w+)\s*=\s*call\s+i8\*\s+@neural_type_cast\s*\(i8\*\s+(%?\w+),\s+i32\s+(%?\w+)\)', line)
            if match:
                dest, obj, type_id = match.groups()
                if obj.startswith('%'): self._emit_load_reg(obj, 'rax')
                else: self._emit_mov_reg_imm('rax', int(obj))
                if type_id.startswith('%'): self._emit_load_reg(type_id, 'rbx')
                else: self._emit_mov_reg_imm('rbx', int(type_id))
                self.emit_vector(Primitive.TYPE_CAST, rax=1.0, src='rbx')
                self._emit_store_reg(dest, 'rax')
                return

        # Level 7 Advanced Threading Extensions
        if 'call' in line and '@neural_thread_exit' in line:
            # call void @neural_thread_exit(i32 %code)
            match = re.search(r'call\s+void\s+@neural_thread_exit\s*\(i32\s+(%?\w+)\)', line)
            if match:
                code = match.group(1)
                if code.startswith('%'): self._emit_load_reg(code, 'rax')
                else: self._emit_mov_reg_imm('rax', int(code))
                self.emit_vector(Primitive.THREAD_EXIT, rax=1.0)
                return

        if 'call' in line and '@neural_thread_yield' in line:
            # call void @neural_thread_yield()
            if 'void @neural_thread_yield()' in line:
                self.emit_vector(Primitive.THREAD_YIELD)
                return

        if 'call' in line and '@neural_barrier_wait' in line:
            # call void @neural_barrier_wait(i32 %barrier_id, i32 %count)
            match = re.search(r'call\s+void\s+@neural_barrier_wait\s*\(i32\s+(%?\w+),\s+i32\s+(%?\w+)\)', line)
            if match:
                bid, count = match.groups()
                if bid.startswith('%'): self._emit_load_reg(bid, 'rax')
                else: self._emit_mov_reg_imm('rax', int(bid))
                if count.startswith('%'): self._emit_load_reg(count, 'rbx')
                else: self._emit_mov_reg_imm('rbx', int(count))
                self.emit_vector(Primitive.BARRIER_WAIT, rax=1.0, src='rbx') # Engine uses EAX=bid, EBX=count
                return

        if 'call' in line and '@neural_atomic_add' in line:
            # %old = call i32 @neural_atomic_add(i32* %ptr, i32 %val)
            match = re.search(r'%(\w+)\s*=\s*call\s+i32\s+@neural_atomic_add\s*\(i32\*\s+(%?\w+),\s+i32\s+(%?\w+)\)', line)
            if match:
                dest, ptr, val = match.groups()
                if ptr.startswith('%'): self._emit_load_reg(ptr, 'rax')
                else: self._emit_mov_reg_imm('rax', int(ptr))
                if val.startswith('%'): self._emit_load_reg(val, 'rbx')
                else: self._emit_mov_reg_imm('rbx', int(val))
                self.emit_vector(Primitive.ATOMIC_ADD, rax=1.0, src='rbx')
                self._emit_store_reg(dest, 'rax')
                return

        if 'call' in line and '@neural_atomic_cmpxchg' in line:
            # %old = call i32 @neural_atomic_cmpxchg(i32* %ptr, i32 %expected, i32 %new)
            match = re.search(r'%(\w+)\s*=\s*call\s+i32\s+@neural_atomic_cmpxchg\s*\(i32\*\s+(%?\w+),\s+i32\s+(%?\w+),\s+i32\s+(%?\w+)\)', line)
            if match:
                dest, ptr, expected, new_val = match.groups()
                if ptr.startswith('%'): self._emit_load_reg(ptr, 'rax')
                else: self._emit_mov_reg_imm('rax', int(ptr))
                if expected.startswith('%'): self._emit_load_reg(expected, 'rbx')
                else: self._emit_mov_reg_imm('rbx', int(expected))
                if new_val.startswith('%'): self._emit_load_reg(new_val, 'rcx')
                else: self._emit_mov_reg_imm('rcx', int(new_val))
                self.emit_vector(Primitive.ATOMIC_CMPXCHG, rax=1.0, src='rbx', reg2='rcx')
                self._emit_store_reg(dest, 'rax')
                return

        if 'call void @sys_exit' in line:
            match = re.search(r'i32 (\d+)', line)
            if match:
                code = match.group(1)
                self._emit_syscall_exit(int(code))
                return

        # 2. Control Flow
        # icmp eq i8 %val, 170
        match = re.match(r'%(\w+)\s*=\s*icmp\s+(\w+)\s+\w+\s+%(\w+),\s+(\d+)', line)
        if match:
            dest, pred, op1, imm = match.groups()
            self._emit_load_reg(op1, 'rax')
            self._emit_mov_reg_imm('rbx', int(imm))
            
            # Emit CMP RAX, RBX
            self.emit_vector(Primitive.CMP, rax=1.0, src='rbx')

            # Store result (1 or 0) to dest (Simplified: assume result is in flags/special reg)
            # For now, we'll map br to check implicit flags if checking this var
            self.stack_frame[dest + "_is_cond"] = True # Mark as condition variable
            self.stack_frame[dest + "_pred"] = pred # Store predicate type
            return

        # br label %loop
        match = re.match(r'br label %(\w+)', line)
        if match:
            target = match.group(1)
            self.label_refs.append((len(self.vectors), target))
            self.emit_vector(Primitive.JMP) 
            return
            
        # br i1 %cond, label %true, label %false
        match = re.match(r'br i1 %(\w+), label %(\w+), label %(\w+)', line)
        if match:
            cond, true_label, false_label = match.groups()
            pred = self.stack_frame.get(cond + "_pred", "eq")

            if pred == "eq":
                self.label_refs.append((len(self.vectors), true_label))
                self.emit_vector(Primitive.JE) 
            elif pred == "ne":
                self.label_refs.append((len(self.vectors), true_label))
                self.emit_vector(Primitive.JNE) 
            elif pred == "slt":
                self.label_refs.append((len(self.vectors), true_label))
                self.emit_vector(Primitive.JL) # JL uses SF != OF
            elif pred == "sge":
                self.label_refs.append((len(self.vectors), true_label))
                self.emit_vector(Primitive.JG) # Simplified: JG
            else:
                self.label_refs.append((len(self.vectors), true_label))
                self.emit_vector(Primitive.JE)

            self.label_refs.append((len(self.vectors), false_label))
            self.emit_vector(Primitive.JMP) 
            return

        # 3. Memory & Arithmetic
        if 'getelementptr' in line and '@' in line:
            var_match = re.match(r'%(\w+)\s*=', line)
            global_match = re.search(r'@(\w+)', line)
            if var_match and global_match:
                dest, global_name = var_match.group(1), global_match.group(1)
                offset = self.globals.get(global_name, 0)
                base_addr = 0x10000 + offset
                self._emit_mov_stack_imm(dest, base_addr)
                return

        # %val = load type, type* %ptr
        match = re.match(r'%(\w+)\s*=\s*load \w+, \w+\* %(\w+)', line)
        if match:
             dest, src_ptr = match.groups()

             # Check if src_ptr contains a pointer value (from inttoptr)
             if src_ptr in self.pointer_values:
                 # Double dereference: src_ptr contains an address
                 # 1. Load the address from src_ptr
                 self._emit_load_reg(src_ptr, 'rax')
                 # 2. Load from that address
                 self.emit_vector(Primitive.MEM_LOAD, rax=1.0)
             else:
                 # Normal load: src_ptr is a stack variable
                 # Load ptr address to RAX
                 addr = self._get_var_loc(src_ptr)
                 self._emit_mov_reg_imm('rax', addr)
                 # Load [RAX] to RAX
                 self.emit_vector(Primitive.MEM_LOAD, rax=1.0)

             # Store RAX to dest
             self._emit_store_reg(dest, 'rax')
             return

        # store i32 170, i32* %ptr
        # store i32 %val, i32* %ptr
        match = re.search(r'store \w+ (%?\w+), \w+\* (%?\w+)', line)
        if match:
            src, ptr = match.groups()
            
            # 1. Load ptr address to RAX
            if ptr.startswith('%') and ptr.strip('%') in self.pointer_values:
                # Direct pointer usage
                self._emit_load_reg(ptr, 'rax')
            elif ptr.startswith('%'):
                # Stack variable address
                ptr_addr = self._get_var_loc(ptr)
                self._emit_mov_reg_imm('rax', ptr_addr)
            else:
                # Immediate address (shouldn't happen in valid LLVM but for safety)
                self._emit_mov_reg_imm('rax', int(ptr) if ptr.isdigit() else 0)
            
            # 2. Load src value to RCX
            if src.startswith('%'):
                self._emit_load_reg(src, 'rcx')
            else:
                self._emit_mov_reg_imm('rcx', int(src))
                
            # 3. Store ECX into [EAX]
            self.emit_vector(Primitive.MEM_STORE, rax=1.0, src='rcx')
            return

        # 4. Arithmetic
        # %res = add i32 42, 58
        match = re.match(r'%(\w+)\s*=\s*(add|sub|mul|sdiv|and|or|xor)\s+i32\s+(%?\w+),\s+(%?\w+)', line)
        if match:
            dest, op, a, b = match.groups()

            # Load A to RAX
            if a.startswith('%'): self._emit_load_reg(a, 'rax')
            else: self._emit_mov_reg_imm('rax', int(a))

            # Load B to RBX
            if b.startswith('%'): self._emit_load_reg(b, 'rbx')
            else: self._emit_mov_reg_imm('rbx', int(b))

            # Emit Op
            prim_map = {"add": Primitive.ADD, "sub": Primitive.SUB, "mul": Primitive.MUL,
                        "sdiv": Primitive.DIV, "and": Primitive.AND, "or": Primitive.OR, "xor": Primitive.XOR}
            self.emit_vector(prim_map[op], rax=1.0, src='rbx')

            # Store RAX to stack
            self._emit_store_reg(dest, 'rax')
            return

        # 5. Pointer Operations
        # %ptr_addr = ptrtoint i32* %value to i32
        match = re.match(r'%(\w+)\s*=\s*ptrtoint\s+\w+\*?\s+%(\w+)\s+to\s+i32', line)
        if match:
            dest, src_var = match.groups()
            # Get the stack address of the source variable
            addr = self._get_var_loc(src_var)
            # Store that address as an integer in dest
            self._emit_mov_stack_imm(dest, addr)
            return

        # %ptr = inttoptr i32 %addr to i32*
        # %ptr = inttoptr i32 8192 to i32*
        match = re.search(r'%(\w+)\s*=\s*inttoptr\s+i32\s+(%?\d+)\s+to\s+\w+\*', line)
        if match:
            dest, src = match.groups()
            # Mark this variable as containing a pointer value (address)
            self.pointer_values.add(dest)
            
            if src.startswith('%'):
                # Load the integer value from src_var
                self._emit_load_reg(src, 'rax')
            else:
                # Direct immediate address
                self._emit_mov_reg_imm('rax', int(src))
                
            # Store it in dest
            self._emit_store_reg(dest, 'rax')
            return

    def _emit_syscall_write(self, fd: int, buf_var: str, length: int):
        self._emit_mov_reg_imm('rax', 1)
        self._emit_mov_reg_imm('rdi', fd)
        self._emit_load_reg(buf_var, 'rsi')
        self._emit_mov_reg_imm('rdx', length)
        self.emit_vector(Primitive.SYSCALL)

    def _emit_syscall_exit(self, code: int):
        self._emit_mov_reg_imm('rax', 60)
        self._emit_mov_reg_imm('rdi', code)
        self.emit_vector(Primitive.SYSCALL)


    def _emit_load_reg(self, var_name: str, reg: str):
        """Load variable from stack to register."""
        addr = self._get_var_loc(var_name)
        # 1. Load Address into Scratch RBP
        self._emit_mov_reg_imm('rbp', addr)
        # 2. Load [RBP] into REG
        self.emit_vector(Primitive.MEM_LOAD, dest=reg, src='rbp')

    def _emit_store_reg(self, var_name: str, reg: str):
        """Store register to variable stack slot."""
        addr = self._get_var_loc(var_name)
        # 1. Load Address into RBP
        self._emit_mov_reg_imm('rbp', addr)
        # 2. Store REG into [RBP]
        self.emit_vector(Primitive.MEM_STORE, dest='rbp', src=reg)

    def _emit_mov_stack_imm(self, var_name: str, imm: int):
        """Move immediate to stack slot."""
        # Load imm to RAX
        self._emit_mov_reg_imm('rax', imm)
        # Store RAX to stack
        self._emit_store_reg(var_name, 'rax')

    # Register Dimension Map
    REG_START = 72
    SRC_REG_OFFSET = 88 # 160 - 72
    REG_MAP = {'rax': 72, 'rcx': 73, 'rdx': 74, 'rbx': 75, 'rsp': 76, 'rbp': 77, 'rsi': 78, 'rdi': 79}

    # Immediate Dimension Map (matches execution_engine.py)
    IMM_START = 104
    IMM_MAP = {
        0: 104, 1: 105, 2: 106, 4: 107, 8: 108, 16: 109, 32: 110, 64: 111, 128: 112, 256: 113,
        -1: 114, -2: 115, -4: 116, -8: 117, -16: 118, -32: 119, -64: 120, -128: 121, -256: 122,
        11: 124, 200: 125, 60: 126
    }
    IMM_OTHER = 123
    BIN_IMM_START = 200

    def emit_vector(self, primitive: int, **kwargs):
        """Emit raw vector with register and immediate encoding."""
        vec = np.zeros(self.vector_size, dtype=np.float32)
        vec[primitive] = 1.0
        
        # 1. Encode Registers
        for k, v in kwargs.items():
            if k == 'dest' or k in self.REG_MAP:
                reg_name = v if isinstance(v, str) else k
                if reg_name in self.REG_MAP:
                    vec[self.REG_MAP[reg_name]] = 1.0
            elif k == 'src' or k == 'reg2':
                reg_name = v
                if reg_name in self.REG_MAP:
                    vec[self.REG_MAP[reg_name] + self.SRC_REG_OFFSET] = 1.0
            elif k == 'rdi' and v == 1.0:
                vec[self.REG_MAP['rdi']] = 1.0
            elif k == 'rsi_src' and v == 1.0:
                vec[self.REG_MAP['rsi'] + self.SRC_REG_OFFSET] = 1.0
            
            # 2. Encode Immediate
            elif k == 'imm':
                imm = int(v)
                if imm in self.IMM_MAP:
                    vec[self.IMM_MAP[imm]] = 1.0
                else:
                    vec[self.IMM_OTHER] = 1.0
                    uv = imm if imm >= 0 else (1 << 32) + imm
                    for i in range(32):
                        if (uv >> i) & 1:
                            vec[self.BIN_IMM_START + i] = 1.0
        
        # 3. Set instruction length (for VMA bookkeeping)
        if self.vector_size > 315:
            vec[315] = 1.0 # 1 byte per instruction for simplicity
            
        self.vectors.append(vec)

    def _emit_mov_reg_imm(self, reg: str, imm: int):
        """Standard helper for MOV reg, imm."""
        self.emit_vector(Primitive.MOV, dest=reg, imm=imm)

    def _link_labels(self):
        """Resolve jump targets and encode relative/absolute offsets."""
        print("🔗 Pass 3: Linking")
        # 1. Relative Jumps
        for i, target in self.label_refs:
             if target in self.labels:
                 target_idx = self.labels[target]
                 input_idx = i
                 offset = target_idx - (input_idx + 1)
                 self._encode_imm_to_vec(input_idx, offset)
             else:
                 print(f"   ⚠️ Unresolved relative label: {target}")

        # 2. Absolute Pointers (for threading/calls)
        for i, target in self.abs_label_refs:
             if target in self.labels:
                 target_idx = self.labels[target]
                 self._encode_imm_to_vec(i, target_idx)
             else:
                 print(f"   ⚠️ Unresolved absolute label: {target}")

    def _encode_imm_to_vec(self, vec_idx: int, imm_val: int):
        """Internal helper to re-encode immediate into an existing vector."""
        vec = self.vectors[vec_idx]
        vec[104:128] = 0
        vec[200:232] = 0
        
        imm = int(imm_val)
        if imm in self.IMM_MAP:
            vec[self.IMM_MAP[imm]] = 1.0
        else:
            vec[self.IMM_OTHER] = 1.0
            uv = imm if imm >= 0 else (1 << 32) + imm
            for i_bit in range(32):
                if (uv >> i_bit) & 1:
                    vec[self.BIN_IMM_START + i_bit] = 1.0

    def save_rts(self, output_path: str):
         """Save RTS file with data section."""
         # Use existing saver but inject data section
         from systems.neural_cpu.tools.llvm_to_rts import save_rts as saver
         # We need to adapt since we overwrote the class
         # Re-import just the save function
         import systems.neural_cpu.tools.llvm_to_rts as original_module
         
         # Convert vectors to format expected
         original_module.save_rts(
             output_path,
             [{'vector': v, 'params': {}} for v in self.vectors],
             data_section=self.data_section,
             vector_dim=self.vector_size
         )

def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('input')
    parser.add_argument('-o', '--output')
    args = parser.parse_args()
    
    converter = LLVMToRTSConverter()
    converter.parse_file(args.input)
    converter.save_rts(args.output)

if __name__ == '__main__':
    main()
