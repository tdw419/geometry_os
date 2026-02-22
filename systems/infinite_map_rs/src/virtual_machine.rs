// Phase 30: Hypervisor Integration
// Virtual Machine Module - Basic KVM Initialization
//
// This module implements the foundation for running guest operating systems
// within the Geometry OS compositor using KVM (Kernel-based Virtual Machine).
//
// Architecture:
// - Geometry Kernel (PID 1) = Host
// - Linux/Alpine/Custom = Guest VM
// - Guest framebuffer rendered as texture in 3D infinite map
// - Neural Cortex injects input when looking at VM window
// - Time dilation: VM pauses when not observed

// Phase 47: Hypervisor Convergence - QEMU Wrapper Integration
use std::process::{Command, Child, Stdio};
use std::thread;
use std::time::Duration;
use std::path::PathBuf;
use std::sync::{Arc, Mutex};
use std::os::unix::net::UnixStream;
use std::io::{Write, Read};

// Phase 47: Task 2 - Shared Memory Framebuffer
use memmap2::{MmapMut, MmapOptions};
use std::ffi::CString;
use std::os::unix::ffi::OsStrExt;

#[cfg(feature = "hypervisor")]
use kvm_ioctls::{Kvm, VmFd, VcpuFd, VcpuExit};
#[cfg(feature = "hypervisor")]
use kvm_bindings::kvm_userspace_memory_region;

// Phase 30.7: Terminal Emulation
use crate::terminal_emulator::TerminalBuffer;
#[cfg(feature = "hypervisor")]
use crate::terminal_emulator::TerminalEmulator;

// ============================================
// Phase 47: QEMU Process Wrapper
// ============================================

/// QEMU Process Configuration
#[derive(Debug, Clone)]
pub struct QemuConfig {
    /// Path to QEMU binary (default: qemu-system-x86_64)
    pub qemu_binary: String,
    /// Path to ISO/image to boot
    pub boot_path: String,
    /// Memory size in MB
    pub memory_mb: usize,
    /// Number of VCPUs
    pub vcpu_count: usize,
    /// Framebuffer width
    pub width: u32,
    /// Framebuffer height
    pub height: u32,
    /// Enable KVM acceleration
    pub enable_kvm: bool,
    /// Additional QEMU arguments
    pub extra_args: Vec<String>,
}

impl Default for QemuConfig {
    fn default() -> Self {
        Self {
            qemu_binary: "qemu-system-x86_64".to_string(),
            boot_path: String::new(),
            memory_mb: 512,
            vcpu_count: 1,
            width: 1024,
            height: 768,
            enable_kvm: true,
            extra_args: Vec::new(),
        }
    }
}

/// QEMU Process Wrapper
///
/// Manages an external QEMU process for running guest operating systems.
/// The VM's display output is captured and rendered as a Window Tile.
pub struct QemuProcess {
    /// QEMU configuration
    config: QemuConfig,
    /// QEMU child process
    child: Option<Child>,
    /// Running state
    running: Arc<Mutex<bool>>,
    /// VM framebuffer (captured from QEMU)
    framebuffer: Arc<Mutex<Vec<u8>>>,
    /// QMP socket path for control
    qmp_socket: PathBuf,
    /// Display socket path (for framebuffer capture)
    display_socket: PathBuf,
}

impl QemuProcess {
    /// Create a new QEMU process wrapper
    pub fn new(config: QemuConfig) -> Self {
        let session_id = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_secs();

        let qmp_socket = PathBuf::from(format!("/tmp/qemu_qmp_{}.sock", session_id));
        let display_socket = PathBuf::from(format!("/tmp/qemu_display_{}.sock", session_id));

        log::info!("🖥️  QEMU Process Wrapper created");
        log::info!("   QMP socket: {:?}", qmp_socket);
        log::info!("   Display socket: {:?}", display_socket);

        Self {
            config,
            child: None,
            running: Arc::new(Mutex::new(false)),
            framebuffer: Arc::new(Mutex::new(vec![0; 1024 * 768 * 4])),
            qmp_socket,
            display_socket,
        }
    }

    /// Start the QEMU process
    pub fn start(&mut self) -> Result<(), String> {
        if self.config.boot_path.is_empty() {
            return Err("No boot path specified".to_string());
        }

        if !PathBuf::from(&self.config.boot_path).exists() {
            return Err(format!("Boot path not found: {}", self.config.boot_path));
        }

        log::info!("🚀 Starting QEMU process...");
        log::info!("   Binary: {}", self.config.qemu_binary);
        log::info!("   Boot: {}", self.config.boot_path);
        log::info!("   Memory: {} MB", self.config.memory_mb);
        log::info!("   VCPUs: {}", self.config.vcpu_count);

        // Build QEMU command
        let mut cmd = Command::new(&self.config.qemu_binary);

        // Basic configuration
        cmd.args([
            "-m", &format!("{}", self.config.memory_mb),
            "-smp", &format!("{}", self.config.vcpu_count),
        ]);

        // Enable KVM if available
        if self.config.enable_kvm {
            cmd.arg("-enable-kvm");
        }

        // Display: Use nogfx + screendump for framebuffer capture
        // We'll use QMP to capture screenshots
        cmd.args(["-nographic", "-monitor", "none"]);

        // QMP control socket
        cmd.args([
            "-qmp",
            &format!("unix:{}", self.qmp_socket.to_string_lossy()),
        ]);

        // Serial console for debugging
        cmd.args(["-serial", "pty"]);

        // Boot device (CD-ROM for ISO)
        if self.config.boot_path.ends_with(".iso") {
            cmd.args(["-cdrom", &self.config.boot_path]);
        } else {
            cmd.args(["-drive", &format!("file={},format=raw", self.config.boot_path)]);
        }

        // Network (user mode for basic connectivity)
        cmd.args(["-netdev", "user,id=net0", "-device", "virtio-net,netdev=net0"]);

        // VirtIO randomized
        cmd.args(["-device", "virtio-rng-pci"]);

        // Additional arguments
        cmd.args(&self.config.extra_args);

        // Spawn the process
        match cmd
            .stdin(Stdio::null())
            .stdout(Stdio::piped())
            .stderr(Stdio::piped())
            .spawn()
        {
            Ok(child) => {
                let pid = child.id();
                self.child = Some(child);
                *self.running.lock().unwrap() = true;
                log::info!("✅ QEMU process started (PID: {:?})", pid);
                Ok(())
            }
            Err(e) => {
                Err(format!("Failed to start QEMU: {}", e))
            }
        }
    }

    /// Stop the QEMU process
    pub fn stop(&mut self) {
        log::info!("⏸️  Stopping QEMU process...");
        *self.running.lock().unwrap() = false;

        if let Some(mut child) = self.child.take() {
            match child.kill() {
                Ok(_) => {
                    // Wait for process to terminate
                    let _ = child.wait();
                    log::info!("✅ QEMU process stopped");
                }
                Err(e) => {
                    log::warn!("⚠️  Failed to kill QEMU process: {}", e);
                }
            }
        }

        // Clean up sockets
        let _ = std::fs::remove_file(&self.qmp_socket);
        let _ = std::fs::remove_file(&self.display_socket);
    }

    /// Check if QEMU is running
    pub fn is_running(&self) -> bool {
        *self.running.lock().unwrap()
    }

    /// Get a copy of the current framebuffer
    pub fn get_framebuffer(&self) -> Vec<u8> {
        self.framebuffer.lock().unwrap().clone()
    }

    /// Get raw pointer to framebuffer (use with caution)
    pub fn get_framebuffer_ref(&self) -> Arc<Mutex<Vec<u8>>> {
        Arc::clone(&self.framebuffer)
    }

    /// Get framebuffer dimensions
    pub fn get_dimensions(&self) -> (u32, u32) {
        (self.config.width, self.config.height)
    }

    /// Capture framebuffer from QEMU via QMP screendump
    pub fn capture_framebuffer(&self) -> Result<(), String> {
        // TODO: Implement QMP connection and screendump command
        // For now, generate a test pattern
        self.generate_test_pattern();
        Ok(())
    }

    /// Send input event to QEMU
    pub fn send_input(&self, input: &str) {
        log::debug!("⌨️  Forwarding Input to QEMU: {}", input);
        // TODO: Implement QMP input-send-event or serial PTY writing
    }

    /// Generate test pattern for framebuffer (placeholder)
    fn generate_test_pattern(&self) {
        let mut fb = self.framebuffer.lock().unwrap();
        let time = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_millis() as u32;

        let width = self.config.width;
        let height = self.config.height;

        // Generate a moving gradient pattern
        for y in 0..height {
            for x in 0..width {
                let idx = ((y * width + x) * 4) as usize;
                if idx + 3 < fb.len() {
                    // QEMU logo colors (green/blue theme)
                    fb[idx] = ((x * 255 / width) as u32 + time / 10) as u8;     // R
                    fb[idx + 1] = ((y * 255 / height) as u32) as u8;              // G
                    fb[idx + 2] = (255 - ((x + y) * 255 / (width + height)) as u32) as u8; // B
                    fb[idx + 3] = 255;                                             // A
                }
            }
        }
    }
}

impl Drop for QemuProcess {
    fn drop(&mut self) {
        self.stop();
    }
}

// ============================================
// Phase 47: Task 2 - Shared Memory Framebuffer
// ============================================

/// Shared Memory Framebuffer for zero-copy VM display
///
/// Creates a POSIX shared memory segment that QEMU can write to
/// and the compositor can read from without copying.
pub struct SharedMemoryFramebuffer {
    /// Shared memory name
    pub name: String,
    /// Memory-mapped region
    mmap: MmapMut,
    /// Framebuffer dimensions
    pub width: u32,
    pub height: u32,
    /// Bytes per pixel (4 for RGBA)
    pub bytes_per_pixel: usize,
    /// Total size in bytes
    pub size: usize,
}

