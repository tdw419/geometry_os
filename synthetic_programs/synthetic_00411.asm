; input driven program
; initialization
  LDI r2, 0x2FDDA8
  LDI r9, 0x0EE0DC
  LDI r4, 1466
  LDI r12, 16
  LDI r10, 2
main_0:
  LDI r13, 2247
  FILL r13
  ADDI r1, r10, 256
  LDI r1, 0
  LDI r14, 2715
  LDI r12, 0x54AFC2
  PSET r1, r14, r12
  SHL r6, r1, r2
  SHL r15, r4, r6
  SAR r6, r0, r14
  SHL r11, r1, r6
  SHR r12, r8, r3
  SAR r8, r9, r3
  SHR r11, r14, r13
  SHR r7, r0, r1
  SAR r2, r11, r0
  SHLI r4, r1, 4
  SHL r24, r14, r7
  FRAME
  JMP main_0
