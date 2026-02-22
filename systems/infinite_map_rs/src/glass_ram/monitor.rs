use crate::glass_ram::process_attacher::ProcessAttacher;
use crate::glass_ram::fault_poller::{FaultPoller, FaultEvent};
use crate::glass_ram::hilbert_skilling::Hilbert3D;
use tokio::sync::mpsc;
use nix::unistd::Pid;

pub struct GlassRamMonitor {
    attacher: ProcessAttacher,
    poller: Option<FaultPoller>,
    event_rx: mpsc::UnboundedReceiver<FaultEvent>,
    hilbert: Hilbert3D,
}

impl GlassRamMonitor {
    pub fn new(pid: u32) -> Result<Self, Box<dyn std::error::Error>> {
        let attacher = ProcessAttacher::attach(Pid::from_raw(pid as i32))?;
        
        let (event_tx, event_rx) = mpsc::unbounded_channel();
        
        let uffd_clone = attacher.uffd().try_clone()?;
        let poller = FaultPoller::new(uffd_clone, event_tx);
        
        // Initialize Hilbert curve with 10 bits per dimension (1024x1024x1024 grid)
        // This covers 4KB pages for up to 4TB of address space (2^30 * 4KB = 4TB)
        let hilbert = Hilbert3D::new(10);
        
        Ok(Self {
            attacher,
            poller: Some(poller),
            event_rx,
            hilbert,
        })
    }
    
    pub async fn run(&mut self) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        // Spawn fault polling task
        if let Some(mut poller) = self.poller.take() {
            tokio::spawn(async move {
                if let Err(e) = poller.run().await {
                    log::error!("Fault poller error: {}", e);
                }
            });
        }
        
        // Process fault events
        while let Some(event) = self.event_rx.recv().await {
            self.handle_fault_event(event).map_err(|e| {
                // Map generic error to Send+Sync error
                 Box::new(std::io::Error::new(std::io::ErrorKind::Other, e.to_string())) as Box<dyn std::error::Error + Send + Sync>
            })?;
        }
        
        Ok(())
    }
    
    fn handle_fault_event(&mut self, event: FaultEvent) -> Result<(), Box<dyn std::error::Error>> {
        match event {
            FaultEvent::PageFault { address, flags, thread_id } => {
                // Calculate Hilbert coordinates
                // Assume 4KB pages
                let page_idx = address >> 12;
                let (x, y, z) = self.hilbert.d_to_xyz(page_idx);
                
                log::debug!("Page fault at 0x{:x} -> Hilbert({}, {}, {}) [Thread: {:?}]", 
                    address, x, y, z, thread_id);
                
                // TODO: Update fault telemetry
                // TODO: Send to visualization
            }
            FaultEvent::Fork { parent_pid, child_pid } => {
                log::info!("Fork: {} -> {}", parent_pid, child_pid);
            }
            FaultEvent::Remap { old_address, new_address, length } => {
                log::debug!("Remap: 0x{:x} -> 0x{:x} (len: {})", 
                    old_address, new_address, length);
            }
            FaultEvent::Remove { address, length } => {
                log::debug!("Remove: 0x{:x} (len: {})", address, length);
            }
            FaultEvent::Unmap { address, length } => {
                 log::debug!("Unmap: 0x{:x} (len: {})", address, length);
            }
            FaultEvent::Unknown(e) => {
                 log::warn!("Unknown UFFD event: {}", e);
            }
        }
        Ok(())
    }
}
