; counted animation
; initialization
  LDI r20, 16
  LDI r13, 2
  LDI r2, 2
  LDI r11, 0
  LDI r3, 10
  LDI r10, 1429
  LDI r9, 255
  LDI r1, 64
  LDI r10, 31
loop_0:
  SUBI r4, r1, 125
  LDI r4, 0x8B4F91
  FILL r4
  LDI r11, 1
  SUB r10, r10, r11
  JNZ r10, loop_0
  LDI r22, 64
loop_1:
  SHL r7, r12, r24
  LDI r3, 32
  LDI r3, 64
  LDI r12, 1
  LDI r10, 3263
  CIRCLE r3, r3, r12, r10
  MUL r11, r12, r15
  LDI r8, 32
  LDI r7, 1481
  LDI r0, 0xF70CC1
  LDI r6, 8
  CIRCLE r8, r7, r0, r6
  LDI r13, 1
  SUB r22, r22, r13
  JNZ r22, loop_1
  HALT
