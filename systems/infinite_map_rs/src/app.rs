use std::time::{SystemTime, UNIX_EPOCH};
use std::sync::{Arc, Mutex};

use smithay::{
    reexports::wayland_server::{
        protocol::wl_surface::WlSurface,
        Resource,
    },
    backend::input::{
        InputEvent as SmithayInputEvent,
        ButtonState,
        MouseButton,
        Axis,
        InputBackend,
        AbsolutePositionEvent,
        PointerButtonEvent,
        PointerAxisEvent,
        KeyboardKeyEvent,
    },
    utils::Size,
    wayland::compositor::{with_states, SurfaceAttributes, Damage},
    wayland::shm::with_buffer_contents,
    backend::renderer::utils::with_renderer_surface_state,
};

use crate::{
    camera::Camera,
    window::{WindowManager, WindowType},
    renderer::Renderer,
    input_manager::InputManager,
    compositor_state::GeometryCompositorState,
    evolution_manager::EvolutionManager,
    thought_renderer::ThoughtRenderer,
    visual_feedback::VisualFeedbackEncoder,
    audio_manager::AudioManager,
    clipboard_manager::SharedClipboardManager,
    clipboard_rts::ClipboardRTS,
    clipboard_texture_manager::ClipboardTextureManager,
    graph_renderer::GraphRenderer,
    evolution_protocol::MemoryGraphProtocol,
    inspector_ui::InspectorUI,
    compiler_tile::CompilerTileDispatcher,
    cartridge_registry::CartridgeRegistry,
};

use crate::evolution_protocol::DaemonFrequencyBand;
use visual_shell::{DaemonId, FrequencyBand};

#[cfg(feature = "hypervisor")]
use crate::virtual_machine::VirtualMachine;
use crate::vm_texture_manager::VmTextureManager;
use crate::cartridge_texture_manager::CartridgeTextureManager;
use crate::virtual_machine::QemuProcessWithShm;
use crate::antigravity_watcher::AntigravityWatcher;
use crate::tectonic_simulator::TectonicSimulator;
use visual_shell::VisualShellIntegration;
use crate::bridge::unreal::UnrealBridge;
use crate::neural_console::ConsoleAction;

pub struct Config {
    pub damping: f32,
    #[allow(dead_code)]
    pub grid_size: f32,
    #[allow(dead_code)]
    pub min_zoom: f32,
    #[allow(dead_code)]
    pub max_zoom: f32,
}

pub const CONFIG: Config = Config {
    min_zoom: 0.1,
    max_zoom: 5.0,
    damping: 0.1,
    grid_size: 100.0,
};

pub struct InfiniteMapApp<'a> {
    pub camera: Camera,
    pub window_manager: WindowManager,
    pub is_panning: bool,
    pub last_mouse_pos: Option<(f32, f32)>,
    #[allow(dead_code)]
    pub dragging_window: Option<usize>,
    pub renderer: Renderer<'a>,
    pub input_manager: InputManager,
    pub evolution_manager: Option<std::sync::Arc<std::sync::Mutex<EvolutionManager>>>,
    pub evolution_window_id: Option<usize>,
    pub thought_renderer: Option<ThoughtRenderer>,
    pub visual_feedback: Option<VisualFeedbackEncoder>,
    pub visual_shell: Option<VisualShellIntegration>,
    // Phase 28: Sensory Calibration
    pub audio_manager: Option<AudioManager>,
    // Phase 30: Virtual Machine
    #[cfg(feature = "hypervisor")]
    pub vm: Option<Arc<Mutex<VirtualMachine>>>,
    #[cfg(feature = "hypervisor")]
    pub vm_window_id: Option<usize>,
    // Phase 30.2: VM Texture Manager
    pub vm_texture_manager: Option<VmTextureManager>,
    // Phase 42: Alpine Linux VM
    pub alpine_vm: Option<std::sync::Arc<Mutex<crate::alpine_vm::AlpineVmManager>>>,
    pub alpine_vm_window_id: Option<usize>,
    pub is_selecting_text: bool,
    // Phase 47: QEMU Shared Memory Process
    pub qemu_shm_process: Option<QemuProcessWithShm>,
    pub qemu_shm_window_id: Option<usize>,
    // Phase 30.8: Frame timing for cursor blink
    pub last_frame_time: Option<u32>,
    // Phase 31: Clipboard Manager
    pub clipboard_manager: Option<SharedClipboardManager>,
    // Phase 31.2: RTS Clipboard for visual persistence
    #[allow(dead_code)]
    pub rts_clipboard: Option<ClipboardRTS>,
    clipboard_texture_manager: Option<ClipboardTextureManager>,
    // Phase 33: Memory Visualization
    pub memory_texture_mapper: Option<crate::memory_texture::MemoryTextureMapper>,
    pub memory_texture_manager: Option<crate::memory_texture_manager::MemoryTextureManager>,
    pub memory_raycaster: Option<crate::memory_raycaster::MemoryRaycaster>,
    pub terrain_raycaster: Option<crate::terrain_raycaster::TerrainRaycaster>, // Phase 39.2
    pub memory_artifact_manager: Option<crate::memory_artifacts::MemoryArtifactManager>,
    // Phase 33 Step 3: Hex dump window
    hex_dump_window_id: Option<usize>,
    hex_dump_address: Option<usize>,
    
    // Phase 34.3: Optical Script Loading
    pub embedded_python_context: Option<crate::python_runtime::EmbeddedPythonContext>,
    
    // Phase 33: Performance Metrics
    last_fps_log: std::time::Instant,
    frame_count: u32,

    // Phase 34.4: Pixel CPU Execution
    pub riscv_executor: Option<std::sync::Arc<std::sync::Mutex<crate::riscv_executor::RiscvExecutor>>>,
    // Phase 48: GPU Capability Detection for i64 Support

    // Phase 34: Visual Bridge
    visual_command_rx: Option<tokio::sync::mpsc::Receiver<crate::glass_ram::bridge::VisualCommand>>,
    
    // Phase 34.5: Diagnostic Overlay
    pub diagnostic_overlay: crate::diagnostic::DiagnosticOverlay,
    diagnostic_window_id: Option<usize>,
    
    // Phase 2: Tool Integration Layer
    pub tool_manager: Option<crate::tool_manager::ToolManager>,

    // Phase 35: Synaptic Bridge
    pub synaptic_bridge: crate::synapse::SynapticBridge,
    pub intent_window_id: Option<usize>,
    
    // Phase 35.2: Synaptic Overlay (Intent Input)
    pub synaptic_overlay: crate::synapse::IntentOverlay,
    pub overlay_window_id: Option<usize>,
    
    // Phase 35.3: Synaptic Daemon Bridge
    pub synaptic_daemon_bridge: Option<crate::synapse::SynapticDaemonBridge>,
    // Phase 37.2: Cognitive Daemon Bridge (Direct LLM)
    pub cognitive_bridge: Option<crate::synapse::CognitiveDaemonBridge>,
    
    // Phase 36: QEMU Shared Memory Bridge
    pub qemu_bridge: Option<crate::qemu::SharedMemoryBridge>,
    // Phase 36.2: QMP Control Channel
    pub qmp_tx: Option<tokio::sync::mpsc::Sender<crate::qemu::QmpCommand>>,
    // Phase 37.1: Neural Introspection - Hover-to-Query
    pub hovered_memory_address: Option<usize>,
    // Phase 38: Antigravity Bridge (Tectonic)
    pub antigravity_watcher: Option<AntigravityWatcher>,
    pub rts_watcher: Option<AntigravityWatcher>,
    pub antigravity_window_id: Option<usize>,
    pub tectonic_simulator: Option<TectonicSimulator>,

    // Phase 35.9: Cartridges Rendered
    pub cartridges_rendered: std::collections::HashSet<String>,

    // Phase 35.9.1: Cartridge texture manager
    pub cartridge_texture_manager: Option<CartridgeTextureManager>,

    // Phase 37.3: Introspection Window (Async UI updates)
    introspection_rx: Option<tokio::sync::mpsc::Receiver<(usize, String)>>,
    introspection_tx: tokio::sync::mpsc::Sender<(usize, String)>,
    
    // Phase 40: Unreal Engine Bridge
    pub unreal_bridge: Option<UnrealBridge>,

    // Phase 41: Neural Console
    pub neural_console: Option<crate::neural_console::NeuralConsole>,
    pub neural_console_window_id: Option<usize>,

    // Phase 42: Infinite Map Loader (The Visual Cortex)
    pub map_loader: Option<crate::map_loader::MapLoader>,
    spawned_map_artifacts: std::collections::HashSet<(i32, i32)>,

    // Memory Graph Renderer
    pub graph_renderer: Option<std::sync::Arc<GraphRenderer>>,
    // Memory Graph Inspector Components
    pub evolution_protocol: Option<std::sync::Arc<MemoryGraphProtocol>>,
    pub inspector_ui: Option<std::sync::Arc<InspectorUI>>,
    pub inspector_visible: bool,
    
    // Phase 43: Visual Shell Integration
    pub manifest_writer: Option<crate::manifest_writer::ManifestWriter>,
    // Phase 43: Camera Sync WebSocket Server
    pub camera_sync_server: Option<std::sync::Arc<crate::camera_sync::CameraSyncServer>>,

    // Phase 44: Antigravity's Cognitive Territory
    pub cognitive_territory: Option<crate::cognitive_territory::CognitiveTerritory>,

    // Phase 46: ACE-RTS Cognitive System
    pub cognitive_manager: Option<std::sync::Arc<crate::cognitive::entity_manager::CognitiveEntityManager>>,
    pub cognitive_runtimes: std::collections::HashMap<String, crate::cognitive::ace_runtime::ACERuntime>,

    // Phase 44: JIT Profiler
    pub profiler_enabled: bool,
    pub profiler_interval: std::time::Duration,
    pub profiler_last_poll: std::time::Instant,
    // Phase 20: RISC-V Linux VM (Full RV32IMA)
    pub riscv_linux_vm: Option<crate::riscv_linux_vm::RiscVLinuxVM>,

    // Phase 44: Multi-VM Manager for parallel execution
    pub multi_vm_manager: Option<crate::multi_vm_manager::MultiVmManager>,

    // Phase 40: PROJECT OUROBOROS - Source City
    pub source_city_loader: Option<crate::source_city::SourceCityLoader>,

    // Phase 40.5: Stateful Hot Swapping - Vat Registry and ModuleManager
    pub vat_registry: Option<std::sync::Arc<std::sync::Mutex<crate::hot_swap::VatRegistry>>>,
    pub module_manager: Option<std::sync::Arc<std::sync::Mutex<crate::hot_swap::ModuleManager>>>,

    // Phase 34.2: Shared Runtime State (Focus/Mouse)
    pub runtime_state: std::sync::Arc<std::sync::Mutex<crate::api_server::RuntimeState>>,
    
    // Phase 35.4: Shared Synaptic Layer
    pub synaptic_layer: std::sync::Arc<std::sync::Mutex<crate::synapse::SynapticLayer>>,

    // Phase 100: Visual Cortex (AI Retina)
    pub visual_cortex: crate::visual_cortex::VisualCortex,

    // Phase 40.2: Source City Interaction
    dragging_source_tile: Option<String>,
    source_tile_drag_start: Option<(f32, f32)>, // World coordinates

    // Phase 40.5: Hot-swap visual tracking
    pub path_to_artifact: std::collections::HashMap<std::path::PathBuf, usize>,
    pub active_morphs: std::collections::HashMap<usize, f32>,
    
    // Phase 46.5: Stabilization & Validation - Telemetry & Signal Grouping
    pub recent_agent_actions: std::collections::HashMap<String, (u32, f64)>,
    // Phase 46: Autonomous Agents
    pub agent_manager: Option<crate::cognitive::agents::CityAgentManager>,

    // Evolution → Infinite Map Bridge
    pub evolution_terrain_bridge: Option<crate::evolution_terrain_bridge::SharedEvolutionTerrainBridge>,
    pub evolution_terrain_bind_group_1: Option<wgpu::BindGroup>,
    pub evolution_terrain_bind_group_2: Option<wgpu::BindGroup>,

    // Phase Mode B.2: Spatial Auto-Save System
    current_tile_x: Option<i32>,
    current_tile_y: Option<i32>,
    last_auto_save_time: std::time::Instant,

    // Phase 40: Source Crystallization
    pub source_importer: Option<crate::source_importer::SourceImporter>,
    pub crystallized_project: Option<crate::source_importer::CrystallizedProject>,

    // Phase 41: Visual AST - Code Gardener Substrate
    pub visual_ast: Option<crate::visual_ast::VisualAST>,
    
    // Phase 46: Z.ai Integration
    pub zai_client: Option<crate::synapse::z_ai_client::ZAiClient>,

    // Phase 48: Mouse Text Selection State
    pub text_selection_drag_start: Option<u32>,  // Grid index where drag started
    pub text_selection_last_update: Option<u32>, // Last grid index during drag
    pub last_click_time: Option<std::time::Instant>, // For double/triple click detection
    pub last_click_pos: Option<(f32, f32)>,      // Screen position of last click
    pub click_count: u32,                         // 1=single, 2=double, 3=triple

    // Phase 42: Micro-Compiler Tile - Visual Feedback
    compilation_status: CompilationStatus,
    compilation_tile_path: Option<std::path::PathBuf>,
    compilation_start_time: Option<std::time::Instant>,
    compiler_dispatcher: Option<std::sync::Arc<CompilerTileDispatcher>>,

    // Phase 43: Geometric JIT Evolution
    pub jit_bridge: Option<crate::jit_bridge::JitBridge>,

    // Phase 45 / Horizon 1: Process Tiles - Linux processes as visual tiles
    pub process_tile_manager: Option<crate::process_tile::ProcessTileManager>,
    pub pid_to_window: std::collections::HashMap<u32, usize>,
    // Phase 45 / Horizon 1.2: Filesystem Hilbert Mapper
    pub filesystem_hilbert_manager: Option<crate::filesystem_hilbert::FilesystemHilbertManager>,
    // Phase 45 / Horizon 1.3: Terminal Tiles
    pub terminal_tiles: Vec<crate::terminal_tile::TerminalTile>,

    // Shader Execution Zone: Compositor for drag-and-drop WGSL .rts.png files
    pub compositor: Option<infinite_map_rs::Compositor>,

    // Phase 48: GPU Capabilities for i64 support detection
    pub gpu_caps: crate::gpu_capabilities::GpuCapabilities,
}

/// Phase 42: Compilation status for visual feedback
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum CompilationStatus {
    None,
    Compiling,
    #[allow(dead_code)]
    Success,
    Error,
}

impl<'a> InfiniteMapApp<'a> {
    pub fn new(
        camera: Camera, 
        window_manager: WindowManager, 
        renderer: Renderer<'a>, 
        input_manager: InputManager,
        runtime_state: std::sync::Arc<std::sync::Mutex<crate::api_server::RuntimeState>>,
        synaptic_layer: std::sync::Arc<std::sync::Mutex<crate::synapse::SynapticLayer>>,
    ) -> Self {
        let mut app = InfiniteMapApp {
            camera,
            window_manager,
            is_panning: false,
            last_mouse_pos: None,
            dragging_window: None,
            renderer,
            input_manager,
            runtime_state,
            synaptic_layer,
            evolution_manager: None,
            evolution_window_id: None,
            thought_renderer: None,
            visual_feedback: None,
            visual_shell: None,
            audio_manager: None,
            #[cfg(feature = "hypervisor")]
            vm: None,
            #[cfg(feature = "hypervisor")]
            vm_window_id: None,
            vm_texture_manager: None,
            // Phase 42: Initialize Alpine VM
            alpine_vm: None,
            alpine_vm_window_id: None,
            is_selecting_text: false,
            qemu_shm_process: None,
            qemu_shm_window_id: None,
            // Phase 30.8: Initialize frame timing
            last_frame_time: None,
            // Phase 37.1: Neural Introspection - Hover-to-Query
            hovered_memory_address: None,
            // Phase 31: Initialize clipboard manager
            clipboard_manager: Some(SharedClipboardManager::new()),
            // Phase 31.2: Initialize RTS Clipboard for visual persistence
            rts_clipboard: None,
            // Phase 31.2: Initialize clipboard texture manager
            clipboard_texture_manager: None,
            // Phase 33: Memory Texture Mapper
            memory_texture_mapper: None,
            // Phase 33: Memory Texture Manager
            memory_texture_manager: None,
            memory_raycaster: None,
            memory_artifact_manager: None,
            // Phase 33 Step 3: Hex dump window
            hex_dump_window_id: None,
            hex_dump_address: None,
            
            // Phase 34.3: Optical Script Loading - Deferred to background thread to prevent hang
            embedded_python_context: None,
            
            // Phase 33: Performance Metrics
            last_fps_log: std::time::Instant::now(),
            frame_count: 0,
            visual_command_rx: None,

            diagnostic_overlay: crate::diagnostic::DiagnosticOverlay::new(),
            diagnostic_window_id: None,
            // Phase 2: Initialize tool manager
            tool_manager: None,
            // Phase 35: Synaptic Bridge
            synaptic_bridge: crate::synapse::SynapticBridge::new(),
            intent_window_id: None,
            // Phase 35.2: Synaptic Overlay
            synaptic_overlay: crate::synapse::IntentOverlay::new(),
            overlay_window_id: None,
            // Phase 35.3: Synaptic Daemon Bridge
            synaptic_daemon_bridge: None,
            cognitive_bridge: None,
            // Phase 36: QEMU Shared Memory Bridge
            qemu_bridge: None,
            qmp_tx: None,
            introspection_rx: None, // Initialized below
            introspection_tx: tokio::sync::mpsc::channel(1).0, // Use dummy, overwritten below
            
            antigravity_watcher: None,
            rts_watcher: None,
            antigravity_window_id: None,
            tectonic_simulator: None,
            
            // Phase 35.9
            cartridges_rendered: std::collections::HashSet::new(),
            // Phase 35.9.1: Cartridge texture manager (initialized when device is available)
            cartridge_texture_manager: None,

            terrain_raycaster: None,
            // Phase 40: Initialize Unreal Bridge (The Glass Monitor)
            unreal_bridge: UnrealBridge::new(),
            // Phase 41: Neural Console
            neural_console: None, // Initialized later
            neural_console_window_id: None,
            
            // Phase 42: Map Loader
            map_loader: Some(crate::map_loader::MapLoader::new(std::path::PathBuf::from("systems/builder/map/manifest.json"))),
            spawned_map_artifacts: std::collections::HashSet::new(),

            // Memory Graph Renderer (initialized later)
            graph_renderer: None,
            // Memory Graph Inspector Components (initialized later)
            evolution_protocol: None,
            inspector_ui: None,
            inspector_visible: false,
            
            // Phase 43: Visual Shell Integration
            manifest_writer: None, // Initialized later
            // Phase 43: Camera Sync WebSocket Server (initialized later)
            camera_sync_server: None,
            
            // Phase 44: Initialize Antigravity's Territory
            cognitive_territory: Some(crate::cognitive_territory::CognitiveTerritory::new()),

            // Phase 46: Initialize ACE-RTS Cognitive System
            cognitive_manager: Some(std::sync::Arc::new(crate::cognitive::entity_manager::CognitiveEntityManager::new())),
            cognitive_runtimes: std::collections::HashMap::new(),

            // Phase 2: Initialize RISC-V Executor
            riscv_executor: None,
            // Phase 44: Initialize JIT Profiler
            profiler_enabled: false,  // Disabled by default, can be enabled via hotkey
            profiler_interval: std::time::Duration::from_secs(1),  // Poll every 1 second
            profiler_last_poll: std::time::Instant::now(),
            // Phase 20: Initialize RISC-V Linux VM
            riscv_linux_vm: None,
            // Phase 44: Multi-VM Manager (initialized later when device is available)
            multi_vm_manager: None,
            // Phase 40: PROJECT OUROBOROS - Source City Loader
            source_city_loader: None,
            // Phase 40.5: Stateful Hot Swapping - Vat Registry and ModuleManager
            vat_registry: None,
            module_manager: None,
            dragging_source_tile: None,
            source_tile_drag_start: None,
            path_to_artifact: std::collections::HashMap::new(),
            active_morphs: std::collections::HashMap::new(),
            recent_agent_actions: std::collections::HashMap::new(),
            agent_manager: None,
            // Phase 100: Initialize Visual Cortex
            visual_cortex: crate::visual_cortex::VisualCortex::new("/home/jericho/zion/projects/geometry_os/geometry_os/systems/vision/retina.rts.png"),
            
            // Evolution → Infinite Map Bridge
            evolution_terrain_bridge: Some(crate::evolution_terrain_bridge::create_shared_bridge()),
            evolution_terrain_bind_group_1: None,
            evolution_terrain_bind_group_2: None,

            // Phase Mode B.2: Spatial Auto-Save System
            current_tile_x: None,
            current_tile_y: None,
            last_auto_save_time: std::time::Instant::now(),
            
            // Phase 40: Source Crystallization
            source_importer: None,
            crystallized_project: None,

            // Phase 41: Visual AST - Code Gardener Substrate
            // Phase 41: Visual AST - Code Gardener Substrate
            visual_ast: None,

            // Phase 46: Z.ai Integration
            zai_client: std::env::var("ZAI_API_KEY")
                .ok()
                .map(crate::synapse::z_ai_client::ZAiClient::new),

            // Phase 48: Mouse Text Selection State
            text_selection_drag_start: None,
            text_selection_last_update: None,
            last_click_time: None,
            last_click_pos: None,
            click_count: 0,

            // Phase 42: Micro-Compiler Tile - Visual Feedback
            compilation_status: CompilationStatus::None,
            compilation_tile_path: None,
            compilation_start_time: None,
            compiler_dispatcher: None, // Will be initialized after renderer is ready

            // Phase 43: Geometric JIT Evolution
            jit_bridge: None,

            process_tile_manager: Some(crate::process_tile::ProcessTileManager::new()),
            pid_to_window: std::collections::HashMap::new(),
            filesystem_hilbert_manager: Some(crate::filesystem_hilbert::FilesystemHilbertManager::new(
                std::path::PathBuf::from("/home/jericho/zion/projects/geometry_os/geometry_os")
            )),
            terminal_tiles: Vec::new(),
            // Shader Execution Zone: Compositor initialized to None (will be set when device is available)
            compositor: None,
            // Phase 48: Initialize GPU capabilities with defaults (will be updated when adapter is available)
            gpu_caps: crate::gpu_capabilities::GpuCapabilities {
                supports_i64: true, // Assume native support initially
                vendor_name: "Unknown".to_string(),
                device_name: "Unknown".to_string(),
            },
        };

        // Initial filesystem scan
        if let Some(ref mut fhm) = app.filesystem_hilbert_manager {
            let _ = fhm.scan();
        }
        
        // Initialize introspection channel
        let (tx, rx) = tokio::sync::mpsc::channel(10);
        app.introspection_rx = Some(rx);
        app.introspection_tx = tx;
        
        // Phase 37.3: Enable Cortex Layer
        app.renderer.enable_cortex();

        app
    }

    // Phase 48: Initialize GPU capabilities asynchronously
    // This should be called during app initialization when we have access to the GPU adapter
    #[allow(dead_code)]
    pub async fn initialize_gpu_capabilities(&mut self, adapter: &wgpu::Adapter) {
        self.gpu_caps = crate::gpu_capabilities::GpuCapabilities::new(adapter).await;
        self.log_gpu_info();
    }

    // Synchronous version for simpler integration (uses pollster internally)
    pub fn initialize_gpu_capabilities_sync(&mut self, adapter: &wgpu::Adapter) {
        self.gpu_caps = pollster::block_on(crate::gpu_capabilities::GpuCapabilities::new(adapter));
        self.log_gpu_info();
    }

    pub fn set_visual_command_rx(&mut self, rx: tokio::sync::mpsc::Receiver<crate::glass_ram::bridge::VisualCommand>) {
        self.visual_command_rx = Some(rx);
    }
    
    // Phase 40+41: Import Source Crystal + Visual AST
    pub fn import_source_crystal(&mut self) {
        log::info!("💎 Initiating Source Crystallization (Phase 40)...");
        
        // Determine project root (assume current directory for now)
        let project_root = std::env::current_dir().unwrap_or(std::path::PathBuf::from("."));
        
        let mut importer = crate::source_importer::SourceImporter::new(project_root.clone());
        
        // Import at coordinate (1200, 3400) as per prompt
        match importer.import_crate((1200, 3400)) {
            Ok(project) => {
                log::info!("✅ Successfully crystallized project: {} tiles", project.tiles.len());
                self.crystallized_project = Some(project.clone());
                self.source_importer = Some(importer);
                
                // Phase 41: Create Visual AST from crystallized tiles
                log::info!("🌳 Building Visual AST (Phase 41)...");
                match crate::visual_ast::VisualAST::from_tiles(project.tiles.clone()) {
                    Ok(ast) => {
                        log::info!("✅ Visual AST: {} nodes across {} files",
                            ast.nodes.len(), ast.roots.len());
                        self.visual_ast = Some(ast);
                        
                        // Auto-spawn first Scout agent
                        log::info!("🤖 Auto-spawning Scout agent for syntax patrol...");
                        // TODO: Spawn Scout agent (Phase 46)
                        
                        eprintln!("✅ Global Source Crystal + Visual AST at (1200, 3400)");
                    }
                    Err(e) => {
                        log::warn!("⚠️  Failed to create Visual AST: {}", e);
                        eprintln!("⚠️  Visual AST parsing failed: {}", e);
                    }
                }
            }
            Err(e) => {
                log::error!("❌ Failed to crystallize source: {}", e);
                eprintln!("❌ Import failed: {}", e);
            }
        }
    }
    
    // Phase 33: Initialize Memory Texture Mapper
    pub fn initialize_memory_mapper(&mut self) {
        log::info!("🧠 Initializing Glass RAM (Process Memory Visualization)...");
        // Renderer returns Arc<Device>, we pass Arc to mapper
        let device = self.renderer.get_device().clone();
        let queue = self.renderer.get_queue().clone();

        let mut mapper = crate::memory_texture::MemoryTextureMapper::new(device, queue, None);

        // Map regions immediately
        if let Err(e) = mapper.map_memory_regions() {
            log::warn!("Failed to map memory regions: {}", e);
        } else {
             log::info!("✅ Mapped memory regions (Heap found: {})", mapper.heap_region.is_some());
        }

        self.memory_texture_mapper = Some(mapper);
    }

    // Phase 40.5: Initialize ModuleManager for hot-swapping
    pub fn initialize_module_manager(&mut self) {
        log::info!("🔧 Initializing ModuleManager (Phase 40.5: Stateful Hot Swapping)...");

        // Create VatRegistry first
        let vat_registry = std::sync::Arc::new(std::sync::Mutex::new(
            crate::hot_swap::VatRegistry::new(std::path::PathBuf::from("systems/health/state_vats"))
        ));

        // Create ModuleManager with the registry
        let module_manager = std::sync::Arc::new(std::sync::Mutex::new(
            crate::hot_swap::ModuleManager::new(vat_registry.clone())
        ));

        // Add common search paths
        {
            let mut manager = module_manager.lock().unwrap();
            manager.add_search_path(std::path::PathBuf::from("target/debug"));
            manager.add_search_path(std::path::PathBuf::from("target/release"));
            manager.add_search_path(std::path::PathBuf::from("modules"));
            manager.add_search_path(std::path::PathBuf::from("systems/builder/modules"));
        }

        self.vat_registry = Some(vat_registry);
        self.module_manager = Some(module_manager);

        // Auto-load test module for Phase 40.5 Validation
        let test_module_path = std::path::PathBuf::from("systems/builder/modules/test_module.so");
        if test_module_path.exists() {
            let mut manager = self.module_manager.as_ref().unwrap().lock().unwrap();
            match manager.load_module(&test_module_path) {
                Ok(vat_id) => log::info!("🔋 Phase 40.5: Test module loaded successfully ({})", vat_id.as_str()),
                Err(e) => log::error!("⚠️  Phase 40.5: Failed to load test module: {:?}", e),
            }
        }

        log::info!("✅ ModuleManager initialized with VatRegistry");
    }

    // Phase 31: Bridge input to Crystallized Text Engine
    pub fn update_crystallized_text(&mut self) {
        let mut cursor_shifted = false;
        if let Some(input_data) = self.input_manager.get_crystallized_input() {
            let queue = self.renderer.get_queue();
            if let Some(text_engine) = &mut self.renderer.text_engine {
                for byte in input_data {
                    text_engine.update(&queue, byte);
                    cursor_shifted = true;
                }
            }
        }

        // Phase 32: Camera Follow Mode
        if cursor_shifted {
            self.update_camera_for_text_cursor();
        }
    }

    // Phase 34: Handle save/load commands
    pub fn handle_save_load_commands(&mut self) {
        if let Some(commands) = self.input_manager.get_save_load_commands() {
            for cmd in commands {
                match cmd {
                    135 => { // Ctrl+S = Save
                        self.save_crystallized_text();
                    }
                    136 => { // Ctrl+O = Load
                        self.load_crystallized_text();
                    }
                    _ => {
                        log::warn!("Unknown save/load command: {}", cmd);
                    }
                }
            }
        }
    }

    // Phase 35.1: Handle selection commands
    pub fn handle_selection_commands(&mut self) {
        let queue = self.renderer.get_queue();
        if let Some(text_engine) = &mut self.renderer.text_engine {
            if let Some(commands) = self.input_manager.get_selection_commands() {
                for cmd in commands {
                    match cmd {
                        137 => { // Ctrl+A = Select All
                            text_engine.select_all(&queue);
                            eprintln!("🎯 Selected all text");
                        }
                        138 => { // Shift+Up
                            // Extend selection up by grid width
                            let new_pos = text_engine.local_stats.cursor_pos.saturating_sub(80);
                            text_engine.extend_selection(&queue, new_pos);
                        }
                        139 => { // Shift+Down
                            // Extend selection down by grid width
                            let new_pos = (text_engine.local_stats.cursor_pos + 80).min(text_engine.local_stats.capacity - 1);
                            text_engine.extend_selection(&queue, new_pos);
                        }
                        140 => { // Shift+Left
                            // Extend selection left by 1
                            let new_pos = text_engine.local_stats.cursor_pos.saturating_sub(1);
                            text_engine.extend_selection(&queue, new_pos);
                        }
                        141 => { // Shift+Right
                            // Extend selection right by 1
                            let new_pos = (text_engine.local_stats.cursor_pos + 1).min(text_engine.local_stats.capacity - 1);
                            text_engine.extend_selection(&queue, new_pos);
                        }
                        _ => {
                            log::warn!("Unknown selection command: {}", cmd);
                        }
                    }
                }
            }
        }
    }

