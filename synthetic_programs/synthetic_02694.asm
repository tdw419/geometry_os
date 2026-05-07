; counted animation
; initialization
  LDI r12, 2900
  LDI r9, 10
  LDI r0, 2325
  LDI r10, 0xFEDA74
  LDI r6, 451
  LDI r11, 0xDB4BE6
  LDI r14, 17
loop_0:
  SHL r6, r9, r7
  SHL r11, r8, r2
  LDI r9, 1
  SUB r14, r14, r9
  JNZ r14, loop_0
  LDI r15, 0x1EF963
loop_1:
  LDI r11, 32
  LDI r8, 0x366E4A
  LDI r4, 128
  LDI r3, 10
  LDI r13, 1021
  LINE r11, r8, r4, r3, r13
  SHL r2, r7, r26
  LDI r2, 1
  SUB r15, r15, r2
  JNZ r15, loop_1
  HALT
