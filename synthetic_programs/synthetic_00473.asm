; mixed program
; initialization
  LDI r13, 3566
  LDI r0, 0xC4DA6A
  SHL r7, r8, r6
  LDI r2, 10
loop_0:
  LDI r4, 10
  LDI r10, 1
  LDI r8, 356
  LDI r1, 16
  LDI r0, 16
  LINE r4, r10, r8, r1, r0
  LDI r6, 1
  SUB r2, r2, r6
  JNZ r2, loop_0
  LDI r6, 0x66C60F
  LDI r5, 4
  LDI r12, 0x88A36A
  LDI r3, 2239
  LDI r3, 3359
  RECTF r6, r5, r12, r3, r3
  HALT