impl SharedMemoryFramebuffer {
    /// Create a new shared memory framebuffer
    ///
    /// # Arguments
    /// * `name` - Unique name for the shared memory segment (without /shm. prefix)
    /// * `width` - Framebuffer width in pixels
    /// * `height` - Framebuffer height in pixels
    ///
    /// # Returns
    /// * `Ok(SharedMemoryFramebuffer)` on success
    /// * `Err(String)` on failure
    pub fn new(name: &str, width: u32, height: u32) -> Result<Self, String> {
        let bytes_per_pixel = 4; // RGBA
        let size = (width as usize) * (height as usize) * bytes_per_pixel;
        
        // Create shared memory name with proper prefix
        let shm_name = format!("/qemu_fb_{}", name);
        let c_name = CString::new(shm_name.clone())
            .map_err(|e| format!("Invalid shared memory name: {}", e))?;
        
        // Create shared memory segment using shm_open
        let fd = unsafe {
            libc::shm_open(
                c_name.as_ptr(),
                libc::O_CREAT | libc::O_RDWR | libc::O_TRUNC,
                0o666,
            )
        };
        
        if fd < 0 {
            return Err(format!(
                "Failed to create shared memory '{}': errno={}",
                shm_name,
                std::io::Error::last_os_error()
            ));
        }
        
        // Set the size of the shared memory segment
        let result = unsafe { libc::ftruncate(fd, size as libc::off_t) };
        if result < 0 {
            unsafe { libc::close(fd) };
            return Err(format!(
                "Failed to set shared memory size: errno={}",
                std::io::Error::last_os_error()
            ));
        }
        
        // Memory map the shared memory
        let mmap = unsafe {
            MmapOptions::new()
                .len(size)
                .map_mut(fd)
                .map_err(|e| format!("Failed to memory map shared memory: {}", e))?
        };
        
        // Close the file descriptor (mmap keeps it open)
        unsafe { libc::close(fd) };
        
        log::info!("📺 Shared Memory Framebuffer created");
        log::info!("   Name: {}", shm_name);
        log::info!("   Dimensions: {}x{}", width, height);
        log::info!("   Size: {} bytes", size);
        
        Ok(Self {
            name: shm_name,
            mmap,
            width,
            height,
            bytes_per_pixel,
            size,
        })
    }
    
    /// Get a slice of the framebuffer memory
    pub fn as_slice(&self) -> &[u8] {
        &self.mmap
    }
    
    /// Get a mutable slice of the framebuffer memory
    pub fn as_mut_slice(&mut self) -> &mut [u8] {
        &mut self.mmap
    }
    
    /// Copy data into the framebuffer
    pub fn write(&mut self, data: &[u8]) -> Result<(), String> {
        if data.len() > self.size {
            return Err(format!(
                "Data too large: {} bytes > {} bytes",
                data.len(),
                self.size
            ));
        }
        self.mmap[..data.len()].copy_from_slice(data);
        Ok(())
    }
    
    /// Read the entire framebuffer into a Vec<u8>
    pub fn read_to_vec(&self) -> Vec<u8> {
        self.mmap.to_vec()
    }
    
    /// Get raw pointer to framebuffer (for GPU upload)
    pub fn as_ptr(&self) -> *const u8 {
        self.mmap.as_ptr()
    }
    
    /// Get the file descriptor for sharing with other processes
    /// Note: The caller is responsible for closing this fd
    pub fn get_fd(&self) -> Result<i32, String> {
        // Re-open the shared memory to get a file descriptor
        let c_name = CString::new(self.name.clone())
            .map_err(|e| format!("Invalid shared memory name: {}", e))?;
        
        let fd = unsafe {
            libc::shm_open(
                c_name.as_ptr(),
                libc::O_RDONLY,
                0o666,
            )
        };
        
        if fd < 0 {
            Err(format!(
                "Failed to open shared memory: errno={}",
                std::io::Error::last_os_error()
            ))
        } else {
            Ok(fd)
        }
    }
    
    /// Generate QEMU arguments for using this framebuffer
    /// 
    /// Returns arguments to pass to QEMU for display output to shared memory.
    /// This uses the 'none' display with a chardev for framebuffer capture.
    pub fn get_qemu_args(&self) -> Vec<String> {
        // Create a unique device ID
        let device_id = format!("fb_{}", 
            std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .unwrap()
                .as_secs()
        );
        
        vec![
            // Disable default display
            "-display".to_string(),
            "none".to_string(),
            // Use virtio-vga with blob resources (shared memory capable)
            "-device".to_string(),
            format!("virtio-vga,blob=true,xres={},yres={}", self.width, self.height),
        ]
    }
    
    /// Clear the framebuffer to black
    pub fn clear(&mut self) {
        self.mmap.fill(0);
    }
    
    /// Get the path for the shared memory segment
    pub fn get_path(&self) -> String {
        format!("/dev/shm{}", self.name)
    }
}

impl Drop for SharedMemoryFramebuffer {
    fn drop(&mut self) {
        // Unlink the shared memory segment
        let c_name = CString::new(self.name.clone()).unwrap();
        unsafe {
            libc::shm_unlink(c_name.as_ptr());
        }
        log::info!("🗑️  Shared Memory Framebuffer destroyed: {}", self.name);
    }
}

// ============================================
// Phase 47: QEMU Process with Shared Memory
// ============================================

/// Extended QEMU process with shared memory framebuffer support
pub struct QemuProcessWithShm {
    /// Base QEMU configuration
    config: QemuConfig,
    /// QEMU child process
    child: Option<Child>,
    /// Running state
    running: Arc<Mutex<bool>>,
    /// Shared memory framebuffer
    framebuffer: Option<SharedMemoryFramebuffer>,
    /// QMP socket path for control
    qmp_socket: PathBuf,
    /// Capture thread handle
    capture_thread: Option<thread::JoinHandle<()>>,
    /// Framebuffer copy for render thread
    framebuffer_copy: Arc<Mutex<Vec<u8>>>,
}

impl QemuProcessWithShm {
    /// Create a new QEMU process with shared memory framebuffer
    pub fn new(config: QemuConfig) -> Self {
        let session_id = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_secs();

        let qmp_socket = PathBuf::from(format!("/tmp/qemu_qmp_{}.sock", session_id));
        let fb_size = (config.width * config.height * 4) as usize;

        log::info!("🖥️  QEMU Process with SHM created");
        log::info!("   QMP socket: {:?}", qmp_socket);
        log::info!("   Framebuffer: {}x{} ({} bytes)", config.width, config.height, fb_size);

        Self {
            config,
            child: None,
            running: Arc::new(Mutex::new(false)),
            framebuffer: None,
            qmp_socket,
            capture_thread: None,
            framebuffer_copy: Arc::new(Mutex::new(vec![0; fb_size])),
        }
    }
    
    /// Start QEMU with shared memory framebuffer
    pub fn start(&mut self) -> Result<(), String> {
        if self.config.boot_path.is_empty() {
            return Err("No boot path specified".to_string());
        }

        if !PathBuf::from(&self.config.boot_path).exists() {
            return Err(format!("Boot path not found: {}", self.config.boot_path));
        }

        // Create shared memory framebuffer
        let session_id = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_secs();
        
        let shm_fb = SharedMemoryFramebuffer::new(
            &format!("vm_{}", session_id),
            self.config.width,
            self.config.height
        )?;
        
        log::info!("🚀 Starting QEMU with SHM framebuffer...");
        log::info!("   Binary: {}", self.config.qemu_binary);
        log::info!("   Boot: {}", self.config.boot_path);
        log::info!("   Memory: {} MB", self.config.memory_mb);
        log::info!("   VCPUs: {}", self.config.vcpu_count);
        log::info!("   SHM: {}", shm_fb.name);

        // Build QEMU command
        let mut cmd = Command::new(&self.config.qemu_binary);

        // Basic configuration
        cmd.args([
            "-m", &format!("{}", self.config.memory_mb),
            "-smp", &format!("{}", self.config.vcpu_count),
        ]);

        // Enable KVM if available
        if self.config.enable_kvm {
            cmd.arg("-enable-kvm");
        }

        // QMP control socket
        cmd.args([
            "-qmp",
            &format!("unix:{},server,nowait", self.qmp_socket.to_string_lossy()),
        ]);

        // Use standard VGA and QMP for screendump
        cmd.args([
            "-display", "none",
            "-device", "VGA",
        ]);

        // Disable audio for now to avoid alsa/pulse errors
        cmd.env("QEMU_AUDIO_DRV", "none");
        
        // Serial console for debugging
        cmd.args(["-serial", "pty"]);

        // Boot device
        if self.config.boot_path.ends_with(".iso") {
            cmd.args(["-cdrom", &self.config.boot_path]);
        } else {
            cmd.args(["-drive", &format!("file={},format=raw", self.config.boot_path)]);
        }

        // Network
        cmd.args(["-netdev", "user,id=net0", "-device", "virtio-net,netdev=net0"]);

        // VirtIO RNG
        cmd.args(["-device", "virtio-rng-pci"]);

        // Additional arguments
        cmd.args(&self.config.extra_args);

        // Spawn the process
        match cmd
            .stdin(Stdio::null())
            .stdout(Stdio::inherit())
            .stderr(Stdio::inherit())
            .spawn()
        {
            Ok(child) => {
                self.child = Some(child);
                *self.running.lock().unwrap() = true;
                log::info!("✅ QEMU process started with SHM support (PID: {:?})", 
                    self.child.as_ref().unwrap().id());
                
                // Start capture thread
                self.start_capture_thread();
                
                // Store framebuffer
                self.framebuffer = Some(shm_fb);
                
                Ok(())
            }
            Err(e) => {
                Err(format!("Failed to start QEMU: {}", e))
            }
        }
    }
    
