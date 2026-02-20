use std::os::unix::io::RawFd;
use std::ffi::CString;
use std::io;
use libc::{forkpty, winsize, ioctl, TIOCSWINSZ, execvp, read, write, close, fcntl, F_GETFL, F_SETFL, O_NONBLOCK};

/// PTY Engine: Native pseudo-terminal support for Geometry OS
pub struct PtyEngine {
    fd: RawFd,
    child_pid: i32,
}

impl PtyEngine {
    /// Create a new PTY and spawn a shell
    pub fn new(rows: u16, cols: u16, shell: &str) -> io::Result<Self> {
        let ws = winsize {
            ws_row: rows,
            ws_col: cols,
            ws_xpixel: 0,
            ws_ypixel: 0,
        };

        let mut master: RawFd = -1;
        
        unsafe {
            let pid = forkpty(&mut master, std::ptr::null_mut(), std::ptr::null_mut(), &ws);
            
            if pid < 0 {
                return Err(io::Error::last_os_error());
            } else if pid == 0 {
                // Child process
                let shell_cstring = CString::new(shell).unwrap();
                let shell_ptr = shell_cstring.as_ptr();
                let args = [shell_ptr, std::ptr::null()];
                
                execvp(shell_ptr, args.as_ptr());
                libc::_exit(1);
            } else {
                // Parent process
                let fd = master;
                
                // Set non-blocking
                let flags = fcntl(fd, F_GETFL);
                if flags == -1 {
                    return Err(io::Error::last_os_error());
                }
                if fcntl(fd, F_SETFL, flags | O_NONBLOCK) == -1 {
                    return Err(io::Error::last_os_error());
                }

                Ok(Self { fd, child_pid: pid })
            }
        }
    }

    /// Read data from the PTY
    pub fn read(&self, buf: &mut [u8]) -> io::Result<usize> {
        let n = unsafe {
            read(self.fd, buf.as_mut_ptr() as *mut libc::c_void, buf.len())
        };

        if n < 0 {
            let err = io::Error::last_os_error();
            if err.kind() == io::ErrorKind::WouldBlock {
                Err(io::Error::new(io::ErrorKind::WouldBlock, err))
            } else {
                Err(err)
            }
        } else {
            Ok(n as usize)
        }
    }

    /// Write data to the PTY
    pub fn write(&self, buf: &[u8]) -> io::Result<usize> {
        let n = unsafe {
            write(self.fd, buf.as_ptr() as *const libc::c_void, buf.len())
        };

        if n < 0 {
            Err(io::Error::last_os_error())
        } else {
            Ok(n as usize)
        }
    }

    /// Resize the PTY
    pub fn resize(&self, rows: u16, cols: u16) -> io::Result<()> {
        let ws = winsize {
            ws_row: rows,
            ws_col: cols,
            ws_xpixel: 0,
            ws_ypixel: 0,
        };

        unsafe {
            if ioctl(self.fd, TIOCSWINSZ as _, &ws) == -1 {
                return Err(io::Error::last_os_error());
            }
        }
        Ok(())
    }

    /// Get the master file descriptor
    pub fn fd(&self) -> RawFd {
        self.fd
    }

    /// Get the child process ID
    pub fn child_pid(&self) -> i32 {
        self.child_pid
    }
}

impl Drop for PtyEngine {
    fn drop(&mut self) {
        unsafe {
            close(self.fd);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::time::{Duration, Instant};
    use std::thread;

    #[test]
    fn test_pty_creation_and_basic_io() {
        let pty = PtyEngine::new(24, 80, "/bin/sh").expect("Failed to create PTY");
        assert!(pty.fd() > 0);
        assert!(pty.child_pid() > 0);

        let cmd = b"echo hello_geometry\n";
        pty.write(cmd).expect("Failed to write to PTY");

        let mut buffer = [0u8; 1024];
        let start = Instant::now();
        let mut output = Vec::new();

        while start.elapsed() < Duration::from_secs(2) {
            match pty.read(&mut buffer) {
                Ok(n) if n > 0 => {
                    output.extend_from_slice(&buffer[..n]);
                    let output_str = String::from_utf8_lossy(&output);
                    if output_str.contains("hello_geometry") {
                        return;
                    }
                }
                _ => thread::sleep(Duration::from_millis(10)),
            }
        }

        panic!("Failed to receive expected output from PTY. Received: {:?}", String::from_utf8_lossy(&output));
    }

    #[test]
    fn test_pty_resize() {
        let pty = PtyEngine::new(24, 80, "/bin/sh").expect("Failed to create PTY");
        pty.resize(30, 100).expect("Failed to resize PTY");
    }
}
