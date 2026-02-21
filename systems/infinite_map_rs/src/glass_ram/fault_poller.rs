// systems/infinite_map_rs/src/glass_ram/fault_poller.rs
//
// Async event loop for userfaultfd fault handling
// Provides non-blocking fault event polling with tokio integration

use crate::glass_ram::uffd_wrapper::{UserfaultFd, PageFaultEvent};
use std::os::fd::{AsRawFd, FromRawFd};
use tokio::sync::mpsc;

/// Fault events from userfaultfd
#[derive(Debug, Clone)]
pub enum FaultEvent {
    PageFault {
        address: u64,
        flags: u32,
        thread_id: Option<u32>,
    },
    Fork {
        parent_pid: u32,
        child_pid: u32,
    },
    Remap {
        old_address: u64,
        new_address: u64,
        length: u64,
    },
    Remove {
        address: u64,
        length: u64,
    },
    Unmap {
        address: u64,
        length: u64,
    },
    Unknown(u8),
}

/// Async fault event poller
pub struct FaultPoller {
    uffd: UserfaultFd,
    event_tx: mpsc::UnboundedSender<FaultEvent>,
}

impl FaultPoller {
    /// Create a new fault poller
    pub fn new(uffd: UserfaultFd, event_tx: mpsc::UnboundedSender<FaultEvent>) -> Self {
        Self { uffd, event_tx }
    }