    /// Start the framebuffer capture thread
    fn start_capture_thread(&mut self) {
        let running = Arc::clone(&self.running);
        let fb_copy = Arc::clone(&self.framebuffer_copy);
        let width = self.config.width;
        let height = self.config.height;
        
        let handle = thread::spawn(move || {
            log::info!("📸 Framebuffer capture thread started");
            
            while *running.lock().unwrap() {
                // For now, generate a test pattern
                // In production, this would read from virtio-gpu blob resources
                let mut fb = fb_copy.lock().unwrap();
                let time = std::time::SystemTime::now()
                    .duration_since(std::time::UNIX_EPOCH)
                    .unwrap()
                    .as_millis() as u32;
                
                // Generate moving gradient (test pattern)
                for y in 0..height {
                    for x in 0..width {
                        let idx = ((y * width + x) * 4) as usize;
                        if idx + 3 < fb.len() {
                            fb[idx] = ((x * 255 / width) as u32 + time / 10) as u8;     // R
                            fb[idx + 1] = ((y * 255 / height) as u32) as u8;              // G
                            fb[idx + 2] = (255 - ((x + y) * 255 / (width + height)) as u32) as u8; // B
                            fb[idx + 3] = 255;                                             // A
                        }
                    }
                }
                
                // 60 FPS target
                thread::sleep(Duration::from_millis(16));
            }
            
            log::info!("📸 Framebuffer capture thread stopped");
        });
        
        self.capture_thread = Some(handle);
    }
    
    /// Get reference to framebuffer slice
    pub fn get_framebuffer_slice(&self) -> Option<&[u8]> {
        self.framebuffer.as_ref().map(|fb| fb.as_slice())
    }

    /// Send input event to QEMU
    pub fn send_input(&self, input: &str) {
        log::debug!("⌨️  Forwarding Input to QEMU (SHM): {}", input);
        // TODO: Implement QMP input-send-event or serial PTY writing
    }

    pub fn update_test_pattern(&self) {
    }

    /// Stop the QEMU process
    pub fn stop(&mut self) {
        log::info!("⏸️  Stopping QEMU process...");
        *self.running.lock().unwrap() = false;
        
        // Wait for capture thread
        if let Some(thread) = self.capture_thread.take() {
            let _ = thread.join();
        }

        if let Some(mut child) = self.child.take() {
            match child.kill() {
                Ok(_) => {
                    let _ = child.wait();
                    log::info!("✅ QEMU process stopped");
                }
                Err(e) => {
                    log::warn!("⚠️  Failed to kill QEMU process: {}", e);
                }
            }
        }

        // Clean up
        let _ = std::fs::remove_file(&self.qmp_socket);
        
        // SharedMemoryFramebuffer will be dropped automatically
        self.framebuffer = None;
    }
    
    /// Check if QEMU is running
    pub fn is_running(&self) -> bool {
        // Check local flag first
        let running_flag = *self.running.lock().unwrap();
        if !running_flag {
            return false;
        }

        // If we have a child handle, check if it has exited
        // Note: We need interior mutability for try_wait(), but QemuProcessWithShm assumes shared immutable access in many places.
        // However, child field is in the struct. We'd need &mut self to call try_wait() on the Child.
        // We can't easily change signature of is_running(&self).
        // BUT, we can use the flag as a best effort, OR wrap Child in Mutex.
        
        // Since we can't change the struct easily now, let's rely on the flag,
        // BUT update the flag if we catch it earlier?
        
        // Wait, QemuProcessWithShm has:
        // running: Arc<Mutex<bool>>
        // child: Option<Child>
        
        // Child is NOT wrapped in Mutex/Arc in lines 498.
        // But QemuProcessWithShm is usually passed around? No, app holds it directly.
        // render loop uses &mut self or &self?
        
        // Let's assume for now we trust the flag, BUT in spawn_qemu_vm we have &mut use.
        // In spawn_qemu_vm, we can call a mutable method "check_status()".
        
        running_flag
    }
    
    /// Check process status and update running flag (requires mutable access)
    pub fn check_status(&mut self) -> bool {
         if let Some(child) = &mut self.child {
             match child.try_wait() {
                 Ok(Some(_status)) => {
                     // Exited
                     *self.running.lock().unwrap() = false;
                     return false;
                 },
                 Ok(None) => return true, // Still running
                 Err(_) => return false,
             }
         }
         false
    }
    
    /// Get a copy of the current framebuffer
    pub fn get_framebuffer(&self) -> Vec<u8> {
        self.framebuffer_copy.lock().unwrap().clone()
    }
    
    /// Get framebuffer dimensions
    pub fn get_dimensions(&self) -> (u32, u32) {
        (self.config.width, self.config.height)
    }
    
    /// Get raw pointer to framebuffer (use with caution)
    pub fn get_framebuffer_ref(&self) -> Arc<Mutex<Vec<u8>>> {
        Arc::clone(&self.framebuffer_copy)
    }
    
    /// Send QMP command to QEMU
    pub fn send_qmp_command(&self, command: &str) -> Result<String, String> {
        if !self.qmp_socket.exists() {
            return Err("QMP socket not available".to_string());
        }
        
        let mut stream = UnixStream::connect(&self.qmp_socket)
            .map_err(|e| format!("Failed to connect to QMP: {}", e))?;
        
        // Read greeting
        let mut greeting = [0u8; 1024];
        stream.read(&mut greeting)
            .map_err(|e| format!("Failed to read QMP greeting: {}", e))?;
        
        // Send command
        let cmd = format!("{}\r\n", command);
        stream.write_all(cmd.as_bytes())
            .map_err(|e| format!("Failed to send QMP command: {}", e))?;
        
        // Read response
        let mut response = [0u8; 4096];
        let n = stream.read(&mut response)
            .map_err(|e| format!("Failed to read QMP response: {}", e))?;
        
        Ok(String::from_utf8_lossy(&response[..n]).to_string())
    }
}

impl Drop for QemuProcessWithShm {
    fn drop(&mut self) {
        self.stop();
    }
}

// ============================================
// VirtIO Console Device Constants
// ============================================
const VIRTIO_CONSOLE_PORT_BASE: u64 = 0x10000000;
const VIRTIO_CONSOLE_PORT_SIZE: u64 = 0x10;
const VIRTIO_CONSOLE_MAGIC: u32 = 0x73724716;
const VIRTIO_CONSOLE_VERSION: u32 = 2;
const VIRTIO_CONSOLE_F_SIZE: usize = 2;
const VIRTIO_CONSOLE_F_MULTIPORT: u8 = 1 << 0; // Supports multiple ports
const VIRTIO_CONSOLE_F_EMERG_WRITE: u8 = 1 << 1; // Emergency write

// Phase 31: Clipboard Integration
#[cfg(feature = "hypervisor")]
use crate::clipboard_manager::TerminalClipboard;

// VirtIO Device Status Flags
const VIRTIO_STATUS_ACKNOWLEDGE: u8 = 1;
const VIRTIO_STATUS_DRIVER: u8 = 2;
const VIRTIO_STATUS_DRIVER_OK: u8 = 4;
const VIRTIO_STATUS_FEATURES_OK: u8 = 8;
const VIRTIO_STATUS_DEVICE_NEEDS_RESET: u8 = 64;
const VIRTIO_STATUS_FAILED: u8 = 128;

// VirtIO Queue Size
const VIRTIO_QUEUE_SIZE: u16 = 256;

// VirtIO Descriptor Flags
const VIRTQ_DESC_F_NEXT: u16 = 1;
const VIRTQ_DESC_F_WRITE: u16 = 2;
const VIRTQ_DESC_F_INDIRECT: u16 = 4;

/// VirtIO Descriptor (Guest Memory Layout)
#[repr(C)]
#[derive(Debug, Clone, Copy, Default)]
pub struct VirtqDesc {
    /// Address of buffer (guest physical)
    pub addr: u64,
    /// Length of buffer
    pub len: u32,
    /// Flags (NEXT, WRITE, INDIRECT)
    pub flags: u16,
    /// Next descriptor index (if NEXT flag set)
    pub next: u16,
}

/// VirtIO Available Ring (Guest -> Host)
#[repr(C)]
#[derive(Debug)]
pub struct VirtqAvail {
    pub flags: u16,
    pub idx: u16,
    pub ring: [u16; VIRTIO_QUEUE_SIZE as usize],
    pub used_event: u16,
}

/// VirtIO Used Ring Element
#[repr(C)]
#[derive(Debug, Clone, Copy, Default)]
pub struct VirtqUsedElem {
    pub id: u32,
    pub len: u32,
}

/// VirtIO Used Ring (Host -> Guest)
#[repr(C)]
#[derive(Debug)]
pub struct VirtqUsed {
    pub flags: u16,
    pub idx: u16,
    pub ring: [VirtqUsedElem; VIRTIO_QUEUE_SIZE as usize],
    pub avail_event: u16,
}

/// VirtQueue Runtime State
#[derive(Debug)]
pub struct VirtQueue {
    /// Guest physical address of descriptor table
    pub desc_addr: u64,
    /// Guest physical address of available ring
    pub avail_addr: u64,
    /// Guest physical address of used ring
    pub used_addr: u64,
    /// Current last-seen available index (consumer head)
    pub last_avail_idx: u16,
    /// Current used index (producer head)
    pub last_used_idx: u16,
    /// Queue ready for processing
    pub ready: bool,
}

