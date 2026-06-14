.section .text
.global _start

_start:
    # sys_write(1, message, 13)
    li a7, 64       # syscall number for sys_write
    li a0, 1        # file descriptor 1 (stdout)
    la a1, message  # Address of message
    li a2, 13       # length of message
    ecall           # Trap to host!

    # sys_exit(0)
    li a7, 93       # syscall number for sys_exit
    li a0, 0        # exit code 0
    ecall           # Trap to host again!

.section .rodata
message:
    .ascii "Hello, GPU!\n"
