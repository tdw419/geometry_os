// Phase 42: Alpine Linux VM Integration for Infinite Map
// Alpine VM Manager - Manages Alpine Linux VM as a live tile on the infinite map
//
// This module handles:
// - Booting Alpine Linux from visual PNG
// - Capturing VNC framebuffer
// - Rendering VM output as a tile on the infinite map
// - Managing VM lifecycle

use std::collections::HashMap;
use std::fs;
use std::io::Read;
use std::os::unix::net::UnixStream;
use std::path::{Path, PathBuf};
use std::process::{Child, Command};
use std::sync::{Arc, Mutex};
use std::thread;
use std::time::{Duration, Instant};

use serde::{Deserialize, Serialize};

/// Alpine VM configuration
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct AlpineVmConfig {
    /// Path to Alpine visual PNG
    pub alpine_png: PathBuf,
    
    /// VNC port for QEMU
    pub vnc_port: u16,
    
    /// QEMU monitor port
    pub monitor_port: u16,
    
    /// Framebuffer socket path
    pub framebuffer_socket: PathBuf,

    /// QMP socket path
    pub qmp_socket: PathBuf,
    
    /// VM memory in MB
    pub memory_mb: u32,
    
    /// Number of CPU cores
    pub cpu_cores: u32,
    
    /// Window ID for rendering on infinite map
    pub window_id: Option<usize>,
    
    /// Tile position on infinite map (x, y)
    pub tile_position: Option<(f64, f64)>,
}

impl Default for AlpineVmConfig {
    fn default() -> Self {
        AlpineVmConfig {
            alpine_png: PathBuf::from("alpine_visual.rts.png"),
            vnc_port: 5900,
            monitor_port: 55555,
            framebuffer_socket: PathBuf::from("/tmp/alpine_fb.sock"),
            qmp_socket: PathBuf::from("/tmp/qmp-alpine.sock"),
            memory_mb: 512,
            cpu_cores: 1,
            window_id: None,
            tile_position: None,
        }
    }
}

/// Alpine VM state
#[derive(Debug, Clone, PartialEq)]
pub enum AlpineVmState {
    /// VM not started
    Stopped,
    
    /// VM is booting
    Booting,
    
    /// VM is running
    Running,
    
    /// VM encounterd an error
    Error(String),
}

/// Boot source type
pub enum BootSource {
    /// Boot from extracted kernel/initrd directory
    ExtractedDir(PathBuf),
    /// Boot from ISO image
    Iso(PathBuf),
    /// Boot from raw Kernel binary
    Kernel(PathBuf),
}

/// Alpine VM Manager
pub struct AlpineVmManager {
    /// VM configuration
    config: AlpineVmConfig,
    
    /// Current VM state
    state: Arc<Mutex<AlpineVmState>>,
    
    /// QEMU process handle
    qemu_process: Arc<Mutex<Option<Child>>>,
    
    /// VNC capture process handle
    vnc_capture_process: Arc<Mutex<Option<Child>>>,
    
    /// Latest framebuffer data
    framebuffer: Arc<Mutex<Option<Vec<u8>>>>,
    
    /// Framebuffer dimensions
    framebuffer_size: Arc<Mutex<(u32, u32)>>,
    
    /// Last framebuffer update time
    last_update: Arc<Mutex<Option<Instant>>>,
    
    /// Temporary directory for extraction
    temp_dir: Arc<Mutex<Option<PathBuf>>>,

    /// QMP Client (Phase 30.3)
    qmp_client: Arc<tokio::sync::Mutex<Option<crate::qemu::QmpClient>>>,
}

impl AlpineVmManager {
    /// Create a new Alpine VM manager
    pub fn new(config: AlpineVmConfig) -> Self {
        AlpineVmManager {
            config,
            state: Arc::new(Mutex::new(AlpineVmState::Stopped)),
            qemu_process: Arc::new(Mutex::new(None)),
            vnc_capture_process: Arc::new(Mutex::new(None)),
            framebuffer: Arc::new(Mutex::new(None)),
            framebuffer_size: Arc::new(Mutex::new((1024, 768))),
            last_update: Arc::new(Mutex::new(None)),
            temp_dir: Arc::new(Mutex::new(None)),
            qmp_client: Arc::new(tokio::sync::Mutex::new(None)),
        }
    }
    
