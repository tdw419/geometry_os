; counted animation
; initialization
  LDI r8, 1
  LDI r23, 3224
  LDI r3, 2724
  LDI r4, 0
  LDI r6, 0xC2F4C6
  LDI r13, 0x04E2B6
  LDI r14, 8
loop_0:
  SHR r2, r11, r15
  LDI r6, 309
  LDI r15, 256
  LDI r5, 64
  PSETI
  ADDI r15, r9, 0xEFC415
  LDI r10, 1
  SUB r14, r14, r10
  JNZ r14, loop_0
  HALT
