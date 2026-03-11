//! Memory Garbage Collection and Leak Detection Module
//!
//! This module provides comprehensive memory management including:
//! - Automatic garbage collection for GPU resources
//! - Leak detection and reporting
//! - Memory pressure monitoring
//! - Resource cleanup on drop
//!
//! # Architecture
//!
//! ```text
//! ┌─────────────────────────────────────────────────────────────────┐
//! │                    MemoryGC (Main Controller)                   │
//! ├─────────────────────────────────────────────────────────────────┤
//! │  ┌──────────────┐   ┌──────────────┐   ┌──────────────────┐   │
//! │  │ Leak         │   │ Resource     │   │ Pressure         │   │
//! │  │ Detector     │   │ Tracker      │   │ Monitor          │   │
//! │  └──────────────┘   └──────────────┘   └──────────────────┘   │
//! │          │                  │                   │              │
//! │          └──────────────────┴───────────────────┘              │
//! │                             │                                   │
//! │                             ▼                                   │
//! │                   ┌──────────────────┐                         │
//! │                   │ GC Scheduler     │                         │
//! │                   │ (Auto/Manual)    │                         │
//! │                   └──────────────────┘                         │
//! └─────────────────────────────────────────────────────────────────┘
//! ```

use std::collections::{HashMap, HashSet, VecDeque};
use std::sync::{Arc, Mutex, RwLock, Weak};
use std::sync::atomic::{AtomicBool, AtomicU64, AtomicUsize, Ordering};
use std::time::{Duration, Instant};
use std::thread::{self, JoinHandle};
use std::any::type_name;

/// Unique identifier for a tracked resource.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct ResourceId(u64);

impl ResourceId {
    /// Generate a new unique resource ID.
    fn next() -> Self {
        static COUNTER: AtomicU64 = AtomicU64::new(1);
        Self(COUNTER.fetch_add(1, Ordering::Relaxed))
    }
}

/// Type of tracked resource.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum ResourceType {
    Buffer,
    Texture,
    Pipeline,
    BindGroup,
    SharedMemory,
    Allocator,
    Other,
}

impl ResourceType {
    /// Get a human-readable name for the resource type.
    pub fn name(&self) -> &'static str {
        match self {
            ResourceType::Buffer => "Buffer",
            ResourceType::Texture => "Texture",
            ResourceType::Pipeline => "Pipeline",
            ResourceType::BindGroup => "BindGroup",
            ResourceType::SharedMemory => "SharedMemory",
            ResourceType::Allocator => "Allocator",
            ResourceType::Other => "Other",
        }
    }
}

/// Metadata about a tracked resource.
#[derive(Debug, Clone)]
pub struct ResourceMetadata {
    /// Unique resource ID.
    pub id: ResourceId,
    /// Type of resource.
    pub resource_type: ResourceType,
    /// Size in bytes (if applicable).
    pub size: Option<usize>,
    /// Label/name for debugging.
    pub label: String,
    /// Creation timestamp.
    pub created_at: Instant,
    /// Last access timestamp.
    pub last_accessed: Instant,
    /// Stack trace at creation (if captured).
    pub creation_context: Option<String>,
    /// Whether this resource has been marked for cleanup.
    pub marked_for_cleanup: bool,
}

impl ResourceMetadata {
    /// Create new resource metadata.
    pub fn new(resource_type: ResourceType, label: String) -> Self {
        Self {
            id: ResourceId::next(),
            resource_type,
            size: None,
            label,
            created_at: Instant::now(),
            last_accessed: Instant::now(),
            creation_context: None,
            marked_for_cleanup: false,
        }
    }
    
    /// Set the size of the resource.
    pub fn with_size(mut self, size: usize) -> Self {
        self.size = Some(size);
        self
    }
    
    /// Set the creation context.
    pub fn with_context(mut self, context: String) -> Self {
        self.creation_context = Some(context);
        self
    }
    
    /// Update the last accessed timestamp.
    pub fn touch(&mut self) {
        self.last_accessed = Instant::now();
    }
    
    /// Get the age of this resource.
    pub fn age(&self) -> Duration {
        self.created_at.elapsed()
    }
    
    /// Get time since last access.
    pub fn idle_time(&self) -> Duration {
        self.last_accessed.elapsed()
    }
}

/// Information about a detected leak.
#[derive(Debug, Clone)]
pub struct LeakInfo {
    /// The leaked resource metadata.
    pub resource: ResourceMetadata,
    /// How long the resource has been alive.
    pub age: Duration,
    /// How long since last access.
    pub idle_time: Duration,
    /// Severity of the leak (1-5, 5 being most severe).
    pub severity: u8,
    /// Suggested action.
    pub suggestion: String,
}

