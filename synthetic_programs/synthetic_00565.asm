; counted animation
; initialization
  LDI r13, 2527
  LDI r1, 256
  LDI r5, 0xA242AC
  LDI r8, 207
  LDI r3, 3534
  LDI r4, 3366
  LDI r9, 2
  LDI r1, 1
loop_0:
  LDI r10, 0x2B8AD7
  LDI r4, 16
  LDI r4, 32
  LDI r12, 2
  LDI r6, 90
  LINE r10, r4, r4, r12, r6
  LDI r8, 1
  SUB r1, r1, r8
  JNZ r1, loop_0
  LDI r27, 0x85953C
loop_1:
  SUBI r3, r6, 0xA1EB48
  LDI r9, 1
  SUB r27, r27, r9
  JNZ r27, loop_1
  LDI r14, 29
loop_2:
  XOR r2, r8, r12
  SUBI r13, r2, 32
  LDI r4, 1
  SUB r14, r14, r4
  JNZ r14, loop_2
  HALT
