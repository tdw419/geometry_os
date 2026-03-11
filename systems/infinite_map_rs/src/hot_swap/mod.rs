//! Phase 40.5: Stateful Hot Swapping - Vat State Protocol
//!
//! The Vat is a capability-based state management system that enables
//! hot-swapping of running modules without losing state.
//!
//! ## Handover Protocol
//! 1. **Signal**: Module receives `MIGRATE` signal
//! 2. **Serialize**: Module writes state to Vat
//! 3. **Swap**: Compositor unloads old module, loads new
//! 4. **Restore**: New module reads from Vat and resumes
//!
//! ## Usage
//! ```rust
//! use crate::hot_swap::{VatState, VatId, VatRegistry};
//!
//! // Module implements VatState trait
//! struct MyModule {
//!     counter: u32,
//!     instruction_ptr: u32,
//! }
//!
//! impl VatState for MyModule {
//!     fn vat_id(&self) -> VatId { VatId::new("my_module") }
//!
//!     fn serialize_to_vat(&self, vat: &mut VatBuffer) -> Result<(), VatError> {
//!         vat.write_u32(self.counter)?;
//!         vat.write_u32(self.instruction_ptr)?;
//!         Ok(())
//!     }
//!
//!     fn deserialize_from_vat(&mut self, vat: &VatBuffer) -> Result<(), VatError> {
//!         self.counter = vat.read_u32()?;
//!         self.instruction_ptr = vat.read_u32()?;
//!         Ok(())
//!     }
//! }
//! ```

use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::path::PathBuf;
use std::sync::{Arc, Mutex};
use std::time::{SystemTime, UNIX_EPOCH};

// Phase 40.5 Task 2: ModuleManager for dynamic .so loading
pub mod module_manager;
pub use module_manager::{
    ModuleManager, LoadedModule, ModuleMetadata, ModuleStatus,
    ModuleError, ModuleInitFn, ModuleSuspendFn, ModuleUpdateFn,
    DummyModuleBuilder,
};

/// Unique identifier for a Vat (capability-based naming)
#[derive(Debug, Clone, Hash, Eq, PartialEq, Serialize, Deserialize)]
pub struct VatId(String);

impl VatId {
    /// Create a new VatId from a string
    pub fn new(id: &str) -> Self {
        Self(id.to_string())
    }

    /// Create a VatId from a module path (e.g., "systems/builder/module.so")
    pub fn from_path(path: &str) -> Self {
        let hash = format!("{:x}", md5::compute(path));
        Self(format!("vat_{}", hash))
    }

    /// Get the string representation
    pub fn as_str(&self) -> &str {
        &self.0
    }
}

/// Errors that can occur during Vat operations
#[derive(Debug, Clone)]
pub enum VatError {
    BufferOverflow,
    BufferUnderflow,
    InvalidVersion,
    NotFound,
    SerializationFailed(String),
    DeserializationFailed(String),
}

/// Version-aligned Vat header for compatibility checking
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VatHeader {
    pub version: u32,
    pub vat_id: VatId,
    pub timestamp: f64,
    pub data_size: u32,
    pub checksum: u64,
}

impl VatHeader {
    /// Create a new Vat header
    pub fn new(vat_id: VatId, data_size: u32) -> Self {
        Self {
            version: 1,
            vat_id,
            timestamp: SystemTime::now()
                .duration_since(UNIX_EPOCH)
                .unwrap_or_default()
                .as_secs_f64(),
            data_size,
            checksum: 0, // Calculated after serialization
        }
    }

    /// Calculate checksum for the header
    pub fn calculate_checksum(&mut self, data: &[u8]) {
        use std::collections::hash_map::DefaultHasher;
        use std::hash::{Hash, Hasher};

        let mut hasher = DefaultHasher::new();
        self.version.hash(&mut hasher);
        self.vat_id.hash(&mut hasher);
        self.timestamp.to_bits().hash(&mut hasher);
        data.hash(&mut hasher);
        self.checksum = hasher.finish();
    }

    /// Verify the checksum
    pub fn verify(&self, data: &[u8]) -> bool {
        use std::collections::hash_map::DefaultHasher;
        use std::hash::{Hash, Hasher};

        let mut hasher = DefaultHasher::new();
        self.version.hash(&mut hasher);
        self.vat_id.hash(&mut hasher);
        self.timestamp.to_bits().hash(&mut hasher);
        data.hash(&mut hasher);
        hasher.finish() == self.checksum
    }
}

/// A VatBuffer holds serialized state for a single module
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VatBuffer {
    pub header: VatHeader,
    pub data: Vec<u8>,
    /// Read position cursor (not serialized)
    #[serde(skip)]
    read_pos: usize,
}