    // Phase 35.2: Handle clipboard commands
    pub fn handle_clipboard_commands(&mut self) {
        let queue = self.renderer.get_queue();
        if let Some(text_engine) = &mut self.renderer.text_engine {
            if let Some(commands) = self.input_manager.get_clipboard_commands() {
                for cmd in commands {
                    match cmd {
                        142 => { // Ctrl+C = Copy
                            let selected_text = text_engine.get_selected_text();
                            if !selected_text.is_empty() {
                                // Store for clipboard paste
                                // Note: For now we just log - full clipboard integration
                                // would require setting the system clipboard via the clipboard_manager
                                log::info!("📋 Copied {} chars to clipboard (internal)", selected_text.len());
                                eprintln!("📋 Copied: \"{}\"", selected_text);
                                // Clear selection after copy
                                text_engine.clear_selection(&queue);
                            }
                        }
                        143 => { // Ctrl+V = Paste
                            // Use the existing clipboard paste method
                            if let Some(text) = self.input_manager.handle_clipboard_paste() {
                                // Clear any existing selection first
                                text_engine.clear_selection(&queue);

                                // Insert pasted text at cursor position
                                for ch in text.bytes() {
                                    text_engine.update(&queue, ch);
                                }
                                log::info!("📋 Pasted {} chars from clipboard", text.len());
                                eprintln!("📋 Pasted {} chars", text.len());
                            }
                        }
                        144 => { // Ctrl+X = Cut (copy + delete)
                            let selected_text = text_engine.get_selected_text();
                            if !selected_text.is_empty() {
                                log::info!("📋 Cut {} chars to clipboard (internal)", selected_text.len());
                                eprintln!("✂️ Cut: \"{}\"", selected_text);

                                // Delete the selection after copying
                                text_engine.delete_selection(&queue);
                            }
                        }
                        _ => {
                            log::warn!("Unknown clipboard command: {}", cmd);
                        }
                    }
                }
            }
        }
    }

    // Phase 35.3: Handle undo commands
    pub fn handle_undo_commands(&mut self) {
        let queue = self.renderer.queue.clone();
        if let Some(text_engine) = &mut self.renderer.text_engine {
            if let Some(commands) = self.input_manager.get_undo_commands() {
                for cmd in commands {
                    match cmd {
                        145 => { // Ctrl+Z = Undo
                            // Phase 40.1: Check hex mode for substrate undo
                            if text_engine.is_hex_mode() {
                                if text_engine.undo_hex_edit(&queue) {
                                    eprintln!("↩️ Hex edit undone");
                                } else {
                                    eprintln!("↩️ Nothing to undo");
                                }
                            } else if text_engine.undo(&queue) {
                                eprintln!("↩️ Undone");
                            } else {
                                eprintln!("↩️ Nothing to undo");
                            }
                        }
                        146 => { // Ctrl+Y = Redo (Ctrl+Shift+Z also maps here)
                            // Phase 40.1: Check hex mode for substrate redo
                            if text_engine.is_hex_mode() {
                                if text_engine.redo_hex_edit(&queue) {
                                    eprintln!("↪️ Hex edit redone");
                                } else {
                                    eprintln!("↪️ Nothing to redo");
                                }
                            } else if text_engine.redo(&queue) {
                                eprintln!("↪️ Redone");
                            } else {
                                eprintln!("↪️ Nothing to redo");
                            }
                        }
                        _ => {
                            log::warn!("Unknown undo command: {}", cmd);
                        }
                    }
                }
            }
        }
    }

    // Phase 35.1: Grid-to-Index mapping for mouse selection
    pub fn world_to_grid_index(&self, world_x: f32, world_y: f32) -> Option<u32> {
        let grid_origin_x = 0.0;
        let grid_origin_y = 0.0;
        let grid_cell_size = 40.0;
        let grid_columns = 80;
        let grid_rows = 40;

        let local_x = (world_x - grid_origin_x) / grid_cell_size;
        let local_y = (world_y - grid_origin_y) / grid_cell_size;

        if local_x >= 0.0 && local_x < grid_columns as f32 &&
           local_y >= 0.0 && local_y < grid_rows as f32 {
            let col = local_x as u32;
            let row = local_y as u32;
            Some(row * grid_columns + col)
        } else {
            None
        }
    }

    /// Phase 48: Detect double/triple click based on timing and position
    fn detect_click_type(&mut self, screen_x: f32, screen_y: f32) -> u32 {
        let now = std::time::Instant::now();
        let double_click_threshold = std::time::Duration::from_millis(500);
        let position_threshold = 5.0; // pixels

        match (&self.last_click_time, &self.last_click_pos) {
            (Some(last_time), Some(last_pos)) => {
                let time_delta = now.duration_since(*last_time);
                let pos_delta = (screen_x - last_pos.0).abs() + (screen_y - last_pos.1).abs();

                if time_delta < double_click_threshold && pos_delta < position_threshold {
                    // Within time and position threshold - increment click count
                    self.click_count = (self.click_count + 1).min(3);
                } else {
                    // Too far or too slow - reset to single click
                    self.click_count = 1;
                }
            }
            _ => {
                self.click_count = 1;
            }
        }

        // Update last click state
        self.last_click_time = Some(now);
        self.last_click_pos = Some((screen_x, screen_y));

        self.click_count
    }

    /// Phase 48: Find word boundaries at the given grid index
    fn find_word_boundaries(&self, index: u32) -> Option<(u32, u32)> {
        let text_engine = self.renderer.text_engine.as_ref()?;
        let grid_columns = 80u32;

        // Access the CPU-side buffer for accurate word detection
        let buffer = &text_engine.cpu_buffer;
        let buffer_len = text_engine.local_stats.length as usize;

        if index as usize >= buffer_len {
            return Some((index, index));
        }

        let mut word_start = index;
        let mut word_end = index;

        // Scan backward to find word start
        while word_start > 0 {
            let prev_idx = (word_start - 1) as usize;
            let prev_char = buffer.get(prev_idx)?; // &u32

            // Word boundary: space or null character
            let prev_char_code = *prev_char as u8 as char;
            if prev_char_code.is_whitespace() || prev_char_code == '\0' {
                break;
            }

            // Also stop at line boundaries
            let col = (word_start - 1) % grid_columns;
            if col == grid_columns - 1 {
                break;
            }

            word_start -= 1;
        }

        // Scan forward to find word end
        while word_end < buffer_len as u32 {
            let next_idx = word_end as usize;
            if next_idx >= buffer.len() {
                break;
            }

            let next_char = buffer[next_idx];
            let next_char_code = next_char as u8 as char;

            // Word boundary: space or null character
            if next_char_code.is_whitespace() || next_char_code == '\0' {
                break;
            }

            // Also stop at line boundaries
            let col = word_end % grid_columns;
            if col == grid_columns - 1 {
                break;
            }

            word_end += 1;
        }

        Some((word_start, word_end))
    }

    /// Phase 48: Find line boundaries at the given grid index
    fn find_line_boundaries(&self, index: u32) -> Option<(u32, u32)> {
        let grid_columns = 80u32;
        let row = index / grid_columns;

        let line_start = row * grid_columns;
        let line_end = line_start + grid_columns - 1;

        Some((line_start, line_end))
    }

    // Phase 38: Handle execution commands (Ctrl+Enter)
    pub fn handle_execution_commands(&mut self) {
        if let Some(commands) = self.input_manager.get_execution_commands() {
            for cmd in commands {
                match cmd {
                    147 => { // Ctrl+Enter = Execute
                        if let Some(text_engine) = &self.renderer.text_engine {
                            // Get code from selection or full buffer
                            let code = if text_engine.selection.active {
                                text_engine.get_selection_as_string()
                            } else {
                                text_engine.get_text_as_string()
                            };
                            
                            if !code.trim().is_empty() {
                                self.execute_code(&code);
                            }
                        }
                    }
                    _ => {
                        log::warn!("Unknown execution command: {}", cmd);
                    }
                }
            }
        }
    }

    // Phase 40: Handle hex editor commands (Ctrl+Shift+H)
    pub fn handle_hex_editor_commands(&mut self) {
        if let Some(commands) = self.input_manager.get_hex_editor_commands() {
            let device = self.renderer.get_device();
            let queue = self.renderer.get_queue();
            
            for cmd in commands {
                match cmd {
                    149 => { // Ctrl+Shift+H = Enter Hex Mode
                        let path = std::path::PathBuf::from("alpine.rts");
                        if path.exists() {
                            if let Some(text_engine) = &mut self.renderer.text_engine {
                                if let Err(e) = text_engine.enter_hex_mode(&device, &queue, &path) {
                                    log::error!("Failed to enter hex mode: {}", e);
                                    eprintln!("⚠️ Failed to enter Hex Mode: {}", e);
                                } else {
                                    eprintln!("🧬 GOD MODE ENGAGED: Editing alpine.rts");
                                    // Optional: Switch focus/mode if needed
                                }
                            }
                        } else {
                            eprintln!("⚠️ alpine.rts not found in current directory");
                            // Fallback try
                            let path2 = std::path::PathBuf::from("alpine_bootable.rts");
                             if path2.exists() {
                                if let Some(text_engine) = &mut self.renderer.text_engine {
                                    if let Err(e) = text_engine.enter_hex_mode(&device, &queue, &path2) {
                                        log::error!("Failed to enter hex mode: {}", e);
                                    } else {
                                        eprintln!("🧬 GOD MODE ENGAGED: Editing alpine_bootable.rts");
                                    }
                                }
                             }
                        }
                    }
                    150 => { // Toggle Search Mode
                        if let Some(text_engine) = &mut self.renderer.text_engine {
                             text_engine.toggle_hex_search_mode();
                        }
                    }
                    151 => { // Find Next
                        if let Some(text_engine) = &mut self.renderer.text_engine {
                             text_engine.hex_find_next();
                        }
                    }
                    152 => { // Find Prev
                        if let Some(text_engine) = &mut self.renderer.text_engine {
                             text_engine.hex_find_prev();
                        }
                    }
                    153 => { // Neural Consult
                        // Capture prompt data upfront to avoid borrow checker issues
                        let prompt_request = if let Some(text_engine) = &mut self.renderer.text_engine {
                             if let Some(prompt) = text_engine.get_hex_neural_prompt() {
                                 // Get current offset safely
                                 let offset = text_engine.hex_editor.as_ref().map(|h| h.cursor_byte_pos as usize).unwrap_or(0);
                                 Some((prompt, offset))
                             } else { None }
                        } else { None };

                        if let Some((prompt, offset)) = prompt_request {
                             log::info!("🧠 Neural Consult Triggered at offset 0x{:04X}", offset);
                             
                             if let Some(evolution_manager) = &self.evolution_manager {
                                 let manager = evolution_manager.clone();
                                 let tx = self.introspection_tx.clone();
                                 
                                 // Spawn async task to query agent
                                 // We use the runtime handle from the current thread (assuming tokio runtime)
                                 let rt = tokio::runtime::Handle::current();
                                 rt.spawn(async move {
                                     // Get client safely without holding lock across await
                                     let zai_client = if let Ok(m) = manager.lock() {
                                         m.get_zai_client()
                                     } else {
                                         None
                                     };

                                     if let Some(client) = zai_client {
                                          log::info!("🧠 Sending request to Z.ai...");
                                          match client.ask_agent(crate::cognitive::agents::AgentRole::Scout, &prompt, "Analyze these bytes").await {
                                               Ok(analysis) => {
                                                   log::info!("🧠 Neural Analysis Received ({} chars)", analysis.len());
                                                   if let Err(e) = tx.send((offset, analysis)).await {
                                                        log::error!("Failed to send introspection result: {}", e);
                                                   }
                                               }
                                               Err(e) => log::error!("🧠 Neural Consult Failed: {}", e),
                                          }
                                     } else {
                                          log::error!("EvolutionManager lock failed or ZAiClient missing");
                                     }
                                 });
                             } else {
                                 log::warn!("⚠️ No Evolution Manager connected for Neural Consult");
                             }
                        }
                    }
                    _ => {}
                }
            }
        }
    }

    // Phase 42: Handle Compile commands (Ctrl+Shift+C)
    pub fn handle_compile_commands(&mut self) {
        if let Some(commands) = self.input_manager.get_compile_commands() {
            for cmd in commands {
                match cmd {
                    154 => { // Ctrl+Shift+C = Compile focused tile
                        // Get current file path from hex editor or text engine
                        let source_path = if let Some(text_engine) = &self.renderer.text_engine {
                            if text_engine.is_hex_mode() {
                                text_engine.hex_editor.as_ref()
                                    .and_then(|h| {
                                        let path = h.current_path.clone();
                                        path
                                    })
                            } else {
                                text_engine.current_file.clone()
                            }
                        } else {
                            None
                        };
                        
                        if let Some(path) = source_path {
                            log::info!("🔧 Phase 42: Compiling tile: {:?}", path);
                            eprintln!("🔧 Phase 42: Compiling tile: {:?}", path);
                            
                            // Check if it's an .rts.png file (compiler tile candidate)
                            if path.extension().map(|e| e == "png").unwrap_or(false) 
                               || path.to_string_lossy().ends_with(".rts.png") 
                            {
                                self.compile_tile_at_path(&path);
                            } else if path.extension().map(|e| e == "wgsl").unwrap_or(false) {
                                // Direct WGSL file - use existing hot-swap
                                if let Ok(source) = std::fs::read_to_string(&path) {
                                    self.execute_code(&source);
                                }
                            } else {
                                eprintln!("⚠️ Phase 42: Not a compilable tile (need .rts.png or .wgsl)");
                            }
                        } else {
                            eprintln!("⚠️ Phase 42: No tile focused for compilation");
                            log::warn!("Phase 42: No tile focused for compilation");
                        }
                    }
                    _ => {}
                }
            }
        }
    }

    // Phase 44: Handle Profiler commands (Ctrl+Shift+P)
    pub fn handle_profiler_commands(&mut self) {
        if let Some(commands) = self.input_manager.get_profiler_commands() {
            for cmd in commands {
                match cmd {
                    155 => { // Ctrl+Shift+P = Toggle profiler
                        self.profiler_enabled = !self.profiler_enabled;
                        if self.profiler_enabled {
                            log::info!("🔍 Phase 44: Profiler ENABLED - polling every {:?}", self.profiler_interval);
                            eprintln!("🔍 Phase 44: Profiler ENABLED - polling every {:?}", self.profiler_interval);
                        } else {
                            log::info!("🔍 Phase 44: Profiler DISABLED");
                            eprintln!("🔍 Phase 44: Profiler DISABLED");
                        }
                    }
                    _ => {}
                }
            }
        }
    }

    // Phase 44: Handle Multi-VM commands (Ctrl+Shift+M)
    pub fn handle_multi_vm_commands(&mut self) {
        if let Some(commands) = self.input_manager.get_multi_vm_commands() {
            for cmd in commands {
                match cmd {
                    156 => { // Ctrl+Shift+M = Launch multiple VMs
                        log::info!("🚀 Phase 44: Launching multiple VM instances...");
                        eprintln!("🚀 Phase 44: Launching multiple VM instances...");
                        self.launch_multiple_vms();
                    }
                    _ => {}
                }
            }
        }
    }