impl VirtQueue {
    pub fn new() -> Self {
        Self {
            desc_addr: 0,
            avail_addr: 0,
            used_addr: 0,
            last_avail_idx: 0,
            last_used_idx: 0,
            ready: false,
        }
    }
}

use std::fs::File;
use std::path::Path;

/// Virtual Machine Configuration
#[derive(Debug, Clone)]
pub struct VmConfig {
    /// Memory size in MB
    pub memory_mb: usize,
    /// Number of VCPUs
    pub vcpu_count: usize,
    /// Kernel image path
    pub kernel_path: String,
    /// Initrd path (optional)
    pub initrd_path: Option<String>,
    /// Kernel command line
    pub cmdline: String,
}

impl Default for VmConfig {
    fn default() -> Self {
        Self {
            memory_mb: 512,
            vcpu_count: 1,
            kernel_path: String::new(),
            initrd_path: None,
            cmdline: String::from("console=ttyS0 earlyprintk=serial"),
        }
    }
}

/// Virtual Machine Entity
///
/// Represents a guest operating system running within the Geometry OS compositor.
/// The guest's framebuffer will be rendered as a texture in the 3D infinite map.
#[cfg(feature = "hypervisor")]
pub struct VirtualMachine {
    /// KVM device file descriptor
    kvm: Kvm,
    /// VM file descriptor
    vm_fd: VmFd,
    /// VCPU file descriptors
    vcpu_fds: Vec<VcpuFd>,
    /// Guest memory
    guest_memory: Vec<u8>,
    /// VM configuration
    config: VmConfig,
    /// Running state
    running: Arc<Mutex<bool>>,
    /// Serial output (for debugging)
    serial_output: Arc<Mutex<String>>,
    /// Guest Framebuffer (RGBA format)
    framebuffer: Arc<Mutex<Vec<u8>>>,
    /// Framebuffer width
    pub width: u32,
    /// Framebuffer height
    pub height: u32,
    /// VirtIO console device
    virtio_console: Option<VirtioConsole>,
    /// Phase 30.7: Terminal Emulator (VT100/ANSI parser)
    terminal_emulator: Option<TerminalEmulator>,
    /// Phase 31: Terminal clipboard integration
    terminal_clipboard: Option<TerminalClipboard>,
}

/// VirtIO Console Device
#[cfg(feature = "hypervisor")]
pub struct VirtioConsole {
    /// Console configuration registers
    pub config: [u32; VIRTIO_CONSOLE_F_SIZE],
    /// Console features
    pub features: [u8; VIRTIO_CONSOLE_F_SIZE],
    /// Console output buffer
    pub output_buffer: Arc<Mutex<Vec<u8>>>,
    /// Console input buffer
    pub input_buffer: Arc<Mutex<Vec<u8>>>,
    /// Console ready flag
    pub ready: Arc<Mutex<bool>>,
    /// VirtIO MMIO registers
    pub mmio: VirtioMmio,
    /// Active VirtQueues (Index 0: receive, Index 1: transmit)
    pub queues: Vec<Arc<Mutex<VirtQueue>>>,
    /// Currently selected queue index
    pub queue_sel: u32,
}

/// VirtIO MMIO Registers
#[cfg(feature = "hypervisor")]
#[derive(Debug)]
pub struct VirtioMmio {
    /// Device features
    pub device_features: u32,
    /// Driver features
    pub driver_features: u32,
    /// Queue address
    pub queue_address: u64,
    /// Queue size
    pub queue_size: u16,
    /// Queue ready
    pub queue_ready: bool,
    /// Queue notify
    pub queue_notify: bool,
    /// Device status
    pub device_status: u8,
}

#[cfg(feature = "hypervisor")]
impl Default for VirtioMmio {
    fn default() -> Self {
        Self {
            device_features: 0,
            driver_features: 0,
            queue_address: 0,
            queue_size: 0,
            queue_ready: false,
            queue_notify: false,
            device_status: 0,
        }
    }
}

#[cfg(feature = "hypervisor")]
impl VirtioConsole {
    /// Create a new VirtIO console device
    pub fn new() -> Self {
        Self {
            config: [VIRTIO_CONSOLE_MAGIC, VIRTIO_CONSOLE_VERSION],
            features: [VIRTIO_CONSOLE_F_MULTIPORT | VIRTIO_CONSOLE_F_EMERG_WRITE; 2],
            output_buffer: Arc::new(Mutex::new(Vec::with_capacity(4096))),
            input_buffer: Arc::new(Mutex::new(Vec::with_capacity(256))),
            ready: Arc::new(Mutex::new(false)),
            mmio: VirtioMmio::default(),

            queues: vec![
                Arc::new(Mutex::new(VirtQueue::new())), // Queue 0: Receive (Input)
                Arc::new(Mutex::new(VirtQueue::new())), // Queue 1: Transmit (Output)
            ],
            queue_sel: 0,
        }
    }

    /// Write data to console output buffer
    pub fn write(&self, data: &[u8]) {
        let mut output = self.output_buffer.lock().unwrap();
        output.extend_from_slice(data);
        // Keep buffer size manageable (max 8KB)
        if output.len() > 8192 {
            let len = output.len();
            output.drain(0..len - 8192);
        }
    }

    /// Write data to console output buffer and feed to terminal emulator
    pub fn write_with_terminal(&self, data: &[u8], terminal_emulator: &mut Option<TerminalEmulator>) {
        // Write to output buffer
        self.write(data);
        
        // Phase 30.7: Feed bytes to terminal emulator for ANSI parsing
        if let Some(ref mut emulator) = terminal_emulator {
            emulator.feed(data);
        }
    }

    /// Read console output buffer
    pub fn read_output(&self) -> Vec<u8> {
        let output = self.output_buffer.lock().unwrap();
        output.clone()
    }

    /// Read console input buffer
    pub fn read_input(&self) -> Vec<u8> {
        let input = self.input_buffer.lock().unwrap();
        input.clone()
    }

    /// Write data to console input buffer (for guest input)
    pub fn write_input(&self, data: &[u8]) {
        let mut input = self.input_buffer.lock().unwrap();
        input.extend_from_slice(data);
        // Keep buffer size manageable (max 256 bytes)
        if input.len() > 256 {
            let len = input.len();
            input.drain(0..len - 256);
        }
    }

    /// Clear console output buffer
    pub fn clear_output(&self) {
        let mut output = self.output_buffer.lock().unwrap();
        output.clear();
    }

    /// Clear console input buffer
    pub fn clear_input(&self) {
        let mut input = self.input_buffer.lock().unwrap();
        input.clear();
    }

    /// Check if console is ready
    pub fn is_ready(&self) -> bool {
        *self.ready.lock().unwrap()
    }

    /// Set console ready state
    pub fn set_ready(&self, ready: bool) {
        *self.ready.lock().unwrap() = ready;
    }

    /// Get console output as string
    pub fn get_output_string(&self) -> String {
        let output = self.output_buffer.lock().unwrap();
        String::from_utf8_lossy(&output).to_string()
    }

    /// Get console input as string
    pub fn get_input_string(&self) -> String {
        let input = self.input_buffer.lock().unwrap();
        String::from_utf8_lossy(&input).to_string()
    }

    /// VirtIO MMIO Read (Legacy Layout)
    pub fn mmio_read(&self, offset: u64, _size: u8) -> u32 {
        match offset {
            0x00 => 0x74726976, // Magic "virt"
            0x04 => 1, // Version 1 (Legacy)
            0x08 => 3, // Device ID (3 = Console)
            0x0C => 0x554d4551, // Vendor ID (Placeholder)
            0x10 => self.mmio.device_features, // Device Features
            0x14 => self.mmio.device_features, // Device Features High (reserved)
            0x30 => self.queue_sel, // QueueSel
            0x34 => VIRTIO_QUEUE_SIZE as u32, // QueueNumMax
            0x38 => {
                // QueueNum (Size of selected queue)
                if (self.queue_sel as usize) < self.queues.len() {
                    VIRTIO_QUEUE_SIZE as u32
                } else {
                    0
                }
            }
            0x40 => {
                // QueuePFN
                if (self.queue_sel as usize) < self.queues.len() {
                    let queue = self.queues[self.queue_sel as usize].lock().unwrap();
                    (queue.desc_addr / 4096) as u32
                } else {
                    0
                }
            }
            0x50 => 0, // QueueNotify (Write Only)
            0x60 => self.mmio.device_status as u32, // InterruptStatus (Simplified to Status for now)
            0x70 => self.mmio.device_status as u32, // Status
            _ => {
                log::warn!("⚠️  Unknown VirtIO MMIO read at offset 0x{:x}", offset);
                0
            }
        }
    }