/// Statistics about memory usage.
#[derive(Debug, Clone, Default)]
pub struct MemoryStats {
    /// Total bytes allocated.
    pub total_allocated: usize,
    /// Total bytes freed.
    pub total_freed: usize,
    /// Current active allocations.
    pub active_allocations: usize,
    /// Peak allocated bytes.
    pub peak_allocated: usize,
    /// Number of resources by type.
    pub resources_by_type: HashMap<ResourceType, usize>,
    /// Number of leaks detected.
    pub leaks_detected: usize,
    /// Number of resources cleaned up.
    pub resources_cleaned: usize,
}

/// Resource tracker that maintains metadata about all tracked resources.
pub struct ResourceTracker {
    /// Tracked resources by ID.
    resources: RwLock<HashMap<ResourceId, ResourceMetadata>>,
    /// Statistics.
    stats: RwLock<MemoryStats>,
    /// Enable creation context capture.
    capture_context: AtomicBool,
    /// Resources marked for cleanup.
    cleanup_queue: Mutex<VecDeque<ResourceId>>,
}

impl ResourceTracker {
    /// Create a new resource tracker.
    pub fn new() -> Self {
        Self {
            resources: RwLock::new(HashMap::new()),
            stats: RwLock::new(MemoryStats::default()),
            capture_context: AtomicBool::new(false),
            cleanup_queue: Mutex::new(VecDeque::new()),
        }
    }
    
    /// Enable or disable creation context capture.
    pub fn set_capture_context(&self, enabled: bool) {
        self.capture_context.store(enabled, Ordering::Relaxed);
    }
    
    /// Track a new resource.
    pub fn track(&self, mut metadata: ResourceMetadata) -> ResourceId {
        let id = metadata.id;
        
        // Capture context if enabled
        if self.capture_context.load(Ordering::Relaxed) {
            metadata.creation_context = Some(capture_stack_trace());
        }
        
        // Update stats
        {
            let mut stats = self.stats.write().unwrap();
            stats.active_allocations += 1;
            if let Some(size) = metadata.size {
                stats.total_allocated += size;
                if stats.total_allocated - stats.total_freed > stats.peak_allocated {
                    stats.peak_allocated = stats.total_allocated - stats.total_freed;
                }
            }
            *stats.resources_by_type
                .entry(metadata.resource_type)
                .or_insert(0) += 1;
        }
        
        // Store metadata
        self.resources.write().unwrap().insert(id, metadata);
        
        id
    }
    
    /// Update a tracked resource.
    pub fn update<F>(&self, id: ResourceId, f: F) 
    where
        F: FnOnce(&mut ResourceMetadata)
    {
        if let Some(resource) = self.resources.write().unwrap().get_mut(&id) {
            f(resource);
        }
    }
    
    /// Mark a resource as accessed.
    pub fn touch(&self, id: ResourceId) {
        self.update(id, |r| r.touch());
    }
    
    /// Untrack a resource (mark for cleanup).
    pub fn untrack(&self, id: ResourceId) {
        let mut resources = self.resources.write().unwrap();
        if let Some(metadata) = resources.remove(&id) {
            // Update stats
            let mut stats = self.stats.write().unwrap();
            stats.active_allocations -= 1;
            if let Some(size) = metadata.size {
                stats.total_freed += size;
            }
            *stats.resources_by_type
                .entry(metadata.resource_type)
                .or_insert(0) = stats.resources_by_type
                    .get(&metadata.resource_type)
                    .copied()
                    .unwrap_or(0)
                    .saturating_sub(1);
        }
    }
    
    /// Get metadata for a resource.
    pub fn get(&self, id: ResourceId) -> Option<ResourceMetadata> {
        self.resources.read().unwrap().get(&id).cloned()
    }
    
    /// Detect potential leaks.
    pub fn detect_leaks(&self, age_threshold: Duration, idle_threshold: Duration) -> Vec<LeakInfo> {
        let resources = self.resources.read().unwrap();
        let now = Instant::now();
        
        resources
            .values()
            .filter(|r| !r.marked_for_cleanup)
            .filter(|r| r.age() > age_threshold && r.idle_time() > idle_threshold)
            .map(|r| {
                let age = r.age();
                let idle_time = r.idle_time();
                
                // Calculate severity (1-5)
                let severity = calculate_severity(age, idle_time, r.size);
                
                // Generate suggestion
                let suggestion = generate_suggestion(r, age, idle_time);
                
                LeakInfo {
                    resource: r.clone(),
                    age,
                    idle_time,
                    severity,
                    suggestion,
                }
            })
            .collect()
    }
    
