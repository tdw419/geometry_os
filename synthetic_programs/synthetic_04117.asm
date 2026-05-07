; counted animation
; initialization
  LDI r0, 0xACB8CE
  LDI r11, 1
  LDI r1, 2084
  LDI r7, 4
  LDI r14, 48
loop_0:
  SUBI r11, r7, 219
  LDI r11, 2
  LDI r11, 0x8F826C
  LDI r11, 10
  PSET r11, r11, r11
  XOR r2, r6, r11
  SUBI r11, r4, 4
  LDI r13, 1
  SUB r14, r14, r13
  JNZ r14, loop_0
  LDI r1, 12
loop_1:
  CMPI r6, r14, 0
  AND r7, r14, r6
  SUBI r5, r17, 32
  LDI r13, 1
  SUB r1, r1, r13
  JNZ r1, loop_1
  HALT