impl VatBuffer {
    /// Create a new empty VatBuffer
    pub fn new(vat_id: VatId) -> Self {
        let header = VatHeader::new(vat_id, 0);
        Self {
            header,
            data: Vec::new(),
            read_pos: 0,
        }
    }

    /// Create a VatBuffer from existing data
    pub fn from_data(vat_id: VatId, data: Vec<u8>) -> Self {
        let data_size = data.len() as u32;
        let mut header = VatHeader::new(vat_id, data_size);
        header.calculate_checksum(&data);
        Self { header, data, read_pos: 0 }
    }

    /// Reset the read cursor to the beginning
    pub fn reset_cursor(&mut self) {
        self.read_pos = 0;
    }

    /// Get the current read position
    pub fn cursor(&self) -> usize {
        self.read_pos
    }

    /// Finalize the buffer (recalculate checksum)
    pub fn finalize(&mut self) {
        self.header.data_size = self.data.len() as u32;
        self.header.calculate_checksum(&self.data);
        self.reset_cursor();
    }

    /// Verify the buffer integrity
    pub fn verify(&self) -> bool {
        self.header.verify(&self.data)
    }

    /// Write a u32 to the buffer
    pub fn write_u32(&mut self, value: u32) -> Result<(), VatError> {
        self.data.extend_from_slice(&value.to_le_bytes());
        Ok(())
    }

    /// Write a u64 to the buffer
    pub fn write_u64(&mut self, value: u64) -> Result<(), VatError> {
        self.data.extend_from_slice(&value.to_le_bytes());
        Ok(())
    }

    /// Write a f32 to the buffer
    pub fn write_f32(&mut self, value: f32) -> Result<(), VatError> {
        self.data.extend_from_slice(&value.to_le_bytes());
        Ok(())
    }

    /// Write a byte slice to the buffer
    pub fn write_bytes(&mut self, bytes: &[u8]) -> Result<(), VatError> {
        self.data.extend_from_slice(bytes);
        Ok(())
    }

    /// Write a single u8 byte
    pub fn write_u8(&mut self, value: u8) -> Result<(), VatError> {
        self.data.push(value);
        Ok(())
    }

    /// Write a string to the buffer
    pub fn write_string(&mut self, s: &str) -> Result<(), VatError> {
        let len = s.len() as u32;
        self.write_u32(len)?;
        self.data.extend_from_slice(s.as_bytes());
        Ok(())
    }

    /// Read a u32 from the buffer (consuming it)
    pub fn read_u32(&mut self) -> Result<u32, VatError> {
        if self.read_pos + 4 > self.data.len() {
            return Err(VatError::BufferUnderflow);
        }
        let bytes = [
            self.data[self.read_pos],
            self.data[self.read_pos + 1],
            self.data[self.read_pos + 2],
            self.data[self.read_pos + 3],
        ];
        self.read_pos += 4;
        Ok(u32::from_le_bytes(bytes))
    }

    /// Read a single u8 byte
    pub fn read_u8(&mut self) -> Result<u8, VatError> {
        if self.read_pos + 1 > self.data.len() {
            return Err(VatError::BufferUnderflow);
        }
        let byte = self.data[self.read_pos];
        self.read_pos += 1;
        Ok(byte)
    }

    /// Read a u64 from the buffer
    pub fn read_u64(&mut self) -> Result<u64, VatError> {
        if self.read_pos + 8 > self.data.len() {
            return Err(VatError::BufferUnderflow);
        }
        let bytes = [
            self.data[self.read_pos],
            self.data[self.read_pos + 1],
            self.data[self.read_pos + 2],
            self.data[self.read_pos + 3],
            self.data[self.read_pos + 4],
            self.data[self.read_pos + 5],
            self.data[self.read_pos + 6],
            self.data[self.read_pos + 7],
        ];
        self.read_pos += 8;
        Ok(u64::from_le_bytes(bytes))
    }

    /// Read a f32 from the buffer
    pub fn read_f32(&mut self) -> Result<f32, VatError> {
        if self.read_pos + 4 > self.data.len() {
            return Err(VatError::BufferUnderflow);
        }
        let bytes = [
            self.data[self.read_pos],
            self.data[self.read_pos + 1],
            self.data[self.read_pos + 2],
            self.data[self.read_pos + 3],
        ];
        self.read_pos += 4;
        Ok(f32::from_le_bytes(bytes))
    }

    /// Read bytes from the buffer
    pub fn read_bytes(&mut self, len: usize) -> Result<Vec<u8>, VatError> {
        if self.read_pos + len > self.data.len() {
            return Err(VatError::BufferUnderflow);
        }
        let bytes = self.data[self.read_pos..self.read_pos + len].to_vec();
        self.read_pos += len;
        Ok(bytes)
    }