    /// Get current statistics.
    pub fn stats(&self) -> MemoryStats {
        self.stats.read().unwrap().clone()
    }
    
    /// Get total active resource count.
    pub fn active_count(&self) -> usize {
        self.resources.read().unwrap().len()
    }
    
    /// Mark old resources for cleanup.
    pub fn mark_idle_for_cleanup(&self, idle_threshold: Duration) -> usize {
        let mut resources = self.resources.write().unwrap();
        let mut cleanup_queue = self.cleanup_queue.lock().unwrap();
        let mut count = 0;
        
        for (id, resource) in resources.iter_mut() {
            if resource.idle_time() > idle_threshold && !resource.marked_for_cleanup {
                resource.marked_for_cleanup = true;
                cleanup_queue.push_back(*id);
                count += 1;
            }
        }
        
        count
    }
    
    /// Get resources marked for cleanup.
    pub fn get_cleanup_queue(&self) -> Vec<ResourceId> {
        self.cleanup_queue.lock().unwrap().iter().copied().collect()
    }
    
    /// Clear a resource from the cleanup queue.
    pub fn clear_from_cleanup(&self, id: ResourceId) {
        let mut queue = self.cleanup_queue.lock().unwrap();
        queue.retain(|&qid| qid != id);
    }
}

impl Default for ResourceTracker {
    fn default() -> Self {
        Self::new()
    }
}

/// Calculate leak severity based on age, idle time, and size.
fn calculate_severity(age: Duration, idle_time: Duration, size: Option<usize>) -> u8 {
    let mut severity = 1u8;
    
    // Age factor
    if age > Duration::from_secs(300) { // 5 minutes
        severity += 2;
    } else if age > Duration::from_secs(60) { // 1 minute
        severity += 1;
    }
    
    // Idle time factor
    if idle_time > Duration::from_secs(180) { // 3 minutes
        severity += 1;
    }
    
    // Size factor
    if let Some(size) = size {
        if size > 10 * 1024 * 1024 { // 10 MB
            severity += 1;
        }
    }
    
    severity.min(5)
}

/// Generate a suggestion for handling a leak.
fn generate_suggestion(resource: &ResourceMetadata, age: Duration, idle_time: Duration) -> String {
    match resource.resource_type {
        ResourceType::Buffer => {
            if idle_time > Duration::from_secs(60) {
                format!(
                    "Buffer '{}' has been idle for {:.1}s. Consider freeing or pooling.",
                    resource.label,
                    idle_time.as_secs_f64()
                )
            } else {
                format!(
                    "Buffer '{}' may be leaking. Check for missing deallocation.",
                    resource.label
                )
            }
        }
        ResourceType::Texture => {
            format!(
                "Texture '{}' has been allocated for {:.1}s. Verify texture lifecycle management.",
                resource.label,
                age.as_secs_f64()
            )
        }
        ResourceType::Pipeline => {
            "Pipeline cache may need LRU eviction. Consider reducing cache size.".to_string()
        }
        ResourceType::SharedMemory => {
            format!(
                "Shared memory '{}' may not be properly cleaned up in Drop. Verify cleanup on all code paths.",
                resource.label
            )
        }
        _ => {
            format!(
                "Resource '{}' of type {} may be leaking. Review lifecycle management.",
                resource.label,
                resource.resource_type.name()
            )
        }
    }
}

/// Capture a simple stack trace (best effort).
fn capture_stack_trace() -> String {
    // In a real implementation, use backtrace crate
    // For now, return a placeholder
    format!(
        "Stack trace capture at {:?}",
        Instant::now()
    )
}

/// Memory pressure level.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MemoryPressure {
    /// Memory usage is normal.
    Normal,
    /// Memory usage is elevated, consider cleanup.
    Warning,
    /// Memory usage is critical, aggressive cleanup needed.
    Critical,
}

impl MemoryPressure {
    /// Determine pressure level from utilization percentage.
    pub fn from_utilization(percent: f32) -> Self {
        if percent > 90.0 {
            MemoryPressure::Critical
        } else if percent > 75.0 {
            MemoryPressure::Warning
        } else {
            MemoryPressure::Normal
        }
    }
}