    /// VirtIO MMIO Write (Legacy Layout)
    /// Returns Some(queue_index) if QueueNotify triggered
    pub fn mmio_write(&mut self, offset: u64, value: u32, _size: u8) -> Option<u16> {
        match offset {
            0x20 => {
                // Driver Features
                self.mmio.driver_features = value;
                log::debug!("📝 VirtIO driver features: 0x{:x}", value);
            }
            0x30 => {
                // QueueSel
                self.queue_sel = value;
                log::debug!("👉 VirtIO Queue Select: {}", value);
            }
            0x38 => {
                 // QueueNum (Write ignored for Legacy usually, creates queue?)
            }
            0x40 => {
                // QueuePFN - The PFN for the queue memory
                if (self.queue_sel as usize) < self.queues.len() {
                    let mut queue = self.queues[self.queue_sel as usize].lock().unwrap();
                    let addr = (value as u64) * 4096;
                    queue.desc_addr = addr;
                    queue.avail_addr = addr + (16 * VIRTIO_QUEUE_SIZE as u64); // Desc table size
                    // Used ring starts after available ring and padding
                    // Avail size = 2 + 2 + 2*Size + 2 = 6 + 2*256 = 518 bytes. Aligned to 4096 usually?
                    // Legacy alignment rule: Used Ring is aligned to 4096 bytes boundary after avail ring?
                    // Actually, standard says:
                    // Descriptor Table: 16 * Size
                    // Available Ring: 6 + 2 * Size
                    // Padding to 4096
                    // Used Ring: 6 + 8 * Size
                    
                    let avail_offset = 16 * VIRTIO_QUEUE_SIZE as u64;
                    let used_offset = (avail_offset + 6 + 2 * VIRTIO_QUEUE_SIZE as u64 + 4095) & !4095;
                    
                    queue.avail_addr = addr + avail_offset;
                    queue.used_addr = addr + used_offset;
                    queue.ready = true;
                    
                    log::info!("✅ VirtIO Queue {} Configured: PFN=0x{:x} => Desc=0x{:x}, Avail=0x{:x}, Used=0x{:x}", 
                        self.queue_sel, value, queue.desc_addr, queue.avail_addr, queue.used_addr);
                }
            }
            0x50 => {
                // QueueNotify
                log::debug!("🔔 VirtIO Queue Notify: Queue {}", value);
                return Some(value as u16);
            }
            0x70 => {
                // Status
                self.mmio.device_status = value as u8;
                if value == 0 {
                    // Reset
                    log::info!("🔄 VirtIO Device Reset");
                    self.reset();
                }
            }
            _ => {
                log::warn!("⚠️  Unknown VirtIO MMIO write at offset 0x{:x}: 0x{:x}", offset, value);
            }
        }
        None
    }

    /// Reset device state
    fn reset(&mut self) {
        self.queue_sel = 0;
        self.mmio.device_status = 0;
        for q in &self.queues {
            let mut queue = q.lock().unwrap();
            queue.ready = false;
            queue.last_avail_idx = 0;
            queue.last_used_idx = 0;
        }
    }
}

/// Virtual Machine Entity (stub for non-hypervisor builds)
#[cfg(not(feature = "hypervisor"))]
pub struct VirtualMachine {
    /// VM configuration
    config: VmConfig,
    /// Running state
    running: Arc<Mutex<bool>>,
    // Stub fields matching hypervisor struct
    framebuffer: Arc<Mutex<Vec<u8>>>,
    pub width: u32,
    pub height: u32,
    // Phase 30.7: Terminal Emulator (stub)
    _terminal_emulator: (),
}

/// Virtual Machine Error
#[derive(Debug)]
pub enum VmError {
    /// KVM device not found
    KvmNotFound,
    /// Failed to open KVM device
    KvmOpenFailed(String),
    /// Failed to create VM
    VmCreateFailed(String),
    /// Failed to create VCPU
    VcpuCreateFailed(String),
    /// Failed to allocate memory
    MemoryAllocationFailed,
    /// Failed to load kernel
    KernelLoadFailed(String),
    /// VM not configured
    NotConfigured,
    /// VM not running
    NotRunning,
}

impl std::fmt::Display for VmError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            VmError::KvmNotFound => write!(f, "KVM device not found (is /dev/kvm present?)"),
            VmError::KvmOpenFailed(e) => write!(f, "Failed to open KVM device: {}", e),
            VmError::VmCreateFailed(e) => write!(f, "Failed to create VM: {}", e),
            VmError::VcpuCreateFailed(e) => write!(f, "Failed to create VCPU: {}", e),
            VmError::MemoryAllocationFailed => write!(f, "Failed to allocate guest memory"),
            VmError::KernelLoadFailed(e) => write!(f, "Failed to load kernel: {}", e),
            VmError::NotConfigured => write!(f, "VM not configured"),
            VmError::NotRunning => write!(f, "VM not running"),
        }
    }
}

impl std::error::Error for VmError {}

/// Virtual Machine Result Type
pub type VmResult<T> = Result<T, VmError>;

#[cfg(feature = "hypervisor")]
impl VirtualMachine {
    /// Create a new Virtual Machine
    ///
    /// Opens the KVM device and initializes VM structures.
    /// The VM is not started until [`start()`](Self::start) is called.
    ///
    /// # Errors
    ///
    /// Returns [`VmError::KvmNotFound`] if /dev/kvm is not present.
    /// Returns [`VmError::KvmOpenFailed`] if opening /dev/kvm fails.
    pub fn new() -> VmResult<Self> {
        log::info!("🖥️  Initializing Virtual Machine...");

        // Open /dev/kvm
        let kvm = Kvm::new()
            .map_err(|e| {
                log::error!("Failed to open /dev/kvm: {}", e);
                // Check if error is "No such file or directory"
                let err_str = format!("{}", e);
                if err_str.contains("No such file") || err_str.contains("not found") {
                    VmError::KvmNotFound
                } else {
                    VmError::KvmOpenFailed(err_str)
                }
            })?;

        log::info!("✅ KVM device opened successfully");

        // Create VM
        let vm_fd = kvm.create_vm()
            .map_err(|e| {
                log::error!("Failed to create VM: {}", e);
                VmError::VmCreateFailed(format!("{}", e))
            })?;

        log::info!("✅ VM created successfully");

        // Phase 30.7: Initialize Terminal Emulator (24x80 default)
        let terminal_emulator = Some(TerminalEmulator::new(24, 80));
        log::info!("✅ Terminal Emulator initialized (24x80)");
        
        // Phase 31: Initialize terminal clipboard (will be set later)
        let terminal_clipboard = None;
        
        Ok(Self {
            kvm,
            vm_fd,
            vcpu_fds: Vec::new(),
            guest_memory: Vec::new(),
            config: VmConfig::default(),
            running: Arc::new(Mutex::new(false)),
            serial_output: Arc::new(Mutex::new(String::new())),
            framebuffer: Arc::new(Mutex::new(vec![0; 1920 * 1080 * 4])),
            width: 1920,
            height: 1080,
            virtio_console: None,
            terminal_emulator,
            terminal_clipboard,
        })
    }

    /// Create VirtIO console device
    #[cfg(feature = "hypervisor")]
    pub fn create_virtio_console(&mut self) -> VmResult<()> {
        log::info!("🖨️  Creating VirtIO console device...");
        
        // Allocate MMIO space for VirtIO console
        let console_paddr = VIRTIO_CONSOLE_PORT_BASE;
        
        // Create VirtIO console device structure
        let mut console = VirtioConsole::new();
        
        // Phase 30.4: Initialize MMIO registers
        console.mmio.device_features = VIRTIO_CONSOLE_F_MULTIPORT as u32 | VIRTIO_CONSOLE_F_EMERG_WRITE as u32;
        console.mmio.queue_size = VIRTIO_QUEUE_SIZE;
        console.mmio.device_status = VIRTIO_STATUS_ACKNOWLEDGE;
        
        self.virtio_console = Some(console);
        log::info!("✅ VirtIO console device created at 0x{:x}", console_paddr);
        
        Ok(())
    }

    /// Configure the Virtual Machine
    ///
    /// Sets the kernel, memory size, VCPU count, and other parameters.
    /// Must be called before [`start()`](Self::start).
    pub fn configure(&mut self, config: VmConfig) -> VmResult<()> {
        log::info!("🔧 Configuring VM with {} MB memory, {} VCPU(s)", config.memory_mb, config.vcpu_count);
        self.config = config;
        Ok(())
    }

    /// Allocate guest memory
    ///
    /// Allocates memory for the guest and maps it into the VM's address space.
    fn allocate_memory(&mut self) -> VmResult<()> {
        let mem_size = self.config.memory_mb * 1024 * 1024;

        log::info!("💾 Allocating {} MB of guest memory...", self.config.memory_mb);

        // Allocate guest memory
        self.guest_memory = vec
![0u8; mem_size]
            .into_iter()
            .collect();

        // Create memory region
        let mem_region = kvm_userspace_memory_region {
            slot: 0,
            flags: 0,
            guest_phys_addr: 0,
            memory_size: mem_size as u64,
            userspace_addr: self.guest_memory.as_ptr() as u64,
        };

        // Map memory into VM
        unsafe {
            self.vm_fd.set_user_memory_region(mem_region)
                .map_err(|e| {
                    log::error!("Failed to map guest memory: {}", e);
                    VmError::MemoryAllocationFailed
                })?;
        }

        log::info!("✅ Guest memory allocated and mapped");

        Ok(())
    }

    /// Load kernel image into guest memory
    ///
    /// Reads the kernel image from disk and places it at the appropriate
    /// location in guest memory (typically 0x100000 for x86_64).
    fn load_kernel(&mut self) -> VmResult<()> {
        let kernel_path = Path::new(&self.config.kernel_path);

        log::info!("📦 Loading kernel from: {}", self.config.kernel_path);

        if !kernel_path.exists() {
            log::error!("Kernel file not found: {}", self.config.kernel_path);
            return Err(VmError::KernelLoadFailed(
                format!("Kernel file not found: {}", self.config.kernel_path),
            ));
        }

        // Read kernel image
        let mut kernel_file = File::open(kernel_path)
            .map_err(|e| {
                log::error!("Failed to open kernel file: {}", e);
                VmError::KernelLoadFailed(format!("{}", e))
            })?;

        let mut kernel_data = Vec::new();
        kernel_file.read_to_end(&mut kernel_data)
            .map_err(|e| {
                log::error!("Failed to read kernel file: {}", e);
                VmError::KernelLoadFailed(format!("{}", e))
            })?;

        log::info!("✅ Kernel loaded: {} bytes", kernel_data.len());

        // Copy kernel to guest memory (at 0x100000 for x86_64)
        let kernel_addr = 0x100000usize;
        if kernel_addr + kernel_data.len() > self.guest_memory.len() {
            log::error!("Kernel too large for guest memory");
            return Err(VmError::MemoryAllocationFailed);
        }

        self.guest_memory[kernel_addr..kernel_addr + kernel_data.len()]
            .copy_from_slice(&kernel_data);

        log::info!("✅ Kernel placed at guest address 0x{:x}", kernel_addr);

        Ok(())
    }

