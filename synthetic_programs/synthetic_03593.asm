; counted animation
; initialization
  LDI r2, 0
  LDI r14, 0x34F2A8
  LDI r13, 0x83911E
loop_0:
  ADDI r3, r2, 178
  LDI r5, 669
  LDI r14, 0xEEBC38
  LDI r2, 64
  PSET r5, r14, r2
  LDI r1, 0
  LDI r9, 2653
  LDI r13, 0x9D26F5
  LDI r8, 0x772A90
  CIRCLE r1, r9, r13, r8
  LDI r2, 1
  SUB r13, r13, r2
  JNZ r13, loop_0
  HALT