    // Phase 43: Compile an .rts.png tile using multi-pass GPU compilation and link via JIT
    fn compile_tile_at_path(&mut self, path: &std::path::Path) {
        use std::time::Instant;

        let start = Instant::now();
        self.ensure_compiler_dispatcher();

        // Set visual feedback: Compiling (Yellow)
        self.compilation_status = CompilationStatus::Compiling;
        self.compilation_tile_path = Some(path.to_path_buf());
        self.compilation_start_time = Some(start);
        eprintln!("🔧 Phase 43: Starting compilation of {:?}...", path.file_name().unwrap_or_default());

        let dispatcher = self.compiler_dispatcher.as_ref().unwrap().clone();
        
        // Initialize JIT bridge if needed
        if self.jit_bridge.is_none() {
            let device = self.renderer.get_device().clone();
            let queue = self.renderer.get_queue().clone();
            self.jit_bridge = Some(crate::jit_bridge::JitBridge::new(device, queue));
        }

        // Load the tile texture for compilation
        let rts_result = crate::rts_texture::RTSTexture::load(path);
        if let Err(e) = rts_result {
            log::error!("Failed to load tile for compilation: {}", e);
            self.compilation_status = CompilationStatus::Error;
            return;
        }
        let rts = rts_result.unwrap();

        // Create a temporary texture for the compiler
        let device = self.renderer.get_device();
        let queue = self.renderer.get_queue();
        
        let texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Compiling Tile Staging"),
            size: wgpu::Extent3d {
                width: rts.width,
                height: rts.height,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Unorm, // Need Unorm for data access in compiler
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST,
            view_formats: &[],
        });

        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &rts.as_rgba_bytes(),
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(4 * rts.width),
                rows_per_image: Some(rts.height),
            },
            wgpu::Extent3d {
                width: rts.width,
                height: rts.height,
                depth_or_array_layers: 1,
            },
        );

        // Capture context for async
        let _path_buf = path.to_path_buf();

        log::info!("🚀 Dispatching GPU compilation task...");
        
        let dispatcher_clone = dispatcher.clone();
        tokio::spawn(async move {
            match dispatcher_clone.compile_tile(&texture).await {
                Ok(spirv) => {
                    log::info!("✅ GPU Compilation successful ({} words)", spirv.len());
                    // In Phase 43, we'll need to send this back to the app thread to link it.
                    // For now, this confirms the compilation pipeline is live.
                }
                Err(e) => {
                    log::error!("❌ GPU Compilation failed: {:?}", e);
                }
            }
        });
    }

    // Phase 42: Ensure compiler dispatcher is initialized
    fn ensure_compiler_dispatcher(&mut self) {
        if self.compiler_dispatcher.is_none() {
            log::info!("🔧 Phase 42: Initializing compiler dispatcher...");
            let dispatcher = CompilerTileDispatcher::new(
                self.renderer.device.clone(),
                self.renderer.queue.clone(),
            );

            // Initialize the dispatcher (loads LUT textures, creates pipelines)
            let mut dispatcher_mut = dispatcher; 
            if let Err(e) = dispatcher_mut.initialize() {
                log::error!("❌ Phase 42: Failed to initialize compiler dispatcher: {}", e);
                eprintln!("  ⚠️ Compiler dispatcher initialization failed: {}", e);
            } else {
                self.compiler_dispatcher = Some(std::sync::Arc::new(dispatcher_mut));
                log::info!("✅ Phase 42: Compiler dispatcher initialized");
            }
        }
    }

    // Phase 42: Get compilation status for visual feedback
    pub fn get_compilation_status(&self) -> (CompilationStatus, Option<std::time::Duration>) {
        let elapsed = self.compilation_start_time.map(|t| t.elapsed());
        (self.compilation_status, elapsed)
    }

    // Phase 42: Get the path of the tile being compiled
    pub fn get_compilation_tile_path(&self) -> Option<&std::path::PathBuf> {
        self.compilation_tile_path.as_ref()
    }

    // Phase 48: GPU Capability Query API
    pub fn gpu_capabilities(&self) -> &crate::gpu_capabilities::GpuCapabilities {
        &self.gpu_caps
    }

    pub fn log_gpu_info(&self) {
        log::info!("GPU: {} {}", self.gpu_caps.vendor_name, self.gpu_caps.device_name);
        log::info!("i64 Strategy: {:?}", self.gpu_caps.get_i64_strategy());
    }

    // Phase 42: Reset compilation status (called after timeout)
    pub fn reset_compilation_status(&mut self) {
        self.compilation_status = CompilationStatus::None;
        self.compilation_tile_path = None;
        self.compilation_start_time = None;
    }

    /// Phase 38: Execute code in appropriate runtime
    fn execute_code(&mut self, code: &str) {
        log::info!("⚡ Phase 38: Executing code from map...");

        let mut output = String::new();
        let mut _is_error = false;

        // Phase 34.4: PixelCPU - Detect Pixel Assembly
        // Pixel assembly uses instructions like: LDI, ADD, SUB, MUL, DIV, MOV, JMP, etc.
        let is_pixel_assembly = code.lines()
            .filter(|line| {
                let trimmed = line.trim().to_uppercase();
                // Check for common Pixel assembly instructions (case-insensitive)
                trimmed.starts_with("LDI") ||
                trimmed.starts_with("ADD") ||
                trimmed.starts_with("SUB") ||
                trimmed.starts_with("MUL") ||
                trimmed.starts_with("DIV") ||
                trimmed.starts_with("MOV") ||
                trimmed.starts_with("JMP") ||
                trimmed.starts_with("JZ") ||
                trimmed.starts_with("JNZ") ||
                trimmed.starts_with("CMP") ||
                trimmed.starts_with("HALT") ||
                trimmed.starts_with("NOP") ||
                trimmed.starts_with("STR") ||
                trimmed.starts_with("LOD")
            })
            .count() > 0;

        if is_pixel_assembly {
            log::info!("🎮 Phase 34.4: RISC-V Assembly detected! Executing on RiscvExecutor...");
            output = self.execute_riscv_code(code);
            _is_error = false;
        }
        // Phase 39: WGSL Hot-Swap (The Self-Modifying Map)
        else if code.contains("@fragment") || code.contains("@vertex") || code.contains("@compute") {
            log::info!("⚡ Phase 39: WGSL detected! Attempting shader hot-swap...");

            if code.contains("@target: grid") {
                match self.renderer.recompile_grid_pipeline(code) {
                    Ok(_) => {
                        output = "✅ Grid Shader Hot-Swapped Successfully!".to_string();
                        _is_error = false;
                    }
                    Err(e) => {
                        output = format!("❌ Grid Shader Error: {}", e);
                        _is_error = true;
                    }
                }
            } else if self.renderer.text_engine.is_none() {
                output = "⚠️ Text engine not available".to_string();
                _is_error = true;
            } else {
                // Get device (Arc - no borrow held)
                let device = self.renderer.get_device();
                // Get format (Copy type - no borrow held)
                let format = self.renderer.get_config().format;

                // Now mutable borrow - no conflicting references
                if let Some(text_engine) = &mut self.renderer.text_engine {
                    match text_engine.recompile_pipeline(&device, format, code) {
                        Ok(_) => {
                            output = "✅ Text Shader Hot-Swapped Successfully!".to_string();
                            _is_error = false;
                        }
                        Err(e) => {
                            output = format!("❌ Text Shader Error: {}", e);
                            _is_error = true;
                        }
                    }
                }
            }
        }
 else if let Some(python_ctx) = &self.embedded_python_context {
            // Option 1: Python Runtime (Hybrid DNA)
            match python_ctx.execute_script(code) {
                Ok(msg) => {
                    log::info!("✅ Python execution: {}", msg);
                    eprintln!("✅ Python Execution: {}", msg);
                    output = format!("✅ {}", msg);
                    _is_error = false;
                }
                Err(e) => {
                    log::error!("❌ Python execution error: {}", e);
                    eprintln!("❌ Python Error: {}", e);
                    output = format!("❌ {}", e);
                    _is_error = true;
                }
            }
        } else {
            output = "⚠️ No Python runtime available".to_string();
            _is_error = true;
        }

        // Phase 38.4: Display output on the map
        let cursor_row = if let Some(text_engine) = &self.renderer.text_engine {
            const GRID_WIDTH: u32 = 80;
            let cursor_pos = text_engine.local_stats.cursor_pos;
            cursor_pos / GRID_WIDTH
        } else {
            return;
        };

        // Display output 2 rows below the cursor
        let output_row = cursor_row + 2;

        // Get queue before mutable borrow
        let queue = self.renderer.get_queue();

        if let Some(text_engine) = &mut self.renderer.text_engine {
            // Clear previous output area (5 lines)
            text_engine.clear_output(&queue, output_row, 5);

            // Display new output
            text_engine.display_output(&queue, &output, output_row);

            log::info!("📤 Phase 38.4: Output displayed at line {}", output_row);
        }

        // Visual feedback
        eprintln!("⚡ Executed {} bytes from map", code.len());
    }

    /// Phase 34.4: Execute Riscv code on RiscvExecutor
    /// Full implementation with assembler-to-GPU integration
    /// TODO: This function needs updating to use current RiscvExecutor API
    /// The current API doesn't have assemble_and_load() or step() methods
    fn execute_riscv_code(&mut self, _code: &str) -> String {
        log::info!("🎮 Phase 34.4: RISC-V execution stub");
        // TODO: Implement using current RiscvExecutor API:
        // - Use load_program_raw() or load_program() to load binary
        // - Use execute_frame() to run instructions
        "⚠️ RISC-V code execution: API needs updating".to_string()
    }

    // Phase 47: Handle crystallize commands (F5 - Text to RTS)
    pub fn handle_crystallize_commands(&mut self) {
        if let Some(commands) = self.input_manager.get_crystallize_commands() {
            for cmd in commands {
                match cmd {
                    148 => { // F5 = Crystallize
                        self.crystallize_text_to_rts();
                    }
                    _ => {
                        log::warn!("Unknown crystallize command: {}", cmd);
                    }
                }
            }
        }
    }

    /// Phase 47: Crystallize text buffer to RTS PNG tile
    /// This is the "Holy Grail" - converting text to a bootable visual container
    fn crystallize_text_to_rts(&mut self) {
        log::info!("💎 Phase 47: Initiating Crystallization (Text → RTS)...");
        eprintln!("💎 Crystallizing text to RTS PNG...");

        // Get text from the text engine
        let code = if let Some(text_engine) = &self.renderer.text_engine {
            if text_engine.selection.active {
                text_engine.get_selection_as_string()
            } else {
                text_engine.get_text_as_string()
            }
        } else {
            log::warn!("No text engine available for crystallization");
            return;
        };

        if code.trim().is_empty() {
            log::warn!("Cannot crystallize empty text");
            eprintln!("⚠️ Cannot crystallize: text is empty");
            return;
        }

        // Create crystallization directory
        let crystallize_dir = std::path::PathBuf::from(".crystallized_rts");
        if let Err(e) = std::fs::create_dir_all(&crystallize_dir) {
            log::error!("Failed to create crystallize directory: {}", e);
            return;
        }

        // Generate unique filename based on timestamp
        let timestamp = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap_or_default()
            .as_secs();
        let source_file = crystallize_dir.join(format!("crystallized_{}.py", timestamp));
        let output_file = crystallize_dir.join(format!("crystallized_{}.rts.png", timestamp));

        // Save text to temporary source file
        if let Err(e) = std::fs::write(&source_file, &code) {
            log::error!("Failed to write source file: {}", e);
            return;
        }

        log::info!("💎 Source saved to: {}", source_file.display());

        // Run pixelrts_v2_converter.py to create RTS PNG
        let converter_path = std::path::PathBuf::from("pixelrts_v2_converter.py");
        if !converter_path.exists() {
            log::error!("pixelrts_v2_converter.py not found at: {}", converter_path.display());
            eprintln!("❌ Converter not found: {}", converter_path.display());
            return;
        }

        // Execute the converter
        let output = std::process::Command::new("python3")
            .arg(&converter_path)
            .arg(&source_file)
            .arg(&output_file)
            .output();

        match output {
            Ok(result) => {
                if result.status.success() {
                    log::info!("✅ Crystallization successful: {}", output_file.display());
                    eprintln!("✅ Crystallized: {}", output_file.display());
                    
                    // Display stdout from converter
                    let stdout = String::from_utf8_lossy(&result.stdout);
                    if !stdout.is_empty() {
                        log::info!("Converter output: {}", stdout);
                    }

                    // Spawn the RTS tile on the map next to the text editor
                    self.spawn_crystallized_tile(&output_file, timestamp);
                } else {
                    let stderr = String::from_utf8_lossy(&result.stderr);
                    log::error!("❌ Crystallization failed: {}", stderr);
                    eprintln!("❌ Crystallization failed: {}", stderr);
                }
            }
            Err(e) => {
                log::error!("Failed to run converter: {}", e);
                eprintln!("❌ Failed to run converter: {}", e);
            }
        }

        // Clean up source file
        let _ = std::fs::remove_file(&source_file);
    }

    /// Phase 47: Spawn a crystallized RTS tile on the map
    fn spawn_crystallized_tile(&mut self, rts_path: &std::path::Path, timestamp: u64) {
        log::info!("💎 Spawning crystallized tile: {}", rts_path.display());

        // Calculate spawn position (to the right of current view)
        let spawn_x = self.camera.x + 1200.0;
        let spawn_y = self.camera.y;

        // Convert to tile coordinates
        let tile_x = (spawn_x / 1000.0).floor() as i32;
        let tile_y = (spawn_y / 1000.0).floor() as i32;

        // Create manifest entry for the tile
        let tile_name = format!("crystallized_{}", timestamp);
        let manifest_path = std::path::PathBuf::from("systems/crystallization/MANIFEST.json");
        
        // Ensure the crystallization directory exists
        if let Some(parent) = manifest_path.parent() {
            let _ = std::fs::create_dir_all(parent);
        }

        // Update or create manifest
        let mut manifest: serde_json::Map<String, serde_json::Value> = if manifest_path.exists() {
            match std::fs::read_to_string(&manifest_path) {
                Ok(content) => serde_json::from_str(&content).unwrap_or_default(),
                Err(_) => serde_json::Map::new(),
            }
        } else {
            serde_json::Map::new()
        };

        let tile_key = format!("{},{}:{}", tile_x, tile_y, tile_name);
        manifest.insert(tile_key, serde_json::json!({
            "brick": rts_path.file_name().unwrap_or_default().to_string_lossy().to_string(),
            "source": "crystallized",
            "timestamp": timestamp,
        }));

        if let Err(e) = std::fs::write(&manifest_path, serde_json::to_string_pretty(&manifest).unwrap_or_default()) {
            log::warn!("Failed to update manifest: {}", e);
        }

        // Copy the RTS file to the crystallization directory for the manifest to reference
        let dest_path = manifest_path.parent()
            .map(|p| p.join(rts_path.file_name().unwrap_or_default()))
            .unwrap_or_else(|| rts_path.to_path_buf());
        
        if dest_path != rts_path {
            let _ = std::fs::copy(rts_path, &dest_path);
        }

        log::info!("✅ Crystallized tile spawned at ({}, {}): {}", tile_x, tile_y, tile_name);
        eprintln!("✅ Spawned crystallized tile at ({}, {}): {}", tile_x, tile_y, tile_name);
    }

    // Phase 34: Save text to file
    fn save_crystallized_text(&mut self) {
        if let Some(text_engine) = &mut self.renderer.text_engine {
            // Phase Mode B.1: Use current_file if set, otherwise use tile-based path
            let filepath = if let Some(current) = &text_engine.current_file {
                current.clone()
            } else {
                // Calculate tile coordinates from camera position
                let cam_x = self.camera.x;
                let cam_y = self.camera.y;
                let tile_x = (cam_x / 1000.0).floor() as i32;
                let tile_y = (cam_y / 1000.0).floor() as i32;

                // Create save directory
                let save_dir = std::path::PathBuf::from(".crystallized_save");
                std::fs::create_dir_all(&save_dir).ok();

                // Generate filename
                let filename = crate::text_engine::tile_filename(tile_x, tile_y);
                save_dir.join(&filename)
            };

            // Save to file using the new method that tracks current_file
            match text_engine.save_to_path(&filepath) {
                Ok(()) => {
                    log::info!("💾 Phase 34: Saved text to {}", filepath.display());
                    eprintln!("💾 Saved to {}", filepath.display());
                }
                Err(e) => {
                    log::error!("Failed to save text: {:?}", e);
                    eprintln!("Failed to save text: {:?}", e);
                }
            }
        }
    }

    // Phase 34: Load text from file
    fn load_crystallized_text(&mut self) {
        // Get queue first to avoid borrow checker issues
        let queue = self.renderer.get_queue();

        if let Some(text_engine) = &mut self.renderer.text_engine {
            // Calculate tile coordinates from camera position
            let cam_x = self.camera.x;
            let cam_y = self.camera.y;
            let tile_x = (cam_x / 1000.0).floor() as i32;
            let tile_y = (cam_y / 1000.0).floor() as i32;

            // Create save directory
            let save_dir = std::path::PathBuf::from(".crystallized_save");

            // Generate filename
            let filename = crate::text_engine::tile_filename(tile_x, tile_y);
            let filepath = save_dir.join(&filename);

            // Load from file using the new method that tracks current_file
            match text_engine.load_from_path(&queue, &filepath) {
                Ok(()) => {
                    log::info!("📂 Phase 34: Loaded text from {}", filepath.display());
                    eprintln!("📂 Loaded from {}", filepath.display());
                }
                Err(e) => {
                    log::warn!("Failed to load text: {:?}", e);
                    eprintln!("Failed to load text: {:?}", e);
                }
            }
        }
    }

    // Phase Mode B.2: Handle spatial auto-save
    fn handle_spatial_auto_save(&mut self) {
        // Calculate current tile from camera position
        const TILE_SIZE: f32 = 1000.0;
        let tile_x = (self.camera.x / TILE_SIZE).floor() as i32;
        let tile_y = (self.camera.y / TILE_SIZE).floor() as i32;

        // Check if we've moved to a new tile
        let tile_changed = match (self.current_tile_x, self.current_tile_y) {
            (Some(cx), Some(cy)) => cx != tile_x || cy != tile_y,
            _ => true,
        };

        // Save when leaving a tile
        if tile_changed {
            if let (Some(old_x), Some(old_y)) = (self.current_tile_x, self.current_tile_y) {
                self.save_spatial_snapshot(old_x, old_y);
            }
            self.current_tile_x = Some(tile_x);
            self.current_tile_y = Some(tile_y);

            // Load snapshot for new tile if exists
            self.load_spatial_snapshot(tile_x, tile_y);
        }

        // Periodic auto-save every 30 seconds
        if self.last_auto_save_time.elapsed() > std::time::Duration::from_secs(30) {
            if let (Some(tx), Some(ty)) = (self.current_tile_x, self.current_tile_y) {
                self.save_spatial_snapshot(tx, ty);
                self.last_auto_save_time = std::time::Instant::now();
            }
        }
    }

    fn save_spatial_snapshot(&mut self, tile_x: i32, tile_y: i32) {
        if let Some(text_engine) = &self.renderer.text_engine {
            let snapshot = text_engine.create_spatial_snapshot(
                tile_x,
                tile_y,
                self.camera.x,
                self.camera.y,
                self.camera.zoom,
            );
            if let Err(e) = text_engine.save_spatial_snapshot(&snapshot) {
                log::warn!("Failed to save spatial snapshot: {}", e);
            }
        }
    }

    fn load_spatial_snapshot(&mut self, tile_x: i32, tile_y: i32) {
        let queue = self.renderer.get_queue();

        if let Some(text_engine) = &mut self.renderer.text_engine {
            // Check if snapshot exists
            if crate::text_engine::TextEngine::has_spatial_snapshot(tile_x, tile_y) {
                match text_engine.load_spatial_snapshot(&queue, tile_x, tile_y) {
                    Ok(snapshot) => {
                        // Restore camera position
                        self.camera.x = snapshot.camera_x;
                        self.camera.y = snapshot.camera_y;
                        self.camera.target_x = snapshot.camera_x;
                        self.camera.target_y = snapshot.camera_y;
                        self.camera.zoom = snapshot.camera_zoom;
                        self.camera.target_zoom = snapshot.camera_zoom;

                        log::info!("📍 Restored spatial snapshot: tile ({}, {})", tile_x, tile_y);
                    }
                    Err(e) => {
                        log::warn!("Failed to load spatial snapshot: {}", e);
                    }
                }
            }
        }
    }

    pub fn update_camera_for_text_cursor(&mut self) {
        if let Some(text_engine) = &self.renderer.text_engine {
            let grid_width = 80;
            let cell_size = 40.0;
            
            let cursor_pos = text_engine.local_stats.cursor_pos;
            let cell_x = cursor_pos % grid_width;
            let cell_y = cursor_pos / grid_width;
            
            // Calculate world position (offset by half cell size to center)
            let world_x = (cell_x as f32) * cell_size + (cell_size / 2.0);
            let world_y = (cell_y as f32) * cell_size + (cell_size / 2.0);
            
            // Update camera position
            // Use set_target for smooth camera follow via lerp
            self.camera.set_target(world_x, world_y);
            log::debug!("🎥 Camera following Crystallized Cursor at ({}, {})", world_x, world_y);
        }
    }

    // Phase 40.5: Update all loaded modules (call periodically)
    pub fn update_qemu_shm_process(&mut self) {
        if let Some(proc) = &mut self.qemu_shm_process {
            if proc.is_running() {
                // Update test pattern (Phase 47 Task 2 simulation)
                // In production this would just read the SHM that QEMU wrote to
                proc.update_test_pattern();
                
                // Phase 47 Task 4: Forward Input
                if let Some(input_data) = self.input_manager.get_console_input() {
                    // Convert bytes to string (naive ASCII for now)
                    if let Ok(input_str) = String::from_utf8(input_data) {
                        proc.send_input(&input_str);
                    }
                }
                
                let (width, height) = proc.get_dimensions();
                
                if let Some(wid) = self.qemu_shm_window_id {
                    // Use get_framebuffer() to get the Vec<u8> from the capture thread
                    // This creates a clone every frame, which is acceptable for MVP.
                    // Ideally we'd lock it.
                    let framebuffer_data = proc.get_framebuffer();
                    let slice = &framebuffer_data;
                    
                    if !slice.is_empty() {
                        if let Some(tm) = &mut self.vm_texture_manager {
                            if let Err(e) = tm.update_vm_texture(wid, slice, width, height) {
                                log::warn!("Failed to update QEMU SHM texture: {}", e);
                            }
                        }
                        
                        // Phase 47 Task 3: Ground Truth Integration
                        // Update Ground Truth Shader (Background Substrate) with VM output
                        self.renderer.update_cartridge_texture(width, height, slice);
                    }
                }
            }
        }
    }

    pub fn spawn_qemu_vm(&mut self, iso_path: String) {
        // Cleanup dead process
        if let Some(proc) = &mut self.qemu_shm_process {
            // Check actual status (updates flag if dead)
            if !proc.check_status() {
                log::warn!("Found dead QEMU process handle. Cleaning up...");
                self.qemu_shm_process = None;
                self.qemu_shm_window_id = None;
            } else {
                log::warn!("QEMU VM already running! (PID active)");
                return;
            }
        }
        
        log::info!("🚀 Spawning QEMU VM with ISO: {}", iso_path);
        
        let config = crate::virtual_machine::QemuConfig {
            boot_path: iso_path,
            memory_mb: 2048,
            vcpu_count: 2,
            width: 640,
            height: 480,
            enable_kvm: false,
            ..Default::default()
        };
        
        let mut proc = crate::virtual_machine::QemuProcessWithShm::new(config);

        // Ensure input manager is ready to capture
        self.input_manager.init_console_input();

        match proc.start() {
            Ok(_) => {
                // Create Window at a specific visual offset (50,50) to ensure visibility
                let window_id = self.window_manager.create_demo_window(
                    "Alpine Linux (QEMU)".to_string(),
                    "Booting...".to_string(),
                    50.0, 50.0,
                    crate::window::WindowType::System
                );
                
                // Force window dimensions to safer 640x480 for visibility check
                if let Some(win) = self.window_manager.get_window_mut(window_id) {
                    win.width = 640.0;
                    win.height = 480.0;
                    win.has_vm_texture = true;
                    log::info!("✅ Created QEMU Window ID {} at (50, 50) with size 640x480", window_id);
                    
                    // Pre-allocate texture in manager
                    if let Some(tm) = &mut self.vm_texture_manager {
                         let _ = tm.update_vm_texture(window_id, &[0; 640*480*4], 640, 480);
                    }
                }
                
                self.qemu_shm_process = Some(proc);
                self.qemu_shm_window_id = Some(window_id);
                
                log::info!("✅ QEMU VM Spawned (Window ID: {})", window_id);
            }
            Err(e) => {
                log::error!("Failed to start QEMU: {}", e);
                log::error!("Ensure /dev/kvm exists and is accessible.");
            }
        }
    }

    pub fn update_modules(&mut self) {
        if let Some(ref manager) = self.module_manager {
            if let Ok(mut mgr) = manager.lock() {
                mgr.update_all();
            }
        }

        // Phase 35.9: Render dynamically created cartridges
        self.render_cartridges();
    }

    // Phase 40.5: Check for module file changes and hot-reload if needed
    pub fn check_module_changes(&mut self) -> Vec<(std::path::PathBuf, crate::hot_swap::VatId)> {
        if let Some(ref manager) = self.module_manager {
            if let Ok(mut mgr) = manager.lock() {
                return mgr.check_for_changes();
            }
        }
        Vec::new()
    }

    // Phase 40.5: Load a dynamic module
    pub fn load_module(&mut self, path: &std::path::Path) -> Result<crate::hot_swap::VatId, String> {
        if let Some(ref manager) = self.module_manager {
            let mut mgr = manager.lock().map_err(|e| format!("Lock error: {}", e))?;
            mgr.load_module(path).map_err(|e| format!("Load error: {}", e))
        } else {
            Err("ModuleManager not initialized".to_string())
        }
    }

    // Phase 40.5: Unload a module
    pub fn unload_module(&mut self, vat_id: &crate::hot_swap::VatId) -> Result<(), String> {
        if let Some(ref manager) = self.module_manager {
            let mut mgr = manager.lock().map_err(|e| format!("Lock error: {}", e))?;
            mgr.unload_module(vat_id).map_err(|e| format!("Unload error: {}", e))
        } else {
            Err("ModuleManager not initialized".to_string())
        }
    }

    // Phase 33: Initialize Memory Texture Manager for V2 bricks
    pub fn initialize_memory_texture_manager(&mut self) {
        log::info!("🧠 Initializing Memory Texture Manager for V2 bricks...");

        let device = self.renderer.get_device();
        let queue = self.renderer.get_queue();
        let bind_group_layout = self.renderer.get_surface_bind_group_layout();
        let sampler = self.renderer.get_shared_sampler();

        let memory_texture_manager = crate::memory_texture_manager::MemoryTextureManager::new(
            device,
            queue,
            bind_group_layout,
            sampler,
        );

        self.memory_texture_manager = Some(memory_texture_manager);

        // Try to load bricks from Foundry archive directory
        let bricks_dir = std::path::Path::new("bricks/archive");
        if bricks_dir.exists() {
            if let Some(manager) = &mut self.memory_texture_manager {
                match manager.load_directory(bricks_dir) {
                    Ok(count) => {
                        log::info!("✅ Loaded {} V2 bricks from {}", count, bricks_dir.display());
                    }
                    Err(e) => {
                        log::warn!("Failed to load bricks from {}: {}", bricks_dir.display(), e);
                    }
                }
            }
        } else {
            log::info!("No bricks/archive directory found (will create on demand)");
        }

        // Phase 33 Step 3: Create live memory textures from MemoryTextureMapper
        self.initialize_live_memory_textures();

        log::info!("✅ Memory Texture Manager initialized");

        // Phase 34.4: Initialize Pixel CPU

    }

    // Phase 35.9.1: Initialize Cartridge Texture Manager
    pub fn initialize_cartridge_texture_manager(&mut self) {
        log::info!("🎨 Initializing Cartridge Texture Manager for Evolution Zone...");

        let device = self.renderer.get_device();
        let queue = self.renderer.get_queue();
        let bind_group_layout = self.renderer.get_surface_bind_group_layout();
        let sampler = self.renderer.get_shared_sampler();

        let cartridge_texture_manager = CartridgeTextureManager::new(
            device,
            queue,
            bind_group_layout,
            sampler,
        );

        self.cartridge_texture_manager = Some(cartridge_texture_manager);

        log::info!("✅ Cartridge Texture Manager initialized");
    }

    // Phase 34.4: Initialize Pixel CPU Runtime


    
    // Phase 2: Initialize RISC-V GPU Executor
    pub fn initialize_riscv_executor(&mut self, rts_path: Option<String>, dtb_path: Option<String>) {
        eprintln!("🚀 Initializing RISC-V GPU Executor...");
        let device = self.renderer.get_device().clone();
        let queue = self.renderer.get_queue().clone();
        
        let mut executor = crate::riscv_executor::RiscvExecutor::new(device, queue);
        
        if let Some(path) = rts_path {
            let res = if path.ends_with(".rts.png") {
                log::info!("🧬 Loading RISC-V program from (RTS-PNG): {}", path);
                executor.load_program_from_file(&path)
            } else {
                log::info!("💾 Loading RISC-V kernel from (Raw Binary): {}", path);
                executor.load_program_raw(&path, 0)
            };

            if let Err(e) = res {
                log::warn!("❌ Failed to load RISC-V program: {}", e);
            } else {
                // If we loaded a raw binary kernel, maybe load a DTB too
                if let Some(dtb) = dtb_path {
                    let dtb_offset = 8 * 1024 * 1024; // 8 MB offset
                    log::info!("💾 Loading RISC-V DTB from: {} to offset 0x{:x}", dtb, dtb_offset);
                    if let Err(e) = executor.load_program_raw(&dtb, dtb_offset as u64) {
                        log::warn!("❌ Failed to load RISC-V DTB: {}", e);
                    } else {
                        // Set a1 to the DTB address (Linux expectation)
                        // x11 is a1 in RISC-V
                        let a1_addr = 11 * 4; // Register x11 address in RAM
                        let dtb_addr_bytes = (dtb_offset as u32).to_le_bytes();
                        executor.queue.write_buffer(&executor.ram_buffer, a1_addr as u64, &dtb_addr_bytes);
                        log::info!("🎯 Set a1 (x11) to 0x{:x}", dtb_offset);
                    }
                }
                // Create a window for the RISC-V execution
                let window_id = self.window_manager.create_demo_window(
                    "RISC-V GPU Executor".to_string(),
                    format!("Program: {}\nStatus: RUNNING", path),
                    700.0,
                    200.0,
                    crate::window::WindowType::System,
                );
                
                // Mark window as having VM texture
                if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                    window.has_vm_texture = true;
                    window.width = 512.0; 
                    window.height = 512.0;
                }

                // Register display texture in VmTextureManager
                if let Some(vm_tm) = &mut self.vm_texture_manager {
                    let display_texture = executor.get_display_texture();
                    if let Err(e) = vm_tm.register_external_texture(window_id, display_texture) {
                        log::error!("Failed to register RISC-V display texture: {}", e);
                    }
                }
            }
        }

        self.riscv_executor = Some(std::sync::Arc::new(std::sync::Mutex::new(executor)));
        log::info!("✅ RISC-V GPU Executor initialized");
    }

    pub fn update_riscv_executor(&mut self) {
        if let Some(ref executor_arc) = self.riscv_executor {
            if let Ok(mut executor) = executor_arc.lock() {
                if executor.is_running() {
                    // Sample neuromodulation from cortex
                    if let Some(ref cortex) = self.renderer.cortex_renderer {
                        let neuro = cortex.get_neuromodulation();
                        executor.set_neuromodulation(neuro);
                    }
                    executor.execute_frame();

                    // Update diagnostic overlay with metabolic state
                    let (neuro, budget) = executor.get_metabolic_state();
                    self.diagnostic_overlay.update_metabolic_state(
                        crate::diagnostic::MetabolicState {
                            instruction_budget: budget,
                            base_budget: 10000,
                            neuromodulator: neuro,
                        }
                    );

                    // Phase 44: Poll profiler data at interval
                    if self.profiler_enabled {
                        let now = std::time::Instant::now();
                        if now.duration_since(self.profiler_last_poll) >= self.profiler_interval {
                            let entries = executor.read_profiler_data();
                            if !entries.is_empty() {
                                log::info!("🔍 Profiler: {} basic blocks tracked", entries.len());
                                // Log top 5 hot blocks
                                let mut sorted = entries.clone();
                                sorted.sort_by(|a, b| b.count.cmp(&a.count));
                                for (_i, entry) in sorted.iter().take(5).enumerate() {
                                    log::info!("  Block 0x{:04x}: {} executions", entry.pc, entry.count);
                                }
                            }
                            self.profiler_last_poll = now;
                        }
                    }
                }
            }
        }
    }

    // Phase 20: Initialize RISC-V Linux VM (Full RV32IMA)
    pub fn initialize_riscv_linux_vm(&mut self, kernel_path: Option<String>, dtb_path: Option<String>) {
        eprintln!("🚀 Initializing RISC-V Linux GPU VM...");
        let device = self.renderer.get_device().clone();
        let queue = self.renderer.get_queue().clone();
        
        let memory_size = 64 * 1024 * 1024; // 64MB
        let mut vm = crate::riscv_linux_vm::RiscVLinuxVM::new(device, queue, memory_size);
        vm.initialize();

        if let Some(path) = kernel_path {
            match std::fs::read(&path) {
                Ok(data) => {
                    log::info!("💾 Loading RISC-V Linux kernel: {}", path);
                    vm.load_kernel(&data);
                }
                Err(e) => {
                    log::error!("❌ Failed to read kernel file {}: {}", path, e);
                    return;
                }
            }

            // Load or generate DTB
            if let Some(dtb_file) = dtb_path {
                match std::fs::read(&dtb_file) {
                    Ok(data) => {
                        log::info!("💾 Loading external DTB: {}", dtb_file);
                        vm.load_dtb(&data, 0x81000000); // Load at 16MB offset
                    }
                    Err(e) => {
                        log::warn!("⚠️  Failed to read DTB file {}, generating simple DTB instead: {}", dtb_file, e);
                        let dtb = crate::riscv_linux_vm::RiscVLinuxVM::generate_simple_dtb(memory_size as u64, "console=ttyS0 earlycon=sbi root=/dev/ram0");
                        vm.load_dtb(&dtb, 0x81000000);
                    }
                }
            } else {
                log::info!("📜 Generating simple DTB...");
                let dtb = crate::riscv_linux_vm::RiscVLinuxVM::generate_simple_dtb(memory_size as u64, "console=ttyS0 earlycon=sbi root=/dev/ram0");
                vm.load_dtb(&dtb, 0x81000000);
            }

            // Create a window for the Linux console output
            let _window_id = self.window_manager.create_demo_window(
                "RISC-V Linux Console".to_string(),
                "Booting Linux on GPU...\n".to_string(),
                700.0,
                200.0,
                crate::window::WindowType::System,
            );
            
            // Set up UART handler to update the window
            // Since we're in an Arc context, we need to be careful with Mutexes if we want to update the window directly.
            // For now, we'll just poll it in update_riscv_linux_vm.
            
            self.riscv_linux_vm = Some(vm);
            log::info!("✅ RISC-V Linux VM initialized and ready to boot");
        }
    }

    pub fn update_riscv_linux_vm(&mut self) {
        if let Some(ref mut vm) = self.riscv_linux_vm {
            // Run a batch of instructions per frame
            // 100k instructions per frame (~6 MIPS at 60 FPS)
            for _ in 0..100_000 {
                vm.step();
            }
            
            // Log PC occasionally
            static mut FRAME_COUNTER: u32 = 0;
            unsafe {
                FRAME_COUNTER += 1;
                if FRAME_COUNTER % 60 == 0 {
                    let state = vm.read_state();
                    log::info!("📟 RISC-V VM: PC=0x{:08x}, Instructions={}", vm.read_pc(), state.instruction_count);
                }
            }
            
            vm.poll_uart();
            
            // If we have console output, update the window
            if !vm.console_output.is_empty() {
                // Find the console window
                if let Some(window) = self.window_manager.get_windows_mut().iter_mut().find(|w| w.title == "RISC-V Linux Console") {
                    if let Ok(content) = String::from_utf8(vm.console_output.clone()) {
                        // Log new output to terminal
                        if !content.is_empty() {
                            eprintln!("📺 RISC-V Console: {}", content);
                        }
                        
                        let mut final_content = content;
                        // Limit scrollback
                        if final_content.len() > 10000 {
                            final_content = final_content.chars().rev().take(10000).collect::<String>().chars().rev().collect();
                        }
                        window.content = Some(final_content);
                    }
                }
            }
        }
    }

    // Phase 44: Initialize Multi-VM Manager
    pub fn initialize_multi_vm_manager(&mut self) {
        let device = self.renderer.get_device().clone();
        let queue = self.renderer.get_queue().clone();

        self.multi_vm_manager = Some(crate::multi_vm_manager::MultiVmManager::new(device, queue));
        log::info!("✅ Multi-VM Manager initialized");
    }

    // Phase 44: Launch multiple VMs in parallel (demo: 4 VMs)
    pub fn launch_multiple_vms(&mut self) {
        if self.multi_vm_manager.is_none() {
            self.initialize_multi_vm_manager();
        }

        let manager = self.multi_vm_manager.as_mut().unwrap();

        // Create 4 VM configs using the test kernel
        let configs = vec![
            crate::multi_vm_manager::VmInstanceConfig::with_test_kernel(0, "VM-0-Alpine".to_string()),
            crate::multi_vm_manager::VmInstanceConfig::with_test_kernel(1, "VM-1-Alpine".to_string()),
            crate::multi_vm_manager::VmInstanceConfig::with_test_kernel(2, "VM-2-Alpine".to_string()),
            crate::multi_vm_manager::VmInstanceConfig::with_test_kernel(3, "VM-3-Alpine".to_string()),
        ];

        match manager.launch_multiple(configs) {
            Ok(_) => {
                log::info!("🚀 Launched 4 VM instances in parallel");
                eprintln!("🚀 Phase 44: Launched 4 VM instances in parallel");
            }
            Err(e) => {
                log::error!("Failed to launch VMs: {}", e);
                eprintln!("❌ Failed to launch VMs: {}", e);
            }
        }
    }

    // Phase 44: Update all VMs (called each frame)
    pub fn update_multi_vms(&mut self) {
        if let Some(ref mut manager) = self.multi_vm_manager {
            manager.execute_frame();

            // Log stats occasionally
            static mut FRAME_COUNTER: u32 = 0;
            unsafe {
                FRAME_COUNTER += 1;
                if FRAME_COUNTER % 60 == 0 {
                    let stats = manager.get_stats();
                    for stat in stats {
                        log::info!("📊 VM {}: {:?}, Instructions: {}",
                            stat.vm_id, stat.state, stat.instruction_count);
                    }
                }
            }
        }
    }

    // Phase 33 Step 3: Create live memory textures
    fn initialize_live_memory_textures(&mut self) {
        if let (Some(ref mapper), Some(ref mut manager)) = (&self.memory_texture_mapper, &mut self.memory_texture_manager) {
            // Create live texture for heap region
            if let Some(ref heap_region) = mapper.heap_region {
                let texture_name = "live_heap".to_string();
                match manager.create_live_texture(
                    texture_name.clone(),
                    heap_region.clone(),
                    4096,
                    4096,
                    std::time::Duration::from_millis(100),
                ) {
                    Ok(_) => {
                        log::info!("✅ Created live heap texture");
                        // Create a window for the live heap texture
                        let window_id = self.window_manager.create_demo_window(
                            "Live Heap Memory".to_string(),
                            format!("Region: {}\nRange: 0x{:x} - 0x{:x}\nPermissions: {}",
                                heap_region.name,
                                heap_region.start_addr,
                                heap_region.end_addr,
                                heap_region.permissions),
                            -300.0,
                            -300.0,
                            crate::window::WindowType::System,
                        );

                        // Assign texture to window
                        manager.assign_to_window(&texture_name, window_id);

                        // Mark window as having memory texture
                        if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                            window.has_memory_texture = true;
                            window.width = 512.0; // Scale down for display
                            window.height = 512.0;
                        }
                    }
                    Err(e) => {
                        log::warn!("Failed to create live heap texture: {}", e);
                    }
                }
            }
        }
    }

    // Phase 33: Initialize Memory Raycaster for 3D artifact interaction
    pub fn initialize_memory_raycaster(&mut self) {
        log::info!("🧠 Initializing Memory Raycaster for 3D artifact interaction...");

        let width = self.window_manager.screen_width();
        let height = self.window_manager.screen_height();
        
        let raycaster = crate::memory_raycaster::MemoryRaycaster::new(
            self.camera.clone(),
            width,
            height,
        );
        let terrain_raycaster = crate::terrain_raycaster::TerrainRaycaster::new(); // Phase 39.2

        self.memory_raycaster = Some(raycaster);
        self.terrain_raycaster = Some(terrain_raycaster);

        // Initialize memory artifact manager
        let device = self.renderer.get_device();
        let queue = self.renderer.get_queue();

        let artifact_manager = crate::memory_artifacts::MemoryArtifactManager::new(device, queue);
        self.memory_artifact_manager = Some(artifact_manager);

        log::info!("✅ Memory Raycaster and Artifact Manager initialized");
    }

    /// Phase 31.2: Initialize RTS Clipboard for visual persistence
    pub fn initialize_rts_clipboard(&mut self) {
        log::info!("📋 Initializing RTS Clipboard for visual persistence...");

        let _rts_clipboard = ClipboardRTS::new(None);

        // Set RTS Clipboard in ClipboardManager
        if let Some(ref _clipboard_manager) = self.clipboard_manager {
            // SharedClipboardManager uses internal locking
             // TODO: Add set_rts_clipboard to SharedClipboardManager (Phase 31.2)
             // clipboard_manager.set_rts_clipboard(rts_clipboard);
             log::info!("✅ RTS Clipboard initialized (Linking pending)");
        }

        // Initialize clipboard texture manager
        // Use default clipboard path
        let clipboard_texture_manager = ClipboardTextureManager::new(
            &self.renderer.get_device(),
            &self.renderer.get_queue(),
            self.renderer.get_surface_bind_group_layout().clone(), // Clone Arc (handle)
            None,
        );

        self.clipboard_texture_manager = Some(clipboard_texture_manager);
        log::info!("✅ Clipboard Texture Manager initialized");
    }

    /// Initialize Memory Graph Renderer
    pub fn initialize_graph_renderer(&mut self) {
        log::info!("🕸️ Initializing Memory Graph Renderer...");

        let device = self.renderer.get_device().clone();
        let queue = self.renderer.get_queue().clone();
        let surface_format = self.renderer.get_surface_format();

        let graph_renderer = GraphRenderer::new(device, queue, surface_format);
        self.graph_renderer = Some(std::sync::Arc::new(graph_renderer));

        log::info!("✅ Memory Graph Renderer initialized");
    }

    /// Initialize Memory Graph Protocol
    pub fn initialize_evolution_protocol(&mut self) {
        log::info!("🔗 Initializing Evolution Protocol...");

        let protocol = MemoryGraphProtocol::new("/tmp/evolution_daemon.sock");
        self.evolution_protocol = Some(std::sync::Arc::new(protocol));

        log::info!("✅ Evolution Protocol initialized");

        // Spawn interactive zone
        self.spawn_evolution_zone();
    }

    /// Initialize Inspector UI
    pub fn initialize_inspector_ui(&mut self) {
        log::info!("🖥️ Initializing Inspector UI...");

        if let (Some(graph_renderer), Some(protocol)) = (&self.graph_renderer, &self.evolution_protocol) {
            let ui = InspectorUI::new(graph_renderer.clone(), protocol.clone());
            self.inspector_ui = Some(std::sync::Arc::new(ui));
            log::info!("✅ Inspector UI initialized");
        } else {
            log::warn!("Cannot initialize Inspector UI: dependencies not ready");
        }
    }

    /// Initialize Evolution → Infinite Map Bridge
    pub fn initialize_evolution_terrain_bridge(&mut self) {
        log::info!("🧬 Initializing Evolution → Infinite Map Bridge...");

        // Get the bridge
        let bridge_arc_opt = self.evolution_terrain_bridge.clone();
        if let Some(bridge_arc) = bridge_arc_opt {
            // Lock and initialize GPU resources
            if let Ok(mut bridge) = bridge_arc.lock() {
                let device = self.renderer.get_device();
                let queue = self.renderer.get_queue();
                
                // Create a demo genome for initial display
                let demo_genome = bridge.generate_demo_genome();
                bridge.submit_genome(demo_genome);
                
                // Initialize GPU resources
                bridge.initialize_gpu(&device, &queue);
                
                // Enable in renderer if GPU resources are available
                if let Some(ref gpu_resources) = bridge.gpu_resources {
                    self.renderer.enable_evolution_terrain(gpu_resources);
                    
                    // Create bind groups for textures
                    self.update_evolution_terrain_bind_groups();
                    
                    log::info!("✅ Evolution Terrain Bridge initialized with demo genome");
                } else {
                    log::warn!("⚠️ Bridge initialized but GPU resources not available");
                }
            } else {
                log::error!("❌ Failed to lock evolution terrain bridge");
            }
        } else {
            log::warn!("⚠️ Evolution terrain bridge not created");
        }
    }

    /// Initialize the execution zone compositor
    ///
    /// Creates a Compositor instance for handling drag-and-drop of WGSL .rts.png files.
    /// This should be called after the renderer is initialized and a device is available.
    pub fn initialize_compositor(&mut self) {
        log::info!("🎨 Initializing Execution Zone Compositor...");

        let device = self.renderer.get_device();

        // Create the compositor with the device
        let compositor = infinite_map_rs::Compositor::new(device);

        self.compositor = Some(compositor);

        log::info!("✅ Execution Zone Compositor initialized");
    }

    /// Handle a file drop event for WGSL .rts.png files
    ///
    /// This method processes dropped files, checking if they are WGSL .rts.png files
    /// and creating execution zones appropriately.
    ///
    /// # Arguments
    ///
    /// * `file_path` - Path to the dropped file
    /// * `data` - Raw file data
    /// * `drop_position` - Position on the map where the file was dropped (world coordinates)
    ///
    /// # Returns
    ///
    /// * `Ok(())` if the file was processed successfully
    /// * `Err(String)` if there was an error processing the file
    pub fn handle_file_drop_event(
        &mut self,
        file_path: &str,
        data: &[u8],
        drop_position: glam::Vec2,
    ) -> Result<(), String> {
        // Check if compositor is initialized
        if let Some(ref mut compositor) = self.compositor {
            compositor.handle_file_drop(file_path, data, drop_position)
        } else {
            Err("Compositor not initialized. Call initialize_compositor() first.".to_string())
        }
    }

    /// Update evolution terrain bind groups (called when genome changes)
    pub fn update_evolution_terrain_bind_groups(&mut self) {
        if let Some(bridge_arc) = &self.evolution_terrain_bridge {
            if let Ok(bridge) = bridge_arc.lock() {
                if let Some(ref gpu) = bridge.gpu_resources {
                    let device = self.renderer.get_device();
                    
                    // Get layout 1 from renderer
                    if let Some(ref layout_1) = self.renderer.evolution_terrain_bind_group_layout_1 {
                        self.evolution_terrain_bind_group_1 = Some(device.create_bind_group(&wgpu::BindGroupDescriptor {
                            label: Some("Evolution Terrain Bind Group 1"),
                            layout: layout_1,
                            entries: &[
                                wgpu::BindGroupEntry {
                                    binding: 0,
                                    resource: wgpu::BindingResource::TextureView(&gpu.heightmap_view),
                                },
                                wgpu::BindGroupEntry {
                                    binding: 1,
                                    resource: wgpu::BindingResource::TextureView(&gpu.color_view),
                                },
                                wgpu::BindGroupEntry {
                                    binding: 2,
                                    resource: wgpu::BindingResource::Sampler(&gpu.sampler),
                                },
                            ],
                        }));
                    }
                    
                    // Get layout 2 from renderer (lighting)
                    if let Some(ref layout_2) = self.renderer.evolution_terrain_bind_group_layout_2 {
                        if let Some(ref lighting_buffer) = self.renderer.evolution_lighting_buffer {
                            self.evolution_terrain_bind_group_2 = Some(device.create_bind_group(&wgpu::BindGroupDescriptor {
                                label: Some("Evolution Terrain Bind Group 2"),
                                layout: layout_2,
                                entries: &[
                                    wgpu::BindGroupEntry {
                                        binding: 0,
                                        resource: lighting_buffer.as_entire_binding(),
                                    },
                                ],
                            }));
                        }
                    }
                }
            }
        }
    }

    /// Update evolution terrain (called each frame)
    pub fn update_evolution_terrain(&mut self) {
        // Check for pending genomes from API
        let mut genomes_to_process = Vec::new();
        if let Ok(mut rs) = self.runtime_state.lock() {
            if !rs.pending_genomes.is_empty() {
                 genomes_to_process = rs.pending_genomes.drain(..).collect();
            }
        }
        
        for genome in genomes_to_process {
            self.submit_evolution_genome(genome);
        }
        let bridge_arc_opt = self.evolution_terrain_bridge.clone();
        if let Some(bridge_arc) = bridge_arc_opt {
            if let Ok(mut bridge) = bridge_arc.lock() {
                // Check if bridge wants to update
                if bridge.should_update() {
                    let queue = self.renderer.get_queue();
                    bridge.update_gpu(&queue);
                    
                    // Update bind groups if genome changed
                    drop(bridge); // Release lock before calling self method
                    self.update_evolution_terrain_bind_groups();
                }
            }
        }
    }

    /// Phase 35.9: Render new cartridges from evolution zone
    ///
    /// Checks the registry for new cartridges and creates visual representations.
    pub fn render_cartridges(&mut self) {
        // Collect new cartridges to avoid borrowing multiple times from self
        let mut new_cartridges = Vec::new();

        if let Some(em_arc) = &self.evolution_manager {
            if let Ok(em) = em_arc.lock() {
                let registry = em.get_cartridge_registry();
                for entry in registry.get_all_entries() {
                    if !self.cartridges_rendered.contains(&entry.id) {
                        new_cartridges.push(entry.clone());
                    }
                }
            }
        }

        // Process new cartridges
        for entry in new_cartridges {
            log::info!("🎨 Rendering new cartridge: {} (Gen {}) at ({}, {})",
                entry.id, entry.generation, entry.spawn_x, entry.spawn_y);

            // Phase 35.9.1: Try to load the .rts.png texture
            let texture_loaded = if let Some(manager) = &self.cartridge_texture_manager {
                // Attempt to load the texture
                let result = manager.load_cartridge(&entry.id, &entry.path);

                match result {
                    Ok(()) => {
                        log::info!("✅ Loaded texture for cartridge: {}", entry.id);
                        true
                    }
                    Err(e) => {
                        log::warn!("⚠️  Failed to load texture for {}: {}", entry.id, e);
                        false
                    }
                }
            } else {
                false
            };

            // Determine window dimensions based on texture or default
            let (width, height) = if texture_loaded {
                if let Some(manager) = &self.cartridge_texture_manager {
                    if let Some(tex) = manager.get_texture(&entry.id) {
                        (tex.width as f32, tex.height as f32)
                    } else {
                        (128.0, 128.0) // Default cartridge size
                    }
                } else {
                    (128.0, 128.0)
                }
            } else {
                (128.0, 128.0) // Default size when texture fails to load
            };

            // Ensure minimum size
            let width = width.max(128.0);
            let height = height.max(128.0);

            // Create window at spawn position
            let title = format!("Cartridge {} (Gen {})", entry.id, entry.generation);
            let window_id = self.window_manager.create_window(
                title.clone(),
                entry.spawn_x,
                entry.spawn_y,
                width,
                height,
            );

            // Set window type to EvolutionZone for gold border
            self.window_manager.set_window_type(window_id, crate::window::WindowType::EvolutionZone);

            // Phase 35.9.2: Configure tile decorations (no title bar)
            let tile_decorations = crate::window::WindowDecorations {
                show_title_bar: false,
                border_width: 4.0,
                title_bar_height: 0.0,
                show_border: true,
                close_button_hovered: false,
            };
            self.window_manager.set_window_decorations(window_id, tile_decorations);

            // Phase 35.9.1: Mark window as having cartridge texture
            if texture_loaded {
                self.window_manager.set_window_has_cartridge_texture(window_id, &entry.id);
            }

            // Mark as rendered
            self.cartridges_rendered.insert(entry.id.clone());

            log::info!("🪟 Created window {} for cartridge: {}", window_id, entry.id);
        }
    }

    /// Phase 35.9.3: Boot a cartridge by launching it as a VM
    ///
    /// This extracts the binary from the .rts.png file and launches
    /// a RISC-V VM instance with the cartridge code.
    ///
    /// # Arguments
    /// * `cartridge_id` - The ID of the cartridge to boot
    /// * `window_id` - The window ID for visual feedback
    ///
    /// # Returns
    /// * `Ok(())` if boot initiated successfully
    /// * `Err(String)` if boot failed
    pub fn boot_cartridge(&mut self, cartridge_id: &str, window_id: usize) -> Result<(), String> {
        log::info!("🚀 Booting cartridge: {} (window {})", cartridge_id, window_id);

        // Get evolution manager reference
        let em_arc = self.evolution_manager.as_ref()
            .ok_or("Evolution manager not initialized")?;

        // Get cartridge entry from registry
        let entry = {
            let em = em_arc.lock()
                .map_err(|e| format!("Failed to lock evolution manager: {}", e))?;
            em.get_cartridge_entry(cartridge_id)
                .ok_or(format!("Cartridge {} not found in registry", cartridge_id))?
                .clone()
        };

        // Extract binary from .rts.png
        let binary_data = self.extract_cartridge_binary(&entry.path)?;

        log::info!("📦 Extracted {} bytes from cartridge", binary_data.len());

        // Emit boot resonance for daemon to handle
        self.emit_cartridge_boot_resonance(&entry, binary_data.len())?;

        // Launch VM with the binary
        self.launch_cartridge_vm(cartridge_id, &binary_data, window_id)?;

        // Visual feedback: update window to show booting state
        if let Some(window) = self.window_manager.get_window_mut(window_id) {
            window.decorations.border_width = 6.0; // Thicker border = booting
        }

        Ok(())
    }

    /// Emit a resonance indicating a cartridge is being booted
    fn emit_cartridge_boot_resonance(&self, entry: &crate::cartridge_registry::CartridgeEntry, size: usize) -> Result<(), String> {
        if let Some(ref bridge) = self.evolution_terrain_bridge {
            if let Ok(mut bridge) = bridge.lock() {
                let genome = crate::evolution_terrain_bridge::EvolutionGenome {
                    id: format!("boot-{}", entry.id),
                    data: vec![0xAF; 32], // Placeholder boot marker
                    fitness: entry.fitness,
                    generation: entry.generation,
                    position: (entry.spawn_x, entry.spawn_y),
                    metadata: serde_json::json!({
                        "action": "CARTRIDGE_BOOT",
                        "cartridge_id": entry.id,
                        "cartridge_path": entry.path,
                        "binary_size": size,
                    }),
                };
                bridge.submit_genome(genome);
                log::info!("📡 Emitted CARTRIDGE_BOOT resonance for {}", entry.id);
                return Ok(());
            }
        }
        // Fallback: log only
        log::info!("📡 CARTRIDGE_BOOT: {} ({} bytes)", entry.id, size);
        Ok(())
    }

    /// Launch a VM instance with cartridge binary
    fn launch_cartridge_vm(&mut self, cartridge_id: &str, binary_data: &[u8], window_id: usize) -> Result<(), String> {
        // TODO: Phase 35.9.4 - Actually launch VM with MultiVmManager
        // For now, just log and create a visual window

        log::info!("🎯 Would launch VM for cartridge {} ({} bytes)", cartridge_id, binary_data.len());

        // Create a console window to show VM output
        let console_window_id = self.window_manager.create_window(
            format!("VM: {}", cartridge_id),
            100.0, 100.0,  // Position (will be adjusted)
            400.0, 300.0,  // Size
        );

        if let Some(window) = self.window_manager.get_window_mut(console_window_id) {
            window.window_type = crate::window::WindowType::EvolutionZone;
            window.has_cartridge_texture = false;
            window.decorations.title_bar_height = 24.0;
            window.decorations.show_title_bar = true;
        }

        log::info!("✅ Created console window {} for VM output", console_window_id);

        Ok(())
    }

    /// Extract binary data from a .rts.png cartridge file
    fn extract_cartridge_binary(&self, path: &str) -> Result<Vec<u8>, String> {
        use std::path::Path;

        let path_obj = Path::new(path);
        if !path_obj.exists() {
            return Err(format!("Cartridge file not found: {}", path));
        }

        // Load PNG
        let image_data = std::fs::read(path_obj)
            .map_err(|e| format!("Failed to read cartridge file: {}", e))?;

        // Decode PNG to extract binary data using PixelRTS v2 format
        // For now, return a placeholder
        // TODO: Integrate with pixelrts_v2_extractor for real extraction
        log::warn!("⚠️  Using placeholder binary extraction - real extraction pending Phase 35.9.4");

        Ok(vec![0x90, 0x00, 0x00, 0x00]) // RISC-V NOP instruction placeholder
    }

    /// Submit a new genome to the evolution terrain bridge
    pub fn submit_evolution_genome(&mut self, genome: crate::evolution_terrain_bridge::EvolutionGenome) {
        if let Some(bridge_arc) = &self.evolution_terrain_bridge {
            if let Ok(mut bridge) = bridge_arc.lock() {
                bridge.submit_genome(genome);
                
                // Update GPU
                let queue = self.renderer.get_queue();
                bridge.update_gpu(&queue);
            }
            
            // Update bind groups
            self.update_evolution_terrain_bind_groups();
            
            log::info!("🧬 New evolution genome submitted to terrain bridge");
        }
    }

    /// Phase 43: Initialize Manifest Writer for Visual Shell Integration
    pub fn initialize_manifest_writer(&mut self) {
        log::info!("📝 Initializing Manifest Writer for Visual Shell Integration...");

        match crate::manifest_writer::ManifestWriter::default() {
            Ok(writer) => {
                self.manifest_writer = Some(writer);
                log::info!("✅ Manifest Writer initialized (systems/builder/map/manifest.json)");
            }
            Err(e) => {
                log::error!("❌ Failed to initialize Manifest Writer: {}", e);
            }
        }
    }

    /// Phase 43: Initialize Camera Sync WebSocket Server
    pub fn initialize_camera_sync_server(&mut self) {
        log::info!("🔌 Initializing Camera Sync WebSocket Server...");

        let server = crate::camera_sync::CameraSyncServer::default();
        let server_arc = std::sync::Arc::new(server);
        
        // Start the server in a background task
        let server_clone = Arc::clone(&server_arc);
        tokio::spawn(async move {
            if let Err(e) = server_clone.start().await {
                log::error!("❌ Camera Sync WebSocket server error: {}", e);
            }
        });

        self.camera_sync_server = Some(server_arc);
        log::info!("✅ Camera Sync WebSocket Server initialized on ws://127.0.0.1:8765");
    }

    #[cfg(feature = "hypervisor")]
    pub fn initialize_vm(&mut self) {
        log::info!("🖥️  Initializing Integrated Virtual Machine...");
        match VirtualMachine::new() {
            Ok(vm) => {
                let vm_ref = Arc::new(Mutex::new(vm));
                
                // Start background thread
                if let Err(e) = VirtualMachine::start_background(Arc::clone(&vm_ref)) {
                     log::error!("Failed to start VM background thread: {}", e);
                } else {
                     log::info!("✅ VM Background Thread Running");
                }
                
                self.vm = Some(vm_ref.clone());
                
                // Phase 31: Set clipboard manager in InputManager
                if let Some(clipboard_manager) = self.get_clipboard_manager() {
                    self.input_manager.set_clipboard_manager(clipboard_manager);
                }
                
                // Phase 30.6: Initialize console input buffer
                self.input_manager.init_console_input();
                
                // Phase 31: Initialize terminal clipboard
                if let Some(clipboard_manager) = self.get_clipboard_manager() {
                    let terminal_clipboard = crate::clipboard_manager::TerminalClipboard::new(clipboard_manager.clone());
                    
                    // Set clipboard in VM
                    if let Ok(mut vm) = vm_ref.try_lock() {
                        vm.set_terminal_clipboard(terminal_clipboard);
                        log::info!("✅ Terminal clipboard initialized");
                    }
                }
                
                // Initialize VM texture manager
                let device = self.renderer.get_device();
                let queue = self.renderer.get_queue();
                let bind_group_layout = self.renderer.get_surface_bind_group_layout();
                let sampler = self.renderer.get_shared_sampler();
                
                self.vm_texture_manager = Some(VmTextureManager::new(
                    device,
                    queue,
                    bind_group_layout,
                    sampler,
                ));
                
                log::info!("✅ VM Texture Manager initialized");
                
                // Create VM window with proper dimensions for framebuffer
                let window_id = self.window_manager.create_demo_window(
                    "Guest VM (Arch Linux)".to_string(),
                    "Initializing...".to_string(),
                    -300.0,
                    -100.0,
                    crate::window::WindowType::System
                );
                
                // Mark window as having VM texture
                if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                    window.has_vm_texture = true;
                    // Set window size to match VM framebuffer (1920x1080)
                    window.width = 960.0;  // Scale down for display
                    window.height = 540.0;
                }
                
                self.vm_window_id = Some(window_id);
            },

            Err(e) => {
                log::error!("Failed to create VM: {}", e);
            }
        }
    }

    // Phase 42: Initialize Alpine Linux VM
    pub fn initialize_alpine_vm(&mut self) {
        log::info!("🐧 Initializing Alpine Linux VM for Infinite Map...");
        
        // Check if Alpine PNG exists
        let alpine_png = std::path::PathBuf::from("alpine_visual.rts.png");
        if !alpine_png.exists() {
            log::warn!("⚠️  Alpine visual PNG not found: {:?}", alpine_png);
            log::info!("   To create: python3 pixelrts_converter.py alpine_bootable.rts alpine_visual.rts.png");
            return;
        }
        
        // Create Alpine VM manager
        let config = crate::alpine_vm::AlpineVmConfig {
            alpine_png,
            vnc_port: 5900,
            monitor_port: 55555,
            framebuffer_socket: std::path::PathBuf::from("/tmp/alpine_fb.sock"),
            qmp_socket: std::path::PathBuf::from("/tmp/qmp-alpine.sock"),
            memory_mb: 512,
            cpu_cores: 1,
            window_id: None,
            tile_position: None,
        };
        
        let mut alpine_vm = crate::alpine_vm::AlpineVmManager::new(config);
        
        // Boot Alpine VM
        match alpine_vm.boot() {
            Ok(()) => {
                log::info!("✅ Alpine VM booted successfully");
                
                // Wrap in Arc<Mutex> for shared access
                let alpine_vm_ref = std::sync::Arc::new(std::sync::Mutex::new(alpine_vm));
                self.alpine_vm = Some(alpine_vm_ref.clone());
                
                // Create window for Alpine on infinite map
                self.alpine_vm_window_id = Some(self.window_manager.create_demo_window(
                    "🐧 Alpine Linux".to_string(),
                    "Alpine Linux on Infinite Map\nStatus: BOOTING\nVNC: localhost:5900\nMonitor: localhost:55555".to_string(),
                    1200.0,
                    0.0,
                    WindowType::Focus,
                ));
                
                // Set window ID in VM manager
                if let Some(window_id) = self.alpine_vm_window_id {
                    if let Ok(mut vm) = alpine_vm_ref.try_lock() {
                        vm.set_window_id(window_id);
                        vm.set_tile_position(1200.0, 0.0);
                    }
                }
                
                log::info!("✅ Alpine VM window created on infinite map at (1200, 0)");
            }
            Err(e) => {
                log::error!("Failed to boot Alpine VM: {}", e);
            }
        }
    }

    // Phase 42: Update Alpine VM framebuffer
    pub fn update_alpine_vm(&mut self) {
        if let Some(alpine_vm_ref) = &self.alpine_vm {
            if let Ok(vm) = alpine_vm_ref.try_lock() {
                if vm.is_running() {
                    // Try to capture framebuffer
                    match vm.capture_framebuffer() {
                        Ok((framebuffer_data, width, height)) => {
                            // Update VM texture manager with framebuffer
                            if let Some(vm_texture_manager) = &mut self.vm_texture_manager {
                                if let Some(window_id) = vm.window_id() {
                                    // Convert PNG to RGBA if needed
                                    let rgba_data = match Self::png_to_rgba(&framebuffer_data) {
                                        Ok(data) => data,
                                        Err(e) => {
                                            log::warn!("Failed to convert PNG to RGBA: {}", e);
                                            return;
                                        }
                                    };
                                    
                                    if let Err(e) = vm_texture_manager.update_vm_texture(
                                        window_id,
                                        &rgba_data,
                                        width,
                                        height,
                                    ) {
                                        log::warn!("Failed to update Alpine VM texture: {}", e);
                                    }
                                }
                            }
                        }
                        Err(e) => {
                            // Non-fatal error, may just need retry
                            log::trace!("Alpine VM framebuffer capture: {}", e);
                        }
                    }
                }
            }
        }
    }
    
    // Helper: Convert PNG data to RGBA
    fn png_to_rgba(png_data: &[u8]) -> Result<Vec<u8>, String> {
        use image::ImageReader;
        
        let cursor = std::io::Cursor::new(png_data);
        let decoder = ImageReader::new(cursor)
            .with_guessed_format()
            .map_err(|e| format!("Failed to create decoder: {}", e))?;
        
        let image = decoder.decode()
            .map_err(|e| format!("Failed to decode PNG: {}", e))?;
        
        let rgba = image.to_rgba8();
        Ok(rgba.to_vec())
    }

    /// Phase 36: Connect QEMU Shared Memory Bridge
    /// Auto-discovers and connects to active QEMU VMs
    pub fn try_connect_qemu_shared_memory(&mut self) {
        // Phase 36: Connect QEMU Shared Memory Bridge
        // Auto-discovery strategy
        let target_vm = "default";
        
        // Check if default exists, if not, scan for others
        let available_vms = crate::qemu::SharedMemoryBridge::discover_active_vms();
        let vm_id_to_connect = if available_vms.contains(&target_vm.to_string()) {
            Some(target_vm.to_string())
        } else if !available_vms.is_empty() {
             log::info!("ℹ️ 'default' VM not found, auto-selecting: {}", available_vms[0]);
             Some(available_vms[0].clone())
        } else {
            None
        };

        if let Some(vm_id) = vm_id_to_connect {
            match crate::qemu::SharedMemoryBridge::new(&vm_id) {
                Ok(bridge) => {
                    log::info!("✅ QEMU Shared Memory Bridge connected (VM: {}, Size: {} bytes)", vm_id, bridge.size());
                    
                    // Phase 36.2: Visual Mapping
                    if let Some(manager) = &mut self.memory_texture_manager {
                        let texture_name = format!("qemu_ram_{}", vm_id);
                        // 1024x1024 = 1MB viewport (visualizing the first 1MB is usually enough to see chaos/boot)
                        if let Err(e) = manager.create_qemu_texture(&texture_name, 1024, 1024) {
                            log::warn!("Failed to create QEMU texture: {}", e);
                        } else {
                            // Create visual window
                            let window_id = self.window_manager.create_demo_window(
                                format!("QEMU RAM ({})", vm_id),
                                "Visualizing physical memory (Hilbert Mapped)...".to_string(),
                                -100.0,
                                -100.0,
                                crate::window::WindowType::System
                            );
                            
                            manager.assign_to_window(&texture_name, window_id);
                            
                            if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                                window.has_memory_texture = true;
                                window.width = 512.0;
                                window.height = 512.0;
                            }
                        }
                    }
                    
                    self.qemu_bridge = Some(bridge);
            
                    // Phase 36.2: Start QMP Control Background Task
                    let (tx, mut rx) = tokio::sync::mpsc::channel(32);
                    self.qmp_tx = Some(tx);
                    let qmp_id = vm_id.clone();
            
                    tokio::spawn(async move {
                        log::info!("🔄 QMP: Background task started for {}", qmp_id);
                        match crate::qemu::QmpClient::connect(&qmp_id).await {
                            Ok(mut client) => {
                                log::info!("✅ QMP: Connected and ready for commands");
                                while let Some(cmd) = rx.recv().await {
                                    match cmd {
                                        crate::qemu::QmpCommand::Pause => {
                                            if let Err(e) = client.stop().await {
                                                log::error!("QMP Pause Failed: {}", e);
                                            }
                                        }
                                        crate::qemu::QmpCommand::Resume => {
                                            if let Err(e) = client.resume().await {
                                                log::error!("QMP Resume Failed: {}", e);
                                            }
                                        }
                                        crate::qemu::QmpCommand::Reset => {
                                            if let Err(e) = client.system_reset().await {
                                                log::error!("QMP Reset Failed: {}", e);
                                            }
                                        }
                                        crate::qemu::QmpCommand::QueryStatus => {
                                            match client.query_status().await {
                                                Ok(status) => log::info!("QMP Status: {}", status),
                                                Err(e) => log::error!("QMP Query Failed: {}", e),
                                            }
                                        }
                                    }
                                }
                            }
                            Err(e) => {
                                log::warn!("⚠️ QMP Connection failed: {} (Is the VM running with -qmp?)", e);
                            }
                        }
                    });

                },
                Err(e) => {
                    log::warn!("Failed to connect QEMU Shared Memory Bridge: {}", e);
                }
            }
        } else {
             log::info!("ℹ️ No QEMU VMs detected (checked /dev/shm/qemu_ram_*)");
        }
    }

    pub fn set_evolution_manager(&mut self, evolution_manager: std::sync::Arc<std::sync::Mutex<EvolutionManager>>) {
        self.evolution_manager = Some(evolution_manager.clone());
        self.create_evolution_window();
        self.create_diagnostic_window(); // Also create diagnostic window when evolution is ready
        self.initialize_tool_manager(); // Phase 2: Initialize tool manager
        self.initialize_thought_renderer();
        self.initialize_visual_feedback();
        self.initialize_visual_shell();
        self.initialize_audio_manager();
        self.initialize_synaptic_daemon(); // Phase 35.3: Initialize synaptic daemon

        // Phase 40.3: Connect neural link to Hex Tensor Editor
        if let Some(text_engine) = &mut self.renderer.text_engine {
            if let Some(hex_editor) = &mut text_engine.hex_editor {
                hex_editor.connect_neural_link(evolution_manager);
                log::info!("🧠 Phase 40.3: Hex Tensor Editor neural link established via EvolutionManager");
            }
        }
    }

    pub fn create_diagnostic_window(&mut self) {
        if self.diagnostic_window_id.is_some() {
            return;
        }

        let window_id = self.window_manager.create_demo_window(
            "Diagnostic Overlay".to_string(),
            "PAS Score: Calculating...\n\nPerformance: --\nAesthetic: --\nSystem: --".to_string(),
            500.0,
            200.0,
            crate::window::WindowType::System,
        );
        
        // Enhance window visuals for diagnostic
        if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
            window.width = 300.0;
            window.height = 200.0;
        }

        self.diagnostic_window_id = Some(window_id);
    }

    // Phase 2: Initialize Tool Manager
    pub fn initialize_tool_manager(&mut self) {
        log::info!("🔧 Initializing Tool Manager for system diagnostics...");
        
        let mut tool_manager = crate::tool_manager::ToolManager::new();
        
        // Register BtopAdapter for system metrics
        tool_manager.register_adapter(std::sync::Arc::new(crate::tool_adapter::BtopAdapter::new()));
        
        // Register BpftraceAdapter for kernel tracing
        tool_manager.register_adapter(std::sync::Arc::new(crate::tool_adapter::BpftraceAdapter::new()));
        
        log::info!(
            "🔧 Tool Manager initialized with {} adapters",
            tool_manager.adapter_count()
        );
        
        self.tool_manager = Some(tool_manager);
    }

    pub fn update_diagnostic_display(&mut self) {
        if let Some(window_id) = self.diagnostic_window_id {
            let pas = &self.diagnostic_overlay.current_pas;
            let pas_color = pas.get_color();
            let expanded = self.diagnostic_overlay.expanded;
            
            if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                let score = pas.calculate();
                
                // Update window border color based on PAS state
                window.custom_border_color = Some(pas_color);

                if expanded {
                    window.width = 450.0;
                    window.height = 350.0;
                    
                    let mut content = format!(
                        "PAS Score: {:.2}\n\nPerformance: {:.2}\nAesthetic: {:.2}\nSystem: {:.2}\n\nVRAM: {} MB / {} MB",
                        score,
                        pas.p,
                        pas.a,
                        pas.s,
                        self.diagnostic_overlay.vram_usage_bytes / (1024 * 1024),
                        self.diagnostic_overlay.vram_limit_bytes / (1024 * 1024)
                    );

                    if let Some(ref tm) = self.tool_manager {
                        let tool_summary = tm.get_status_summary_sync();
                        content.push_str("\n\n-- System Tools --\n");
                        content.push_str(&tool_summary);
                    }
                    
                    window.content = Some(content);
                } else {
                    window.width = 250.0;
                    window.height = 60.0;
                    
                    window.content = Some(format!(
                        "PAS Score: {:.2} [ {} ]",
                        score,
                        if score > 0.8 { "OPTIMAL" } else if score > 0.5 { "CAUTION" } else { "CRITICAL" }
                    ));
                }
            }
        }
    }

    // Phase 45 / Horizon 1: Process Tiles - Update process list and tiles
    pub fn update_process_tiles(&mut self) {
        if self.process_tile_manager.is_none() {
            return;
        }

        let mut manager = self.process_tile_manager.take().unwrap();
        
        if let Err(e) = manager.refresh() {
            log::warn!("ProcessTileManager: Refresh failed: {}", e);
            self.process_tile_manager = Some(manager);
            return;
        }

        // Get top processes to show as windows (limit to top 10 by CPU)
        let top_processes = manager.top_by_cpu(10);
        let active_pids: std::collections::HashSet<u32> = top_processes.iter().map(|p| p.pid).collect();

        // 1. Remove windows for processes that are no longer in top 10
        let pids_to_remove: Vec<u32> = self.pid_to_window.keys()
            .filter(|pid| !active_pids.contains(pid))
            .cloned()
            .collect();

        for pid in pids_to_remove {
            if let Some(window_id) = self.pid_to_window.remove(&pid) {
                self.window_manager.remove_window(window_id);
            }
        }

        // 2. Update or create windows for current top processes
        for process in top_processes {
            let pid = process.pid;
            let window_content = format!(
                "PID: {}\nState: {}\nCPU: {:.1}%\nMemory: {} KB ({:.1}%)\nThreads: {}\n\nCmd: {}",
                pid, process.state, process.cpu_percent, process.memory_kb, 
                process.memory_percent, process.num_threads, process.cmdline
            );

            if let Some(&window_id) = self.pid_to_window.get(&pid) {
                // Update existing window
                if let Some(window) = self.window_manager.get_window_mut(window_id) {
                    window.content = Some(window_content);
                    
                    let brightness = process.cpu_to_brightness();
                    let color = process.semantic_color();
                    window.custom_border_color = Some([
                        color[0] * brightness, 
                        color[1] * brightness, 
                        color[2] * brightness,
                        1.0
                    ]);

                    // Update window size based on memory
                    let size_mult = process.memory_to_size();
                    window.width = 300.0 * size_mult;
                    window.height = 200.0 * size_mult;
                }
            } else {
                // Create new window
                let pos = manager.get_tile_position(pid).unwrap_or((0.0, 0.0));
                
                // Determine window type based on semantic color
                let color = process.semantic_color();
                let window_type = if color[0] == 0.0 && color[2] == 1.0 {
                    crate::window::WindowType::Focus
                } else if color[0] == 0.7 && color[2] == 1.0 {
                    crate::window::WindowType::Creative
                } else if color[1] > 0.8 {
                    crate::window::WindowType::System
                } else {
                    crate::window::WindowType::Default
                };

                let window_id = self.window_manager.create_demo_window(
                    format!("{}: {}", process.name, pid),
                    window_content,
                    pos.0,
                    pos.1,
                    window_type,
                );
                
                if let Some(window) = self.window_manager.get_window_mut(window_id) {
                    let brightness = process.cpu_to_brightness();
                    window.custom_border_color = Some([
                        color[0] * brightness, 
                        color[1] * brightness, 
                        color[2] * brightness,
                        1.0
                    ]);
                    
                    let size_mult = process.memory_to_size();
                    window.width = 300.0 * size_mult;
                    window.height = 200.0 * size_mult;
                }
                
                self.pid_to_window.insert(pid, window_id);
            }
        }

        self.process_tile_manager = Some(manager);
    }

    // Phase 45 / Horizon 1.2: Filesystem Hilbert - Update texture
    pub fn update_filesystem_hilbert(&mut self) {
        if let Some(ref mut manager) = self.filesystem_hilbert_manager {
            // Generate texture
            let (w, h, data) = manager.generate_texture();
            
            // Upload to Visual Cortex as a Retina Artifact
            if let Err(e) = self.visual_cortex.save_retina(
                data,
                w,
                h,
                None,
                Some((5000.0, 5000.0, 1.0)) // Place filesystem at (5000, 5000)
            ) {
                log::error!("Filesystem Hilbert: Failed to save retina: {}", e);
            } else {
                log::info!("🗄️  Filesystem Hilbert: Retina updated ({}x{})", w, h);
            }
        }
    }

    // Phase 45 / Horizon 1.3: Terminal Tiles - Create a new terminal tile
    pub fn create_terminal_tile(&mut self, x: f32, y: f32, title: String) -> usize {
        let id = self.terminal_tiles.len();
        let tile = crate::terminal_tile::TerminalTile::new(id, title, 80, 24);
        self.terminal_tiles.push(tile);
        
        // Also create a window to represent it visually
        let window_id = self.window_manager.create_demo_window(
            self.terminal_tiles[id].title.clone(),
            "".to_string(), // Content handled by custom texture
            x, y,
            crate::window::WindowType::Default
        );
        
        if let Some(window) = self.window_manager.get_window_mut(window_id) {
            window.width = self.terminal_tiles[id].texture_width as f32;
            window.height = self.terminal_tiles[id].texture_height as f32;
            window.custom_border_color = Some([1.0, 0.7, 0.0, 1.0]); // Gold border for native tools
        }
        
        window_id
    }

    /// Spawn an Evolution Zone window for autonomous execution interactions
    pub fn spawn_evolution_zone(&mut self) {
        // Initial spawning of the evolution zone window
        let window_id = self.window_manager.create_demo_window(
            "Evolution Zone".to_string(),
            "⚠️ Autonomous Execution Area\n\nClick to evolve local daemon.".to_string(),
            -500.0, -500.0,
            crate::window::WindowType::EvolutionZone,
        );
        
        if let Some(window) = self.window_manager.get_window_mut(window_id) {
            window.width = 400.0;
            window.height = 300.0;
        }
        
        log::info!("🧬 Spawning Evolution Zone (ID: {})", window_id);
    }

    // Phase 45 / Horizon 1.3: Update Terminal Tiles
    pub fn update_terminal_tiles(&mut self) {
        for tile in &mut self.terminal_tiles {
            if tile.needs_render {
                tile.update_texture();
                
                // Upload to Visual Cortex as an Eye Artifact
                if let Err(e) = self.visual_cortex.save_eye_artifact(
                    tile.texture_data.clone(),
                    tile.texture_width,
                    tile.texture_height,
                    Some(tile.id),
                    None
                ) {
                    log::error!("Terminal Tile {}: Failed to save artifact: {}", tile.id, e);
                }
            }
        }
    }

    // Phase 3: Diagnostic Interaction
    /// Phase 40.2: Handle Source City Interaction (Drag & Drop)
    fn handle_source_city_interaction(&mut self, world_x: f32, world_y: f32, is_press: bool, button: Option<smithay::backend::input::MouseButton>) -> bool {
        // If we have no city, we can't interact
        if self.source_city_loader.is_none() {
            return false;
        }

        if is_press {
             // Right Click: Boot System Slab or Rebuild City
             if button == Some(smithay::backend::input::MouseButton::Right) {
                  if let Some(loader) = &self.source_city_loader {
                       if let Some(tile) = loader.find_tile_at(world_x, world_y, 0.5) {
                            // Phase 40.4: Foundry Support
                            if tile.tile_type == "foundry" {
                                 log::info!("🏗️  FOUNDRY TRIGGER: Rebuilding Source City...");
                                 let task_path = "systems/builder/queue/rebuild.task";
                                 if let Err(e) = std::fs::write(task_path, "REBUILD_CITY") {
                                     log::error!("Failed to trigger rebuild: {}", e);
                                 } else {
                                     log::info!("✅ Rebuild task queued at {}", task_path);
                                 }
                                 return true;
                            }

                            if tile.path.ends_with(".iso") || tile.path.ends_with(".kernel") || tile.path.ends_with(".bin") || tile.path.ends_with(".img") {
                                 log::info!("🚀 Booting System Slab: {}", tile.path);
                                 
                                 // Initialize VM manager if needed (without booting default)
                                 if self.alpine_vm.is_none() {
                                     let config = crate::alpine_vm::AlpineVmConfig::default();
                                     let manager = crate::alpine_vm::AlpineVmManager::new(config);
                                     self.alpine_vm = Some(std::sync::Arc::new(std::sync::Mutex::new(manager)));
                                     
                                     // Create window logic embedded here for now
                                     self.alpine_vm_window_id = Some(self.window_manager.create_demo_window(
                                        format!("🐧 System: {}", tile.path),
                                        "Booting...".to_string(),
                                        world_x + 50.0, world_y + 50.0,
                                        crate::window::WindowType::System
                                     ));
                                     
                                     if let Some(window_id) = self.alpine_vm_window_id {
                                         if let Some(vm_arc) = &self.alpine_vm {
                                             if let Ok(mut vm) = vm_arc.lock() {
                                                 vm.set_window_id(window_id);
                                             }
                                         }
                                     }
                                 }
                                 
                                 // Trigger Boot
                                 if let Some(vm_arc) = &self.alpine_vm {
                                     if let Ok(mut vm) = vm_arc.lock() {
                                         if vm.is_running() { let _ = vm.stop(); }
                                         match vm.boot_from_file(std::path::PathBuf::from(&tile.path)) {
                                             Ok(_) => log::info!("✅ System Slab Booted"),
                                             Err(e) => log::error!("⚠️ Boot Failed: {}", e),
                                         }
                                     }
                                 }
                                 return true;
                            }
                       }
                  }
             }

            // Mouse Down (Left Click): Try to pick a tile
            if button == Some(smithay::backend::input::MouseButton::Left) {
                if let Some(loader) = &self.source_city_loader {
                    // Find tile at mouse position (tolerance related to zoom? assume 1.0 size?)
                    // Source tiles have explicit width/height
                    if let Some(tile) = loader.find_tile_at(world_x, world_y, 0.5) {
                        self.dragging_source_tile = Some(tile.path.clone());
                        self.source_tile_drag_start = Some((world_x, world_y));
                        log::info!("🏗️  Started dragging source tile: {}", tile.path);
                        return true;
                    }
                }
            }
        } else {
            // Mouse Up: Check if we were dragging
            if let Some(path) = self.dragging_source_tile.take() {
                // We were dragging. Now we drop.
                log::info!("🏗️  Dropped source tile: {}", path);
                
                // Find new location
                // Just use current cursor world_x, world_y
                // Determine new district based on nearest tile
                let target_district = if let Some(loader) = &self.source_city_loader {
                     if let Some(nearest) = loader.find_tile_at(world_x, world_y, 50.0) { // Large tolerance to find neighbor
                         Some(nearest.district.clone())
                     } else {
                         None
                     }
                } else { None };

                if let Some(district) = target_district {
                    // Start synaptic action
                    let signal = format!("file_move:{}:{}", path, district);
                    log::info!("🧠 SYNAPTIC TRIGGER: {}", signal);
                    
                    // Directly queue it for execution for now
                    if let Ok(mut rs) = self.runtime_state.lock() {
                        rs.pending_synaptic_actions.push(format!("fs_move {} {}", path, district));
                    }
                }
                
                self.source_tile_drag_start = None;
                return true;
            }
        }
        
        false
    }

    pub fn handle_diagnostic_click(&mut self, world_x: f32, world_y: f32) -> bool {
        if let Some(id) = self.diagnostic_window_id {
            if let Some(window) = self.window_manager.get_windows().get(id) {
                // Check if click is anywhere inside the window
                if world_x >= window.x && world_x <= window.x + window.width &&
                   world_y >= window.y - 30.0 && world_y <= window.y + window.height {
                    self.diagnostic_overlay.toggle_expansion();
                    log::info!("🔧 Diagnostic Overlay toggled: expanded={}", self.diagnostic_overlay.expanded);
                    return true;
                }
            }
        }
        false
    }

    pub fn handle_process_tile_interaction(&mut self, screen_x: f32, screen_y: f32, world_x: f32, world_y: f32) -> bool {
        // Find if we clicked a process window
        let mut clicked_pid = None;
        for (&pid, &window_id) in &self.pid_to_window {
            if let Some(window) = self.window_manager.get_window_mut(window_id) {
                if window.contains_visual(world_x, world_y) {
                    clicked_pid = Some(pid);
                    break;
                }
            }
        }

        if let Some(pid) = clicked_pid {
            let click_type = self.detect_click_type(screen_x, screen_y);
            if click_type == 2 {
                log::info!("📟 Attaching terminal to PID: {}", pid);
                // Phase 45 extension: In a real system we'd spawn a terminal window 
                // and link it to the process via /proc/[pid]/fd/0 etc.
                // For now, we'll just log it.
                return true;
            }
            return true; // Consume single click too to prevent propagation to map
        }
        
        false
    }

    fn initialize_visual_shell(&mut self) {
        // Assume tokens are in sibling directory
        let tokens_path = "../visual_shell/tokens.json";
        
        match VisualShellIntegration::new(tokens_path, 8) {
            Ok(mut shell) => {
                let device = self.renderer.get_device();
                let queue = self.renderer.get_queue();
                
                if let Err(e) = shell.init_gpu(&device, &queue) {
                    log::error!("Failed to initialize Visual Shell GPU: {}", e);
                    // Don't set self.visual_shell if GPU init fails
                } else {
                    if let Some(view) = shell.texture_view() {
                        self.renderer.set_background_texture(view);
                    }
                    self.visual_shell = Some(shell);
                    log::info!("✅ Visual Shell Integration initialized and linked to Renderer");
                }
            },
            Err(e) => {
                log::warn!("Failed to initialize Visual Shell (tokens not found?): {}", e);
            }
        }

        // Initialize Antigravity Bridge (Tectonic)
        self.initialize_antigravity_bridge();

        // Phase 41: Initialize Neural Console
        self.initialize_neural_console();
    }

    pub fn initialize_neural_console(&mut self) {
        log::info!("🧠 Initializing Neural Console...");

        let console = crate::neural_console::NeuralConsole::new();
        
        let window_id = self.window_manager.create_demo_window(
            "Neural Console".to_string(),
            "Initializing REPL...".to_string(),
            100.0,
            100.0,
            crate::window::WindowType::System, // Or a new Type?
        );
        
        // Setup window for rendering
        if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
             window.has_vm_texture = true; // Use VM texture mechanism for now
             // Size: 80 cols * 8px = 640, 30 rows * 16px = 480
             window.width = 640.0;
             window.height = 480.0; 
             // Phase 41: Set transparency or specific border color?
             window.custom_border_color = Some([0.0, 1.0, 0.0, 1.0]); // Neon Green
        }
        
        // Register texture
        if let Some(manager) = &mut self.vm_texture_manager {
             // Initial empty texture
             if let Err(e) = manager.update_vm_texture(window_id, &[0; 640*480*4], 640, 480) {
                 log::warn!("Failed to init Neural Console texture: {}", e);
             }
        }
        
        self.neural_console = Some(console);
        self.neural_console_window_id = Some(window_id);
        log::info!("✅ Neural Console initialized (Window ID: {})", window_id);
    }

    fn handle_console_actions(&mut self, actions: Vec<ConsoleAction>) {
        for action in actions {
            match action {
                ConsoleAction::Status => {
                    let pas = self.diagnostic_overlay.current_pas.calculate();
                    let vram = self.diagnostic_overlay.vram_usage_bytes / (1024 * 1024);
                    let status_msg = format!("System Status: NOMINAL\nPAS Score: {:.2}\nVRAM Usage: {} MB", pas, vram);
                    
                    if let Some(console) = &mut self.neural_console {
                        console.writeln(&status_msg);
                        console.write_prompt();
                    }
                }
                ConsoleAction::Scan => {
                    let artifact_count = if let Some(am) = &self.memory_artifact_manager {
                        am.get_index_count() / 36 
                    } else { 0 };
                    
                    let memory_regions = if let Some(_mapper) = &self.memory_texture_mapper {
                        "Mapped: Heap, Stack, .text".to_string()
                    } else {
                        "Memory Mapper: OFFLINE".to_string()
                    };

                    if let Some(console) = &mut self.neural_console {
                        console.writeln("Initiating Deep Memory Scan...");
                        console.writeln(&format!("Artifacts Detected: {}", artifact_count));
                        console.writeln(&format!("Memory Regions: {}", memory_regions));
                        console.write_prompt();
                    }
                }
                ConsoleAction::Morph => {
                    // Trigger a visual glitch or effect?
                    if let Some(console) = &mut self.neural_console {
                         console.writeln("Initiating Morphological Phase Shift...");
                         console.writeln("Warning: Metric Stability < 50%");
                         console.write_prompt();
                    }
                    // TODO: Actually trigger visual effect in Renderer
                }
                ConsoleAction::Quit => {
                    self.input_manager.set_possessed_window(None);
                    if let Some(console) = &mut self.neural_console {
                        console.writeln("Ending Possession.");
                        console.write_prompt();
                    }
                }
            }
        }
    }

    /// Phase 38: Initialize Antigravity Bridge
    /// Connects to the Daemon's shared memory texture
    pub fn initialize_antigravity_bridge(&mut self) {
        let path = std::path::PathBuf::from("/home/jericho/zion/projects/geometry_os/geometry_os/systems/vectorland/antigravity.pixelrts.png");
        log::info!("Initializing Antigravity Bridge at {:?}", path);

        let watcher = AntigravityWatcher::new(path);
        
        // Initial load
        if let Some((data, width, height, metadata_str)) = watcher.check_and_load() {
            log::info!("Loaded initial Antigravity texture: {}x{}", width, height);

            // Parse metadata for label
            let display_text = if let Ok(json) = serde_json::from_str::<serde_json::Value>(&metadata_str) {
                if let Some(label) = json["Visual_Label"].as_str() {
                    format!("shared_memory_map: /antigravity.pixelrts.png\n\n{}", label)
                } else {
                    format!("shared_memory_map: /antigravity.pixelrts.png\nStatus: SIMULATION ACTIVE\nMeta: {}", metadata_str)
                }
            } else {
                "shared_memory_map: /antigravity.pixelrts.png\nStatus: SIMULATION ACTIVE".to_string()
            };
            
            // Phase 3: The GPU Switch - Initialize Tectonic Simulator
            let device = self.renderer.get_device();
            let queue = self.renderer.get_queue();
            
            let simulator = TectonicSimulator::new(&device, width, height);
            simulator.upload_state(&queue, &data, width, height);
            
            // Set Renderer ground texture to simulator view
            self.renderer.set_background_texture(simulator.get_current_view());
            
            self.tectonic_simulator = Some(simulator);

            // Create a window for it
            let window_id = self.window_manager.create_demo_window(
                "Unified Cognitive Daemon".to_string(),
                display_text,
                -400.0, // Left side
                0.0,
                crate::window::WindowType::System,
            );
            
            // Mark window as texturable
             if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                window.has_vm_texture = true; // Use VM texture slot for now
                window.width = 512.0;
                window.height = 512.0;
            }

            // Register texture in VmTextureManager
            if let Some(vm_tm) = &mut self.vm_texture_manager {
                 if let Err(e) = vm_tm.update_vm_texture(window_id, &data, width, height) {
                     log::error!("Failed to upload Antigravity texture: {}", e);
                 } else {
                     self.antigravity_window_id = Some(window_id);
                 }
             }
        } else {
            log::warn!("Antigravity texture not found yet. Watcher active.");
        }
        
        self.antigravity_watcher = Some(watcher);
    }

    fn initialize_thought_renderer(&mut self) {
        // Fix: Use the neural texture from EvolutionManager, not the RTS texture from Renderer
        // We need the activations to drive the visual thoughts, not the map background
        if let Some(manager_arc) = &self.evolution_manager {
            if let Ok(manager) = manager_arc.lock() {
                if let Some(neural_texture) = manager.get_neural_texture_view() {
                     let mut thought_renderer = ThoughtRenderer::new(
                        self.renderer.get_device(),
                        self.renderer.get_queue(),
                        manager_arc.clone(),
                        neural_texture,
                    );
                    
                    // Set synaptic layer
                    thought_renderer.set_synaptic_layer(self.synaptic_layer.clone());
                    
                    self.thought_renderer = Some(thought_renderer);
                    log::info!("✅ Thought Renderer initialized with Neural Texture and Synaptic Layer");
                }
            }
        }
    }

    fn initialize_visual_feedback(&mut self) {
        if let Some(manager_arc) = &self.evolution_manager {
            if let Ok(manager) = manager_arc.lock() {
                let client = manager.get_client().clone();
                let mut visual_feedback = VisualFeedbackEncoder::new(
                    self.renderer.get_device(),
                    self.renderer.get_queue(),
                    client,
                    Default::default(),
                );
                visual_feedback.initialize(self.renderer.get_width(), self.renderer.get_height());
                self.visual_feedback = Some(visual_feedback);
                log::info!("✅ Visual Feedback Encoder initialized");
            }
        }
    }

    fn initialize_audio_manager(&mut self) {
        let config = crate::audio_manager::AudioManagerConfig::default();
        match crate::audio_manager::AudioManager::new(config) {
            Ok(mut audio_manager) => {
                match audio_manager.initialize() {
                    Ok(_) => {
                        if let Err(e) = audio_manager.start() {
                            log::warn!("Failed to start audio manager: {}", e);
                        } else {
                            self.audio_manager = Some(audio_manager);
                            log::info!("✅ Audio Manager initialized and started");
                        }
                    }
                    Err(e) => {
                        log::warn!("Failed to initialize audio manager: {}", e);
                    }
                }
            }
            Err(e) => {
                log::warn!("Failed to create audio manager: {}", e);
            }
        }
    }



    fn create_evolution_window(&mut self) {
        if let Some(manager_arc) = &self.evolution_manager {
            if let Ok(manager) = manager_arc.lock() {
                let metrics_text = manager.get_metrics_display();
                let neural_text = manager.get_neural_summary();
                
                let window_id = self.window_manager.create_demo_window(
                    "Evolution Metrics".to_string(),
                    format!("{}\n\n{}", metrics_text, neural_text),
                    -400.0,
                    200.0,
                    crate::window::WindowType::Creative,
                );
                
                self.evolution_window_id = Some(window_id);
            }
        }
    }

    pub fn update_evolution_display(&mut self) {
        if let (Some(manager_arc), Some(window_id)) = (&self.evolution_manager, self.evolution_window_id) {
            // Use get_windows_mut() to get mutable reference
            if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                if let Ok(manager) = manager_arc.lock() {
                    let metrics_text = manager.get_metrics_display();
                    let neural_text = manager.get_neural_summary();
                    window.content = Some(format!("{}\n\n{}", metrics_text, neural_text));
                }
            }
        }
    }



    pub fn get_vm_texture_bind_group(&self, window_id: usize) -> Option<&wgpu::BindGroup> {
        if let Some(vm_texture_manager) = &self.vm_texture_manager {
            if let Some(vm_texture) = vm_texture_manager.get_texture(window_id) {
                return Some(&vm_texture.bind_group);
            }
        }
        None
    }

    /// Get clipboard manager reference
    pub fn get_clipboard_manager(&self) -> Option<crate::clipboard_manager::SharedClipboardManager> {
        self.clipboard_manager.as_ref().map(|cm| cm.clone())
    }

    /// Get memory texture manager reference
    pub fn get_memory_texture_manager(&self) -> Option<&crate::memory_texture_manager::MemoryTextureManager> {
        self.memory_texture_manager.as_ref()
    }

    /// Handle click on memory artifact for inspection
    ///
    /// # Arguments
    /// * `screen_x` - Screen X coordinate
    /// * `screen_y` - Screen Y coordinate
    ///
    /// # Returns
    /// (artifact_id, _address) if clicked on artifact, None otherwise
    pub fn handle_memory_artifact_click(&mut self, screen_x: f32, screen_y: f32) -> (Option<usize>, Option<usize>) {
        if let (Some(raycaster), Some(artifact_manager)) = (&self.memory_raycaster, &self.memory_artifact_manager) {
            let artifacts = artifact_manager.get_artifacts();

            if let (Some(artifact_id), Some(address)) = raycaster.handle_click(screen_x, screen_y, artifacts) {
                log::info!("🧠 Clicked on memory artifact {} at address 0x{:x}",
                          artifact_id, address);

                // Phase 33 Step 3: Show hex dump window
                self.show_hex_dump(address);

                (Some(artifact_id), Some(address))
            } else {
                (None, None)
            }
        } else {
            (None, None)
        }
    }

    /// Show hex dump window for a memory address
    ///
    /// # Arguments
    /// * `address` - Memory address to inspect
    fn show_hex_dump(&mut self, address: usize) {
        // Read memory at address
        let hex_dump = if let Some(ref mapper) = self.memory_texture_mapper {
            match mapper.read_memory(address, 256) {
                Ok(data) => {
                    self.format_hex_dump(&data, address)
                }
                Err(e) => {
                    format!("Failed to read memory at 0x{:x}: {}", address, e)
                }
            }
        } else {
            "Memory mapper not available".to_string()
        };

        // Update existing hex dump window or create new one
        if let Some(window_id) = self.hex_dump_window_id {
            if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                window.content = Some(hex_dump);
                self.window_manager.bring_to_front(window_id);
            }
        } else {
            // Create new hex dump window
            let window_id = self.window_manager.create_demo_window(
                "Memory Inspector (Hex Dump)".to_string(),
                hex_dump,
                400.0,
                -400.0,
                crate::window::WindowType::System,
            );

            self.hex_dump_window_id = Some(window_id);
            self.hex_dump_address = Some(address);
        }

        log::info!("🔍 Showing hex dump for address 0x{:x}", address);
    }

    /// Format memory data as hex dump
    ///
    /// # Arguments
    /// * `data` - Memory data to format
    /// * `base_addr` - Base address for the hex dump
    ///
    /// # Returns
    /// Formatted hex dump string
    fn format_hex_dump(&self, data: &[u8], base_addr: usize) -> String {
        let mut output = String::new();

        for (i, chunk) in data.chunks(16).enumerate() {
            let addr = base_addr + i * 16;
            output.push_str(&format!("{:08x}: ", addr));

            // Hex bytes
            for (j, byte) in chunk.iter().enumerate() {
                output.push_str(&format!("{:02x} ", byte));
                if j == 7 {
                    output.push(' ');
                }
            }

            // Padding
            for j in chunk.len()..16 {
                output.push_str("   ");
                if j == 7 {
                    output.push(' ');
                }
            }

            output.push_str(" |");

            // ASCII representation
            for byte in chunk {
                if byte.is_ascii_graphic() || *byte == b' ' {
                    output.push(*byte as char);
                } else {
                    output.push('.');
                }
            }

            output.push_str("|\n");
        }

        output
    }

    /// Create a window with memory texture from V2 brick
    ///
    /// # Arguments
    /// * `brick_path` - Path to .brick file
    /// * `title` - Window title
    /// * `x` - Window X position
    /// * `y` - Window Y position
    ///
    /// # Returns
    /// Window ID if successful, None otherwise
    pub fn create_memory_window<P: AsRef<std::path::Path>>(
        &mut self,
        brick_path: P,
        title: String,
        x: f32,
        y: f32,
    ) -> Option<usize> {
        let brick_path = brick_path.as_ref();

        // Load brick if not already loaded
        if let Some(manager) = &mut self.memory_texture_manager {
            if manager.get_texture_by_path(brick_path).is_none() {
                match manager.load_brick(brick_path) {
                    Ok(Some(code)) => {
                        log::info!("🧬 Executing Hybrid DNA from {}", brick_path.display());
                         if let Some(ref context) = self.embedded_python_context {
                            if let Err(e) = context.execute_script(&code) {
                                log::warn!("Hybrid DNA execution failed: {}", e);
                            }
                        }
                    },
                    Ok(None) => {}, // Already loaded
                    Err(e) => {
                        log::error!("Failed to load brick {}: {}", brick_path.display(), e);
                        return None;
                    }
                }
            }

            // Get brick info for window content
            let brick_info = if let Some(texture) = manager.get_texture_by_path(brick_path) {
                if let Some(header) = &texture.header {
                    let width = header.texture_width;
                    let height = header.texture_height;
                    let entropy = header.entropy;
                    let order = header.hilbert_order;
                    let orig_size = header.original_size;

                    format!(
                        "V2 Brick: {}x{}\nEntropy: {:.2} bits/byte\nHilbert Order: {}\nOriginal Size: {} bytes",
                        width,
                        height,
                        entropy,
                        order,
                        orig_size
                    )
                } else {
                    "Loading...".to_string()
                }
            } else {
                "Loading...".to_string()
            };

            // Create window
            let window_id = self.window_manager.create_demo_window(
                title,
                brick_info,
                x,
                y,
                crate::window::WindowType::System,
            );

            // Assign texture to window
            manager.assign_to_window(brick_path, window_id);

            // Mark window as having memory texture
            if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                window.has_memory_texture = true;
                // Set window size to match brick dimensions (scaled)
                if let Some(texture) = manager.get_texture_by_path(brick_path) {
                    if let Some(header) = &texture.header {
                        window.width = header.texture_width as f32 * 0.5; // Scale down for display
                        window.height = header.texture_height as f32 * 0.5;
                    }
                }
            }

            log::info!("Created memory window {} for brick {}", window_id, brick_path.display());
            Some(window_id)
        } else {
            None
        }
    }

    pub fn execute_test_script_brick(&mut self) {
        if let Some(ctx) = &mut self.embedded_python_context {
             // Try to initialize context if likely needed (it's safe to call multiple times)
             let _ = ctx.initialize();
             
             let brick_path = std::path::Path::new("assets/scripts/test_script.brick");
             if brick_path.exists() {
                 match ctx.execute_brick_script(brick_path) {
                     Ok(msg) => log::info!("✅ Executed test script brick: {}", msg),
                     Err(e) => log::error!("❌ Failed to execute test script brick: {}", e),
                 }
             } else {
                 log::warn!("Test script brick not found at {}", brick_path.display());
             }
        }
    }

    // Phase 42: Infinite Map Loader Logic
    fn check_map_updates(&mut self) {
        let mut updates_available = false;
        
        if let Some(ref mut loader) = self.map_loader {
            match loader.check_updates() {
                Ok(true) => {
                    updates_available = true;
                }
                Err(e) => {
                     // Log occasionally? For now rely on loader logging
                     if self.frame_count % 600 == 0 {
                         log::warn!("MapLoader check failed: {}", e);
                     }
                },
                _ => {}
            }
        }

        if updates_available {
            self.load_map_textures();
        }
    }

    fn load_map_textures(&mut self) {
        // We know map_loader exists if we called this
        if self.map_loader.is_none() { return; }
        
        log::info!("🗺️  Syncing Infinite Map textures...");
        
        // Clone entries with coordinates
        let entries: Vec<((i32, i32), crate::map_loader::BrickEntry)> = self.map_loader.as_ref().unwrap().entries.iter().map(|(k,v)| (*k, v.clone())).collect();
        let mut loaded_count = 0;
        let mut new_artifacts_count = 0;
        
        // 1. Load Textures into MemoryTextureManager
        if let Some(ref mut manager) = self.memory_texture_manager {
            let processed_dir = std::path::Path::new("systems/builder/processed");
            let queue_dir = std::path::Path::new("systems/builder/queue");
            let cache_dir = std::path::Path::new("systems/builder/cache");
            
            for ((_x, _y), entry) in &entries {
                let brick_name = &entry.brick;
                let processed_path = processed_dir.join(brick_name);
                let queue_path = queue_dir.join(brick_name);
                let cache_path = cache_dir.join(brick_name);
                
                let path = if processed_path.exists() { processed_path } 
                           else if queue_path.exists() { queue_path }
                           else if cache_path.exists() { cache_path }
                           else { continue };
                
                match manager.load_brick(&path) {
                    Ok(Some(code)) => {
                        loaded_count += 1;
                        // Execute Hybrid DNA
                        if let Some(ref context) = self.embedded_python_context {
                            log::info!("🧬 Executing Hybrid DNA from {}", brick_name);
                            if let Err(e) = context.execute_script(&code) {
                                log::warn!("Hybrid DNA execution failed: {}", e);
                            }
                        }
                    },
                    Ok(None) => {
                        loaded_count += 1;
                    },
                    Err(e) => {
                        log::warn!("Failed to load map brick {}: {}", brick_name, e);
                    }
                }

                // Phase 46: Auto-detect Cognitive Entities
                if let Some(cognitive_manager) = &self.cognitive_manager {
                    // Try to find metadata sidecar (e.g. brick.rts.meta.json)
                    // If path is "foo.rts.png", with_extension("rts.meta.json") replaces "png" -> "foo.rts.meta.json"
                    // If path is "foo", -> "foo.rts.meta.json"
                    // This assumes standard sidecar naming
                    let mut meta_path = path.clone();
                    if let Some(file_name) = path.file_name() {
                        let mut new_name = file_name.to_os_string();
                        new_name.push(".meta.json"); // Append .meta.json to full filename? 
                        // Actually standard is usually replacing extension or appending.
                        // Let's assume appending for safety: foo.rts.png -> foo.rts.png.meta.json OR foo.rts.meta.json
                        // The user said: .rts.meta.json is the metadata format.
                        // If file is .rts.png, then removing .png and adding .meta.json works.
                         meta_path.set_extension("meta.json"); 
                    }
                    
                    if meta_path.exists() {
                         if let Ok(file) = std::fs::File::open(&meta_path) {
                            if let Ok(metadata) = serde_json::from_reader::<_, crate::cognitive::entity_type::RTSMetadata>(file) {
                                match crate::cognitive::entity_type::detect_entity_type(&metadata) {
                                    crate::cognitive::entity_type::EntityType::CognitiveEntity => {
                                        cognitive_manager.register_entity(brick_name.clone(), path.clone(), crate::cognitive::entity_type::EntityType::CognitiveEntity);
                                        log::info!("🧠 Registered Cognitive Entity: {}", brick_name);
                                    },
                                    _ => {}
                                }
                            }
                        }
                    }
                }
            }
        }

        // 2. Create 3D Artifacts in MemoryArtifactManager
        if let Some(ref mut artifact_manager) = self.memory_artifact_manager {
            let processed_dir = std::path::Path::new("systems/builder/processed");
            let queue_dir = std::path::Path::new("systems/builder/queue");
            let cache_dir = std::path::Path::new("systems/builder/cache");

            for ((x, y), entry) in &entries {
                if !self.spawned_map_artifacts.contains(&(*x, *y)) {
                    let brick_name = &entry.brick;
                    let processed_path = processed_dir.join(brick_name);
                    let queue_path = queue_dir.join(brick_name);
                    let cache_path = cache_dir.join(brick_name);
                    
                    let path = if processed_path.exists() { processed_path } 
                               else if queue_path.exists() { queue_path }
                               else if cache_path.exists() { cache_path }
                               else { continue };

                    // Load brick data for artifact properties
                    if let Ok(brick) = crate::memory_tensor::V2Brick::load(&path) {
                        let grid_size = 100.0; // Keep in sync with CONFIG.grid_size
                        // Map (X, Y) -> 3D World (X, Z) to match terrain view
                        // Terrain View (Renderer): Target=[x, 0, y]. So X is X, Y is Z.
                        let world_x = (*x as f32) * grid_size;
                        let world_z = (*y as f32) * grid_size; 
                        let world_y = 0.0; // Floor level

                        artifact_manager.create_from_brick(&brick, [world_x, world_y, world_z]);
                        self.spawned_map_artifacts.insert((*x, *y));
                        new_artifacts_count += 1;
                    }
                }
            }
            
            if new_artifacts_count > 0 {
                artifact_manager.update_buffers();
                log::info!("✨ Created {} new 3D artifacts for map", new_artifacts_count);
            }
        }
            
        if loaded_count > 0 {
            log::info!("🗺️  Synced {} textures for Infinite Map", loaded_count);
        }
    }

    pub fn update(&mut self, state: &mut GeometryCompositorState) {
        // Phase 47: Update QEMU SHM
        self.update_qemu_shm_process();

        // Phase 31: Update Crystallized Text Engine
        self.update_crystallized_text();

        // Phase 34: Handle save/load commands
        self.handle_save_load_commands();

        // Phase 35.1: Handle selection commands
        self.handle_selection_commands();

        // Phase 35.2: Handle clipboard commands
        self.handle_clipboard_commands();

        // Phase 35.3: Handle undo/redo commands
        self.handle_undo_commands();

        // Phase 38: Handle execution commands
        self.handle_execution_commands();

        // Phase 47: Handle crystallize commands (F5)
        self.handle_crystallize_commands();

        // Phase 40: Handle Hex Tensor Editor commands
        self.handle_hex_editor_commands();

        // Phase 42: Handle Compile commands (Ctrl+Shift+C)
        self.handle_compile_commands();

        // Phase 44: Handle Profiler commands (Ctrl+Shift+P)
        self.handle_profiler_commands();

        // Phase 44: Handle Multi-VM commands (Ctrl+Shift+M)
        self.handle_multi_vm_commands();

        // Phase Mode B.2: Handle spatial auto-save
        self.handle_spatial_auto_save();

        // Phase 45 / Horizon 1: Update Process Tiles
        self.update_process_tiles();

        // Phase 45 / Horizon 1.2: Update Filesystem Hilbert Texture
        self.update_filesystem_hilbert();

        // Phase 45 / Horizon 1.3: Update Terminal Tiles
        self.update_terminal_tiles();

        // Phase 35.9: Render new cartridges from evolution zone
        self.render_cartridges();

        // Phase 100: Visual Cortex (AI Feedback Loop)
        // Check if we should trigger a new capture
        if self.visual_cortex.should_capture() {
            if let Ok(mut rs) = self.runtime_state.lock() {
                if rs.screenshot_params.is_none() && rs.screenshot_data.is_none() {
                    let config = self.renderer.get_config();
                    rs.screenshot_params = Some((0, 0, config.width, config.height));
                }
            }
        }

        // Check if there is pending screenshot data to persist as RTS
        let screenshot_data = if let Ok(mut rs) = self.runtime_state.lock() {
            rs.screenshot_data.take()
        } else {
            None
        };

        if let Some((data, w, h)) = screenshot_data {
            if let Err(e) = self.visual_cortex.save_retina(
                data, 
                w, 
                h, 
                None, // Use default neuromodulation for now
                Some((self.camera.x, self.camera.y, self.camera.zoom))
            ) {
                log::error!("failed to save retina artifact: {}", e);
            } else {
                log::info!("👁️  Visual Cortex: Retina updated ({}x{})", w, h);
            }
        }

        // Phase 34: Check for pending transmutations from API
        let pending_load = if let Ok(mut rs) = self.runtime_state.lock() {
             rs.pending_load.take()
        } else {
             None
        };

        if let Some(path) = pending_load {
             self.initialize_riscv_executor(Some(path), None);
        }

        // Phase 34.2: Update Shared Runtime State

        if let Ok(mut rs) = self.runtime_state.lock() {
            // Update Mouse Pos (Screen -> World needed?)
            // Just use raw screen pos for now, or last known
            if let Some((mx, my)) = self.last_mouse_pos {
                rs.mouse_pos = (mx, my);
            }
            
            // Update Focused ID
            if let Some(fid) = self.window_manager.get_focused_window_id() {
                 let windows = self.window_manager.get_windows();
                 if let Some(win) = windows.iter().find(|w| w.id == fid) {
                     // Check if it's the Alpine VM window
                     if Some(fid) == self.alpine_vm_window_id {
                         rs.focused_id = Some("Alpine_VM".to_string());
                     } else {
                         // Or try to use the window title/id as brick name
                         // Window struct has title
                         rs.focused_id = Some(win.title.clone()); 
                     }
                 }
            } else {
                rs.focused_id = None;
            }
        }

        // Phase 2: Update RISC-V GPU Executor
        self.update_riscv_executor();
        self.update_riscv_linux_vm();

        // Phase 44: Update Multi-VM Manager
        self.update_multi_vms();

        // Phase 42: Check for Map Updates
        self.check_map_updates();
        self.poll_rebuild_signal();

        // Phase 40.5: Update hot-swappable modules and check for changes
        self.update_modules();
        let reloaded_indices = {
            let reloaded = self.check_module_changes();
            let mut indices = Vec::new();
            for (path, vat_id) in reloaded {
                log::info!("🔄 Hot-swapped module: {} (vat_id: {})", path.display(), vat_id.as_str());
                if let Some(&id) = self.path_to_artifact.get(&path) {
                    indices.push(id);
                }
            }
            indices
        };

        // Start morph animation for reloaded artifacts
        for id in reloaded_indices {
            self.active_morphs.insert(id, 1.0);
        }

        // Animate morphs
        if !self.active_morphs.is_empty() {
            let mut to_remove = Vec::new();
            if let Some(manager) = &mut self.memory_artifact_manager {
                for (&id, progress) in &mut self.active_morphs {
                    *progress -= 0.02; // Slow fade (approx 0.8s @ 60fps)
                    if *progress <= 0.0 {
                        to_remove.push(id);
                        manager.set_morph_factor(id, 0.0);
                    } else {
                        manager.set_morph_factor(id, *progress);
                    }
                }
                for id in to_remove {
                    self.active_morphs.remove(&id);
                }
                manager.update_buffers();
            }
        }
        
        // Phase 42: Update Alpine Linux VM framebuffer
        self.update_alpine_vm();
        
        // Phase 40: Unreal Bridge Broadcast (Heartbeat)
        if let Some(ref mut bridge) = self.unreal_bridge {
            // Broadcasting a heartbeat with empty payload for now
            bridge.broadcast_update(0, 0, &[]);
        }

        let current_time = self.current_time();
        
        // Phase 38: Check for Antigravity Updates
        let update_data = if let Some(ref mut watcher) = self.antigravity_watcher {
            watcher.check_and_load()
        } else {
            None
        };

        // If new external data (Daemon Pulse), inject it into simulation state
        if let Some((data, width, height, metadata_str)) = update_data {
             log::info!("↺ Antigravity Bridge: Reloading Shared Memory Texture ({}x{})", width, height);
             
             // Update Window Text with new Metadata
             if let Some(window_id) = self.antigravity_window_id {
                if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                    if let Ok(json) = serde_json::from_str::<serde_json::Value>(&metadata_str) {
                         if let Some(label) = json["Visual_Label"].as_str() {
                             window.content = Some(format!("shared_memory_map: /antigravity.pixelrts.png\n\n{}", label));
                         }
                         
                         // Phase 46.5: Proprioception - Pulse Attention Tile
                         if let Some(filename) = json["Attention_Tile"].as_str() {
                             // Find artifact ID by filename
                             let mut target_id = None;
                             for (path, &id) in &self.path_to_artifact {
                                 if path.file_name().and_then(|n| n.to_str()) == Some(filename) {
                                     target_id = Some(id);
                                     break;
                                 }
                             }
                             
                             if let Some(id) = target_id {
                                 if let Some(ref mut am) = self.memory_artifact_manager {
                                     log::info!("⚡ Proprioception: Pulsing Attention Tile '{}' (ID: {})", filename, id);
                                     am.pulse(id as usize, 1.5, 500); // High intensity pulse
                                     am.update_buffers();
                                 }
                             }
                         }
                    }
                }
             }
             
             // Update Simulator State (External Injection)
             if let Some(ref mut simulator) = self.tectonic_simulator {
                 let queue = self.renderer.get_queue(); // Arc clone
                 simulator.upload_state(&queue, &data, width, height);
             }

             // Visual feedback for window
             if let Some(window_id) = self.antigravity_window_id {
                 if let Some(ref mut vm_tm) = self.vm_texture_manager {
                     let _ = vm_tm.update_vm_texture(window_id, &data, width, height);
                 }
                 
                 // Mark window as updated?
                 if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                     window.content = Some(format!("shared_memory_map: /antigravity.pixelrts.png\nStatus: PULSE DETECTED\nTimestamp: {:?}", current_time));
                 }
             }
        }

        // Tectonic Simulation Step (Every Frame)
        if let Some(ref mut simulator) = self.tectonic_simulator {
            let device = self.renderer.get_device();
            let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Tectonic Simulation Encoder"),
            });

            // Run Compute Shader
            simulator.update(&mut encoder);
            
            // Submit
            self.renderer.get_queue().submit(Some(encoder.finish()));

            // Update Ground Texture View (Flip Ping-Pong)
            // Note: renderer.set_background_texture creates a bind group. Doing this 60fps is okay?
            // Yes, wgpu bind group creation is fast enough for per-frame updates usually.
            // A better way would be swapping bind groups if pre-created, but set_background_texture adapts to unknown views.
            self.renderer.set_background_texture(simulator.get_current_view());
        }

        // Phase 35: Update Synaptic Layer
        self.update_synaptic_layer();

        // Phase 46: Update Cognitive System (ACE Entities)
        self.update_cognitive_system();
        
        // Phase 30.8: Calculate delta time for cursor blink
        let _delta_time = if let Some(last_time) = self.last_frame_time {
            (current_time - last_time) as f32 / 1000.0
        } else {
            0.016 // Default ~16ms for first frame
        };
        
        // Update last frame time
        let frame_time = if let Some(last_time) = self.last_frame_time {
            std::time::Duration::from_millis((current_time - last_time) as u64)
        } else {
            std::time::Duration::from_millis(16)
        };
        self.last_frame_time = Some(current_time);
        
        // Update diagnostic overlay
        self.diagnostic_overlay.update_performance(frame_time);
        
        if let Some(ref mtm) = self.memory_texture_manager {
            self.diagnostic_overlay.update_system_health(mtm.get_total_vram_usage());
        }

        // Phase 2: Blend Tool health into System component
        if let Some(ref tm) = self.tool_manager {
            let tool_health = tm.get_health_sync();
            self.diagnostic_overlay.update_system_from_tools(tool_health, Some(0.5));
        }
        
        // Update aesthetic entropy (Phase 1 shim)
        if let Some(ref mtm) = self.memory_texture_manager {
            let stats = mtm.stats();
            if stats.total_textures > 0 {
                // Simplified: use average entropy of all bricks as a proxy for visual complexity
                self.diagnostic_overlay.set_aesthetic_entropy(0.2); // Placeholder low entropy
            }
        }
        
        self.update_diagnostic_display();
        
        self.camera.update(CONFIG.damping);
        
        // Phase 43: Broadcast camera state to WebSocket clients (PixiJS visual shell)
        if let Some(ref server) = self.camera_sync_server {
            server.broadcast_camera(
                self.camera.x,
                self.camera.y,
                self.camera.zoom,
                self.camera.target_x,
                self.camera.target_y,
                self.camera.target_zoom,
            );

            // Phase 44: Broadcast Cognitive State
            if let Some(ref mut territory) = self.cognitive_territory {
                territory.update();
                let state = territory.get_render_state();
                let msg = serde_json::json!({
                    "type": "cognitive_update",
                    "data": state
                });
                server.broadcast(msg);
            }

            // Phase 40: Broadcast Neural State & Token Visualization
            if let Some(manager_arc) = &self.evolution_manager {
                if let Ok(manager) = manager_arc.lock() {
                    // 1. Broadcast Neural State
                    if let Some(neural_state) = manager.get_neural_state() {
                         let msg = serde_json::json!({
                            "type": "neural_state_update",
                            "data": neural_state
                         });
                         server.broadcast(msg);
                    }

                    // 2. Broadcast Token Visualization
                    if let Some(token_data) = manager.get_token_visualization() {
                        let msg = serde_json::json!({
                            "type": "token_visualization",
                            "data": token_data
                        });
                        server.broadcast(msg);
                    }
                }
            }
        }
        
        // Phase 30.8: Update cursor blink state
        #[cfg(feature = "hypervisor")]
        if let Some(ref vm) = self.vm {
            if let Ok(mut locked_vm) = vm.try_lock() {
                locked_vm.update_cursor_blink(delta_time);
            }
        }
        
        // Update evolution manager if present
        if let Some(manager_arc) = &self.evolution_manager {
            if let Ok(mut manager) = manager_arc.lock() {
                manager.update(&self.renderer.get_device(), &self.renderer.get_queue());
            }
            self.update_evolution_display();
        }

        // Update visual shell (Harmonic & Legacy Support)
        if let Some(shell) = &mut self.visual_shell {
            if let Some(manager_arc) = &self.evolution_manager {
                if let Ok(mut manager) = manager_arc.lock() {
                    
                    // 1. Process Harmonic Daemon Sync (Phase 2)
                    if let Some(sync) = manager.fetch_daemon_sync() {
                        // Unregister
                        for name in sync.unregistered {
                             let _ = shell.unregister_daemon(DaemonId::from_name(&name));
                        }
        
                        // Register
                        for reg in sync.registered {
                            let id = DaemonId::from_name(&reg.name);
                            let band = match reg.preferred_band {
                                DaemonFrequencyBand::UltraLow => FrequencyBand::UltraLow,
                                DaemonFrequencyBand::Low => FrequencyBand::Low,
                                DaemonFrequencyBand::Mid => FrequencyBand::Mid,
                                DaemonFrequencyBand::High => FrequencyBand::High,
                                DaemonFrequencyBand::Custom(hz) => FrequencyBand::Custom(hz),
                            };
                            if let Err(e) = shell.register_daemon(id, band, reg.initial_amplitude) {
                                 log::warn!("Daemon registration failed: {}", e);
                            }
                        }
        
                        // Update Data
                        for update in sync.updates {
                             if let Ok(data) = serde_json::from_value::<Vec<f32>>(update.data.clone()) {
                                 let _ = shell.update_daemon_data(DaemonId::from_name(&update.name), data);
                             }
                        }
                        
                        // Update Amplitudes
                        for amp in sync.amplitude_updates {
                             let _ = shell.set_daemon_amplitude(DaemonId::from_name(&amp.name), amp.amplitude);
                        }
                    }
                    
                    // 2. Visualization Update
                    if shell.daemon_count() > 0 {
                         // Harmonic Mode: Tick mixer and resolve field
                         shell.tick_mixer(std::time::Duration::from_millis(16));
                         if let Err(e) = shell.update_from_spectral_field(1.0) {
                              log::warn!("Harmonic update failed: {}", e);
                         }
                    } else {
                         // Legacy Mode: Single Neural State
                         if let Some(neural_state) = manager.get_neural_state() {
                            let activations: Vec<f32> = neural_state.layer_activations.clone();
                            
                            if let Err(e) = shell.update_from_neural(
                                &activations,
                                &neural_state.attention_weights,
                                &neural_state.memory_patterns,
                                neural_state.confidence
                            ) {
                                log::warn!("Visual Shell update failed: {}", e);
                            }
                        }
                    }
                    
                    // Trigger texture update on GPU
                    if let Err(e) = shell.update_texture() {
                        log::warn!("Visual Shell texture update failed: {}", e);
                    }
                }
            }
        }

        // Phase 34.4: Execute Pixel CPU Step

        
        // Update thought renderer if present
        if let Some(ref mut renderer) = self.thought_renderer {
            // Check if we have token visualization data
            let token_data_clone = if let Some(manager_arc) = &self.evolution_manager {
                if let Ok(manager) = manager_arc.lock() {
                    manager.get_neural_state()
                        .and_then(|ns| ns.token_visualization.clone())
                } else { None }
            } else { None };

            if let Some(token_data) = token_data_clone {
                // Use token visualization mode
                renderer.update_with_token_visualization(&self.camera.get_view_projection_matrix(), &token_data);
            } else {
                // Phase 28: Use audio features if available
                let audio_features = self.audio_manager.as_ref().map(|am| am.get_features());
                renderer.update_with_audio(&self.camera.get_view_projection_matrix(), audio_features.as_ref());
            }
        }
        
        // Update visual feedback if present
        if let (Some(ref mut feedback), Some(output_texture)) = (&mut self.visual_feedback, self.renderer.get_output_texture()) {
            if let Err(_e) = feedback.update(output_texture) {
                // log::warn!("Failed to send visual feedback: {}", e);
                // Reduce spam
            }
        }
        
        // Update audio manager if present (Phase 28)
        if let Some(ref mut audio_manager) = self.audio_manager {
            audio_manager.update();
        }
        
        // Phase 33: Update Glass RAM
        if let Some(ref mut memory_mapper) = self.memory_texture_mapper {
            memory_mapper.update_textures();
        }

        // Phase 35.6: Process Synaptic Actions
        self.process_synaptic_actions();

        // process_synaptic_actions() call is above at line 2163.
        // We removed the nested definitions.

    // Update live memory textures
        if let Some(ref mut memory_texture_manager) = self.memory_texture_manager {
            memory_texture_manager.update_live_textures();
            
            // Try to auto-discover bridge if missing
            if self.qemu_bridge.is_none() {
                let vms = crate::qemu::SharedMemoryBridge::discover_active_vms();
                if let Some(vm_id) = vms.first() {
                     log::info!("🔍 Auto-connecting to QEMU VM: {}", vm_id);
                     if let Ok(bridge) = crate::qemu::SharedMemoryBridge::new(vm_id) {
                         self.qemu_bridge = Some(bridge);
                     }
                }
            }

            if let Some(ref bridge) = self.qemu_bridge {
                memory_texture_manager.update_qemu_texture("qemu_ram_default", bridge);
                
                // Phase 5: Hilbert Injection - Map QEMU to "Outer Ring" via Fractal Folding
                // Inject the first 4MB at offset (2048, 0)
                if let Some(ref mut simulator) = self.tectonic_simulator {
                     // Read 4MB (1MB pixels since 1024*1024)
                     // Note: h2xy for 1024x1024 uses 20 bits of index.
                     // 1024*1024 = 1,048,576 bytes mapped cleanly.
                     let size = 1024 * 1024; // 1MB scan window
                     if let Ok(data) = bridge.read_physical(0, size) {
                         // Inject at (2048, 0) using Hilbert Folding with Base Address 0
                         simulator.inject_hilbert_chunk(&self.renderer.get_queue(), data, 2048, 0, 1024, 0);
                     }
                }
            }
        }

        // Phase 38: Tectonic Bridge Update (Operation Tectonic) (Renamed from Antigravity Bridge)
        if let Some(ref watcher) = self.antigravity_watcher {
            if let Some((data, width, height, _)) = watcher.check_and_load() {
                log::info!("⚡ Tectonic Switch: Updating Ground Truth Substrate ({}x{})", width, height);
                // Update Ground Truth (Substrate)
                self.renderer.update_rts_texture(&data, width, height);

                // Update Window (Visual Monitor)
                if let Some(window_id) = self.antigravity_window_id {
                     if let Some(vm_tm) = &mut self.vm_texture_manager {
                         let _ = vm_tm.update_vm_texture(window_id, &data, width, height);
                     }
                }
            }
        }
        
        // Phase 30, Task 4: Neural Integration (The "Watchful Eye")
        // Feed QEMU RAM to Tectonic Simulator (Compute Shader)
        self.update_tectonic_bridge();

        // Phase 37.3: Handle Introspection Results
        if let Some(rx) = &mut self.introspection_rx {
            while let Ok((address, analysis)) = rx.try_recv() {
                log::info!("Creating Introspection Window for 0x{:x}", address);
                
                // Phase 40.3: Update Hex Editor with Annotation (if active)
                // We need to apply this BEFORE creating window to ensure visual consistency
                let queue = self.renderer.queue.clone(); // Clone Arc for borrow check
                if let Some(text_engine) = &mut self.renderer.text_engine {
                    if text_engine.is_hex_mode() {
                        let annotation = crate::hex_tensor_editor::NeuralAnnotation {
                             offset: address,
                             length: 16, // Default assume 16 bytes relevant context
                             interpretation: analysis.clone(),
                             confidence: 1.0, // AI is always confident :)
                             suggested_patch: None, // Parsing patch would be next step
                             timestamp: std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_secs(),
                        };
                        text_engine.apply_hex_neural_annotation(&queue, address, annotation);
                        log::info!("✨ Applied Neural Annotation to Hex Editor at 0x{:04X}", address);
                    }
                }

                // Create Window
                // We'll place it slightly offset from camera center or near mouse?
                // For now, center screen relative to camera
                let _x = self.camera.x;
                let _y = self.camera.y;

                // TODO: Re-enable when introspection_window module is fixed
                // if let Some(tm) = &mut self.vm_texture_manager {
                //     let window = crate::ui::introspection_window::IntrospectionWindow::new(
                //         &mut self.window_manager,
                //         x, y,
                //         &analysis
                //     );
                //
                //     window.update_texture(tm);
                // } else {
                //     log::error!("Cannot create IntrospectionWindow: VmTextureManager not available");
                // }
                log::info!("IntrospectionWindow temporarily disabled (module commented out)");
            }
        }



        // Phase 34: Handle Visual Commands from Bridge
        if let Some(rx) = &mut self.visual_command_rx {
             while let Ok(cmd) = rx.try_recv() {
                 match cmd {
                     crate::glass_ram::bridge::VisualCommand::AllocTower { id, hilbert_index, height, color: _ } => {
                         log::info!("Bridge Command: AllocTower id={} h={}", id, hilbert_index);
                         if let Some(ref mut am) = self.memory_artifact_manager {
                             // Simple mapping: Hilbert index to spatial coordinates
                             // usage: x = (idx % 32) * 20, z = (idx / 32) * 20
                             let spacing = 20.0;
                             let grid_width = 32;
                             
                             let x = (hilbert_index % grid_width) as f32 * spacing - 300.0;
                             let z = (hilbert_index / grid_width) as f32 * spacing - 300.0;
                             
                             let artifact = crate::memory_artifacts::MemoryArtifact::new(
                                 id as usize,
                                 crate::memory_artifacts::MemoryArtifactType::Stack, // Stack renders as tower
                                 [x, 0.0, z],
                                 [10.0, height, 10.0],
                                 (0, 0),
                                 0.8, // High entropy for glow
                             );
                             
                             am.add_artifact(artifact);
                             am.update_buffers();
                         }
                     },
                     crate::glass_ram::bridge::VisualCommand::SetColor { id, color } => {
                         log::info!("Bridge Command: SetColor id={}", id);
                         if let Some(ref mut am) = self.memory_artifact_manager {
                             am.set_color(id as usize, color);
                             am.update_buffers();
                         }
                     },
                     crate::glass_ram::bridge::VisualCommand::Pulse { id, intensity, duration_ms } => {
                         log::info!("Bridge Command: Pulse id={} intensity={} duration={}", id, intensity, duration_ms);
                         if let Some(ref mut am) = self.memory_artifact_manager {
                             am.pulse(id as usize, intensity, duration_ms);
                             am.update_buffers();
                         }
                     },
                     crate::glass_ram::bridge::VisualCommand::ClearAll => {
                         log::info!("Bridge Command: ClearAll");
                         if let Some(ref mut am) = self.memory_artifact_manager {
                             am.clear();
                             am.update_buffers();
                         }
                     },
                     crate::glass_ram::bridge::VisualCommand::SynapticAction { command } => {
                         log::info!("🧠 Bridge Command: SynapticAction {:?}", command);
                         // TODO: Route to synaptic map for processing
                         // This will be integrated when the SynapticMap is added to InfiniteMapApp
                     },
                     crate::glass_ram::bridge::VisualCommand::TypeText { text } => {
                         log::info!("⌨️ Bridge Command: TypeText '{}'", text.replace("\n", "\\n"));
                         if let Some(alpine_vm) = &self.alpine_vm {
                             if let Ok(vm) = alpine_vm.lock() {
                                 vm.type_text(&text);
                             }
                         }
                     },
                     crate::glass_ram::bridge::VisualCommand::MoveCamera { x, y } => {
                         log::info!("🎥 Bridge Command: MoveCamera ({}, {})", x, y);
                         self.camera.set_target(x, y);
                     },
                     crate::glass_ram::bridge::VisualCommand::ZoomCamera { zoom } => {
                         log::info!("🔍 Bridge Command: ZoomCamera {}", zoom);
                         self.camera.set_zoom(zoom);
                     },
                     crate::glass_ram::bridge::VisualCommand::MoveMouse { x, y } => {
                         // Convert World -> Screen
                         let screen_width = self.window_manager.screen_width();
                         let screen_height = self.window_manager.screen_height();
                         let screen_pos = self.camera.world_to_screen(x, y, screen_width, screen_height);
                         
                         // Inject Pointer Motion
                         self.input_manager.handle_pointer_motion(
                             state,
                             &self.window_manager,
                             &self.camera,
                             screen_pos.x,
                             screen_pos.y,
                             0,
                             0,
                         );
                     },
                     crate::glass_ram::bridge::VisualCommand::MouseClick { button, down } => {
                         let state_input = if down { 
                             smithay::backend::input::ButtonState::Pressed 
                         } else { 
                             smithay::backend::input::ButtonState::Released 
                         };
                         let btn = match button {
                             1 => smithay::backend::input::MouseButton::Left,
                             2 => smithay::backend::input::MouseButton::Right,
                             3 => smithay::backend::input::MouseButton::Middle,
                             _ => smithay::backend::input::MouseButton::Left,
                         };
                         
                         self.input_manager.handle_pointer_button(
                             state,
                             btn,
                             state_input,
                             0,
                             0,
                         );
                     },
                 }
             }
        }

        // Performance Logging (Every 1s)
        self.frame_count += 1;
        if self.last_fps_log.elapsed().as_secs_f32() >= 1.0 {
            let fps = self.frame_count as f32 / self.last_fps_log.elapsed().as_secs_f32();
            let artifact_count = if let Some(ref m) = self.memory_artifact_manager {
                m.get_index_count() / 36 // Approx cubes
            } else { 0 };

            // Phase 47: Metabolic state telemetry
            let metabolic = self.diagnostic_overlay.get_metabolic_state();
            let state_name = metabolic.get_state_name();
            let mult = metabolic.get_multiplier();

            log::info!(
                "Perf: {:.1} FPS | Artifacts: {} | [{}] D:{:.2} A:{:.2} U:{:.2} | Cycles: {} ({:.1}x)",
                fps, artifact_count, state_name,
                metabolic.neuromodulator.dopamine,
                metabolic.neuromodulator.acetylcholine,
                metabolic.neuromodulator.urgency,
                metabolic.instruction_budget,
                mult
            );

            self.frame_count = 0;
            self.last_fps_log = std::time::Instant::now();
        }

        // Phase 41: Update Neural Console Texture
        if let (Some(console), Some(window_id)) = (&mut self.neural_console, self.neural_console_window_id) {
             if let Some(manager) = &mut self.vm_texture_manager { // Reuse VM texture manager for terminal rendering
                 let buffer = console.get_emulator().get_buffer();
                 // Check focus or possession
                 let focused = self.window_manager.get_focused_window_id() == Some(window_id);
                 let possessed = self.input_manager.get_possessed_window_id() == Some(window_id);
                 let cursor_blink = if focused || possessed { 1.0 } else { 0.0 }; // Simple blink logic
                 
                 // Reuse update_terminal_texture from VmTextureManager
                 if let Err(_e) = manager.update_terminal_texture(
                     window_id,
                     buffer,
                     true, // cursor visible
                     cursor_blink,
                     None // selection (TODO: Implement console selection)
                 ) {
                     // Warn only once or throttle?
                     // log::warn!("Failed to update Neural Console texture: {}", e);
                 }
                 
                 // Update window content text (optional debug info)
                 if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                     window.content = Some("Neural Console: ACTIVE".to_string());
                 }
             }
        }

        // Phase 30.2: VM Window Update (Visual Feedback from Framebuffer)
        // Phase 30.3: VirtIO Console Integration
        // Phase 30.6: Interactive Terminal Integration
        #[cfg(feature = "hypervisor")]
        if let (Some(vm), Some(window_id), Some(vm_texture_manager)) = (&self.vm, self.vm_window_id, &mut self.vm_texture_manager) {
            // Phase 30.6: Get console input before locking VM
            let console_input = if let Some(focused_window_id) = self.window_manager.get_focused_window_id() {
                if focused_window_id == window_id {
                    self.input_manager.get_console_input()
                } else {
                    None
                }
            } else {
                None
            };
            
            // Write console input to VM (if any)
            if let Some(input_data) = console_input {
                if let Ok(vm) = vm.try_lock() {
                    vm.write_console_input(&input_data);
                    log::debug!("📝 Routed {} bytes to VM console", input_data.len());
                }
            }
            
            // Now lock VM for rendering
            if let Ok(mut locked_vm) = vm.try_lock() {
                 let running = locked_vm.is_running();
                   
                   if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                        if running {
                           // Phase 30.8: Get cursor state for rendering
                           let cursor_visible = locked_vm.is_cursor_visible();
                           let cursor_blink_state = locked_vm.get_cursor_blink_state();
                           
                           // Phase 32: Handle window resize (inline to avoid borrow conflict)
                           {
                               // Calculate new terminal dimensions based on window size
                               // Assume 8x16 pixel cells (typical terminal font size)
                               let char_width = 8.0;
                               let char_height = 16.0;
                               
                               let new_cols = (window.width / char_width).floor() as usize;
                               let new_rows = (window.height / char_height).floor() as usize;
                               
                               // Ensure minimum dimensions
                               let new_cols = new_cols.max(40);
                               let new_rows = new_rows.max(24);
                               
                               // Get current terminal dimensions
                               let (current_rows, current_cols) = locked_vm.get_terminal_size();
                               
                               // Only resize if dimensions changed
                               if new_rows != current_rows || new_cols != current_cols {
                                   log::info!("📐 VM window resized: {}x{} -> {}x{} terminal",
                                           current_cols, current_rows, new_cols, new_rows);
                                   
                                   locked_vm.resize_terminal(new_rows, new_cols);
                               }
                           }
                           
                           // Upload framebuffer to texture
                           let fb = locked_vm.get_framebuffer();
                           let width = locked_vm.width;
                           let height = locked_vm.height;
                           
                           // Phase 30.8: Render terminal buffer with cursor
                           if let Some(terminal_buffer) = locked_vm.get_terminal_buffer() {
                               let selection_range = locked_vm.get_terminal_clipboard()
                                   .and_then(|c| c.get_selection_range());
 
                               if let Err(e) = vm_texture_manager.update_terminal_texture(
                                   window_id,
                                   terminal_buffer,
                                   cursor_visible,
                                   cursor_blink_state,
                                   selection_range,
                               ) {
                                   log::warn!("Failed to update terminal texture: {}", e);
                               }
                           }
                           
                           // Fallback: Update VM texture with framebuffer data
                           if let Err(e) = vm_texture_manager.update_vm_texture(
                               window_id,
                               &fb,
                               width,
                               height,
                           ) {
                                 log::warn!("Failed to update VM texture: {}", e);
                           }
                           
                           // Phase 30.3: Get VirtIO console output
                           let console_output = locked_vm.get_console_output_string();
                           let console_preview = if console_output.len() > 200 {
                               format!("...{}", &console_output[console_output.len()-200..])
                           } else {
                               console_output.clone()
                           };
                           
                           // Update window content with status and console output
                           window.content = Some(format!(
                               "STATUS: RUNNING\nResolution: {}x{}\nTerminal: {}x{}\nFPS: {:.1}\n\n--- CONSOLE OUTPUT ---\n{}",
                               width,
                               height,
                               locked_vm.get_terminal_size().0,
                               locked_vm.get_terminal_size().1,
                               60.0, // Placeholder for actual FPS calculation
                               console_preview
                           ));
                       } else {
                           window.content = Some("STATUS: STOPPED\n\n--- CONSOLE OUTPUT ---\nNo output available".to_string());
                       }
                   }
            }
        }
    }

    // Phase 35.6: Execute Action Logic
    fn process_synaptic_actions(&mut self) {
        let actions = {
            if let Ok(mut rs) = self.runtime_state.lock() {
                // Drain queue
                rs.pending_synaptic_actions.drain(..).collect::<Vec<_>>()
            } else {
                return;
            }
        };

        for action in actions {
            log::info!("🧠 EXECUTING SYNAPTIC SIGNAL: {}", action);
            
            if action.starts_with("sys_") {
                self.handle_system_action(&action);
            } else if action.starts_with("launch:") {
                let app_id = action.trim_start_matches("launch:");
                log::info!("🚀 Launching app via Synapse: {}", app_id);
                
                // Try to find the matching .rts.png
                let possible_paths = [
                    format!("systems/transmutation/{}.rts.png", app_id),
                    format!("{}.rts.png", app_id),
                    format!("systems/vectorland/{}.rts.png", app_id),
                ];
                
                let mut found = false;
                for path in possible_paths {
                    if std::path::Path::new(&path).exists() {
                        log::info!("✅ Found executable: {}", path);
                        self.initialize_riscv_executor(Some(path), None);
                        found = true;
                        break;
                    }
                }
                
                if !found {
                    log::warn!("❌ Could not find executable for app_id: {}", app_id);
                }
            } else if action == "build_component" {
                log::info!("🏗️ Triggering build component...");
                // Placeholder
            } else {
                 log::warn!("⚠️ Unknown synaptic action: {}", action);
            }
        }
    }

    fn handle_system_action(&mut self, action: &str) {
        match action {
            "sys_reboot" => {
                log::warn!("🔄 SYSTEM REBOOT TRIGGERED BY SYNAPSE");
                // Reset Camera
                self.camera.x = 0.0;
                self.camera.y = 0.0;
                self.camera.zoom = 1.0;
                
                // Reset Evolution Manager if present
                if let Some(manager_arc) = &self.evolution_manager {
                     if let Ok(mut manager) = manager_arc.lock() {
                         manager.reset();
                     }
                }
            },
            "sys_evolution_start" => {
                log::info!("🧬 Evolution Start Visual Effect Triggered");
                // Could trigger a specific visual effect here
            },
            "sys_alert_malware" => {
                log::error!("🛡️ MALWARE ALERT VISUALIZATION");
                // Turn screen red?
            },
            "sys_manifest_magenta" => {
                log::info!("🎨 Proprioception Loop: Manifesting Magenta Artifact");
                let id = self.window_manager.create_demo_window(
                    "Proprioception Beacon (Magenta)".to_string(),
                    "GROUNDING_LOOP_ACTIVE".to_string(),
                    -250.0, -250.0,
                    crate::window::WindowType::Default
                );
                if let Some(w) = self.window_manager.get_window_mut(id) {
                    w.custom_border_color = Some([1.0, 0.0, 1.0, 1.0]); // Magenta
                    w.width = 500.0;
                    w.height = 500.0;
                }
            },
            _ => log::info!("System action: {}", action),
        }
    }
    
    /// Task 4: Tectonic Bridge - Feed QEMU RAM to Neural Grid
    fn update_tectonic_bridge(&mut self) {
        // Only run if we have both a QEMU bridge and a Tectonic Simulator
        if let (Some(ref bridge), Some(ref mut simulator)) = (&self.qemu_bridge, &mut self.tectonic_simulator) {
            
            // Limit update rate to avoid bus contention (e.g. every 10 frames)
            if self.frame_count % 10 != 0 {
                return;
            }

            // Read a "Saccade" (Visual Scan) of QEMU Memory
            // We focus on the VGA Framebuffer area (0xA0000) or Kernel Text
            // For now, scan the first 1MB (Real Mode area) which is dense with info
            let scan_size = 1024 * 1024; // 1MB
            let scan_offset = 0; // Base physical address

            if let Ok(data) = bridge.read_physical(scan_offset, scan_size) {
                 // Inject into Tectonic Grid
                 // We map this 1MB chunk to a specific region on the Infinite Map (Neural Cortex)
                 // Map to coordinates (4096, 0) - The "Memory Palace" Region
                 let target_x = 4096;
                 let target_y = 0;
                 let width = 1024; // 1024x1024 = 1MB pixels

                 simulator.inject_hilbert_chunk(
                     &self.renderer.get_queue(),
                     data,
                     target_x,
                     target_y,
                     width,
                     scan_offset
                 );
                 
                 // Run Inference Step (Visual Assembly)
                 // The compute shader 'tectonic_kernel.wgsl' will now process this memory
                 // and generate "Activated" pixels where patterns are found
            }
        }
    }

    pub fn handle_surface_commit(&mut self, surface: &WlSurface) {
        log::trace!("Surface commit: {:?}", surface.id());
        
        let mut texture_update = None;
        let mut damage_rects = Vec::new();
        let mut full_update_needed = false;

        with_states(surface, |states| {
            let mut attributes_guard = states.cached_state.get::<SurfaceAttributes>();
            let attributes = attributes_guard.current();
            for d in &attributes.damage {
                match d {
                    Damage::Buffer(rect) => damage_rects.push(rect.clone()),
                    Damage::Surface(_rect) => {
                        // Logical damage requires scaling which we skip for now
                        full_update_needed = true;
                    }
                }
            }
        });

        log::debug!("Surface Commit {:?}: Damage rects: {:?}, Full Update: {}", surface.id(), damage_rects, full_update_needed);

        with_renderer_surface_state(surface, |state| {
            if let Some(buffer) = state.buffer() { 

                 let result = with_buffer_contents(buffer, |ptr, len, data_spec| {
                    // Safety: We are copying the data immediately.
                    let data = unsafe { std::slice::from_raw_parts(ptr, len) };
                    (data.to_vec(), data_spec.width, data_spec.height, data_spec.format)
                });

                if let Ok((data, width, height, format)) = result {
                    let format_u32 = format as u32; 
                    
                    if let Some(wgpu_format) = crate::surface_manager::wayland_format_to_wgpu(format_u32) {
                        texture_update = Some((data, width as u32, height as u32, wgpu_format));
                    } else {
                        log::warn!("Unsupported Wayland buffer format: {:?}", format);
                    }
                } else {
                    log::warn!("Failed to read buffer contents for surface {:?}", surface.id());
                }
            }
        });

        if let Some((data, width, height, format)) = texture_update {
            if let Err(e) = self.renderer.get_surface_manager().update_surface(
                surface,
                &data,
                width,
                height,
                format,
                if full_update_needed || damage_rects.is_empty() { None } else { Some(&damage_rects) }
            ) {
                log::error!("Failed to update surface texture: {}", e);
            }
        }
    }

    pub fn handle_input_event<I: InputBackend>(
        &mut self,
        state: &mut GeometryCompositorState,
        event: SmithayInputEvent<I>,
        serial: u32
    ) {
        let time = self.current_time();
        
        match event {
            SmithayInputEvent::Keyboard { event, .. } => {
                let key_code = event.key_code().raw();
                let key_state = event.state();
                
                if key_state == smithay::backend::input::KeyState::Pressed {
                    log::info!("⌨️  Key Pressed: Raw Code = {}", key_code);
                }

                // Memory Graph Inspector Toggle (F12 - 88)
                if key_state == smithay::backend::input::KeyState::Pressed && key_code == 88 {
                    self.inspector_visible = !self.inspector_visible;
                    log::info!("🕸️ Memory Graph Inspector {}", if self.inspector_visible { "shown" } else { "hidden" });
                    return; // Consume event
                }

                // Phase Mode B.1: File Persistence Shortcuts (Ctrl+S / Ctrl+O)
                let is_ctrl = self.input_manager.is_ctrl_pressed();
                let is_shift = self.input_manager.is_shift_pressed();

                if is_ctrl && key_state == smithay::backend::input::KeyState::Pressed {
                    match key_code {
                        31 => { // Ctrl+S (Save)
                            if let Some(text_engine) = &self.renderer.text_engine {
                                // Phase 40: Check if in hex mode for substrate saving
                                if text_engine.is_hex_mode() {
                                    if let Err(e) = text_engine.save_substrate(None) {
                                        log::error!("❌ Failed to save substrate: {}", e);
                                    } else {
                                        log::info!("💾 Substrate saved successfully");
                                    }
                                } else {
                                    // Normal text save
                                    let path = if let Some(p) = &text_engine.current_file {
                                        p.clone()
                                    } else {
                                        std::path::PathBuf::from("project_ouroboros.txt")
                                    };
                                    
                                    if let Err(e) = text_engine.save_to_path(&path) {
                                        log::error!("❌ Failed to save: {}", e);
                                    } else {
                                        log::info!("✅ Saved to {:?}", path);
                                    }
                                }
                            }
                            return;
                        }
                        24 => { // Ctrl+O (Open)
                             let queue = self.renderer.queue.clone();
                             let path = std::path::Path::new("project_ouroboros.txt");
                             
                             // Init file if missing
                             if !path.exists() {
                                 let _ = std::fs::write(path, "Welcome to Project Ouroboros.\nMode B Persistence Layer Active.\n");
                             }
                             
                             if let Some(text_engine) = &mut self.renderer.text_engine {
                                 if let Err(e) = text_engine.load_from_path(&queue, path) {
                                     log::error!("❌ Failed to open: {}", e);
                                 } else {
                                     log::info!("✅ Opened {:?}", path);
                                 }
                             }
                             return;
                        }
                        23 => { // Ctrl + I (Check shift for Import)
                            if is_shift {
                                // Ctrl+Shift+I = Import Source Crystal (Phase 40)
                                self.import_source_crystal();
                                return;
                            }
                        }
                        33 => { // Ctrl+C (Copy)
                            if let Some(text_engine) = &self.renderer.text_engine {
                                let selected = text_engine.get_selected_text();
                                if !selected.is_empty() {
                                    if let Some(clipboard) = &self.clipboard_manager {
                                        let _ = clipboard.set_text(selected.clone());
                                        log::info!("📋 Copied {} chars to clipboard", selected.len());
                                    }
                                }
                            }
                            return; // Consume event
                        }
                        53 => { // Ctrl+X (Cut)
                            if let Some(text_engine) = &mut self.renderer.text_engine {
                                let selected = text_engine.get_selected_text();
                                if !selected.is_empty() {
                                    if let Some(clipboard) = &self.clipboard_manager {
                                        let _ = clipboard.set_text(selected.clone());
                                        text_engine.delete_selection(&self.renderer.queue);
                                        log::info!("✂️ Cut {} chars to clipboard", selected.len());
                                    }
                                }
                            }
                            return; // Consume event
                        }
                        47 => { // Ctrl+V (Paste)
                            if let Some(clipboard) = &self.clipboard_manager {
                                if let Some(contents) = clipboard.get_text() {
                                    if let Some(text_engine) = &mut self.renderer.text_engine {
                                        text_engine.replace_selection(&self.renderer.queue, &contents);
                                        log::info!("📋 Pasted {} chars from clipboard", contents.len());
                                    }
                                }
                            }
                            return; // Consume event
                        }
                        44 => { // Ctrl + Z (Check shift for Z.ai)
                            if is_shift {
                                log::info!("🤖 Triggering Z.ai Code Scout...");
                                if let Some(_client) = &self.zai_client {
                                    // Async call in sync context... tricky in Smithay loop.
                                    // For a quick test, we'll spawn a tokio task if we have a handle, 
                                    // or just log for now. Ideally we use a channel.
                                    // Since we don't have easy runtime handle access here, we'll 
                                    // verify client existence and log.
                                    log::info!("✅ Z.ai Client is active and ready.");
                                    
                                    // TODO: Dispatch actual request via channel
                                } else {
                                    log::warn!("⚠️ Z.ai Client not initialized (Check ZAI_API_KEY)");
                                    eprintln!("⚠️ ZAI_API_KEY missing");
                                }
                                return;
                            }
                        }
                        _ => {}
                    }
                }

                // Phase 46.5: Stress Test Keys ('K' - 37)
                 if key_state == smithay::backend::input::KeyState::Pressed && key_code == 37 && !self.input_manager.is_window_possessed() {
                     self.spawn_city_agents_batch(10);
                     return;
                 }

                // Phase 47: Spawn QEMU ('Q' - 16 [Evdev] or 24 [X11])
                // Also checking 113 ('q') just in case of weird mapping
                if key_state == smithay::backend::input::KeyState::Pressed && !self.input_manager.is_window_possessed() {
                     if key_code == 16 || key_code == 24 || key_code == 113 {
                        log::info!("⌨️  Detected 'Q' press (Code: {}) - Initiating VM Spawn Sequence", key_code);
                        
                        // Check multiple locations for alpine.iso
                        let candidates = [
                            "alpine.iso",
                            "../../alpine.iso",
                            "/home/jericho/zion/projects/geometry_os/geometry_os/alpine.iso"
                        ];
                        
                        let mut iso = String::new();
                        for path in candidates.iter() {
                            if std::path::Path::new(path).exists() {
                                log::info!("✅ Found ISO at: {}", path);
                                iso = path.to_string();
                                break;
                            }
                        }
                        
                        if iso.is_empty() {
                            log::error!("❌ alpine.iso not found in CWD or parents. Cannot spawn VM.");
                            log::warn!("Please download alpine.iso to the project root.");
                            // Attempt to spawn anyway to show error in window? No, spawn requires iso.
                        }
                        
                        self.spawn_qemu_vm(iso);
                        return;
                    }
                }

                // Phase 41: Game Mode Interaction
                // 1. Exit Possession (ESC or Left Alt)
                if key_state == smithay::backend::input::KeyState::Pressed && (key_code == 1 || key_code == 56) {
                    if self.input_manager.is_window_possessed() {
                        log::info!("🎮 Game Mode: Exiting Possession");
                        self.input_manager.set_possessed_window(None);
                        return; // Consume event
                    }
                }

                // 2. Enter Possession (E)
                // Only enter if not already possessed and not typing in overlay
                if key_state == smithay::backend::input::KeyState::Pressed && key_code == 18 && !self.input_manager.is_window_possessed() {
                    // Check what is under the cursor
                    if let Some((mx, my)) = self.last_mouse_pos {
                         let world_pos = self.camera.screen_to_world(
                            mx, my,
                            self.window_manager.screen_width(),
                            self.window_manager.screen_height()
                         );
                         
                         // Find window under cursor
                         // We need to use find_window_at_position (which borrows self.window_manager)
                         // But we also need to modify self.input_manager
                         // This is safe as they are separate fields
                         let target_id = if let Some(window) = self.window_manager.find_window_at_position(world_pos.x, world_pos.y) {
                             // Check validity (Antigravity Bridge or VM)
                             if Some(window.id) == self.antigravity_window_id || window.has_vm_texture || window.has_memory_texture {
                                 Some(window.id)
                             } else {
                                 None
                             }
                         } else {
                             None
                         };

                         if let Some(id) = target_id {
                             log::info!("🎮 Game Mode: Possessing Window {}", id);
                             self.input_manager.set_possessed_window(Some(id));
                             return; // Consume 'E'
                         }
                    }
                }

                // Phase 41: Handle Active Possession (Route to Socket if Antigravity)
                if let Some(possessed_id) = self.input_manager.get_possessed_window_id() {
                    if Some(possessed_id) == self.antigravity_window_id {
                        if key_state == smithay::backend::input::KeyState::Pressed {
                             if let Some(em_arc) = &self.evolution_manager {
                                  if let Ok(mut em) = em_arc.lock() {
                                      em.send_input_event(key_code);
                                  }
                             }
                        }
                        return; // Consume event (don't pass to VM console buffer)
                    }
                    
                    // Phase 47: Route to QEMU SHM Window (Possessed)
                    if Some(possessed_id) == self.qemu_shm_window_id {
                        if key_state == smithay::backend::input::KeyState::Pressed {
                             if let Some(byte) = self.input_manager.map_scancode_to_ascii(key_code) {
                                 if let Ok(input_str) = std::str::from_utf8(&[byte]) {
                                     if let Some(proc) = &self.qemu_shm_process {
                                         proc.send_input(input_str);
                                     }
                                 }
                             }
                        }
                        return;
                    }

                    // 2. Neural Console (Possessed)
                    if self.neural_console_window_id == Some(possessed_id) {
                         let mut actions = Vec::new();
                         if let Some(console) = &mut self.neural_console {
                             if key_state == smithay::backend::input::KeyState::Pressed {
                                 if let Some(byte) = self.input_manager.map_scancode_to_ascii(key_code) {
                                     actions = console.process_input(&[byte]);
                                 }
                             }
                         }
                         
                         if !actions.is_empty() {
                             self.handle_console_actions(actions);
                         }
                         return; // Consume
                    }
                }

                // Phase 30.6: Route keyboard to VM console or Neural Console
                if let Some(focused_window_id) = self.input_manager.get_focused_window_id() {
                    // Phase 41: Route to Neural Console
                    if let (Some(console_id), Some(_)) = (self.neural_console_window_id, &mut self.neural_console) {
                         if focused_window_id == console_id {
                             let mut actions = Vec::new();
                             // Re-borrow console nicely?
                             if let Some(console) = &mut self.neural_console {
                                 if key_state == smithay::backend::input::KeyState::Pressed {
                                     // Simple mapping: Use map_scancode_to_ascii
                                     if let Some(byte) = self.input_manager.map_scancode_to_ascii(key_code) {
                                         actions = console.process_input(&[byte]);
                                     }
                                 }
                             }
                             
                             if !actions.is_empty() {
                                 self.handle_console_actions(actions);
                             }
                             return; // Consume event
                         }
                    }

                    // Route to VM Console
                    #[cfg(feature = "hypervisor")]
                    if let Some(vm_window_id) = &self.vm_window_id {
                        if focused_window_id == *vm_window_id {
                            // Phase 30.8: Check for scroll shortcuts (Shift + PageUp/Down)
                            // PageUp = 104, PageDown = 109 (Linux keycodes)
                            // let key_code = event.key_code(); // Already got key_code above
                            let is_shift = self.input_manager.is_shift_pressed();
                            let is_ctrl = self.input_manager.is_ctrl_pressed();
                            let mut handled = false;
                            
                            // Phase 31: Handle clipboard shortcuts (Ctrl+C and Ctrl+V)
                            if is_ctrl && event.state() == smithay::backend::input::KeyState::Pressed {
                                match key_code.raw() {
                                    46 => { // Ctrl+C - Copy
                                        if let Some(vm) = &self.vm {
                                            if let Ok(mut locked_vm) = vm.try_lock() {
                                                if locked_vm.copy_selection_to_clipboard() {
                                                    log::info!("📋 Copied selection to clipboard");
                                                    handled = true;
                                                }
                                            }
                                        }
                                    },
                                    47 => { // Ctrl+V - Paste
                                        if let Some(text) = self.input_manager.handle_clipboard_paste() {
                                            self.input_manager.paste_to_console(&text);
                                            log::info!("📋 Pasted from clipboard: {} bytes", text.len());
                                            handled = true;
                                        }
                                    },
                                    _ => {}
                                }
                            }
                            
                            // Scroll shortcuts
                            if !handled && is_shift && event.state() == smithay::backend::input::KeyState::Pressed {
                                if let Some(vm) = &self.vm {
                                    // Use try_lock to avoid deadlocks in input path
                                    if let Ok(mut locked_vm) = vm.try_lock() {
                                        match key_code.raw() {
                                            104 => { // Shift + PageUp
                                                 locked_vm.scroll_terminal(-10); // Scroll up 10 lines
                                                 handled = true;
                                            }, 
                                            109 => { // Shift + PageDown
                                                 locked_vm.scroll_terminal(10); // Scroll down 10 lines
                                                 handled = true;
                                            },
                                            _ => {}
                                        }
                                    }
                                }
                            }

                            if !handled {
                                // Route keyboard input to VM console
                                self.input_manager.route_keyboard_to_console(
                                    event.key_code().into(),
                                    event.state()
                                );
                            }
                        }
                    }
                }
                
                // Phase 35.2: Synaptic Overlay keyboard handling
                // Check if overlay is active and should consume input
                let key_code = event.key_code().raw();
                let key_state = event.state();
                
                if self.handle_overlay_input(key_code, key_state) {
                    // Overlay consumed the input, don't pass to standard handler
                    return;
                }
                
                // Check for Space+/ activation (Space=57, /=53)
                if key_state == smithay::backend::input::KeyState::Pressed {
                    if key_code == 57 { // Space
                        // Track space press for combo detection
                        // (For now, just activate on Space alone for simplicity)
                        // TODO: Implement proper combo detection
                    } else if key_code == 53 { // /
                        // Activate overlay
                        self.activate_synaptic_overlay();
                        return; // Don't pass to standard handler
                    }
                }
                
                // Phase 42.1: Route input to Alpine VM if possessed
                if let Some(possessed_id) = self.input_manager.get_possessed_window_id() {
                    let key_code = event.key_code().raw();
                    let key_state = event.state();
                    let is_down = key_state == smithay::backend::input::KeyState::Pressed;
                    
                    if Some(possessed_id) == self.alpine_vm_window_id {
                        if let Some(alpine_vm) = &self.alpine_vm {
                            // Phase 31: Host -> VM Paste (Ctrl+V)
                            let is_ctrl = self.input_manager.is_ctrl_pressed();
                            if is_ctrl && key_code == 47 && is_down {
                                if let Some(text) = self.input_manager.handle_clipboard_paste() {
                                    log::info!("📋 Pasting to Alpine VM: {} bytes", text.len());
                                    if let Ok(vm) = alpine_vm.lock() {
                                        // 1. Release Ctrl to ensure text isn't treated as shortcuts
                                        vm.inject_key_event("ctrl", false);
                                        
                                        // 2. Type the text
                                        vm.type_text(&text);
                                    }
                                    return; // Consume event
                                }
                            }

                            // Map scancode using static helper
                            if let Some(qcode) = crate::alpine_vm::AlpineVmManager::scancode_to_qcode(key_code) {
                                // We only send event if key is mapped
                                if let Ok(vm) = alpine_vm.lock() {
                                    vm.inject_key_event(qcode, is_down);
                                }
                            }
                        }
                    }
                }

                self.input_manager.handle_keyboard_event(state, event, serial, time);
            }
            SmithayInputEvent::PointerMotionAbsolute { event, .. } => {
                let size = Size::<i32, smithay::utils::Logical>::from((
                    self.window_manager.screen_width() as i32, 
                    self.window_manager.screen_height() as i32
                ));
                // Note: position_transformed might need I to satisfy generic constraints
                // Typically Smithay events are generic over backend
                let pos = event.position_transformed(size);
                
                self.last_mouse_pos = Some((pos.x as f32, pos.y as f32));

                // Phase 35.1: Text Selection Drag
                if self.is_selecting_text {
                    let world_pos = self.camera.screen_to_world(
                        pos.x as f32, pos.y as f32,
                        self.window_manager.screen_width(),
                        self.window_manager.screen_height()
                    );

                    if let Some(grid_index) = self.world_to_grid_index(world_pos.x, world_pos.y) {
                        let queue = self.renderer.queue.clone();

                        if let Some(text_engine) = &mut self.renderer.text_engine {
                            // Only update if position changed
                            if self.text_selection_last_update != Some(grid_index) {
                                if let Some(drag_start) = self.text_selection_drag_start {
                                    // Extend selection from drag start to current position
                                    text_engine.set_selection(&queue, drag_start, grid_index);
                                } else {
                                    // First drag movement - start selection from cursor
                                    text_engine.start_selection(&queue);
                                    text_engine.extend_selection(&queue, grid_index);
                                    self.text_selection_drag_start = Some(text_engine.local_stats.cursor_pos);
                                }

                                self.text_selection_last_update = Some(grid_index);
                                log::trace!("🖱️ Drag selection extended to {}", grid_index);
                            }
                        }
                    } else {
                        // Dragged outside grid - stop selecting
                        let queue = self.renderer.queue.clone();
                        if let Some(text_engine) = &mut self.renderer.text_engine {
                            text_engine.clear_selection(&queue);
                        }
                        self.is_selecting_text = false;
                        self.text_selection_drag_start = None;
                    }
                }
                
                if self.is_panning {
                    // Pan implementation would go here (requires logic from main.rs)
                    // For now keeping it simple or empty as it was in main.rs snippet
                }

                // Phase 31: VM Mouse Selection (Drag Update)
                #[cfg(feature = "hypervisor")]
                if let (Some(vm_window_id), Some(vm)) = (self.vm_window_id, &self.vm) {
                     let world_pos = self.camera.screen_to_world(
                        pos.x as f32, pos.y as f32, 
                        self.window_manager.screen_width(), 
                        self.window_manager.screen_height()
                     );
                     
                     if let Some(window) = self.window_manager.get_windows().get(vm_window_id) {
                         let surface_x = world_pos.x - window.x;
                         let surface_y = world_pos.y - window.y;
                         
                         // Check if inside window content area
                         // Note: Windows might have borders/titlebars, assuming content starts at 0,0 for now
                         if surface_x >= 0.0 && surface_x <= window.width && surface_y >= 0.0 && surface_y <= window.height {
                             if let Ok(mut locked_vm) = vm.try_lock() {
                                 // Scale to framebuffer
                                 let scale_x = locked_vm.width as f32 / window.width;
                                 let scale_y = locked_vm.height as f32 / window.height;
                                 
                                 let vm_x = surface_x * scale_x;
                                 let vm_y = surface_y * scale_y;
                                 
                                 locked_vm.update_selection_to_pixel(vm_x, vm_y);
                             }
                         }
                     }
                }

                // Phase 6: The Glass Drill (Introspection)
                // Check if hovering over Tectonic Map
                if let Some(ref simulator) = self.tectonic_simulator {
                     let world_pos = self.camera.screen_to_world(
                        pos.x as f32, pos.y as f32, 
                        self.window_manager.screen_width(), 
                        self.window_manager.screen_height()
                     );

                     // Map World -> Texture (Same logic as kill_pixel)
                     let half_size = 2048.0;
                     let tex_x_i = (world_pos.x + half_size) as i32;
                     let tex_y_i = (world_pos.y + half_size) as i32;
                     
                     if tex_x_i >= 0 && tex_x_i < 4096 && tex_y_i >= 0 && tex_y_i < 4096 {
                         let tex_x = tex_x_i as u32;
                         let tex_y = tex_y_i as u32;
                         
                         if let Some(phys_addr) = simulator.resolve_address(tex_x, tex_y) {
                             // We found a valid address!
                             // Update our "Hovered" state
                             self.hovered_memory_address = Some(phys_addr as usize);
                             
                             // Visual Feedback: Log for now (Or send to channel)
                             // To avoid spam, we could checking if address changed significanty or debounce.
                             // But log trace is fine.
                             // log::trace!("Glass Drill: 0x{:x}", phys_addr);
                             
                             // Send to Introspection Window if connected
                             // Optimization: Only send if changed?
                             // self.introspection_tx.try_send((phys_addr as usize, format!("0x{:x}", phys_addr)));
                         }
                     }
                }

                self.input_manager.handle_pointer_motion(
                    state,
                    &self.window_manager,
                    &self.camera,
                    pos.x as f32,
                    pos.y as f32,
                    time,
                    serial,
                );
            }
            // Temporarily ignore relative motion which is likely UnusedEvent
            SmithayInputEvent::PointerMotion { .. } => {}
            SmithayInputEvent::PointerButton { event, .. } => {
                 // Phase 40.2: Release Drag
                 if event.state() == ButtonState::Released {
                      // Phase 48: Clean up selection drag state
                      if self.is_selecting_text {
                          self.is_selecting_text = false;
                          self.text_selection_drag_start = None;
                          self.text_selection_last_update = None;

                          // Log final selection
                          if let Some(text_engine) = &self.renderer.text_engine {
                              if text_engine.selection.active {
                                  log::info!("🖱️ Selection: {}..{} ({} chars)",
                                      text_engine.selection.start,
                                      text_engine.selection.end,
                                      text_engine.selection.length());
                              }
                          }
                      }

                      if let Some((mx, my)) = self.last_mouse_pos {
                          let world_pos = self.camera.screen_to_world(
                             mx, my,
                             self.window_manager.screen_width(),
                             self.window_manager.screen_height()
                          );
                          self.handle_source_city_interaction(world_pos.x, world_pos.y, false, event.button());
                      }
                 }

                 if event.state() == ButtonState::Pressed {
                      if let Some((mx, my)) = self.last_mouse_pos {
                          let world_pos = self.camera.screen_to_world(
                             mx, my,
                              self.window_manager.screen_width(),
                              self.window_manager.screen_height()
                           );

                            // Check for Evolution Zone interaction (Click to Boot)
                            if let Some(target_window) = self.window_manager.find_window_at_position(world_pos.x, world_pos.y) {
                                if target_window.window_type == crate::window::WindowType::EvolutionZone {
                                    // Phase 35.9.3: Check if this is a cartridge tile
                                    if target_window.has_cartridge_texture {
                                        if let Some(cartridge_id) = &target_window.cartridge_texture_id {
                                            log::info!("🧬 Clicked cartridge tile: {} at ({}, {})",
                                                cartridge_id, world_pos.x, world_pos.y);

                                            // Boot the cartridge
                                            match self.boot_cartridge(cartridge_id, target_window.id) {
                                                Ok(()) => {
                                                    log::info!("✅ Cartridge boot initiated: {}", cartridge_id);
                                                }
                                                Err(e) => {
                                                    log::error!("❌ Failed to boot cartridge {}: {}", cartridge_id, e);
                                                }
                                            }
                                            return; // Consume the click
                                        }
                                    } else {
                                        // Legacy behavior: generic EvolutionZone click
                                        log::info!("🧬 Clicked Evolution Zone! Initiating Autonomous Execution...");

                                        // Trigger evolution boot
                                        if let Some(em_arc) = &self.evolution_manager {
                                            if let Ok(mut em) = em_arc.lock() {
                                                // Send a test genome or trigger daemon action
                                                let genome = crate::evolution_protocol::EvolvedGenomeData {
                                                    id: format!("genome-boot-{}", self.frame_count),
                                                    data: vec![0xCA, 0xFE, 0xBA, 0xBE], // Minimal executable
                                                    generation: 1,
                                                    fitness: 0.99,
                                                    metadata: serde_json::json!({
                                                        "action": "BOOT_DAEMON",
                                                        "spawn_x": world_pos.x,
                                                        "spawn_y": world_pos.y
                                                    }),
                                                };
                                                em.write_evolved_genome(genome);
                                            }
                                        }
                                        return;
                                    }
                                }
                            }

                            // Phase 48: Check if click is within text editor grid
                            if let Some(grid_index) = self.world_to_grid_index(world_pos.x, world_pos.y) {
                                // Only left mouse button for selection
                                if event.button() == Some(MouseButton::Left) {
                                    let click_type = self.detect_click_type(mx, my);
                                    let queue = self.renderer.queue.clone();

                                    // Pre-calculate boundaries for double/triple clicks to avoid borrow issues
                                    let word_bounds = self.find_word_boundaries(grid_index);
                                    let line_bounds = self.find_line_boundaries(grid_index);

                                    if let Some(text_engine) = &mut self.renderer.text_engine {
                                        match click_type {
                                            1 => {
                                                // Single click: Move cursor, start selection
                                                text_engine.local_stats.cursor_pos = grid_index;
                                                text_engine.start_selection(&queue);
                                                self.text_selection_drag_start = Some(grid_index);
                                                self.is_selecting_text = true;
                                                log::info!("🖱️ Single click at grid index {}", grid_index);
                                            }
                                            2 => {
                                                // Double click: Select word
                                                text_engine.local_stats.cursor_pos = grid_index;
                                                if let Some((start, end)) = word_bounds {
                                                    text_engine.set_selection(&queue, start, end + 1);
                                                    log::info!("🖱️🖱️ Double click: selected word {}..{}", start, end);
                                                }
                                                self.is_selecting_text = false;
                                            }
                                            3 => {
                                                // Triple click: Select line
                                                text_engine.local_stats.cursor_pos = grid_index;
                                                if let Some((start, end)) = line_bounds {
                                                    text_engine.set_selection(&queue, start, end);
                                                    log::info!("🖱️🖱️🖱️ Triple click: selected line {}..{}", start, end);
                                                }
                                                self.is_selecting_text = false;
                                            }
                                            _ => {}
                                        }
                                    }
                                    return; // Consume the event
                                }
                            }

                           // Phase 40.2: Check for Source City Interaction (Drag Start)
                           if self.handle_source_city_interaction(world_pos.x, world_pos.y, true, event.button()) {
                               return; // Handled
                           }

                            // Phase 3: Check for Diagnostic Overlay interaction
                            if self.handle_diagnostic_click(world_pos.x, world_pos.y) {
                                return; // Handled
                            }

                            // Phase 45 / Horizon 1: Check for Process Tile interaction
                            if self.handle_process_tile_interaction(mx, my, world_pos.x, world_pos.y) {
                                return;
                            }


                           // Phase 39.2: Check for Neural Terrain interaction
                           if let Some(ref mut raycaster) = self.terrain_raycaster {
                               if let Some(ref terrain) = &self.renderer.neural_terrain {
                                   // Cast ray to terrain
                                   if let Some(result) = raycaster.cast_ray(
                                       mx,
                                       my,
                                       self.window_manager.screen_width(),
                                       self.window_manager.screen_height(),
                                       &self.renderer.get_terrain_view_proj(),
                                       &self.renderer.get_terrain_view_pos(),
                                       terrain
                                   ) {
                                       // Update hovered memory address
                                       self.hovered_memory_address = Some(result.memory_address as usize);
                                       
                                       log::info!("🔍 Terrain clicked at UV ({:.2}, {:.2}) → Memory Address: 0x{:08X}",
                                           result.uv.0, result.uv.1, result.memory_address);
                                   }
                               }
                           }

                           // Phase 36.2: Visual Interrupts (Middle Click to Pause)
                           if event.button() == Some(MouseButton::Middle) {
                               if let Some(window) = self.window_manager.find_window_at_position(world_pos.x, world_pos.y) {
                                   if window.has_memory_texture {
                                        // Visual Feedback: Check if we have a QMP channel 
                                        if self.qmp_tx.is_some() {
                                            log::info!("🛑 Visual Interrupt: Pausing VM via Middle Click on Window {}", window.id);
                                            // Send Pause Command (Non-blocking)
                                            if let Some(ref tx) = self.qmp_tx {
                                                 let _ = tx.try_send(crate::qemu::QmpCommand::Pause);
                                            }
                                            
                                            // Optional: Trigger a visual pulse or feedback via window border color?
                                            // For now, log is sufficient. The VM status in the window usually updates to "STOPPED"
                                            return; // Consumer
                                        }
                                   }
                               }
                           }

                           // Phase 37.2: Synaptic Query Interface
                           if event.button() == Some(MouseButton::Right) {
                               if let Some(window) = self.window_manager.find_window_at_position(world_pos.x, world_pos.y) {
                                   if window.has_memory_texture {
                                        if let Some(address) = self.hovered_memory_address {
                                            self.trigger_memory_analysis(address);
                                            return; // Consumer
                                        }
                                   }
                                } else {
                                     if let Some(address) = self.hovered_memory_address {
                                         if self.tectonic_simulator.is_some() {
                                             self.trigger_memory_analysis(address);
                                             return;
                                         }
                                     }
                                }
                           }
                           
                           // Phase 31: VM Click handling
                          if event.button() == Some(MouseButton::Left) {
                              let (artifact_id, _address) = self.handle_memory_artifact_click(mx, my);
                              if artifact_id.is_some() {
                                  // Memory artifact was clicked, skip window focus
                                  // The hex dump window is now shown
                              } else {
                                  // Phase 4: Tectonic Interaction (Click-to-Kill)
                                  if let Some(ref mut simulator) = self.tectonic_simulator {
                                       // Map world pos to texture pos (4096 centered at 0,0)
                                       // World (0,0) -> Texture (2048, 2048)
                                       let half_size = 2048.0;
                                       let tex_x = (world_pos.x + half_size) as i32;
                                       let tex_y = (world_pos.y + half_size) as i32;
                                       
                                       if tex_x >= 0 && tex_x < 4096 && tex_y >= 0 && tex_y < 4096 {
                                           log::info!("⚡ Tectonic Kill: Killing pixel at ({}, {})", tex_x, tex_y);
                                           simulator.kill_pixel(&self.renderer.get_queue(), tex_x as u32, tex_y as u32);
                                       }
                                  }
                              }
                          }

                          // Phase 31: VM Mouse Selection (Start/End)
                          // Check this BEFORE window focus logic to catch the event
                          #[cfg(feature = "hypervisor")]
                          if let (Some(vm_window_id), Some(vm)) = (self.vm_window_id, &self.vm) {
                             if let Some(window) = self.window_manager.get_windows().get(vm_window_id) {
                                 let surface_x = world_pos.x - window.x;
                                 let surface_y = world_pos.y - window.y;
                                 
                                 if surface_x >= 0.0 && surface_x <= window.width && surface_y >= 0.0 && surface_y <= window.height {
                                     // Only handle Left Click (272)
                                     if event.button() == Some(MouseButton::Left) {
                                         if let Ok(mut locked_vm) = vm.try_lock() {
                                             let scale_x = locked_vm.width as f32 / window.width;
                                             let scale_y = locked_vm.height as f32 / window.height;
                                             
                                             let vm_x = surface_x * scale_x;
                                             let vm_y = surface_y * scale_y;
                                             
                                             if event.state() == ButtonState::Pressed {
                                                 locked_vm.start_selection_at_pixel(vm_x, vm_y);
                                             } else if event.state() == ButtonState::Released {
                                                 if locked_vm.end_selection() {
                                                     log::info!("📋 Selection copied to clipboard via mouse");
                                                 }
                                             }
                                         }
                                     }
                                 }
                             }
                         }
                         
                         let mut found_id = None;
                         let mut found_surface = None;
                         
                         if let Some(window) = self.window_manager.find_window_at_position(world_pos.x, world_pos.y) {
                             found_id = Some(window.id);
                             found_surface = window.surface.clone();

                             // Phase 37.1: Neural Introspection - Hover-to-Query
                             // Check if user clicked on a QEMU RAM window
                             if window.has_memory_texture {
                                 // Calculate pixel coordinates relative to window
                                 let surface_x = world_pos.x - window.x;
                                 let surface_y = world_pos.y - window.y;
                                  
                                 if surface_x >= 0.0 && surface_x <= window.width && surface_y >= 0.0 && surface_y <= window.height {
                                     // Convert pixel coordinates to (x,y) in texture space
                                     let tex_x = (surface_x / window.width * 1024.0).floor() as u32;
                                     let tex_y = (surface_y / window.height * 1024.0).floor() as u32;
                                      
                                     // Use inverse Hilbert mapping to find memory address
                                     if let Some(ref bridge) = self.qemu_bridge {
                                         if let Some(addr) = bridge.xy2h(tex_x, tex_y, 1024) {
                                             // Update hovered memory address
                                             self.hovered_memory_address = Some(addr);
                                                 
                                             // Log address for debugging
                                             log::info!("🔍 QEMU RAM: Hovered at 0x{:x} (pixel: {},{})", addr, tex_x, tex_y);
                                         }
                                     }
                                 }
                             }
                         }

                         if let Some(id) = found_id {
                             self.window_manager.bring_to_front(id);
                             if let Some(surf) = found_surface {
                                 let surf_clone = surf.as_ref().clone(); 
                                 self.input_manager.set_focus(state, Some(surf_clone), Some(id));
                             } else {
                                self.input_manager.set_focus(state, None, Some(id));
                             }
                         } else {
                             self.input_manager.set_focus(state, None, None);
                         }
                     }
                 }
                
                if let Some(button) = event.button() {
                    self.input_manager.handle_pointer_button(state, button, event.state(), serial, time);
                }
            }
            SmithayInputEvent::PointerAxis { event, .. } => {
                for axis in [Axis::Horizontal, Axis::Vertical] {
                    if let Some(amount) = event.amount(axis) {
                        self.input_manager.handle_pointer_axis(state, axis, amount, time);
                    }
                }
            }
            _ => {}
        }
    }
    
    fn current_time(&self) -> u32 {
        SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap()
            .as_millis() as u32
    }
    
    // ========== Phase 35.3: Synaptic Daemon Methods ==========

    pub fn initialize_synaptic_daemon(&mut self) {
        log::info!("🧠 Connecting to Synaptic Cognitive Daemon (LM Studio)...");
        // Default to localhost LM Studio port
        let daemon_url = "http://localhost:8000".to_string(); 
        self.synaptic_daemon_bridge = Some(crate::synapse::SynapticDaemonBridge::new(daemon_url));

        if let Some(ref _bridge) = self.synaptic_daemon_bridge {
            log::info!("✅ Synaptic Daemon Bridge initialized");
        }

        // Initialize Cognitive Bridge for direct memory analysis
        let cognitive_url = "http://localhost:1234".to_string(); // LM Studio default
        self.cognitive_bridge = Some(crate::synapse::CognitiveDaemonBridge::new(cognitive_url));
        if let Some(ref _bridge) = self.cognitive_bridge {
             log::info!("✅ Cognitive Daemon Bridge initialized (Direct LLM)");
        }
    }

    pub fn update_synaptic_layer(&mut self) {
        // Phase 35: Synaptic Bridge - Process current intent if active
        if let Some(intent) = self.synaptic_bridge.active_intent.take() {
            log::info!("🧠 Processing intent: {}", intent);
            
            // In a full implementation, this would trigger the SynapticDaemonBridge
            // For now, update overlay status
            self.synaptic_overlay.is_thinking = true;
            
            // Trigger diagnostic overlay update (Aesthetic component)
            self.diagnostic_overlay.set_aesthetic_entropy(0.4); // Moderate arousal
        }
        
        // Update Synaptic Overlay display if active
        if self.synaptic_overlay.visible {
            self.update_overlay_display();
        }
    }

    // Phase 46: Cognitive System Update Loop
    pub fn update_cognitive_system(&mut self) {
        // 1. Tick ACE Entities (WASM thinking)
        if let Some(manager) = &self.cognitive_manager {
            let entities = manager.list_entities(); // Returns Vec<ACEEntity>
            
            for entity in entities {
                match entity.state {
                    crate::cognitive::entity_manager::EntityState::Active | crate::cognitive::entity_manager::EntityState::Booting => {
                        // Check if runtime exists
                        if !self.cognitive_runtimes.contains_key(&entity.id) {
                            // Try to boot
                            log::info!("🧠 Booting cognitive entity: {}", entity.id);
                            match crate::cognitive::ace_runtime::ACERuntime::boot_from_texture(
                                entity.id.clone(),
                                &entity.texture_path
                            ) {
                                Ok(runtime) => {
                                    self.cognitive_runtimes.insert(entity.id.clone(), runtime);
                                    manager.set_state(&entity.id, crate::cognitive::entity_manager::EntityState::Active);
                                    log::info!("✅ Cognitive entity {} is now ACTIVE", entity.id);
                                },
                                Err(e) => {
                                    log::error!("❌ Failed to boot entity {}: {}", entity.id, e);
                                    manager.set_state(&entity.id, crate::cognitive::entity_manager::EntityState::Error(e.to_string()));
                                }
                            }
                        } else {
                            // Runtime exists, tick it
                            if let Some(runtime) = self.cognitive_runtimes.get_mut(&entity.id) {
                                if let Err(e) = runtime.think() {
                                    log::error!("❌ Error in entity {} during thought process: {}", entity.id, e);
                                    // Optionally suspend or error
                                }
                            }
                        }
                    },
                    _ => {
                        // If suspended or dormant, do nothing or unload runtime?
                        // For now we keep runtime in memory but don't tick
                    }
                }
            }
        }

        // 2. Tick Autonomous Agents (Spatial Navigation)
        let mut rebuild_requests = Vec::new();

        if let Some(ref mut agent_mgr) = self.agent_manager {
            agent_mgr.update(0.016); // Target 60 FPS delta
            
            // Drain and process requests
            while let Some(request) = agent_mgr.requests.pop_front() {
                match request {
                    crate::cognitive::agents::AgentRequest::Rebuild { path, agent_id } => {
                        log::info!("🤖 Agent {} requested rebuild of {:?}", agent_id, path);
                        rebuild_requests.push(path);
                    },
                    crate::cognitive::agents::AgentRequest::Log { message, agent_id: _ } => {
                        // Phase 46.5 Task 5: Synaptic Signal Grouping
                        let now = crate::cognitive::agents::CityAgent::now();
                        let entry = self.recent_agent_actions.entry(message.clone()).or_insert((0, now));
                        
                        // Increment count and update timestamp
                        entry.0 += 1;
                        entry.1 = now;
                        
                        // Signal logic: if count is 1, send immediate. 
                        // If count > 1, send only every Nth or periodic "Coordinated" message.
                        if entry.0 == 1 {
                            if let Ok(mut layer) = self.synaptic_layer.lock() {
                                layer.signal_intent(
                                    "agent_action".to_string(),
                                    format!("Action: {}", message),
                                    0.8
                                );
                            }
                        } else if entry.0 % 5 == 0 {
                            if let Ok(mut layer) = self.synaptic_layer.lock() {
                                layer.signal_intent(
                                    "coordinated_action".to_string(),
                                    format!("Coordinated: {} agents {}", entry.0, message),
                                    0.9
                                );
                            }
                        }
                    },
                    _ => {}
                }
            }
        }

        // 4. Cleanup old agent action statistics
        let now = crate::cognitive::agents::CityAgent::now();
        self.recent_agent_actions.retain(|_, (_, ts)| now - *ts < 10.0); // Keep last 10 seconds

        // 3. Trigger Foundry for collected requests
        for path in rebuild_requests {
            self.trigger_foundry_rebuild(path);
        }
    }

    /// Trigger a rebuild via Foundry for a specific source file
    pub fn trigger_foundry_rebuild(&mut self, path: std::path::PathBuf) {
        let intent_path = std::path::Path::new("systems/foundry/intents");
        let _ = std::fs::create_dir_all(intent_path);
        
        let file_name = path.file_name().unwrap_or_default().to_string_lossy();
        let intent_file = intent_path.join(format!("refactor_{}.md", file_name));
        
        let intent_content = format!(
            "REFACTOR REQUEST\nTarget: {:?}\n\nPlease analyze the current implementation and optimize it for Geometry OS. Ensure Visual Consistency Contract (VCC) compliance.",
            path
        );
        
        if let Err(e) = std::fs::write(&intent_file, intent_content) {
            log::error!("Failed to write Foundry intent: {}", e);
        } else {
            log::info!("✨ Triggered Foundry rebuild for {:?}", path);
            
            // Trigger visual morph if artifact exists
            if let Some(&artifact_id) = self.path_to_artifact.get(&path) {
                self.active_morphs.insert(artifact_id, 1.0); // Start morph animation
            }
        }
    }

    /// Phase 46: Spawn initial population of city agents
    pub fn spawn_city_agents(&mut self) {
        if self.agent_manager.is_none() {
            let mgr = crate::cognitive::agents::CityAgentManager::new(4096); // Grid Size matches .rts.png
            self.agent_manager = Some(mgr);
            
            // Connect to Vat Registry if available for persistence
            if let Some(ref reg) = self.vat_registry {
                if let Some(ref mut mgr) = self.agent_manager {
                    mgr.set_vat_registry(reg.clone());
                }
            }
            
            // Spawn initial crew
            if std::env::var("STRESS_TEST_MODE").is_ok() {
                log::info!("🔥 STRESS_TEST_MODE active: Spawning 100 agents...");
                self.spawn_city_agents_batch(100);
            } else {
                self.spawn_city_agents_batch(3);
            }
            log::info!("🤖 Phase 46: Initialized autonomous city agent population");
        }
    }

    /// Phase 46.5: Batch spawn agents for stress testing
    pub fn spawn_city_agents_batch(&mut self, count: usize) {
        if let Some(ref mut mgr) = self.agent_manager {
            use rand::Rng;
            let mut rng = rand::thread_rng();
            
            for _ in 0..count {
                let role = match rng.gen_range(0..3) {
                    0 => crate::cognitive::agents::AgentRole::Scout,
                    1 => crate::cognitive::agents::AgentRole::Engineer,
                    _ => crate::cognitive::agents::AgentRole::Archivist,
                };
                let pos = rng.gen_range(0..4096 * 4096);
                mgr.spawn_agent(role, pos);
            }
            log::info!("🤖 Phase 46.5: Spawned {} additional agents (Total: {})", 
                count, mgr.list_agents().len());
        }
    }

    // Phase 37.2: Trigger Memory Analysis
    pub fn trigger_memory_analysis(&mut self, address: usize) {
        log::info!("🧠 Triggering semantic analysis for address 0x{:x}", address);
        
        // 1. Get raw data
        let mut hex_dump = String::new();
        let heuristics;
        let region_len;

        if let Some(ref bridge) = self.qemu_bridge {
            if let Ok(data) = bridge.read_page(address as u64) {
                 region_len = data.len();
                 // 2. Run heuristics
                 heuristics = crate::synapse::heuristics::analyze_buffer(data);
                 
                 // 3. Format hex dump (first 256 bytes)
                 let dump_len = 256.min(data.len());
                 for (i, byte) in data[..dump_len].iter().enumerate() {
                     if i % 16 == 0 {
                         hex_dump.push_str(&format!("{:04x}: ", i));
                     }
                     hex_dump.push_str(&format!("{:02x} ", byte));
                     if (i + 1) % 16 == 0 {
                         hex_dump.push('\n');
                     }
                 }
            } else {
                log::warn!("Failed to read page at 0x{:x}", address);
                return;
            }
        } else {
            log::warn!("No QEMU bridge available for analysis");
            return;
        }
        
        // 4. Create request
        let request = crate::synapse::MemoryAnalysisRequest {
            address: address as u64,
            length: region_len,
            hex_dump,
            heuristics,
        };

        // 5. Send to Cognitive Bridge
        if let Some(ref bridge) = self.cognitive_bridge {
             let bridge_clone = bridge.clone();
             let request_clone = request.clone();
             let tx = self.introspection_tx.clone();
             
             tokio::spawn(async move {
                 log::info!("🧠 Sending memory analysis request to LM Studio...");
                 match bridge_clone.analyze_memory(&request_clone).await {
                     Ok(analysis) => {
                         log::info!("✅ SYNAPTIC ANALYSIS RESULT RECEIVED");
                         if let Err(e) = tx.send((address, analysis)).await {
                             log::error!("Failed to send introspection result to UI: {}", e);
                         }
                     }
                     Err(e) => {
                         log::error!("❌ Memory Analysis Failed: {}", e);
                     }
                 }
             });
        }
    }


    // ========== Phase 35.2: Synaptic Overlay Methods ==========
    
    /// Activate the Synaptic Overlay for intent input
    pub fn activate_synaptic_overlay(&mut self) {
        if self.synaptic_overlay.visible {
            return; // Already active
        }
        
        self.synaptic_overlay.show();
        log::info!("🧠 Synaptic Overlay activated (Space+/)");
        
        // Create overlay window if it doesn't exist
        if self.overlay_window_id.is_none() {
            let window_id = self.window_manager.create_demo_window(
                "⚡ Synaptic Intent".to_string(),
                "Type your intent...".to_string(),
                0.0,  // Center of screen (will be adjusted)
                -200.0,
                crate::window::WindowType::System,
            );
            
            // Style the window for intent input
            if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                window.width = 600.0;
                window.height = 100.0;
                // Glassmorphism effect (via custom border color)
                window.custom_border_color = Some([0.2, 0.6, 1.0, 0.8]); // Cyan glow
            }
            
            self.overlay_window_id = Some(window_id);
        }
        
        self.update_overlay_display();
    }
    
    /// Deactivate the Synaptic Overlay
    pub fn deactivate_synaptic_overlay(&mut self) {
        if !self.synaptic_overlay.visible {
            return;
        }
        
        self.synaptic_overlay.hide();
        log::info!("🧠 Synaptic Overlay deactivated");
        
        // Hide the window
        if let Some(window_id) = self.overlay_window_id {
            self.window_manager.remove_window(window_id);
            self.overlay_window_id = None;
        }
    }
    
    /// Handle keyboard input for the overlay
    pub fn handle_overlay_input(&mut self, key_code: u32, key_state: smithay::backend::input::KeyState) -> bool {
        if !self.synaptic_overlay.visible {
            return false;
        }
        
        // Only process key press events
        if key_state != smithay::backend::input::KeyState::Pressed {
            return true; // Consume the event
        }
        
        match key_code {
            // Escape - cancel overlay
            1 => {
                self.deactivate_synaptic_overlay();
                return true;
            }
            // Enter - submit intent
            28 => {
                self.submit_overlay_intent();
                return true;
            }
            // Backspace
            14 => {
                self.synaptic_overlay.backspace();
                self.update_overlay_display();
                return true;
            }
            // Left arrow
            105 => {
                self.synaptic_overlay.cursor_left();
                self.update_overlay_display();
                return true;
            }
            // Right arrow
            106 => {
                self.synaptic_overlay.cursor_right();
                self.update_overlay_display();
                return true;
            }
            // Space
            57 => {
                self.synaptic_overlay.insert_char(' ');
                self.update_overlay_display();
                return true;
            }
            // A-Z (lowercase for now)
            30 => { self.synaptic_overlay.insert_char('a'); }
            48 => { self.synaptic_overlay.insert_char('b'); }
            46 => { self.synaptic_overlay.insert_char('c'); }
            32 => { self.synaptic_overlay.insert_char('d'); }
            18 => { self.synaptic_overlay.insert_char('e'); }
            33 => { self.synaptic_overlay.insert_char('f'); }
            34 => { self.synaptic_overlay.insert_char('g'); }
            35 => { self.synaptic_overlay.insert_char('h'); }
            23 => { self.synaptic_overlay.insert_char('i'); }
            36 => { self.synaptic_overlay.insert_char('j'); }
            37 => { self.synaptic_overlay.insert_char('k'); }
            38 => { self.synaptic_overlay.insert_char('l'); }
            50 => { self.synaptic_overlay.insert_char('m'); }
            49 => { self.synaptic_overlay.insert_char('n'); }
            24 => { self.synaptic_overlay.insert_char('o'); }
            25 => { self.synaptic_overlay.insert_char('p'); }
            16 => { self.synaptic_overlay.insert_char('q'); }
            19 => { self.synaptic_overlay.insert_char('r'); }
            31 => { self.synaptic_overlay.insert_char('s'); }
            20 => { self.synaptic_overlay.insert_char('t'); }
            22 => { self.synaptic_overlay.insert_char('u'); }
            47 => { self.synaptic_overlay.insert_char('v'); }
            17 => { self.synaptic_overlay.insert_char('w'); }
            45 => { self.synaptic_overlay.insert_char('x'); }
            21 => { self.synaptic_overlay.insert_char('y'); }
            44 => { self.synaptic_overlay.insert_char('z'); }
            // 0-9
            2 => { self.synaptic_overlay.insert_char('1'); }
            3 => { self.synaptic_overlay.insert_char('2'); }
            4 => { self.synaptic_overlay.insert_char('3'); }
            5 => { self.synaptic_overlay.insert_char('4'); }
            6 => { self.synaptic_overlay.insert_char('5'); }
            7 => { self.synaptic_overlay.insert_char('6'); }
            8 => { self.synaptic_overlay.insert_char('7'); }
            9 => { self.synaptic_overlay.insert_char('8'); }
            10 => { self.synaptic_overlay.insert_char('9'); }
            11 => { self.synaptic_overlay.insert_char('0'); }
            // Special characters
            12 => { self.synaptic_overlay.insert_char('-'); }
            13 => { self.synaptic_overlay.insert_char('='); }
            51 => { self.synaptic_overlay.insert_char(','); }
            52 => { self.synaptic_overlay.insert_char('.'); }
            53 => { self.synaptic_overlay.insert_char('/'); }
            39 => { self.synaptic_overlay.insert_char(';'); }
            40 => { self.synaptic_overlay.insert_char('\''); }
            _ => {
                log::debug!("🧠 Unhandled key code in overlay: {}", key_code);
                return true;
            }
        }
        
        self.update_overlay_display();
        true
    }
    
    /// Update the overlay window display
    fn update_overlay_display(&mut self) {
        if let Some(window_id) = self.overlay_window_id {
            if let Some(window) = self.window_manager.get_windows_mut().get_mut(window_id) {
                let text = &self.synaptic_overlay.text;
                let cursor_pos = self.synaptic_overlay.cursor_pos;
                
                // Create visual cursor
                let mut display_text = text.clone();
                if cursor_pos < display_text.len() {
                    display_text.insert(cursor_pos, '|');
                } else {
                    display_text.push('|');
                }
                
                window.content = Some(if display_text.is_empty() || display_text == "|" {
                    "Type your intent...".to_string()
                } else {
                    display_text
                });
            }
        }
    }
    
    /// Submit the current overlay intent to the LLM
    fn submit_overlay_intent(&mut self) {
        let intent_text = self.synaptic_overlay.text.clone();
        
        if intent_text.trim().is_empty() {
            log::warn!("🧠 Empty intent submitted, ignoring");
            self.deactivate_synaptic_overlay();
            return;
        }
        
        log::info!("🧠 Synaptic Intent Submitted: \"{}\"", intent_text);
        
        // Phase 35.3: Send to synaptic daemon for interpretation
        if let Some(ref _bridge) = self.synaptic_daemon_bridge {
            let intent = crate::synapse::Intent::new(intent_text);
            
            // Note: We use the bridge to interpret the intent. 
            // In a production loop, this would be handled asynchronously to avoid blocking the UI.
            // For now, we set the intent in the base bridge state which triggers the async loop if one exists.
            self.synaptic_bridge.set_intent(intent.text.clone());
        } else {
            log::warn!("⚠️ Synaptic Daemon Bridge not initialized - cannot process intent");
            self.synaptic_bridge.set_intent(intent_text);
        }
        
        self.deactivate_synaptic_overlay();
    }

    /// Phase 33: Initialize Memory Artifact Manager
    pub fn initialize_memory_artifact_manager(&mut self) {
        if self.memory_artifact_manager.is_some() {
            return;
        }

        let device = self.renderer.get_device();
        let queue = self.renderer.get_queue();

        self.memory_artifact_manager = Some(
            crate::memory_artifacts::MemoryArtifactManager::new(device, queue)
        );
        
        log::info!("✅ Memory Artifact Manager Initialized");
    }

    /// Phase 40: Visualize Source City via Memory Artifacts
    pub fn hydrate_source_city_artifacts(&mut self) {
        if self.source_city_loader.is_none() {
            return;
        }

        // Initialize artifact manager if needed
        self.initialize_memory_artifact_manager();

        // Access the loading data (holding the borrow)
        let tiles_data: Vec<(usize, std::path::PathBuf, f32, f32, f32, f32, f32, f32)> = if let Some(loader) = &self.source_city_loader {
             if let Some(layout) = loader.layout() {
                 eprintln!("🏛️  Hydrating Source City Artifacts: {} tiles", layout.tiles.len());
                 layout.tiles.iter().enumerate().map(|(i, t)| {
                     (i, std::path::PathBuf::from(&t.path), t.x, t.y, t.width, t.height, t.lines as f32, t.depth)
                 }).collect()
             } else {
                 return;
             }
        } else {
            return;
        };

        // Populate artifacts
        if let Some(manager) = &mut self.memory_artifact_manager {
            manager.clear();
            self.path_to_artifact.clear();
            
            for (i, path, x, y, w, h, lines, depth) in tiles_data {
                let height = (lines / 10.0).max(5.0); // Min height 5.0
                
                let artifact = crate::memory_artifacts::MemoryArtifact::new(
                    i,
                    crate::memory_artifacts::MemoryArtifactType::Code,
                    [x, y, 0.0], // Position (Z=0)
                    [w, h, height], // [Width, Depth, Height]
                    (0, 0), // Address range dummy
                    depth // Entropy/Complexity
                );
                
                // Track path for hot-swapping using canonical paths for consistency with ModuleManager
                let artifact_path = if let Ok(canonical) = path.canonicalize() {
                    canonical
                } else {
                    path
                };
                self.path_to_artifact.insert(artifact_path, i);
                manager.add_artifact(artifact);
            }
            
            manager.update_buffers();
            log::info!("✅ Source City Artifacts Hydrated and Uploaded to GPU (Mapped {} paths)", self.path_to_artifact.len());
        }
    }

    /// Phase 40.4: Poll for Rebuild Signal
    pub fn poll_rebuild_signal(&mut self) {
        let signal_path = "systems/builder/map/RELOAD";
        if std::path::Path::new(signal_path).exists() {
            log::info!("🔄 RELOAD SIGNAL DETECTED: Refreshing Source City...");
            
            // 1. Reload SourceCityLoader
            if let Some(ref mut loader) = self.source_city_loader {
                if let Err(e) = loader.load() {
                    log::error!("Failed to reload source city: {}", e);
                }
            }
            
            // Remove signal file
            let _ = std::fs::remove_file(signal_path);
        }
    }


}