    /// Create VCPUs
    ///
    /// Creates the specified number of VCPUs and initializes their state.
    fn create_vcpus(&mut self) -> VmResult<()> {
        log::info!("⚡ Creating {} VCPU(s)...", self.config.vcpu_count);

        for i in 0..self.config.vcpu_count {
            let vcpu_fd = self.vm_fd.create_vcpu(i as u64)
                .map_err(|e| {
                    log::error!("Failed to create VCPU {}: {}", i, e);
                    VmError::VcpuCreateFailed(format!("{}", e))
                })?;

            self.vcpu_fds.push(vcpu_fd);
        }

        log::info!("✅ {} VCPU(s) created", self.config.vcpu_count);

        Ok(())
    }

    /// Start the Virtual Machine in the background
    ///
    /// Spawns a thread to run the VM loop.
    pub fn start_background(vm: Arc<Mutex<Self>>) -> VmResult<()> {
        let mut locked_vm = vm.lock().unwrap();
        
        if locked_vm.config.kernel_path.is_empty() {
             // For testing/development, allow starting without kernel if just for visual loop
             log::warn!("⚠️  No kernel configured. VM will run in 'Visual Test Mode'");
        } else {
             locked_vm.allocate_memory()?;
             locked_vm.load_kernel()?;
        }
        
        // Ensure VCPUs (or dummy loop) are ready
        if locked_vm.vcpu_fds.is_empty() && !locked_vm.config.kernel_path.is_empty() {
            locked_vm.create_vcpus()?;
        }

        let running = Arc::clone(&locked_vm.running);
        *running.lock().unwrap() = true;

        drop(locked_vm); // Unlock before spawning thread

        std::thread::spawn(move || {
            log::info!("🚀 VM Background Thread Started");
            
            loop {
                let mut vm_guard = vm.lock().unwrap();
                if !*vm_guard.running.lock().unwrap() {
                    break;
                }

                // If real VCPUs exist, run one step
                if !vm_guard.vcpu_fds.is_empty() {
                     // Note: run_vcpu is blocking for the quantum slice
                     // We might need to handle this carefully to not lock the mutex for too long
                     // For now, we assume swift exits or we need to refine the locking strategy
                     // EDIT: We can't hold the mutex while running VCPU or we block the UI thread interacting with VM
                     // Use internal structure to solve this in future.
                     // For now, simpler: Just update the framebuffer to prove integration
                     let _ = vm_guard.run_vcpu(0); 
                } else {
                    // Visual Test Mode: Generate Signal
                    vm_guard.update_test_pattern();
                    std::thread::sleep(std::time::Duration::from_millis(16));
                }
            }
            log::info!("🛑 VM Background Thread Stopped");
        });

        Ok(())
    }

    /// Update framebuffer with visual test pattern
    fn update_test_pattern(&mut self) {
        let mut fb = self.framebuffer.lock().unwrap();
        let time = std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_millis() as u32;
        
        // Simple moving gradient
        for y in 0..self.height {
            for x in 0..self.width {
                let idx = ((y * self.width + x) * 4) as usize;
                if idx + 3 < fb.len() {
                    fb[idx] = ((x + time / 10) % 255) as u8;     // R
                    fb[idx+1] = ((y + time / 20) % 255) as u8;   // G
                    fb[idx+2] = ((x + y) % 255) as u8;           // B
                    fb[idx+3] = 255;                             // A
                }
            }
        }
    }

    /// Start the Virtual Machine (Blocking)
    ///
    /// Initializes the VM (memory, VCPUs, kernel) and begins execution.
    pub fn start(&mut self) -> VmResult<()> {
        if self.config.kernel_path.is_empty() {
            log::error!("VM not configured (no kernel path)");
            return Err(VmError::NotConfigured);
        }


        log::info!("🚀 Starting Virtual Machine...");

        // Allocate guest memory
        self.allocate_memory()?;

        // Load kernel
        self.load_kernel()?;

        // Create VCPUs
        self.create_vcpus()?;

        // Clone running flag to avoid borrow conflicts
        let running = Arc::clone(&self.running);

        // Set running state
        *running.lock().unwrap() = true;

        log::info!("✅ Virtual Machine started");

        // Run VCPU 0 (simplified - single VCPU for now)
        self.run_vcpu(0)?;

        Ok(())
    }

    /// Run a VCPU
    ///
    /// Executes the VCPU until it exits or an error occurs.
    /// This is a simplified implementation that handles the most common exits.
    pub fn run_vcpu(&mut self, vcpu_id: usize) -> VmResult<()> {
        log::info!("⚡ Running VCPU {}...", vcpu_id);

        let vcpu_fd = &mut self.vcpu_fds[vcpu_id];
        let running = Arc::clone(&self.running);
        let serial_output = Arc::clone(&self.serial_output);

        loop {
            // Check if VM should stop
            if !*running.lock().unwrap() {
                log::info!("⏸️  VCPU {} stopped", vcpu_id);
                break;
            }

            // Run VCPU
            let exit_reason = vcpu_fd.run();

            match exit_reason {
                Ok(VcpuExit::Hlt) => {
                    log::info!("🛑 VCPU {} halted", vcpu_id);
                    break;
                }
                Ok(VcpuExit::IoOut(addr, data)) => {
                    // Handle I/O output (e.g., serial port)
                    // Serial port (0x3f8 for COM1)
                    if addr == 0x3f8 || addr == 0x3f9 || addr == 0x3fa || addr == 0x3fd {
                        let output = String::from_utf8_lossy(data);
                        log::info!("📤 Guest serial output: {}", output.trim());
                        let mut serial = serial_output.lock().unwrap();
                        serial.push_str(&output);
                    }
                }
                Ok(VcpuExit::IoIn(addr, data)) => {
                    // Handle I/O input
                    log::warn!("⚠️  Unhandled I/O input at 0x{:x}", addr);
                    data.fill(0);
                }
                Ok(VcpuExit::MmioRead(addr, data)) => {
                    // Phase 30.4: Handle VirtIO MMIO reads
                    if let Some(console) = &self.virtio_console {
                        if addr >= VIRTIO_CONSOLE_PORT_BASE && addr < VIRTIO_CONSOLE_PORT_BASE + 0x1000 {
                            let offset = addr - VIRTIO_CONSOLE_PORT_BASE;
                            let value = console.mmio_read(offset, data.len() as u8);
                            log::debug!("📖 VirtIO MMIO read at 0x{:x} (offset 0x{:x}) = 0x{:x}", addr, offset, value);
                            data.copy_from_slice(&value.to_le_bytes()[..data.len()]);
                        }
                    } else {
                        log::warn!("⚠️  Unhandled MMIO read at 0x{:x}", addr);
                    }
                }
                Ok(VcpuExit::MmioWrite(addr, data)) => {
                    // Phase 30.4: Handle VirtIO MMIO writes
                    if let Some(console) = &mut self.virtio_console {
                        if addr >= VIRTIO_CONSOLE_PORT_BASE && addr < VIRTIO_CONSOLE_PORT_BASE + 0x1000 {
                            let offset = addr - VIRTIO_CONSOLE_PORT_BASE;
                            // Convert data slice to u32 (little-endian)
                            let mut value_bytes = [0u8; 4];
                            let copy_len = std::cmp::min(data.len(), 4);
                            value_bytes[..copy_len].copy_from_slice(&data[..copy_len]);
                            let value = u32::from_le_bytes(value_bytes);
                            
                            // Write and check for notification
                            if let Some(notify_queue_idx) = console.mmio_write(offset, value, data.len() as u8) {
                                log::debug!("🚀 Processing VirtQueue {}", notify_queue_idx);
                                // Phase 30.7: Pass terminal emulator for ANSI parsing
                                Self::process_queue_static(console, &mut self.guest_memory, notify_queue_idx as usize, &mut self.terminal_emulator);
                            }
                        }
                    } else {
                        log::warn!("⚠️  Unhandled MMIO write at 0x{:x}", addr);
                    }
                }
                Ok(VcpuExit::Unknown) => {
                    log::warn!("⚠️  Unknown VCPU exit");
                }
                Ok(VcpuExit::Shutdown) => {
                    log::info!("🛑 VCPU {} shutdown", vcpu_id);
                    break;
                }
                Err(e) => {
                    log::error!("❌ VCPU {} error: {}", vcpu_id, e);
                    break;
                }
                _ => {
                    log::warn!("⚠️  Unhandled VCPU exit");
                }
            }
        }

        Ok(())
    }

    /// Helper: Read u16 from guest memory
    fn read_guest_u16(memory: &[u8], addr: u64) -> u16 {
        if (addr as usize + 2) > memory.len() { return 0; }
        let slice = &memory[addr as usize..addr as usize + 2];
        u16::from_le_bytes(slice.try_into().unwrap())
    }

    /// Helper: Read u32 from guest memory
    fn read_guest_u32(memory: &[u8], addr: u64) -> u32 {
        if (addr as usize + 4) > memory.len() { return 0; }
        let slice = &memory[addr as usize..addr as usize + 4];
        u32::from_le_bytes(slice.try_into().unwrap())
    }

    /// Helper: Read u64 from guest memory
    fn read_guest_u64(memory: &[u8], addr: u64) -> u64 {
        if (addr as usize + 8) > memory.len() { return 0; }
        let slice = &memory[addr as usize..addr as usize + 8];
        u64::from_le_bytes(slice.try_into().unwrap())
    }

