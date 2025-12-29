#!/usr/bin/env python3
"""
Neural Memory Manager for Level 6 Advanced Data Structures

This module provides sophisticated memory management capabilities including
heap allocation, memory pools, and type-aware memory operations for the
Neural CPU's advanced data structures.
"""

import numpy as np
from typing import Dict, List, Tuple, Optional, Union
import logging
import struct
import math

logger = logging.getLogger(__name__)


class NeuralMemoryManager:
    """Advanced memory management system for Neural CPU Level 6."""
    
    def __init__(self, heap_size: int = 1024 * 1024):
        """
        Initialize the memory manager.
        
        Args:
            heap_size: Total heap size in bytes
        """
        self.heap_size = heap_size
        self.heap_start = 0x100000  # 1MB mark
        self.heap_end = self.heap_start + heap_size
        self.heap_ptr = self.heap_start
        
        # Memory tracking
        self.allocated_blocks = {}  # addr -> (size, alignment, type_info)
        self.free_blocks = []       # list of (addr, size) tuples
        self.memory_pools = {}      # pool_name -> pool_info
        self.data = {}              # addr -> value (actual data storage)
        
        # Statistics
        self.total_allocated = 0
        self.total_freed = 0
        self.allocations_count = 0
        self.frees_count = 0
        
        # Initialize with one large free block
        self.free_blocks.append((self.heap_start, heap_size))
        
        logger.info(f"Memory Manager initialized: {heap_size} bytes heap")
    
    def allocate(self, size: int, alignment: int = 1, type_info: Optional[Dict] = None) -> int:
        """
        Allocate memory from heap with alignment.
        
        Args:
            size: Number of bytes to allocate
            alignment: Required alignment (must be power of 2)
            type_info: Optional type information for the allocation
            
        Returns:
            Memory address of allocated block, or 0 on failure
        """
        if size <= 0:
            return 0
            
        # Ensure alignment is power of 2
        if alignment > 1 and (alignment & (alignment - 1)) != 0:
            alignment = 1 << (alignment.bit_length() - 1)
            
        # Find suitable free block
        aligned_size = self._align_size(size, alignment)
        best_fit_idx = -1
        best_fit_size = float('inf')
        
        for i, (addr, block_size) in enumerate(self.free_blocks):
            if block_size >= aligned_size:
                if block_size < best_fit_size:
                    best_fit_idx = i
                    best_fit_size = block_size
                    
        if best_fit_idx == -1:
            logger.warning(f"Allocation failed: no suitable block found for {size} bytes")
            return 0
            
        # Allocate from best fit block
        addr, block_size = self.free_blocks.pop(best_fit_idx)
        
        # Calculate aligned address
        aligned_addr = self._align_address(addr, alignment)
        padding = aligned_addr - addr
        
        # Split remaining space
        remaining_size = block_size - padding - aligned_size
        if remaining_size > 0:
            self.free_blocks.append((aligned_addr + aligned_size, remaining_size))
            
        # Track allocation
        self.allocated_blocks[aligned_addr] = (aligned_size, alignment, type_info)
        self.total_allocated += aligned_size
        self.allocations_count += 1
        
        logger.debug(f"Allocated {aligned_size} bytes at 0x{aligned_addr:08X} (alignment: {alignment})")
        return aligned_addr
    
    def deallocate(self, addr: int, expected_size: Optional[int] = None) -> bool:
        """
        Deallocate memory and merge adjacent free blocks.
        
        Args:
            addr: Address to deallocate
            expected_size: Expected size (for validation)
            
        Returns:
            True if successful, False otherwise
        """
        if addr not in self.allocated_blocks:
            logger.warning(f"Attempted to free unallocated address: 0x{addr:08X}")
            return False
            
        size, alignment, type_info = self.allocated_blocks.pop(addr)
        
        if expected_size is not None and size != expected_size:
            logger.warning(f"Size mismatch: expected {expected_size}, got {size}")
            return False
            
        # Add to free blocks
        self.free_blocks.append((addr, size))
        self.total_freed += size
        self.frees_count += 1
        
        # Sort free blocks by address for merging
        self.free_blocks.sort(key=lambda x: x[0])
        
        # Merge adjacent free blocks
        self._merge_free_blocks()
        
        logger.debug(f"Deallocated {size} bytes at 0x{addr:08X}")
        return True
    
    def reallocate(self, old_addr: int, new_size: int, alignment: int = 1) -> int:
        """
        Resize an allocated memory block.
        
        Args:
            old_addr: Current address
            new_size: New size in bytes
            alignment: Required alignment
            
        Returns:
            New address, or 0 on failure
        """
        if old_addr not in self.allocated_blocks:
            logger.warning(f"Attempted to reallocate unallocated address: 0x{old_addr:08X}")
            return 0
            
        old_size, old_alignment, type_info = self.allocated_blocks[old_addr]
        
        # Try to extend in place
        if new_size <= old_size:
            # Shrinking - just update the record
            self.allocated_blocks[old_addr] = (new_size, alignment, type_info)
            return old_addr
            
        # Growing - try to extend in place
        next_block_addr = old_addr + old_size
        next_block_idx = -1
        
        for i, (addr, size) in enumerate(self.free_blocks):
            if addr == next_block_addr:
                next_block_idx = i
                break
                
        if next_block_idx >= 0:
            next_block_size = self.free_blocks[next_block_idx][1]
            required_size = new_size - old_size
            
            if next_block_size >= required_size:
                # Can extend in place
                self.free_blocks.pop(next_block_idx)
                new_total_size = old_size + min(required_size, next_block_size)
                self.allocated_blocks[old_addr] = (new_total_size, alignment, type_info)
                self.total_allocated += (new_total_size - old_size)
                
                # Return any excess to free list
                excess = next_block_size - required_size
                if excess > 0:
                    self.free_blocks.append((next_block_addr + required_size, excess))
                    self._merge_free_blocks()
                    
                return old_addr
        
        # Cannot extend in place - allocate new block and copy
        new_addr = self.allocate(new_size, alignment, type_info)
        if new_addr == 0:
            return 0
            
        # Copy data
        for i in range(old_size):
            self.data[new_addr + i] = self.data.get(old_addr + i, 0)
            
        self.deallocate(old_addr)
        return new_addr
        
    def read_memory(self, addr: int) -> int:
        """Read value from memory."""
        return self.data.get(addr, 0)
        
    def write_memory(self, addr: int, value: int):
        """Write value to memory."""
        self.data[addr] = value
        logger.debug(f"Memory Write: 0x{addr:08X} = {value}")
    
    def create_memory_pool(self, pool_name: str, block_size: int, num_blocks: int) -> bool:
        """
        Create a memory pool for fixed-size allocations.
        
        Args:
            pool_name: Name of the memory pool
            block_size: Size of each block in the pool
            num_blocks: Number of blocks in the pool
            
        Returns:
            True if successful, False otherwise
        """
        total_size = block_size * num_blocks
        pool_addr = self.allocate(total_size, alignment=block_size)
        
        if pool_addr == 0:
            return False
            
        # Initialize pool metadata
        pool_info = {
            'addr': pool_addr,
            'block_size': block_size,
            'num_blocks': num_blocks,
            'free_blocks': list(range(num_blocks)),  # List of free block indices
            'allocated_blocks': set()  # Set of allocated block indices
        }
        
        self.memory_pools[pool_name] = pool_info
        logger.info(f"Created memory pool '{pool_name}' with {num_blocks} blocks of {block_size} bytes")
        return True
    
    def allocate_from_pool(self, pool_name: str) -> int:
        """
        Allocate a block from a memory pool.
        
        Args:
            pool_name: Name of the memory pool
            
        Returns:
            Address of allocated block, or 0 on failure
        """
        if pool_name not in self.memory_pools:
            logger.warning(f"Memory pool '{pool_name}' not found")
            return 0
            
        pool_info = self.memory_pools[pool_name]
        
        if not pool_info['free_blocks']:
            logger.warning(f"Memory pool '{pool_name}' is empty")
            return 0
            
        # Get next free block
        block_idx = pool_info['free_blocks'].pop(0)
        pool_info['allocated_blocks'].add(block_idx)
        
        # Calculate address
        block_addr = pool_info['addr'] + (block_idx * pool_info['block_size'])
        
        logger.debug(f"Allocated block {block_idx} from pool '{pool_name}' at 0x{block_addr:08X}")
        return block_addr
    
    def deallocate_to_pool(self, pool_name: str, block_addr: int) -> bool:
        """
        Return a block to a memory pool.
        
        Args:
            pool_name: Name of the memory pool
            block_addr: Address of the block to return
            
        Returns:
            True if successful, False otherwise
        """
        if pool_name not in self.memory_pools:
            return False
            
        pool_info = self.memory_pools[pool_name]
        
        # Calculate block index
        block_idx = (block_addr - pool_info['addr']) // pool_info['block_size']
        
        if block_idx not in pool_info['allocated_blocks']:
            logger.warning(f"Block {block_idx} not allocated from pool '{pool_name}'")
            return False
            
        # Return block to pool
        pool_info['allocated_blocks'].remove(block_idx)
        pool_info['free_blocks'].append(block_idx)
        pool_info['free_blocks'].sort()
        
        logger.debug(f"Returned block {block_idx} to pool '{pool_name}'")
        return True
    
    def get_memory_stats(self) -> Dict:
        """Get current memory usage statistics."""
        total_free = sum(size for _, size in self.free_blocks)
        fragmentation = self._calculate_fragmentation()
        
        return {
            'heap_size': self.heap_size,
            'total_allocated': self.total_allocated,
            'total_freed': self.total_freed,
            'current_used': self.total_allocated - self.total_freed,
            'total_free': total_free,
            'allocations_count': self.allocations_count,
            'frees_count': self.frees_count,
            'fragmentation': fragmentation,
            'active_allocations': len(self.allocated_blocks),
            'memory_pools': len(self.memory_pools)
        }
    
    def _align_address(self, addr: int, alignment: int) -> int:
        """Align address to specified boundary."""
        if alignment <= 1:
            return addr
        return (addr + alignment - 1) & ~(alignment - 1)
    
    def _align_size(self, size: int, alignment: int) -> int:
        """Align size to specified boundary."""
        if alignment <= 1:
            return size
        return (size + alignment - 1) & ~(alignment - 1)
    
    def _merge_free_blocks(self):
        """Merge adjacent free blocks to reduce fragmentation."""
        if len(self.free_blocks) < 2:
            return
            
        self.free_blocks.sort(key=lambda x: x[0])
        
        merged = []
        current_addr, current_size = self.free_blocks[0]
        
        for i in range(1, len(self.free_blocks)):
            next_addr, next_size = self.free_blocks[i]
            
            if current_addr + current_size == next_addr:
                # Adjacent blocks - merge
                current_size += next_size
            else:
                # Non-adjacent - add current to merged list
                merged.append((current_addr, current_size))
                current_addr, current_size = next_addr, next_size
        
        # Add the last block
        merged.append((current_addr, current_size))
        self.free_blocks = merged
    
    def _calculate_fragmentation(self) -> float:
        """Calculate memory fragmentation percentage."""
        if not self.free_blocks:
            return 0.0
            
        total_free = sum(size for _, size in self.free_blocks)
        largest_free = max(size for _, size in self.free_blocks)
        
        if total_free == 0:
            return 0.0
            
        # Fragmentation = 1 - (largest_free / total_free)
        return max(0.0, 1.0 - (largest_free / total_free)) * 100.0
    
    def validate_address(self, addr: int) -> bool:
        """Validate that an address is within heap bounds."""
        return self.heap_start <= addr < self.heap_end
    
    def is_allocated(self, addr: int) -> bool:
        """Check if an address is currently allocated."""
        return addr in self.allocated_blocks
    
    def get_allocation_info(self, addr: int) -> Optional[Dict]:
        """Get information about an allocated block."""
        if addr not in self.allocated_blocks:
            return None
            
        size, alignment, type_info = self.allocated_blocks[addr]
        return {
            'address': addr,
            'size': size,
            'alignment': alignment,
            'type_info': type_info
        }