    /// Read a string from the buffer
    pub fn read_string(&mut self) -> Result<String, VatError> {
        let len = self.read_u32()? as usize;
        if self.read_pos + len > self.data.len() {
            return Err(VatError::BufferUnderflow);
        }
        let s = String::from_utf8_lossy(&self.data[self.read_pos..self.read_pos + len]).to_string();
        self.read_pos += len;
        Ok(s)
    }
}

/// Trait for types that can be serialized/deserialized to/from a Vat
pub trait VatState {
    /// Get the Vat ID for this state
    fn vat_id(&self) -> VatId;

    /// Serialize state to a VatBuffer
    fn serialize_to_vat(&self, vat: &mut VatBuffer) -> Result<(), VatError>;

    /// Deserialize state from a VatBuffer
    fn deserialize_from_vat(&mut self, vat: &mut VatBuffer) -> Result<(), VatError>;

    /// Get the current state as a VatBuffer
    fn to_vat_buffer(&self) -> Result<VatBuffer, VatError> {
        let mut buffer = VatBuffer::new(self.vat_id());
        self.serialize_to_vat(&mut buffer)?;
        buffer.finalize();
        Ok(buffer)
    }

    /// Restore state from a VatBuffer
    fn from_vat_buffer(&mut self, buffer: &mut VatBuffer) -> Result<(), VatError> {
        if !buffer.verify() {
            return Err(VatError::InvalidVersion);
        }
        buffer.reset_cursor();
        self.deserialize_from_vat(buffer)
    }
}

/// Global Vat Registry for managing all active Vats
pub struct VatRegistry {
    vats: HashMap<VatId, VatBuffer>,
    storage_path: PathBuf,
}

impl VatRegistry {
    /// Create a new VatRegistry
    pub fn new(storage_path: PathBuf) -> Self {
        Self {
            vats: HashMap::new(),
            storage_path,
        }
    }

    /// Register a Vat (store state in memory and optionally persist to disk)
    pub fn register_vat(&mut self, buffer: VatBuffer) -> Result<(), VatError> {
        let vat_id = buffer.header.vat_id.clone();

        // Verify checksum before storing
        if !buffer.verify() {
            return Err(VatError::InvalidVersion);
        }

        // Store in memory
        self.vats.insert(vat_id.clone(), buffer.clone());

        // Persist to disk
        self.persist_vat(&vat_id)?;

        Ok(())
    }

    /// Get a Vat by ID
    pub fn get_vat(&self, vat_id: &VatId) -> Option<&VatBuffer> {
        self.vats.get(vat_id)
    }

    /// Get a mutable Vat by ID
    pub fn get_vat_mut(&mut self, vat_id: &VatId) -> Option<&mut VatBuffer> {
        self.vats.get_mut(vat_id)
    }

    /// Remove a Vat (unregister)
    pub fn unregister_vat(&mut self, vat_id: &VatId) -> Option<VatBuffer> {
        self.vats.remove(vat_id)
    }

    /// Persist a Vat to disk
    fn persist_vat(&self, vat_id: &VatId) -> Result<(), VatError> {
        use std::fs;
        use std::io::Write;

        let buffer = self.vats.get(vat_id)
            .ok_or(VatError::NotFound)?;

        // Create storage directory if it doesn't exist
        fs::create_dir_all(&self.storage_path)
            .map_err(|e| VatError::SerializationFailed(e.to_string()))?;

        // Write to file
        let file_path = self.storage_path.join(format!("{}.vat", vat_id.as_str()));
        let json = serde_json::to_string_pretty(buffer)
            .map_err(|e| VatError::SerializationFailed(e.to_string()))?;

        fs::write(file_path, json)
            .map_err(|e| VatError::SerializationFailed(e.to_string()))?;

        Ok(())
    }

    /// Load a Vat from disk
    pub fn load_vat(&mut self, vat_id: &VatId) -> Result<VatBuffer, VatError> {
        use std::fs;

        let file_path = self.storage_path.join(format!("{}.vat", vat_id.as_str()));
        let json = fs::read_to_string(&file_path)
            .map_err(|e| VatError::DeserializationFailed(e.to_string()))?;

        let buffer: VatBuffer = serde_json::from_str(&json)
            .map_err(|e| VatError::DeserializationFailed(e.to_string()))?;

        if !buffer.verify() {
            return Err(VatError::InvalidVersion);
        }

        self.vats.insert(vat_id.clone(), buffer.clone());
        Ok(buffer)
    }

    /// List all registered Vat IDs
    pub fn list_vats(&self) -> Vec<VatId> {
        self.vats.keys().cloned().collect()
    }

    /// Clear all Vats (for testing or shutdown)
    pub fn clear(&mut self) {
        self.vats.clear();
    }
}

/// Example: Simple counter state for testing
#[derive(Debug, Clone)]
pub struct CounterState {
    pub id: VatId,
    pub count: u32,
    pub last_increment: f64,
}

