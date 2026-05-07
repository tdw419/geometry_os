; counted animation
; initialization
  LDI r2, 1178
  LDI r4, 8
  LDI r3, 0x102892
  LDI r29, 8
  LDI r7, 0x439A3A
  LDI r10, 3873
  LDI r9, 3510
  LDI r5, 614
  LDI r8, 13
loop_0:
  ANDI r7, r15, 52
  SUB r7, r5, r2
  XOR r3, r9, r4
  LDI r0, 1
  SUB r8, r8, r0
  JNZ r8, loop_0
  HALT
