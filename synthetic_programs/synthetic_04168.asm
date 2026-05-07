; counted animation
; initialization
  LDI r1, 256
  LDI r12, 10
  LDI r3, 64
  LDI r4, 1112
  LDI r6, 445
  LDI r11, 10
  LDI r15, 26
loop_0:
  CMPI r2, r11, 0
  LDI r0, 1
  SUB r15, r15, r0
  JNZ r15, loop_0
  LDI r8, 5
loop_1:
  LDI r9, 0x50C3B9
  FILL r9
  LDI r11, 0xBC2D9D
  LDI r7, 0x537844
  LDI r12, 0x8A1EE9
  PSET r11, r7, r12
  XOR r1, r8, r15
  SUBI r3, r15, 94
  LDI r21, 1
  SUB r8, r8, r21
  JNZ r8, loop_1
  LDI r11, 42
loop_2:
  LDI r11, 2539
  FILL r11
  CMPI r7, r13, 10
  SUBI r15, r14, 0x2CBD78
  LDI r6, 2060
  LDI r3, 2316
  LDI r12, 913
  LDI r13, 0xAA5DED
  LDI r4, 0xDF6307
  RECTF r6, r3, r12, r13, r4
  LDI r0, 1
  SUB r11, r11, r0
  JNZ r11, loop_2
  HALT
