; counted animation
; initialization
  LDI r7, 4
  LDI r0, 8
  LDI r3, 3811
  LDI r15, 2507
  LDI r8, 32
  LDI r14, 517
  LDI r10, 7
  LDI r9, 402
  LDI r13, 0x1F7A84
loop_0:
  CMPI r4, r7, 16
  LDI r14, 1
  SUB r13, r13, r14
  JNZ r13, loop_0
  HALT