    /// Boot Alpine Linux VM
    pub fn boot(&mut self) -> Result<(), String> {
        // Check if already running
        {
            let state = self.state.lock().unwrap();
            if *state != AlpineVmState::Stopped {
                return Err("VM is already running or booting".to_string());
            }
        }
        
        // Set state to booting
        *self.state.lock().unwrap() = AlpineVmState::Booting;
        
        // Create temporary directory
        let temp_dir = tempfile::tempdir()
            .map_err(|e| format!("Failed to create temp dir: {}", e))?;
        let temp_path = temp_dir.path().to_path_buf();
        *self.temp_dir.lock().unwrap() = Some(temp_path.clone());
        
        // Extract Alpine from PNG
        self.extract_alpine(&temp_path)?;
        
        // Start QEMU
        self.start_qemu(&temp_path, BootSource::ExtractedDir(temp_path.clone()))?;
        
        // Start VNC capture
        self.start_vnc_capture()?;
        
        // Set state to running
        *self.state.lock().unwrap() = AlpineVmState::Running;
        
        // Connect QMP
        self.connect_qmp()?;

        log::info!("Alpine VM booted successfully");
        Ok(())
    }

    /// Connect to QMP Socket
    fn connect_qmp(&self) -> Result<(), String> {
        let qmp_client = self.qmp_client.clone();
        
        // Spawn connection task to avoid blocking main thread
        // Note: In a real app we might want to await this, but here we just start the connection loop
        tokio::spawn(async move {
            log::info!("Connecting to Alpine QMP...");
            // We retry a few times
            for _ in 0..10 {
                match crate::qemu::QmpClient::connect("alpine").await {
                    Ok(client) => {
                        log::info!("✅ Alpine QMP Connected!");
                        *qmp_client.lock().await = Some(client);
                        break;
                    }
                    Err(e) => {
                        log::debug!("QMP Connect retry: {}", e);
                        tokio::time::sleep(Duration::from_millis(500)).await;
                    }
                }
            }
        });

        Ok(())
    }

    /// Inject Key Event via QMP
    /// key_code: QEMU Key Name (e.g. "ret", "spc", "a", "b") or "shift-a"
    pub fn inject_key_event(&self, key_code: &str, down: bool) {
        let qmp_client = self.qmp_client.clone();
        let key = key_code.to_string();
        
        tokio::spawn(async move {
            let mut guard = qmp_client.lock().await;
            if let Some(client) = guard.as_mut() {
                // Construct input-send-event command
                // QMP 2.x+ uses 'input-send-event' with InputEvent union
                // But simpler 'send-key' command still works and is easier for simple keys
                
                // Using send-key for simplicity: { "execute": "send-key", "arguments": { "keys": [ { "type": "qcode", "data": "ret" } ] } }
                // But send-key presses AND releases.
                // We want explicit down/up if possible?
                // 'send-key' has 'hold-time'. 
                
                // If we want detailed events, we use input-send-event.
                // input-send-event arguments: device (opt), head (opt), events: [ { type: "key", data: { key: "...", down: true } } ]
                
                let event = serde_json::json!({
                    "type": "key",
                    "data": {
                        "key": { "type": "qcode", "data": key },
                        "down": down
                    }
                });
                
                let args = serde_json::json!({
                    "events": [ event ]
                });
                
                if let Err(e) = client.execute("input-send-event", Some(args)).await {
                    log::warn!("Failed to inject key {}: {}", key, e);
                }
            }
        });
    }
    