    /// Run the async event loop
    /// This method polls for userfaultfd events and sends them via channel
    pub async fn run(&mut self) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        loop {
            // Read event from userfaultfd (blocking call in async context)
            let event_opt = self.read_event_async().await?;

            if let Some(event) = event_opt {
                // Send event to channel
                if let Err(e) = self.event_tx.send(event) {
                    log::error!("Failed to send fault event: {}", e);
                    // Send error via channel closing is not an IO error, but we need to return
                    // map SendError to something generic or just break
                    return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, "Channel closed")));
                }
            }

            // Small delay to prevent busy-waiting
            tokio::time::sleep(tokio::time::Duration::from_millis(1)).await;
        }
    }

    /// Read event from userfaultfd asynchronously
    async fn read_event_async(&mut self) -> Result<Option<FaultEvent>, Box<dyn std::error::Error + Send + Sync>> {
        // Use tokio's task::spawn_blocking for blocking read
        let uffd_fd = self.uffd.as_raw_fd();

        tokio::task::spawn_blocking(move || {
            // SAFETY: We're using the file descriptor in a blocking context
            // This is safe as long as the UserfaultFd remains valid
            // We'll create a temporary File wrapper for reading
            let mut file = unsafe {
                std::fs::File::from_raw_fd(uffd_fd)
            };

            // Read from file descriptor
            use std::io::Read;
            use std::mem;

            let mut buf = [0u8; mem::size_of::<crate::glass_ram::uffd_wrapper::UffdMsg>()];
            match file.read(&mut buf) {
                Ok(n) => {
                    if n != mem::size_of::<crate::glass_ram::uffd_wrapper::UffdMsg>() {
                        // Prevent file from being closed
                        std::mem::forget(file);
                        return Err(Box::<dyn std::error::Error + Send + Sync>::from(std::io::Error::new(
                            std::io::ErrorKind::UnexpectedEof,
                            "Incomplete UFFD message"
                        )));
                    }

                    // Prevent file from being closed
                    std::mem::forget(file);

                    let msg: crate::glass_ram::uffd_wrapper::UffdMsg = unsafe {
                        mem::transmute(buf)
                    };

                    // Parse the message
                    let uffd_event = unsafe {
                        match msg.event {
                            0x12 => { // UFFD_EVENT_PAGEFAULT
                                crate::glass_ram::uffd_wrapper::UffdEventType::PageFault(PageFaultEvent {
                                    address: msg.arg.pagefault.address,
                                    flags: msg.arg.pagefault.flags,
                                    thread_id: Some(msg.arg.pagefault.feat.ptid),
                                })
                            },
                            0x13 => crate::glass_ram::uffd_wrapper::UffdEventType::Fork { ufd: msg.arg.fork.ufd },
                            0x14 => crate::glass_ram::uffd_wrapper::UffdEventType::Remap {
                                old: msg.arg.remap.old,
                                new: msg.arg.remap.new,
                                len: msg.arg.remap.len,
                            },
                            0x15 => crate::glass_ram::uffd_wrapper::UffdEventType::Remove {
                                start: msg.arg.remove.start,
                                end: msg.arg.remove.end,
                            },
                            0x16 => crate::glass_ram::uffd_wrapper::UffdEventType::Unmap {
                                start: msg.arg.remove.start,
                                end: msg.arg.remove.end,
                            },
                            e => crate::glass_ram::uffd_wrapper::UffdEventType::Unknown(e),
                        }
                    };

                    // Convert to FaultEvent
                    let fault_event = match uffd_event {
                        crate::glass_ram::uffd_wrapper::UffdEventType::PageFault(pf) => FaultEvent::PageFault {
                            address: pf.address,
                            flags: pf.flags,
                            thread_id: pf.thread_id,
                        },
                        crate::glass_ram::uffd_wrapper::UffdEventType::Fork { ufd } => FaultEvent::Fork {
                            parent_pid: std::process::id(),
                            child_pid: ufd,
                        },
                        crate::glass_ram::uffd_wrapper::UffdEventType::Remap { old, new, len } => FaultEvent::Remap {
                            old_address: old,
                            new_address: new,
                            length: len,
                        },
                        crate::glass_ram::uffd_wrapper::UffdEventType::Remove { start, end } => FaultEvent::Remove {
                            address: start,
                            length: end - start,
                        },
                        crate::glass_ram::uffd_wrapper::UffdEventType::Unmap { start, end } => FaultEvent::Unmap {
                            address: start,
                            length: end - start,
                        },
                        crate::glass_ram::uffd_wrapper::UffdEventType::Unknown(e) => FaultEvent::Unknown(e),
                    };

                    Ok(Some(fault_event))
                }
                Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => {
                    // Prevent file from being closed
                    std::mem::forget(file);
                    Ok(None)
                }
                Err(e) => {
                    // Prevent file from being closed
                    std::mem::forget(file);
                    Err(Box::<dyn std::error::Error + Send + Sync>::from(e))
                }
            }
        }).await.map_err(|e| Box::<dyn std::error::Error + Send + Sync>::from(e))?
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use tokio::sync::mpsc;

    #[tokio::test]
    async fn test_fault_poller_creation() {
        let (event_tx, mut event_rx) = mpsc::unbounded_channel();
        let uffd = UserfaultFd::new(
            crate::glass_ram::uffd_wrapper::UffdFlags::CLOEXEC |
            crate::glass_ram::uffd_wrapper::UffdFlags::NONBLOCK
        ).expect("Failed to create userfaultfd");

        let poller = FaultPoller::new(uffd, event_tx);
        // assert_eq!(poller.event_tx.capacity(), None); // Unbounded channel does not expose capacity method
    }

    #[test]
    fn test_fault_event_variants() {
        let page_fault = FaultEvent::PageFault {
            address: 0x1000,
            flags: 0x1,
            thread_id: Some(123),
        };
        assert!(matches!(page_fault, FaultEvent::PageFault { .. }));

        let fork = FaultEvent::Fork {
            parent_pid: 1,
            child_pid: 2,
        };
        assert!(matches!(fork, FaultEvent::Fork { .. }));

        let remap = FaultEvent::Remap {
            old_address: 0x1000,
            new_address: 0x2000,
            length: 0x1000,
        };
        assert!(matches!(remap, FaultEvent::Remap { .. }));

        let remove = FaultEvent::Remove {
            address: 0x1000,
            length: 0x1000,
        };
        assert!(matches!(remove, FaultEvent::Remove { .. }));

        let unmap = FaultEvent::Unmap {
            address: 0x1000,
            length: 0x1000,
        };
        assert!(matches!(unmap, FaultEvent::Unmap { .. }));

        let unknown = FaultEvent::Unknown(0xFF);
        assert!(matches!(unknown, FaultEvent::Unknown(_)));
    }
}
