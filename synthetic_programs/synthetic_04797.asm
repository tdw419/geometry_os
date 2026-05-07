; counted animation
; initialization
  LDI r7, 1791
  LDI r2, 3596
  LDI r14, 64
  LDI r19, 32
  LDI r12, 0x0DDB63
  LDI r31, 1506
  LDI r13, 1038
  LDI r12, 0x2491A9
loop_0:
  CMPI r4, r9, 2
  SHR r7, r4, r15
  LDI r15, 1
  SUB r12, r12, r15
  JNZ r12, loop_0
  LDI r6, 1
loop_1:
  LDI r0, 292
  LDI r7, 128
  LDI r4, 1588
  LDI r11, 1594
  LDI r3, 2160
  LINE r0, r7, r4, r11, r3
  LDI r14, 1436
  LDI r3, 2739
  LDI r6, 1984
  PSET r14, r3, r6
  ANDI r1, r14, 202
  LDI r9, 1
  SUB r6, r6, r9
  JNZ r6, loop_1
  HALT