impl CounterState {
    pub fn new(id: &str) -> Self {
        Self {
            id: VatId::new(id),
            count: 0,
            last_increment: 0.0,
        }
    }

    pub fn increment(&mut self) {
        self.count += 1;
        self.last_increment = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap_or_default()
            .as_secs_f64();
    }
}

impl VatState for CounterState {
    fn vat_id(&self) -> VatId {
        self.id.clone()
    }

    fn serialize_to_vat(&self, vat: &mut VatBuffer) -> Result<(), VatError> {
        vat.write_u32(self.count)?;
        vat.write_f32(self.last_increment as f32)?;
        Ok(())
    }

    fn deserialize_from_vat(&mut self, vat: &mut VatBuffer) -> Result<(), VatError> {
        self.count = vat.read_u32()?;
        self.last_increment = vat.read_f32()? as f64;
        Ok(())
    }
}

/// Example: RISC-V Executor State for hot-swapping the VM
#[derive(Debug, Clone)]
pub struct RiscVExecutorState {
    pub id: VatId,
    pub instruction_ptr: u32,
    pub registers: [u32; 32],
    pub memory_size: usize,
    pub halted: bool,
}

impl RiscVExecutorState {
    pub fn new(kernel_path: &str) -> Self {
        Self {
            id: VatId::from_path(kernel_path),
            instruction_ptr: 0,
            registers: [0; 32],
            memory_size: 0,
            halted: false,
        }
    }

    /// Snapshot current state for hot-swapping
    pub fn snapshot(&self) -> Result<VatBuffer, VatError> {
        self.to_vat_buffer()
    }

    /// Restore state from a previous snapshot
    pub fn restore(&mut self, buffer: &mut VatBuffer) -> Result<(), VatError> {
        self.from_vat_buffer(buffer)
    }
}

impl VatState for RiscVExecutorState {
    fn vat_id(&self) -> VatId {
        self.id.clone()
    }

    fn serialize_to_vat(&self, vat: &mut VatBuffer) -> Result<(), VatError> {
        vat.write_u32(self.instruction_ptr)?;
        vat.write_u32(self.memory_size as u32)?;
        vat.write_u32(if self.halted { 1 } else { 0 })?;

        // Write all 32 registers
        for reg in &self.registers {
            vat.write_u32(*reg)?;
        }

        Ok(())
    }

    fn deserialize_from_vat(&mut self, vat: &mut VatBuffer) -> Result<(), VatError> {
        self.instruction_ptr = vat.read_u32()?;
        self.memory_size = vat.read_u32()? as usize;
        self.halted = vat.read_u32()? != 0;

        // Read all 32 registers
        for reg in &mut self.registers {
            *reg = vat.read_u32()?;
        }

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_vat_buffer_write_read() {
        let mut buffer = VatBuffer::new(VatId::new("test"));
        buffer.write_u32(42).unwrap();
        buffer.write_u32(1337).unwrap();
        buffer.finalize();

        assert_eq!(buffer.read_u32().unwrap(), 42);
        assert_eq!(buffer.read_u32().unwrap(), 1337);
    }

    #[test]
    fn test_counter_state_serialization() {
        let mut counter = CounterState::new("test_counter");
        counter.count = 100;
        counter.last_increment = 123456.789; // Fixed timestamp

        let buffer = counter.to_vat_buffer().unwrap();
        assert_eq!(buffer.header.data_size, 8); // u32 + f32

        let mut restored = CounterState::new("test_counter");
        restored.from_vat_buffer(&mut buffer.clone()).unwrap();

        assert_eq!(restored.count, 100);
        // f32 has ~7 decimal digits of precision
        assert!((restored.last_increment - 123456.789).abs() < 0.1);
    }

    #[test]
    fn test_riscv_state_serialization() {
        let mut state = RiscVExecutorState::new("test_kernel.bin");
        state.instruction_ptr = 0x1000;
        state.registers[1] = 42;
        state.registers[10] = 1337;
        state.halted = false;

        let mut buffer = state.to_vat_buffer().unwrap();
        assert!(buffer.verify());

        let mut restored = RiscVExecutorState::new("test_kernel.bin");
        restored.from_vat_buffer(&mut buffer).unwrap();

        assert_eq!(restored.instruction_ptr, 0x1000);
        assert_eq!(restored.registers[1], 42);
        assert_eq!(restored.registers[10], 1337);
        assert_eq!(restored.halted, false);
    }

    #[test]
    fn test_vat_registry() {
        let mut registry = VatRegistry::new(PathBuf::from("/tmp/test_vats"));

        let counter = CounterState::new("registry_test");
        let buffer = counter.to_vat_buffer().unwrap();

        registry.register_vat(buffer).unwrap();
        assert!(registry.get_vat(&counter.id).is_some());

        let vats = registry.list_vats();
        assert!(vats.contains(&counter.id));
    }
}