/// Configuration for the garbage collector.
#[derive(Debug, Clone)]
pub struct GCConfig {
    /// Enable automatic garbage collection.
    pub auto_gc: bool,
    /// Interval between automatic GC cycles.
    pub gc_interval: Duration,
    /// Age threshold for leak detection.
    pub leak_age_threshold: Duration,
    /// Idle threshold for resource cleanup.
    pub idle_threshold: Duration,
    /// Maximum memory usage before triggering GC (bytes).
    pub memory_limit: usize,
    /// Enable aggressive cleanup on high pressure.
    pub aggressive_on_pressure: bool,
    /// Maximum resources to clean in one cycle.
    pub max_cleanup_per_cycle: usize,
}

impl Default for GCConfig {
    fn default() -> Self {
        Self {
            auto_gc: true,
            gc_interval: Duration::from_secs(30),
            leak_age_threshold: Duration::from_secs(60),
            idle_threshold: Duration::from_secs(120),
            memory_limit: 1024 * 1024 * 1024, // 1 GB
            aggressive_on_pressure: true,
            max_cleanup_per_cycle: 100,
        }
    }
}

/// Main garbage collector for hypervisor resources.
pub struct MemoryGC {
    /// Resource tracker.
    tracker: Arc<ResourceTracker>,
    /// Configuration.
    config: RwLock<GCConfig>,
    /// GC thread handle.
    gc_thread: Mutex<Option<JoinHandle<()>>>,
    /// Shutdown flag.
    shutdown: AtomicBool,
    /// Last GC run time.
    last_gc: RwLock<Instant>,
    /// GC statistics.
    gc_stats: RwLock<GCStats>,
}

/// Statistics about GC operations.
#[derive(Debug, Clone, Default)]
pub struct GCStats {
    /// Number of GC cycles run.
    pub cycles: u64,
    /// Total resources cleaned.
    pub resources_cleaned: u64,
    /// Total bytes freed.
    pub bytes_freed: u64,
    /// Total time spent in GC.
    pub total_gc_time: Duration,
    /// Number of leaks detected.
    pub leaks_detected: u64,
}

impl MemoryGC {
    /// Create a new garbage collector.
    pub fn new(config: GCConfig) -> Self {
        Self {
            tracker: Arc::new(ResourceTracker::new()),
            config: RwLock::new(config),
            gc_thread: Mutex::new(None),
            shutdown: AtomicBool::new(false),
            last_gc: RwLock::new(Instant::now()),
            gc_stats: RwLock::new(GCStats::default()),
        }
    }
    
    /// Start automatic garbage collection.
    pub fn start(&self) {
        if !self.config.read().unwrap().auto_gc {
            return;
        }
        
        let tracker = Arc::clone(&self.tracker);
        let config = self.config.read().unwrap().clone();
        let shutdown = self.shutdown.clone();
        let last_gc = self.last_gc.clone();
        let gc_stats = self.gc_stats.clone();
        
        let handle = thread::spawn(move || {
            loop {
                if shutdown.load(Ordering::Relaxed) {
                    break;
                }
                
                thread::sleep(config.gc_interval);
                
                // Run GC cycle
                let start = Instant::now();
                let leaks = tracker.detect_leaks(
                    config.leak_age_threshold,
                    config.idle_threshold
                );
                
                let marked = tracker.mark_idle_for_cleanup(config.idle_threshold);
                
                // Update stats
                {
                    let mut stats = gc_stats.write().unwrap();
                    stats.cycles += 1;
                    stats.leaks_detected += leaks.len() as u64;
                    stats.resources_cleaned += marked as u64;
                    stats.total_gc_time += start.elapsed();
                }
                
                {
                    let mut lg = last_gc.write().unwrap();
                    *lg = Instant::now();
                }
            }
        });
        
        *self.gc_thread.lock().unwrap() = Some(handle);
    }
    
    /// Stop automatic garbage collection.
    pub fn stop(&self) {
        self.shutdown.store(true, Ordering::Relaxed);
        
        if let Some(handle) = self.gc_thread.lock().unwrap().take() {
            let _ = handle.join();
        }
    }
    
    /// Run a manual GC cycle.
    pub fn run_gc(&self) -> GCResult {
        let start = Instant::now();
        let config = self.config.read().unwrap().clone();
        
        // Detect leaks
        let leaks = self.tracker.detect_leaks(
            config.leak_age_threshold,
            config.idle_threshold
        );
        
        // Mark idle resources
        let marked = self.tracker.mark_idle_for_cleanup(config.idle_threshold);
        
        // Update stats
        {
            let mut stats = self.gc_stats.write().unwrap();
            stats.cycles += 1;
            stats.leaks_detected += leaks.len() as u64;
            stats.resources_cleaned += marked as u64;
            stats.total_gc_time += start.elapsed();
        }
        
        {
            let mut lg = self.last_gc.write().unwrap();
            *lg = Instant::now();
        }
        
        GCResult {
            leaks_detected: leaks.len(),
            resources_marked: marked,
            gc_time: start.elapsed(),
            leaks,
        }
    }
    