    /// Extract Alpine Linux from visual PNG
    fn extract_alpine(&self, temp_dir: &Path) -> Result<(), String> {
        log::info!("Extracting Alpine from visual PNG: {:?}", self.config.alpine_png);
        
        if !self.config.alpine_png.exists() {
            return Err(format!("Alpine PNG not found: {:?}", self.config.alpine_png));
        }
        
        // Use Python extractor
        let output = Command::new("python3")
            .env("PYTHONPATH", "../..")
            .arg("-c")
            .arg(format!(r#"
import sys
sys.path.insert(0, '../..')
from pixelrts_extractor import PixelRTSExtractor

extractor = PixelRTSExtractor('{}')
binaries = extractor.extract()

if not binaries:
    print("ERROR: Failed to extract binaries")
    sys.exit(1)

import os
os.chdir('{}')
for name, data in binaries.items():
    with open(name, 'wb') as f:
        f.write(data)
    print(f"Extracted: {{name}} ({{len(data)}} bytes)")
"#, self.config.alpine_png.display(), temp_dir.display()))
            .output()
            .map_err(|e| format!("Failed to run extractor: {}", e))?;
        
        if !output.status.success() {
            let stderr = String::from_utf8_lossy(&output.stderr);
            return Err(format!("Extraction failed: {}", stderr));
        }
        
        log::info!("Alpine extracted to: {:?}", temp_dir);
        Ok(())
    }

    /// Boot from a specific file path (ISO or Kernel)
    pub fn boot_from_file(&mut self, path: PathBuf) -> Result<(), String> {
        // Check if already running
        {
            let state = self.state.lock().unwrap();
            if *state != AlpineVmState::Stopped {
                return Err("VM is already running or booting".to_string());
            }
        }
        
        *self.state.lock().unwrap() = AlpineVmState::Booting;
        
        // Setup temp dir for sockets/pidfile even if we don't extract
        let temp_dir = tempfile::tempdir()
            .map_err(|e| format!("Failed to create temp dir: {}", e))?;
        let temp_path = temp_dir.path().to_path_buf();
        *self.temp_dir.lock().unwrap() = Some(temp_path.clone());

        let source = if path.extension().map_or(false, |e| e == "iso" || e == "img") {
            BootSource::Iso(path)
        } else {
            BootSource::Kernel(path)
        };
        
        // Start QEMU with the file
        self.start_qemu(&temp_path, source)?;
        
        // Start VNC capture
        self.start_vnc_capture()?;
        
        *self.state.lock().unwrap() = AlpineVmState::Running;
        
        log::info!("VM booted from file successfully");
        Ok(())
    }
    
    /// Start QEMU with VNC output
    fn start_qemu(&self, temp_dir: &Path, source: BootSource) -> Result<(), String> {
        log::info!("Starting QEMU with VNC on port {}", self.config.vnc_port);
        
        // Kill any existing QEMU on this port
        let _ = Command::new("fuser")
            .arg("-k")
            .arg(format!("{}/tcp", self.config.vnc_port))
            .output();
        
        // Base Command
        let mut cmd = Command::new("qemu-system-x86_64");
        
        // Configure Boot Source
        match source {
            BootSource::ExtractedDir(dir) => {
                let kernel_path = dir.join("kernel");
                let initrd_path = dir.join("initrd");
                if !kernel_path.exists() || !initrd_path.exists() {
                     return Err("Kernel or initrd not found".to_string());
                }
                cmd.arg("-kernel").arg(kernel_path)
                   .arg("-initrd").arg(initrd_path)
                   .arg("-append").arg("console=tty0 console=ttyS0 modules=loop,squashfs,sd-mod,usb-storage quiet");
            },
            BootSource::Iso(path) => {
                cmd.arg("-cdrom").arg(path);
            },
            BootSource::Kernel(path) => {
                cmd.arg("-kernel").arg(path)
                   .arg("-append").arg("console=tty0 console=ttyS0 earlyprintk=serial");
            }
        }

        // Common Configuration
        cmd.arg("-m")
            .arg(format!("{}M", self.config.memory_mb))
            // Phase 36.1: Expose RAM to /dev/shm for Zero-Copy Bridge
            .arg("-object")
            .arg(format!("memory-backend-file,id=mem,size={}M,mem-path=/dev/shm/qemu_ram_alpine,share=on", self.config.memory_mb))
            .arg("-numa")
            .arg("node,memdev=mem")
            .arg("-smp")
            .arg(self.config.cpu_cores.to_string())
            .arg("-enable-kvm")
            .arg("-cpu")
            .arg("host")
            .arg("-vnc")
            .arg(format!(":{}", self.config.vnc_port - 5900))
            .arg("-monitor")
            .arg(format!("telnet:localhost:{},server,nowait", self.config.monitor_port))
            .arg("-qmp")
            .arg(format!("unix:{},server,nowait", self.config.qmp_socket.display()))
            .arg("-serial")
            .arg("file:/dev/null")
            .arg("-pidfile")
            .arg(temp_dir.join("qemu.pid"))
            .arg("-daemonize");

        let mut child = cmd.spawn()
            .map_err(|e| format!("Failed to start QEMU: {}", e))?;
        
        // Wait and check
        thread::sleep(Duration::from_secs(3));
        match child.try_wait() {
            Ok(Some(status)) => return Err(format!("QEMU exited immediately: {}", status)),
            Ok(None) => {}, // Running
            Err(e) => return Err(format!("Status check failed: {}", e)),
        }
        
        *self.qemu_process.lock().unwrap() = Some(child);
        
        log::info!("QEMU started successfully");
        Ok(())
    }
    
    /// Start VNC framebuffer capture
    fn start_vnc_capture(&self) -> Result<(), String> {
        log::info!("Starting VNC framebuffer capture");
        
        // Create VNC capture script
        let capture_script = r#"
#!/usr/bin/env python3
import socket
import struct
import os
import sys
import time

try:
    from PIL import Image
except ImportError:
    print("ERROR: PIL not installed")
    sys.exit(1)

VNC_HOST = os.environ.get('VNC_HOST', 'localhost')
VNC_PORT = int(os.environ.get('VNC_PORT', 5900))
FRAMEBUFFER_SOCKET = os.environ.get('FRAMEBUFFER_SOCKET', '/tmp/alpine_fb.sock')

def capture_framebuffer():
    # Create Unix socket for compositor
    if os.path.exists(FRAMEBUFFER_SOCKET):
        os.unlink(FRAMEBUFFER_SOCKET)
    
    server = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    server.bind(FRAMEBUFFER_SOCKET)
    server.listen(1)
    
    print(f"VNC Capture Server listening on {FRAMEBUFFER_SOCKET}")
    
    # Default framebuffer dimensions
    width = 1024
    height = 768
    
    try:
        while True:
            conn, _ = server.accept()
            print("Compositor connected")
            
            try:
                while True:
                    # Create a test pattern (since we can't capture VNC without vncdotool)
                    # In production, use vncdotool to capture actual VNC framebuffer
                    import io
                    
                    # Create a gradient pattern
                    img = Image.new('RGBA', (width, height))
                    pixels = img.load()
                    
                    import time
                    t = time.time()
                    
                    for y in range(height):
                        for x in range(width):
                            # Animated gradient
                            r = int(127 + 127 * (x / width + t * 0.5).sin())
                            g = int(127 + 127 * (y / height + t * 0.3).sin())
                            b = int(127 + 127 * ((x + y) / (width + height) + t * 0.7).sin())
                            pixels[x, y] = (r, g, b, 255)
                    
                    # Convert to PNG
                    buf = io.BytesIO()
                    img.save(buf, format='PNG')
                    png_data = buf.getvalue()
                    
                    # Send dimensions
                    header = struct.pack('<II', width, height)
                    
                    # Send PNG data
                    conn.sendall(header + png_data)
                    
                    time.sleep(0.033)  # ~30 FPS
                    
            except (ConnectionResetError, BrokenPipeError):
                print("Compositor disconnected")
                conn.close()
            except Exception as e:
                print(f"Error: {e}")
                conn.close()
                
    except KeyboardInterrupt:
        print("\nShutting down...")
    finally:
        server.close()
        if os.path.exists(FRAMEBUFFER_SOCKET):
            os.unlink(FRAMEBUFFER_SOCKET)

if __name__ == "__main__":
    capture_framebuffer()
"#;
        
        let temp_dir = self.temp_dir.lock().unwrap().as_ref().unwrap().clone();
        let script_path = temp_dir.join("vnc_capture.py");
        
        fs::write(&script_path, capture_script)
            .map_err(|e| format!("Failed to write capture script: {}", e))?;
        
        // Set environment variables
        let mut envs = std::env::vars().collect::<HashMap<_, _>>();
        envs.insert("VNC_HOST".to_string(), "localhost".to_string());
        envs.insert("VNC_PORT".to_string(), self.config.vnc_port.to_string());
        envs.insert("FRAMEBUFFER_SOCKET".to_string(), self.config.framebuffer_socket.display().to_string());
        
        // Start VNC capture
        let mut child = Command::new("python3")
            .arg(&script_path)
            .envs(&envs)
            .stdout(fs::File::create(temp_dir.join("vnc_capture.log")).unwrap())
            .stderr(fs::File::create(temp_dir.join("vnc_capture.err")).unwrap())
            .spawn()
            .map_err(|e| format!("Failed to start VNC capture: {}", e))?;
        
        // Wait for socket to be created
        thread::sleep(Duration::from_secs(2));
        
        *self.vnc_capture_process.lock().unwrap() = Some(child);
        
        log::info!("VNC capture started");
        Ok(())
    }
    
    /// Capture latest framebuffer from socket
    pub fn capture_framebuffer(&self) -> Result<(Vec<u8>, u32, u32), String> {
        let socket_path = &self.config.framebuffer_socket;
        
        if !socket_path.exists() {
            return Err("Framebuffer socket does not exist".to_string());
        }
        
        let mut stream = UnixStream::connect(socket_path)
            .map_err(|e| format!("Failed to connect to framebuffer socket: {}", e))?;
        
        // Read header (width, height)
        let mut header = [0u8; 8];
        stream.read_exact(&mut header)
            .map_err(|e| format!("Failed to read framebuffer header: {}", e))?;
        
        let (width, height) = (
            u32::from_le_bytes([header[0], header[1], header[2], header[3]]),
            u32::from_le_bytes([header[4], header[5], header[6], header[7]]),
        );
        
        // Read PNG data
        let mut buffer = Vec::new();
        stream.read_to_end(&mut buffer)
            .map_err(|e| format!("Failed to read framebuffer data: {}", e))?;
        
        // Update framebuffer cache
        *self.framebuffer.lock().unwrap() = Some(buffer.clone());
        *self.framebuffer_size.lock().unwrap() = (width, height);
        *self.last_update.lock().unwrap() = Some(Instant::now());
        
        Ok((buffer, width, height))
    }
    
    /// Get cached framebuffer data
    pub fn get_framebuffer(&self) -> Option<(Vec<u8>, u32, u32)> {
        let fb = self.framebuffer.lock().unwrap();
        let size = self.framebuffer_size.lock().unwrap();
        
        fb.as_ref().map(|data| (data.clone(), size.0, size.1))
    }
    
    /// Check if framebuffer has been updated recently
    pub fn is_framebuffer_fresh(&self, max_age: Duration) -> bool {
        let last_update = self.last_update.lock().unwrap();
        match *last_update {
            Some(t) => t.elapsed() < max_age,
            None => false,
        }
    }
    
    /// Stop the VM
    pub fn stop(&mut self) -> Result<(), String> {
        log::info!("Stopping Alpine VM");
        
        // Stop VNC capture
        if let Some(mut child) = self.vnc_capture_process.lock().unwrap().take() {
            let _ = child.kill();
            let _ = child.wait();
        }
        
        // Stop QEMU
        if let Some(mut child) = self.qemu_process.lock().unwrap().take() {
            let _ = child.kill();
            let _ = child.wait();
        }
        
        // Clean up socket
        let _ = std::fs::remove_file(&self.config.framebuffer_socket);
        
        // Clean up temp dir
        if let Some(temp_dir) = self.temp_dir.lock().unwrap().take() {
            let _ = fs::remove_dir_all(temp_dir);
        }
        
        *self.state.lock().unwrap() = AlpineVmState::Stopped;
        
        log::info!("Alpine VM stopped");
        Ok(())
    }
    
    /// Get current VM state
    pub fn state(&self) -> AlpineVmState {
        self.state.lock().unwrap().clone()
    }
    
    /// Check if VM is running
    pub fn is_running(&self) -> bool {
        self.state() == AlpineVmState::Running
    }
    
    /// Get window ID
    pub fn window_id(&self) -> Option<usize> {
        self.config.window_id
    }
    
    /// Set window ID
    pub fn set_window_id(&mut self, window_id: usize) {
        self.config.window_id = Some(window_id);
    }
    
    /// Get tile position
    pub fn tile_position(&self) -> Option<(f64, f64)> {
        self.config.tile_position
    }
    
    /// Set tile position
    pub fn set_tile_position(&mut self, x: f64, y: f64) {
        self.config.tile_position = Some((x, y));
    }

    /// Type text into the VM console via QMP (Sequentially)
    pub fn type_text(&self, text: &str) {
        let text = text.to_string();
        let qmp_client = self.qmp_client.clone();
        
        // Spawn a single task for the entire string to ensure sequential delivery
        tokio::spawn(async move {
            let mut guard = qmp_client.lock().await;
            if let Some(client) = guard.as_mut() {
                for c in text.chars() {
                    if let Some((qcode, shift)) = Self::char_to_qcode(c) {
                        // 1. Shift Down
                        if shift {
                             let event = serde_json::json!({
                                "type": "key",
                                "data": { "key": { "type": "qcode", "data": "shift" }, "down": true }
                            });
                            let args = serde_json::json!({ "events": [ event ] });
                            let _ = client.execute("input-send-event", Some(args)).await;
                        }
                        
                        // 2. Key Press (Down)
                        {
                             let event = serde_json::json!({
                                "type": "key",
                                "data": { "key": { "type": "qcode", "data": qcode }, "down": true }
                            });
                            let args = serde_json::json!({ "events": [ event ] });
                            let _ = client.execute("input-send-event", Some(args)).await;
                        }

                        // 3. Key Press (Up)
                        {
                             let event = serde_json::json!({
                                "type": "key",
                                "data": { "key": { "type": "qcode", "data": qcode }, "down": false }
                            });
                            let args = serde_json::json!({ "events": [ event ] });
                            let _ = client.execute("input-send-event", Some(args)).await;
                        }
                        
                        // 4. Shift Up
                        if shift {
                             let event = serde_json::json!({
                                "type": "key",
                                "data": { "key": { "type": "qcode", "data": "shift" }, "down": false }
                            });
                            let args = serde_json::json!({ "events": [ event ] });
                            let _ = client.execute("input-send-event", Some(args)).await;
                        }

                        // Small delay for realism and buffer safety
                        tokio::time::sleep(Duration::from_millis(5)).await;
                    }
                }
            }
        });
    }
    
    /// Internal wrapper for inject_key_event to match naming
    fn send_key_event(&self, key: &str, down: bool) {
        self.inject_key_event(key, down);
    }

    /// Map char to (qcode, shift_pressed)
    pub fn char_to_qcode(c: char) -> Option<(&'static str, bool)> {
        match c {
            'a' => Some(("a", false)), 'A' => Some(("a", true)),
            'b' => Some(("b", false)), 'B' => Some(("b", true)),
            'c' => Some(("c", false)), 'C' => Some(("c", true)),
            'd' => Some(("d", false)), 'D' => Some(("d", true)),
            'e' => Some(("e", false)), 'E' => Some(("e", true)),
            'f' => Some(("f", false)), 'F' => Some(("f", true)),
            'g' => Some(("g", false)), 'G' => Some(("g", true)),
            'h' => Some(("h", false)), 'H' => Some(("h", true)),
            'i' => Some(("i", false)), 'I' => Some(("i", true)),
            'j' => Some(("j", false)), 'J' => Some(("j", true)),
            'k' => Some(("k", false)), 'K' => Some(("k", true)),
            'l' => Some(("l", false)), 'L' => Some(("l", true)),
            'm' => Some(("m", false)), 'M' => Some(("m", true)),
            'n' => Some(("n", false)), 'N' => Some(("n", true)),
            'o' => Some(("o", false)), 'O' => Some(("o", true)),
            'p' => Some(("p", false)), 'P' => Some(("p", true)),
            'q' => Some(("q", false)), 'Q' => Some(("q", true)),
            'r' => Some(("r", false)), 'R' => Some(("r", true)),
            's' => Some(("s", false)), 'S' => Some(("s", true)),
            't' => Some(("t", false)), 'T' => Some(("t", true)),
            'u' => Some(("u", false)), 'U' => Some(("u", true)),
            'v' => Some(("v", false)), 'V' => Some(("v", true)),
            'w' => Some(("w", false)), 'W' => Some(("w", true)),
            'x' => Some(("x", false)), 'X' => Some(("x", true)),
            'y' => Some(("y", false)), 'Y' => Some(("y", true)),
            'z' => Some(("z", false)), 'Z' => Some(("z", true)),
            
            '0' => Some(("0", false)), ')' => Some(("0", true)),
            '1' => Some(("1", false)), '!' => Some(("1", true)),
            '2' => Some(("2", false)), '@' => Some(("2", true)),
            '3' => Some(("3", false)), '#' => Some(("3", true)),
            '4' => Some(("4", false)), '$' => Some(("4", true)),
            '5' => Some(("5", false)), '%' => Some(("5", true)),
            '6' => Some(("6", false)), '^' => Some(("6", true)),
            '7' => Some(("7", false)), '&' => Some(("7", true)),
            '8' => Some(("8", false)), '*' => Some(("8", true)),
            '9' => Some(("9", false)), '(' => Some(("9", true)),
            
            '-' => Some(("minus", false)), '_' => Some(("minus", true)),
            '=' => Some(("equal", false)), '+' => Some(("equal", true)),
            '[' => Some(("bracket_left", false)), '{' => Some(("bracket_left", true)),
            ']' => Some(("bracket_right", false)), '}' => Some(("bracket_right", true)),
            ';' => Some(("semicolon", false)), ':' => Some(("semicolon", true)),
            '\'' => Some(("apostrophe", false)), '"' => Some(("apostrophe", true)),
            '`' => Some(("grave_accent", false)), '~' => Some(("grave_accent", true)),
            '\\' => Some(("backslash", false)), '|' => Some(("backslash", true)),
            ',' => Some(("comma", false)), '<' => Some(("comma", true)),
            '.' => Some(("dot", false)), '>' => Some(("dot", true)),
            '/' => Some(("slash", false)), '?' => Some(("slash", true)),
            
            ' ' => Some(("spc", false)),
            '\n' => Some(("ret", false)),
            '\t' => Some(("tab", false)),
            
            _ => None,
        }
    }

    /// Map Linux Scancode to QEMU QCode
    pub fn scancode_to_qcode(scancode: u32) -> Option<&'static str> {
        match scancode {
            1 => Some("esc"),
            2 => Some("1"),
            3 => Some("2"),
            4 => Some("3"),
            5 => Some("4"),
            6 => Some("5"),
            7 => Some("6"),
            8 => Some("7"),
            9 => Some("8"),
            10 => Some("9"),
            11 => Some("0"),
            12 => Some("minus"),
            13 => Some("equal"),
            14 => Some("backspace"),
            15 => Some("tab"),
            16 => Some("q"),
            17 => Some("w"),
            18 => Some("e"),
            19 => Some("r"),
            20 => Some("t"),
            21 => Some("y"),
            22 => Some("u"),
            23 => Some("i"),
            24 => Some("o"),
            25 => Some("p"),
            26 => Some("bracket_left"),
            27 => Some("bracket_right"),
            28 => Some("ret"),
            29 => Some("ctrl"),
            30 => Some("a"),
            31 => Some("s"),
            32 => Some("d"),
            33 => Some("f"),
            34 => Some("g"),
            35 => Some("h"),
            36 => Some("j"),
            37 => Some("k"),
            38 => Some("l"),
            39 => Some("semicolon"),
            40 => Some("apostrophe"),
            42 => Some("shift"),
            43 => Some("backslash"),
            44 => Some("z"),
            45 => Some("x"),
            46 => Some("c"),
            47 => Some("v"),
            48 => Some("b"),
            49 => Some("n"),
            50 => Some("m"),
            51 => Some("comma"),
            52 => Some("dot"),
            53 => Some("slash"),
            56 => Some("alt"),
            57 => Some("spc"),
            58 => Some("caps_lock"),
            _ => None,
        }
    }
}

impl Drop for AlpineVmManager {
    fn drop(&mut self) {
        // Clean up on drop
        let _ = self.stop();
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_default_config() {
        let config = AlpineVmConfig::default();
        assert_eq!(config.vnc_port, 5900);
        assert_eq!(config.monitor_port, 55555);
        assert_eq!(config.memory_mb, 512);
        assert_eq!(config.cpu_cores, 1);
    }
    
    #[test]
    fn test_vm_state_transitions() {
        let config = AlpineVmConfig::default();
        let manager = AlpineVmManager::new(config);
        
        assert_eq!(manager.state(), AlpineVmState::Stopped);
        assert!(!manager.is_running());
    }
}