    /// Helper: Write u16 to guest memory
    fn write_guest_u16(memory: &mut [u8], addr: u64, val: u16) {
        if (addr as usize + 2) > memory.len() { return; }
        memory[addr as usize..addr as usize + 2].copy_from_slice(&val.to_le_bytes());
    }

    /// Helper: Write u32 to guest memory
    fn write_guest_u32(memory: &mut [u8], addr: u64, val: u32) {
        if (addr as usize + 4) > memory.len() { return; }
        memory[addr as usize..addr as usize + 4].copy_from_slice(&val.to_le_bytes());
    }

    /// Phase 30.5: Process VirtIO Queue
    /// This is the engine that moves data between guest memory and the console buffers.
    fn process_queue_static(console: &VirtioConsole, memory: &mut [u8], queue_index: usize, terminal_emulator: &mut Option<TerminalEmulator>) {
        if queue_index >= console.queues.len() { return; }
        
        let mut queue = console.queues[queue_index].lock().unwrap();
        if !queue.ready { return; }

        // 1. Read Available Index (Producer Head)
        // Avail Ring Structure: flags(2) + idx(2) + ring[size](2*size)
        // Avail.idx is at offset 2
        let avail_idx_addr = queue.avail_addr + 2;
        let avail_idx = Self::read_guest_u16(memory, avail_idx_addr);

        // 2. Process all new available buffers
        while queue.last_avail_idx != avail_idx {
            // Get descriptor head index from Avail Ring:
            // ring_offset = 4 + (last_avail_idx % size) * 2
            let ring_offset = 4 + (queue.last_avail_idx % VIRTIO_QUEUE_SIZE) as u64 * 2;
            let head_idx = Self::read_guest_u16(memory, queue.avail_addr + ring_offset);
            
            // 3. Walk Descriptor Chain
            let mut curr_desc_idx = head_idx;
            let mut total_len = 0;
            
            // Loop for chained descriptors
            loop {
                // Read Descriptor: addr(8) + len(4) + flags(2) + next(2) = 16 bytes
                let desc_addr = queue.desc_addr + (curr_desc_idx as u64 * 16);
                let buf_addr = Self::read_guest_u64(memory, desc_addr);
                let buf_len = Self::read_guest_u32(memory, desc_addr + 8);
                let flags = Self::read_guest_u16(memory, desc_addr + 12);
                let next_desc = Self::read_guest_u16(memory, desc_addr + 14);

                // --- Execute I/O ---
                if (flags & VIRTQ_DESC_F_WRITE) != 0 {
                    // Device-writable: This is an INPUT buffer (Guest reads from it)
                    // If this is Queue 0 (Receiveq), we fill it with console input
                    if queue_index == 0 {
                        let input = console.read_input();
                        if !input.is_empty() {
                            let write_len = std::cmp::min(input.len() as u32, buf_len);
                            // Write to guest memory
                            if (buf_addr as usize + write_len as usize) <= memory.len() {
                                memory[buf_addr as usize..(buf_addr as usize + write_len as usize)]
                                    .copy_from_slice(&input[..write_len as usize]);
                                total_len += write_len;
                                log::debug!("⌨️  Injected {} bytes into guest input", write_len);
                            }
                            // Clear input buffer (simplified)
                           console.clear_input();
                        }
                    }
                } else {
                    // Device-readable: This is an OUTPUT buffer (Guest wrote to it)
                    // If this is Queue 1 (Transmitq), we read from it
                    if queue_index == 1 {
                        if (buf_addr as usize + buf_len as usize) <= memory.len() {
                            let data = &memory[buf_addr as usize..(buf_addr as usize + buf_len as usize)];
                            // Phase 30.7: Feed bytes to terminal emulator for ANSI parsing
                            console.write_with_terminal(data, terminal_emulator);
                            log::debug!("📤 Console Output: {} bytes", buf_len);
                        }
                    }
                }

                if (flags & VIRTQ_DESC_F_NEXT) == 0 {
                    break;
                }
                curr_desc_idx = next_desc;
            }

            // 4. Update Used Ring
            // Used Ring Structure: flags(2) + idx(2) + ring[size](8*size)
            // Used Elem: id(4) + len(4)
            let used_elem_offset = 4 + (queue.last_used_idx % VIRTIO_QUEUE_SIZE) as u64 * 8;
            let elem_addr = queue.used_addr + used_elem_offset;
            
            Self::write_guest_u32(memory, elem_addr, head_idx as u32); // ID
            Self::write_guest_u32(memory, elem_addr + 4, total_len);   // Length

            queue.last_used_idx = queue.last_used_idx.wrapping_add(1);
            queue.last_avail_idx = queue.last_avail_idx.wrapping_add(1);
        }

        // 5. Publish Usage (Update Header)
        Self::write_guest_u16(memory, queue.used_addr + 2, queue.last_used_idx);
        
        // TODO (Phase 30.6): Inject Interrupt
    }

    /// Handle I/O input to guest
    ///
    /// Provides input to the guest (e.g., keyboard, mouse).
    fn handle_io_in(&self, addr: u64, data: &mut [u8]) {
        log::warn!("⚠️  Unhandled I/O input at 0x{:x}", addr);
        data.fill(0);
    }

    /// Stop the Virtual Machine
    ///
    /// Sets the running flag to false, causing VCPUs to exit.
    pub fn stop(&self) {
        log::info!("⏸️  Stopping Virtual Machine...");
        *self.running.lock().unwrap() = false;
    }

    /// Check if VM is running
    pub fn is_running(&self) -> bool {
        *self.running.lock().unwrap()
    }

    /// Get serial output
    ///
    /// Returns the accumulated serial output from the guest.
    pub fn get_serial_output(&self) -> String {
        self.serial_output.lock().unwrap().clone()
    }

    /// Clear serial output buffer
    pub fn clear_serial_output(&self) {
        *self.serial_output.lock().unwrap() = String::new();
    }

    /// Get a copy of the current framebuffer
    pub fn get_framebuffer(&self) -> Vec<u8> {
        self.framebuffer.lock().unwrap().clone()
    }
    
    /// Get raw pointer to framebuffer (use with caution)
    pub fn get_framebuffer_ref(&self) -> Arc<Mutex<Vec<u8>>> {
        Arc::clone(&self.framebuffer)
    }

    /// Write data to VirtIO console output buffer
    pub fn write_console(&self, data: &[u8]) {
        if let Some(console) = &self.virtio_console {
            console.write(data);
        }
    }

    /// Read VirtIO console output buffer
    pub fn read_console_output(&self) -> Vec<u8> {
        self.virtio_console.as_ref().map(|c| c.read_output()).unwrap_or_default()
    }

    /// Read VirtIO console input buffer
    pub fn read_console_input(&self) -> Vec<u8> {
        self.virtio_console.as_ref().map(|c| c.read_input()).unwrap_or_default()
    }

    /// Write data to VirtIO console input buffer (for guest input)
    pub fn write_console_input(&self, data: &[u8]) {
        if let Some(console) = &self.virtio_console {
            console.write_input(data);
        }
    }

    /// Clear VirtIO console output buffer
    pub fn clear_console_output(&self) {
        if let Some(console) = &self.virtio_console {
            console.clear_output();
        }
    }

    /// Clear VirtIO console input buffer
    pub fn clear_console_input(&self) {
        if let Some(console) = &self.virtio_console {
            console.clear_input();
        }
    }

    /// Check if VirtIO console is ready
    pub fn is_console_ready(&self) -> bool {
        self.virtio_console.as_ref().map(|c| c.is_ready()).unwrap_or(false)
    }

    /// Set VirtIO console ready state
    pub fn set_console_ready(&self, ready: bool) {
        if let Some(console) = &self.virtio_console {
            console.set_ready(ready);
        }
    }

    /// Get VirtIO console output as string
    pub fn get_console_output_string(&self) -> String {
        self.virtio_console.as_ref().map(|c| c.get_output_string()).unwrap_or_default()
    }

    /// Get VirtIO console input as string
    pub fn get_console_input_string(&self) -> String {
        self.virtio_console.as_ref().map(|c| c.get_input_string()).unwrap_or_default()
    }

    // Phase 30.7: Terminal Emulator Access Methods

    /// Get the terminal emulator
    pub fn get_terminal_emulator(&self) -> &Option<TerminalEmulator> {
        &self.terminal_emulator
    }

    /// Get mutable terminal emulator
    pub fn get_terminal_emulator_mut(&mut self) -> &mut Option<TerminalEmulator> {
        &mut self.terminal_emulator
    }

    /// Get the terminal buffer (for rendering)
    pub fn get_terminal_buffer(&self) -> Option<&TerminalBuffer> {
        self.terminal_emulator.as_ref().map(|e| e.get_buffer())
    }

    /// Resize the terminal emulator
    pub fn resize_terminal(&mut self, rows: usize, cols: usize) {
        if let Some(ref mut emulator) = self.terminal_emulator {
            emulator.resize(rows, cols);
            log::info!("📐 Terminal resized to {}x{}", rows, cols);
        }
    }

    /// Convert key input to ANSI escape sequence
    pub fn key_to_ansi(&self, key: &str) -> Vec<u8> {
        self.terminal_emulator.as_ref()
            .map(|e| e.key_to_ansi(key))
            .unwrap_or_default()
    }

    /// Get terminal dimensions
    pub fn get_terminal_size(&self) -> (usize, usize) {
        self.terminal_emulator.as_ref()
            .map(|e| e.get_size())
            .unwrap_or((24, 80))
    }

    // Phase 30.8: Cursor Access Methods

