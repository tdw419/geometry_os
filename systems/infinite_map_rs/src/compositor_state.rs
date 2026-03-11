use smithay::backend::renderer::utils::on_commit_buffer_handler;
use smithay::{
    wayland::{
        compositor::{CompositorHandler, CompositorState},
        shell::xdg::{XdgShellHandler, XdgShellState, ToplevelSurface, PopupSurface, PositionerState},
        shm::{ShmHandler, ShmState},
        buffer::BufferHandler,
        output::{OutputHandler, OutputManagerState},
    },
    reexports::wayland_server::{
        protocol::{wl_surface::WlSurface, wl_seat::WlSeat, wl_buffer::WlBuffer},
        Client, DisplayHandle,
    },
    input::{SeatHandler, SeatState},
    utils::{Serial},
    delegate_compositor,
    delegate_seat,
    delegate_xdg_shell,
    delegate_output,
    delegate_shm,
    xwayland::{XWayland, XWaylandEvent},
    reexports::calloop::{LoopHandle, Interest, Mode, PostAction},
};

use smithay::backend::input::InputEvent;
use smithay::backend::libinput::LibinputInputBackend;

// use crate::backend::drm::DrmBackend;

pub struct GeometryClientData {
    pub compositor_state: smithay::wayland::compositor::CompositorClientState,
}
impl smithay::reexports::wayland_server::backend::ClientData for GeometryClientData {}

pub struct GeometryCompositorState {
pub display_handle: DisplayHandle,

pub compositor_state: CompositorState,
pub seat_state: SeatState<GeometryCompositorState>,
pub xdg_shell_state: XdgShellState,
#[allow(dead_code)]
pub output_state: OutputManagerState,
pub shm_state: ShmState,

#[allow(dead_code)]
pub surfaces: Vec<WlSurface>,
#[allow(dead_code)]
pub focused_surface: Option<WlSurface>,

/// List of surfaces that committed a new buffer this frame
pub pending_commits: Vec<WlSurface>,

/// Serial counter for Wayland events
pub next_serial: u32,

/// Primary DRM GPU device (for Phase 7 DRM backend)
#[allow(dead_code)]
pub primary_gpu: Option<smithay::backend::drm::DrmNode>,

/// List of DRM devices (for Phase 7 DRM backend)
#[allow(dead_code)]
pub drm_devices: Vec<std::path::PathBuf>,

/// DRM backend reference (for input event handling)
/// This is stored as a raw pointer to avoid circular ownership issues
/// The backend is owned by main() and lives for the duration of the program
// pub drm_backend: Option<*mut DrmBackend>,

/// Queue of input events from Libinput backend
pub input_events: Vec<InputEvent<LibinputInputBackend>>,
pub xwayland: Option<XWayland>,
}

impl GeometryCompositorState {
pub fn new(display_handle: DisplayHandle) -> Self {
    let dh = display_handle.clone();
    
    let compositor_state = CompositorState::new::<GeometryCompositorState>(&dh);
    let seat_state = SeatState::new();
    let xdg_shell_state = XdgShellState::new::<GeometryCompositorState>(&dh);
    let output_state = OutputManagerState::new_with_xdg_output::<GeometryCompositorState>(&dh);
    let shm_state = ShmState::new::<GeometryCompositorState>(&dh, vec![]);
    
    GeometryCompositorState {
        display_handle,
        compositor_state,
        seat_state,
        xdg_shell_state,
        output_state,
        shm_state,
        surfaces: Vec::new(),
        focused_surface: None,
        pending_commits: Vec::new(),
        next_serial: 0,
        primary_gpu: None,
        drm_devices: Vec::new(),
        // drm_backend: None,
        input_events: Vec::new(),
        xwayland: None,
    }
}

pub fn init_xwayland(&mut self, loop_handle: &LoopHandle<'static, GeometryCompositorState>) {
    use std::process::Stdio;
    
    // Spawn XWayland with Smithay 0.7.0 API
    match smithay::xwayland::XWayland::spawn(
        &self.display_handle,
        None,                    // Auto-select display number
        Vec::<(String, String)>::new(), // No extra env vars
        true,                    // Open abstract socket
        Stdio::null(),          // Redirect stdout
        Stdio::null(),          // Redirect stderr  
        |_| {},                 // No user_data initialization
    ) {
        Ok((xwayland, _client)) => {
            eprintln!("✅ XWayland spawned successfully on DISPLAY :{}", xwayland.display_number());
            self.xwayland = Some(xwayland);
        }
        Err(e) => {
            eprintln!("⚠️  Failed to spawn XWayland: {}", e);
            eprintln!("   Ubuntu apps will not be available.");
        }
    }
}
    
    pub fn next_serial(&mut self) -> u32 {
        let serial = self.next_serial;
        self.next_serial = self.next_serial.wrapping_add(1);
        serial
    }
    
    pub fn socket_name(&self) -> String {
        "geometry-0".to_string() 
    }

}

// Delegates
delegate_compositor!(GeometryCompositorState);
delegate_seat!(GeometryCompositorState);
delegate_xdg_shell!(GeometryCompositorState);
delegate_output!(GeometryCompositorState);
delegate_shm!(GeometryCompositorState);




impl CompositorHandler for GeometryCompositorState {
    fn compositor_state(&mut self) -> &mut CompositorState {
        &mut self.compositor_state
    }

    fn client_compositor_state<'a>(&self, client: &'a smithay::reexports::wayland_server::Client) -> &'a smithay::wayland::compositor::CompositorClientState {
        if let Some(data) = client.get_data::<GeometryClientData>() {
            &data.compositor_state
        } else {
            // Safe fallback for clients without custom data (e.g. XWayland internal)
            static FALLBACK_STATE: std::sync::OnceLock<smithay::wayland::compositor::CompositorClientState> = std::sync::OnceLock::new();
            FALLBACK_STATE.get_or_init(smithay::wayland::compositor::CompositorClientState::default)
        }
    }

    fn commit(&mut self, _surface: &WlSurface) {}
}

impl SeatHandler for GeometryCompositorState {
    type KeyboardFocus = WlSurface;
    type PointerFocus = WlSurface;
    type TouchFocus = WlSurface;

    fn seat_state(&mut self) -> &mut SeatState<GeometryCompositorState> {
        &mut self.seat_state
    }
    fn focus_changed(&mut self, _seat: &smithay::input::Seat<Self>, _focused: Option<&WlSurface>) {}
    fn cursor_image(&mut self, _seat: &smithay::input::Seat<Self>, _image: smithay::input::pointer::CursorImageStatus) {}
    
}

impl XdgShellHandler for GeometryCompositorState {
    fn xdg_shell_state(&mut self) -> &mut XdgShellState {
        &mut self.xdg_shell_state
    }
    fn new_toplevel(&mut self, _surface: ToplevelSurface) {}
    fn new_popup(&mut self, _surface: PopupSurface, _positioner: PositionerState) {}
    fn grab(&mut self, _surface: PopupSurface, _seat: WlSeat, _serial: Serial) {}
    
    fn reposition_request(&mut self, _surface: PopupSurface, _positioner: PositionerState, _token: u32) {
    }
}

impl ShmHandler for GeometryCompositorState {
    fn shm_state(&self) -> &ShmState {
        &self.shm_state
    }
}

impl BufferHandler for GeometryCompositorState {
    fn buffer_destroyed(&mut self, _buffer: &WlBuffer) {}
}

impl OutputHandler for GeometryCompositorState {}




