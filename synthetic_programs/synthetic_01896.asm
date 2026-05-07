; counted animation
; initialization
  LDI r1, 1476
  LDI r7, 32
  LDI r3, 4089
  LDI r1, 32
loop_0:
  ANDI r5, r23, 0xAA5157
  ANDI r13, r1, 242
  LDI r15, 255
  LDI r0, 0x110413
  LDI r2, 1
  LDI r10, 2771
  LDI r3, 0xD31DB0
  RECTF r15, r0, r2, r10, r3
  LDI r2, 1
  SUB r1, r1, r2
  JNZ r1, loop_0
  LDI r4, 9
loop_1:
  ADDI r9, r10, 184
  ANDI r2, r12, 256
  LDI r2, 1
  SUB r4, r4, r2
  JNZ r4, loop_1
  HALT