class NeuralTypeSystem:
    """Type system for managing structs, classes, and type safety."""
    
    def __init__(self):
        self.structs = {}      # struct_name -> struct_info
        self.classes = {}      # class_name -> class_info
        self.pointers = {}     # ptr_id -> pointer_info
        self.references = {}   # ref_id -> reference_info
        self.type_registry = {}  # type_name -> type_info
        
        # Register basic types
        self._register_basic_types()
    
    def _register_basic_types(self):
        """Register basic primitive types."""
        basic_types = {
            'void': {'size': 0, 'alignment': 1, 'category': 'primitive'},
            'bool': {'size': 1, 'alignment': 1, 'category': 'primitive'},
            'char': {'size': 1, 'alignment': 1, 'category': 'primitive'},
            'int': {'size': 4, 'alignment': 4, 'category': 'primitive'},
            'float': {'size': 4, 'alignment': 4, 'category': 'primitive'},
            'double': {'size': 8, 'alignment': 8, 'category': 'primitive'},
            'string': {'size': 32, 'alignment': 1, 'category': 'primitive'}  # Fixed-size string
        }
        
        for type_name, type_info in basic_types.items():
            self.type_registry[type_name] = type_info
    
    def define_struct(self, struct_name: str, fields: List[Dict], alignment: int = 4) -> bool:
        """
        Define a new struct type.
        
        Args:
            struct_name: Name of the struct
            fields: List of field definitions
            alignment: Required alignment for the struct
            
        Returns:
            True if successful, False otherwise
        """
        if struct_name in self.structs:
            logger.warning(f"Struct '{struct_name}' already defined")
            return False
            
        # Validate fields and calculate offsets
        struct_info = {
            'name': struct_name,
            'fields': {},
            'field_order': [],
            'total_size': 0,
            'alignment': alignment,
            'category': 'struct'
        }
        
        current_offset = 0
        
        for field in fields:
            field_name = field['name']
            field_type = field['type']
            field_size = self.get_type_size(field_type)
            
            if field_size == 0:
                logger.error(f"Unknown field type '{field_type}' in struct '{struct_name}'")
                return False
                
            # Align field to its natural boundary
            field_alignment = self.get_type_alignment(field_type)
            aligned_offset = self._align_offset(current_offset, field_alignment)
            
            # Add padding if needed
            padding = aligned_offset - current_offset
            if padding > 0:
                logger.debug(f"Added {padding} bytes padding before field '{field_name}'")
                
            field_info = {
                'name': field_name,
                'type': field_type,
                'offset': aligned_offset,
                'size': field_size,
                'alignment': field_alignment
            }
            
            struct_info['fields'][field_name] = field_info
            struct_info['field_order'].append(field_name)
            current_offset = aligned_offset + field_size
        
        # Calculate total size with final alignment
        struct_info['total_size'] = self._align_offset(current_offset, alignment)
        
        self.structs[struct_name] = struct_info
        self.type_registry[struct_name] = {
            'size': struct_info['total_size'],
            'alignment': alignment,
            'category': 'struct'
        }
        
        logger.info(f"Defined struct '{struct_name}' with {len(fields)} fields, size: {struct_info['total_size']} bytes")
        return True
    
    def define_class(self, class_name: str, class_def: Dict) -> bool:
        """
        Define a new class with methods and inheritance.
        
        Args:
            class_name: Name of the class
            class_def: Class definition dictionary
            
        Returns:
            True if successful, False otherwise
        """
        if class_name in self.classes:
            logger.warning(f"Class '{class_name}' already defined")
            return False
            
        # Validate parent class
        parent_class = class_def.get('parent_class')
        if parent_class and parent_class not in self.classes:
            logger.error(f"Parent class '{parent_class}' not found")
            return False
            
        class_info = {
            'name': class_name,
            'parent_class': parent_class,
            'fields': class_def.get('fields', []),
            'methods': class_def.get('methods', []),
            'vtable_addr': class_def.get('vtable_addr', 0),
            'category': 'class'
        }
        
        self.classes[class_name] = class_info
        self.type_registry[class_name] = {
            'size': self._calculate_class_size(class_info),
            'alignment': 4,
            'category': 'class'
        }
        
        logger.info(f"Defined class '{class_name}' with inheritance from '{parent_class}'")
        return True
    
    def create_pointer(self, target_addr: int, target_type: str, ptr_id: Optional[str] = None) -> str:
        """
        Create a new pointer.
        
        Args:
            target_addr: Address the pointer points to
            target_type: Type of data the pointer points to
            ptr_id: Optional pointer ID
            
        Returns:
            Pointer ID string
        """
        if not self.validate_type(target_type):
            logger.error(f"Invalid target type '{target_type}' for pointer")
            return ""
            
        if ptr_id is None:
            ptr_id = f"ptr_{len(self.pointers)}"
            
        pointer_info = {
            'id': ptr_id,
            'target_addr': target_addr,
            'target_type': target_type,
            'is_null': target_addr == 0
        }
        
        self.pointers[ptr_id] = pointer_info
        logger.debug(f"Created pointer '{ptr_id}' to {target_type} at 0x{target_addr:08X}")
        return ptr_id
    
    def create_reference(self, target_addr: int, target_type: str, ref_id: Optional[str] = None) -> str:
        """
        Create a new reference.
        
        Args:
            target_addr: Address the reference points to
            target_type: Type of data the reference points to
            ref_id: Optional reference ID
            
        Returns:
            Reference ID string
        """
        if ref_id is None:
            ref_id = f"ref_{len(self.references)}"
            
        reference_info = {
            'id': ref_id,
            'target_addr': target_addr,
            'target_type': target_type,
            'is_null': target_addr == 0
        }
        
        self.references[ref_id] = reference_info
        logger.debug(f"Created reference '{ref_id}' to {target_type} at 0x{target_addr:08X}")
        return ref_id
    
    def cast_type(self, source_addr: int, source_type: str, target_type: str) -> Optional[int]:
        """
        Safely cast between compatible types.
        
        Args:
            source_addr: Source address
            source_type: Source type
            target_type: Target type
            
        Returns:
            Target address if cast is valid, None otherwise
        """
        if not self.validate_type(source_type) or not self.validate_type(target_type):
            return None
            
        # Check if types are compatible
        if self._are_types_compatible(source_type, target_type):
            return source_addr
            
        logger.warning(f"Invalid cast from '{source_type}' to '{target_type}'")
        return None
    
    def get_type_size(self, type_name: str) -> int:
        """Get the size of a type in bytes."""
        if type_name not in self.type_registry:
            return 0
        return self.type_registry[type_name]['size']
    
    def get_type_alignment(self, type_name: str) -> int:
        """Get the alignment requirement of a type."""
        if type_name not in self.type_registry:
            return 1
        return self.type_registry[type_name]['alignment']
    
    def validate_type(self, type_name: str) -> bool:
        """Check if a type is valid."""
        return type_name in self.type_registry
    
    def get_struct_field(self, struct_name: str, field_name: str) -> Optional[Dict]:
        """Get information about a struct field."""
        if struct_name not in self.structs:
            return None
            
        struct_info = self.structs[struct_name]
        return struct_info['fields'].get(field_name)
    
    def get_struct_size(self, struct_name: str) -> int:
        """Get the total size of a struct."""
        if struct_name not in self.structs:
            return 0
        return self.structs[struct_name]['total_size']
    
    def _align_offset(self, offset: int, alignment: int) -> int:
        """Align an offset to the specified boundary."""
        if alignment <= 1:
            return offset
        return (offset + alignment - 1) & ~(alignment - 1)
    
    def _calculate_class_size(self, class_info: Dict) -> int:
        """Calculate the total size of a class."""
        # For now, simple calculation based on fields
        # In a real implementation, this would include vtable pointer, etc.
        total_size = 0
        for field in class_info['fields']:
            field_size = self.get_type_size(field['type'])
            total_size += field_size
        return total_size
    
    def _are_types_compatible(self, type1: str, type2: str) -> bool:
        """Check if two types are compatible for casting."""
        # Basic compatibility rules
        if type1 == type2:
            return True
            
        # Pointer compatibility
        if type1.startswith('*') and type2.startswith('*'):
            base1 = type1[1:]
            base2 = type2[1:]
            return self._are_types_compatible(base1, base2)
            
        # Void pointer compatibility
        if type1 == 'void*' or type2 == 'void*':
            return True
            
        # Numeric type compatibility (simplified)
        numeric_types = ['int', 'float', 'double']
        if type1 in numeric_types and type2 in numeric_types:
            return True
            
        return False


# Global instances
memory_manager = NeuralMemoryManager()
type_system = NeuralTypeSystem()


def get_memory_manager() -> NeuralMemoryManager:
    """Get the global memory manager instance."""
    return memory_manager


def get_type_system() -> NeuralTypeSystem:
    """Get the global type system instance."""
    return type_system