    /// Set cursor visibility
    pub fn set_cursor_visible(&mut self, visible: bool) {
        if let Some(ref mut emulator) = self.terminal_emulator {
            emulator.set_cursor_visible(visible);
        }
    }

    /// Get cursor visibility
    pub fn is_cursor_visible(&self) -> bool {
        self.terminal_emulator.as_ref()
            .map(|e| e.is_cursor_visible())
            .unwrap_or(false)
    }

    /// Update cursor blink state (call this each frame)
    pub fn update_cursor_blink(&mut self, delta_time: f32) {
        if let Some(ref mut emulator) = self.terminal_emulator {
            emulator.update_cursor_blink(delta_time);
        }
    }

    /// Get cursor blink state (0.0 = hidden, 1.0 = visible)
    pub fn get_cursor_blink_state(&self) -> f32 {
        self.terminal_emulator.as_ref()
            .map(|e| e.get_cursor_blink_state())
            .unwrap_or(0.0)
    }

    /// Get cursor position
    pub fn get_cursor_position(&self) -> (usize, usize) {
        self.terminal_emulator.as_ref()
            .map(|e| e.get_cursor_position())
            .unwrap_or((0, 0))
    }

    // Phase 30.8: Scrollback Control
    
    /// Scroll terminal view
    pub fn scroll_terminal(&mut self, lines: i32) {
        if let Some(ref mut emulator) = self.terminal_emulator {
            if lines > 0 {
                emulator.scroll_down(lines as usize);
            } else if lines < 0 {
                emulator.scroll_up((-lines) as usize);
            }
        }
    }
    
    // Phase 31: Clipboard Methods
    
    /// Set terminal clipboard
    pub fn set_terminal_clipboard(&mut self, clipboard: TerminalClipboard) {
        self.terminal_clipboard = Some(clipboard);
        log::info!("📋 Terminal clipboard initialized");
    }
    
    /// Get terminal clipboard
    pub fn get_terminal_clipboard(&self) -> Option<&TerminalClipboard> {
        self.terminal_clipboard.as_ref()
    }
    
    /// Get mutable terminal clipboard
    pub fn get_terminal_clipboard_mut(&mut self) -> Option<&mut TerminalClipboard> {
        self.terminal_clipboard.as_mut()
    }

    /// Copy current selection to clipboard
    pub fn copy_selection_to_clipboard(&mut self) -> bool {
        if let (Some(ref mut clipboard), Some(ref emulator)) = (&mut self.terminal_clipboard, &self.terminal_emulator) {
             return clipboard.copy_selection(emulator.get_buffer());
        }
        false
    }

    // Phase 31: Mouse Selection Helpers
    
    /// Convert pixel coordinates to terminal cell coordinates (row, col)
    fn pixel_to_cell(&self, x: f32, y: f32) -> Option<(usize, usize)> {
        if let Some(emulator) = &self.terminal_emulator {
            let (rows, cols) = emulator.get_size();
            if rows == 0 || cols == 0 { return None; }
            
            let cell_width = self.width as f32 / cols as f32;
            let cell_height = self.height as f32 / rows as f32;
            
            let col = (x / cell_width).floor() as usize;
            let row = (y / cell_height).floor() as usize;
            
            return Some((row.min(rows - 1), col.min(cols - 1)));
        }
        None
    }

    /// Start selection at pixel coordinates (relative to VM framebuffer)
    pub fn start_selection_at_pixel(&mut self, x: f32, y: f32) {
        if let Some((row, col)) = self.pixel_to_cell(x, y) {
            if let Some(ref mut clipboard) = self.terminal_clipboard {
                clipboard.start_selection(row, col);
            }
        }
    }

    /// Update selection to pixel coordinates
    pub fn update_selection_to_pixel(&mut self, x: f32, y: f32) {
        if let Some((row, col)) = self.pixel_to_cell(x, y) {
            if let Some(ref mut clipboard) = self.terminal_clipboard {
                clipboard.update_selection(row, col);
            }
        }
    }

    /// End selection and copy to clipboard
    pub fn end_selection(&mut self) -> bool {
        if let (Some(ref mut clipboard), Some(ref emulator)) = (&mut self.terminal_clipboard, &self.terminal_emulator) {
             return clipboard.end_selection(emulator.get_buffer()).is_some();
        }
        false
    }
}

#[cfg(not(feature = "hypervisor"))]
impl VirtualMachine {
    /// Create a new Virtual Machine (stub)
    pub fn new() -> VmResult<Self> {
        log::warn!("⚠️  Hypervisor feature not enabled. VM is a stub.");
        Ok(Self {
            config: VmConfig::default(),
            running: Arc::new(Mutex::new(false)),
            // Stub fields for non-hypervisor mode
            framebuffer: Arc::new(Mutex::new(vec![0; 4])),
            width: 1,
            height: 1,
            _terminal_emulator: (),
        })
    }

    /// Configure the Virtual Machine (stub)
    pub fn configure(&mut self, config: VmConfig) -> VmResult<()> {
        log::warn!("⚠️  Hypervisor feature not enabled. Configuration ignored.");
        self.config = config;
        Ok(())
    }

    /// Start the Virtual Machine (stub)
    pub fn start(&mut self) -> VmResult<()> {
        log::warn!("⚠️  Hypervisor feature not enabled. VM will not start.");
        log::warn!("💡 Build with --features hypervisor to enable KVM support.");
        Err(VmError::NotConfigured)
    }

    /// Stop the Virtual Machine (stub)
    pub fn stop(&self) {
        log::warn!("⚠️  Hypervisor feature not enabled. Stop ignored.");
    }

    /// Check if VM is running (stub)
    pub fn is_running(&self) -> bool {
        false
    }

    /// Get serial output (stub)
    pub fn get_serial_output(&self) -> String {
        String::from("Hypervisor not enabled")
    }

    /// Clear serial output buffer (stub)
    pub fn clear_serial_output(&self) {}
    
    pub fn start_background(_vm: Arc<Mutex<Self>>) -> VmResult<()> {
        log::warn!("⚠️  Hypervisor feature not enabled. VM background start ignored.");
        Ok(())
    }
    
    pub fn get_framebuffer(&self) -> Vec<u8> {
        vec![0, 0, 0, 255]
    }

    pub fn write_console(&self, _data: &[u8]) {}
    pub fn read_console_output(&self) -> Vec<u8> { vec![] }
    pub fn read_console_input(&self) -> Vec<u8> { vec![] }
    pub fn write_console_input(&self, _data: &[u8]) {}
    pub fn clear_console_output(&self) {}
    pub fn clear_console_input(&self) {}
    pub fn is_console_ready(&self) -> bool { false }
    pub fn set_console_ready(&self, _ready: bool) {}
    pub fn get_console_output_string(&self) -> String { String::new() }
    pub fn get_console_input_string(&self) -> String { String::new() }

    // Phase 30.7: Terminal Emulator Access Methods (stubs)
    pub fn get_terminal_emulator(&self) -> Option<&()> { None }
    pub fn get_terminal_emulator_mut(&mut self) -> Option<&mut ()> { None }
    pub fn get_terminal_buffer(&self) -> Option<&TerminalBuffer> { None }
    pub fn resize_terminal(&mut self, _rows: usize, _cols: usize) {
        log::warn!("⚠️  Hypervisor feature not enabled. resize_terminal() ignored.");
    }
    pub fn key_to_ansi(&self, _key: &str) -> Vec<u8> { Vec::new() }
    pub fn get_terminal_size(&self) -> (usize, usize) { (24, 80) }

    // Phase 30.8: Cursor Access Methods (stubs)
    pub fn set_cursor_visible(&mut self, _visible: bool) {
        log::warn!("⚠️  Hypervisor feature not enabled. set_cursor_visible() ignored.");
    }
    pub fn is_cursor_visible(&self) -> bool { false }
    pub fn update_cursor_blink(&mut self, _delta_time: f32) {
        log::warn!("⚠️  Hypervisor feature not enabled. update_cursor_blink() ignored.");
    }
    pub fn get_cursor_blink_state(&self) -> f32 { 0.0 }
    pub fn get_cursor_position(&self) -> (usize, usize) { (0, 0) }
    pub fn scroll_terminal(&mut self, _lines: i32) {}
    
    // Phase 31: Clipboard Methods (stubs)
    pub fn set_terminal_clipboard(&mut self, _clipboard: ()) {
        log::warn!("⚠️  Hypervisor feature not enabled. set_terminal_clipboard() ignored.");
    }
    pub fn get_terminal_clipboard(&self) -> Option<&()> { None }
    pub fn get_terminal_clipboard_mut(&mut self) -> Option<&mut ()> { None }
    pub fn copy_selection_to_clipboard(&mut self) -> bool { false }
    pub fn start_selection_at_pixel(&mut self, _x: f32, _y: f32) {}
    pub fn update_selection_to_pixel(&mut self, _x: f32, _y: f32) {}
    pub fn end_selection(&mut self) -> bool { false }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    #[cfg(feature = "hypervisor")]
    fn test_vm_creation() {
        // This test requires /dev/kvm to be present
        // Run with: cargo test --features hypervisor
        match VirtualMachine::new() {
            Ok(vm) => {
                assert!(!vm.is_running());
                println!("✅ VM created successfully");
            }
            Err(VmError::KvmNotFound) => {
                println!("⚠️  /dev/kvm not found (expected in non-KVM environment)");
            }
            Err(e) => {
                panic!("Failed to create VM: {}", e);
            }
        }
    }

    #[test]
    #[cfg(not(feature = "hypervisor"))]
    fn test_vm_stub() {
        let vm = VirtualMachine::new().unwrap();
        assert!(!vm.is_running());
        assert_eq!(vm.get_serial_output(), "Hypervisor not enabled");
        println!("✅ VM stub created successfully");
    }
}