    /// Track a new resource.
    pub fn track(&self, metadata: ResourceMetadata) -> ResourceId {
        self.tracker.track(metadata)
    }
    
    /// Untrack a resource.
    pub fn untrack(&self, id: ResourceId) {
        self.tracker.untrack(id);
    }
    
    /// Get the resource tracker.
    pub fn tracker(&self) -> &Arc<ResourceTracker> {
        &self.tracker
    }
    
    /// Get GC statistics.
    pub fn stats(&self) -> GCStats {
        self.gc_stats.read().unwrap().clone()
    }
    
    /// Get memory statistics.
    pub fn memory_stats(&self) -> MemoryStats {
        self.tracker.stats()
    }
    
    /// Check current memory pressure.
    pub fn pressure(&self) -> MemoryPressure {
        let stats = self.tracker.stats();
        let config = self.config.read().unwrap();
        
        let current_usage = stats.total_allocated - stats.total_freed;
        let utilization = (current_usage as f64 / config.memory_limit as f64) * 100.0;
        
        MemoryPressure::from_utilization(utilization as f32)
    }
}

impl Drop for MemoryGC {
    fn drop(&mut self) {
        self.stop();
    }
}

/// Result of a GC cycle.
#[derive(Debug)]
pub struct GCResult {
    /// Number of leaks detected.
    pub leaks_detected: usize,
    /// Number of resources marked for cleanup.
    pub resources_marked: usize,
    /// Time spent in GC.
    pub gc_time: Duration,
    /// Detected leaks.
    pub leaks: Vec<LeakInfo>,
}

/// RAII guard for tracked resources.
pub struct TrackedResource {
    id: ResourceId,
    tracker: Arc<ResourceTracker>,
}

impl TrackedResource {
    /// Create a new tracked resource.
    pub fn new(tracker: Arc<ResourceTracker>, metadata: ResourceMetadata) -> Self {
        let id = tracker.track(metadata);
        Self { id, tracker }
    }
    
    /// Get the resource ID.
    pub fn id(&self) -> ResourceId {
        self.id
    }
    
    /// Mark the resource as accessed.
    pub fn touch(&self) {
        self.tracker.touch(self.id);
    }
}

impl Drop for TrackedResource {
    fn drop(&mut self) {
        self.tracker.untrack(self.id);
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_resource_tracking() {
        let tracker = ResourceTracker::new();
        
        let metadata = ResourceMetadata::new(ResourceType::Buffer, "test_buffer".to_string())
            .with_size(1024);
        
        let id = tracker.track(metadata);
        
        assert!(tracker.get(id).is_some());
        assert_eq!(tracker.active_count(), 1);
        
        tracker.untrack(id);
        
        assert!(tracker.get(id).is_none());
        assert_eq!(tracker.active_count(), 0);
    }
    
    #[test]
    fn test_leak_detection() {
        let tracker = ResourceTracker::new();
        
        // Create an old resource
        let metadata = ResourceMetadata::new(ResourceType::Buffer, "old_buffer".to_string())
            .with_size(1024);
        
        tracker.track(metadata);
        
        // Wait a bit
        thread::sleep(Duration::from_millis(100));
        
        // Detect leaks with very low thresholds
        let leaks = tracker.detect_leaks(
            Duration::from_millis(50),
            Duration::from_millis(50)
        );
        
        assert_eq!(leaks.len(), 1);
        assert_eq!(leaks[0].resource.label, "old_buffer");
    }
    
    #[test]
    fn test_gc_basic() {
        let config = GCConfig {
            auto_gc: false,
            ..Default::default()
        };
        
        let gc = MemoryGC::new(config);
        
        // Track some resources
        let metadata1 = ResourceMetadata::new(ResourceType::Buffer, "buffer1".to_string());
        let metadata2 = ResourceMetadata::new(ResourceType::Texture, "texture1".to_string());
        
        gc.track(metadata1);
        gc.track(metadata2);
        
        // Run GC
        let result = gc.run_gc();
        
        assert_eq!(gc.memory_stats().active_allocations, 2);
    }
}
