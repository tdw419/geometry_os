use smithay::{
    backend::{
        winit::{self, WinitEventLoop, WinitGraphicsBackend},
        renderer::gles::GlesRenderer,
    },
    reexports::calloop::EventLoop,
};
use std::os::unix::io::{AsRawFd, AsFd, BorrowedFd, RawFd};
// use std::path::Path;

struct RawFdWrapper(RawFd);
impl AsFd for RawFdWrapper {
    fn as_fd(&self) -> BorrowedFd<'_> {
        unsafe { BorrowedFd::borrow_raw(self.0) }
    }
}

use crate::compositor_state::GeometryCompositorState;
use smithay::reexports::wayland_server::Display;

pub struct WinitBackend {
    pub backend: WinitGraphicsBackend<GlesRenderer>,
    event_loop: Option<WinitEventLoop>,
}

impl WinitBackend {
    pub fn new() -> Self {
        let (backend, event_loop) = winit::init().expect("Failed to create Winit backend");
        
        WinitBackend {
            backend,
            event_loop: Some(event_loop),
        }
    }
    
    pub fn run<F>(mut self, mut display: Display<GeometryCompositorState>, mut state: GeometryCompositorState, mut callback: F)
    where
        F: FnMut(&mut GeometryCompositorState, &mut WinitGraphicsBackend<GlesRenderer>, winit::WinitEvent) + 'static,
    {
        let mut calloop = EventLoop::<GeometryCompositorState>::try_new().expect("Failed to create calloop");
        let loop_handle = calloop.handle();
        
        let winit_loop = self.event_loop.take().expect("Event loop already consumed");
        let mut backend = self.backend;
        
        // Wayland Socket - try multiple names to avoid conflicts
        let mut socket = None;
        let mut first_error = None;
        
        // Try geometry-0 first
        match smithay::reexports::wayland_server::ListeningSocket::bind("geometry-0") {
            Ok(s) => {
                socket = Some(s);
            }
            Err(e) => {
                first_error = Some(e);
                // Try geometry-1, geometry-2, etc.
                for i in 1..10 {
                    let name = format!("geometry-{}", i);
                    if let Ok(s) = smithay::reexports::wayland_server::ListeningSocket::bind(&name) {
                        eprintln!("Bound to Wayland socket: {}", name);
                        socket = Some(s);
                        break;
                    }
                }
            }
        }
        
        let socket = socket.expect("Failed to bind Wayland socket after trying geometry-0 through geometry-9");
        
        loop_handle.insert_source(
            smithay::reexports::calloop::generic::Generic::new(
                socket, 
                smithay::reexports::calloop::Interest::READ, 
                smithay::reexports::calloop::Mode::Level
            ),
            |_, socket, state: &mut GeometryCompositorState| {
                match socket.accept() {
                    Ok(Some(stream)) => {
                         eprintln!("Wayland Client connected!");
                         state.display_handle.insert_client(stream, std::sync::Arc::new(crate::compositor_state::GeometryClientData {
                             compositor_state: smithay::wayland::compositor::CompositorClientState::default(),
                         })).expect("Failed to insert client");
                    }
                    Ok(None) => {},
                    Err(e) => eprintln!("Socket accept error: {:?}", e),
                }
                Ok(smithay::reexports::calloop::PostAction::Continue)
            }
        ).expect("Failed to insert wayland socket source");

        // Insert Display source to dispatch client events
        // Create wrapper to break lifetime dependency
        let raw_fd = display.backend().poll_fd().as_raw_fd();
        let wrapper = RawFdWrapper(raw_fd);

        let display_source = smithay::reexports::calloop::generic::Generic::new(
             wrapper,
             smithay::reexports::calloop::Interest::READ, 
             smithay::reexports::calloop::Mode::Level
        );

        loop_handle.insert_source(
             display_source,
             move |_, _, state: &mut GeometryCompositorState| {
                 display.dispatch_clients(state).expect("Failed to dispatch clients");
                 Ok(smithay::reexports::calloop::PostAction::Continue)
             }
        ).expect("Failed to insert display source");

        // Insert Winit source
        loop_handle.insert_source(winit_loop, move |event, _, state| {
            callback(state, &mut backend, event);
        }).expect("Failed to insert winit source");
        
        // Initialize XWayland
        state.init_xwayland(&loop_handle);

        // Run the loop
        calloop.run(None, &mut state, |_| {
            // Idle callback, no-op
        }).expect("Error running loop");
    }
}
