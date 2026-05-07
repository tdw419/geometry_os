; counted animation
; initialization
  LDI r12, 2
  LDI r9, 0xFC5A7F
  LDI r2, 26
loop_0:
  ANDI r2, r14, 32
  ANDI r5, r8, 0xF0DAD0
  LDI r4, 1
  SUB r2, r2, r4
  JNZ r2, loop_0
  LDI r2, 0xC3BF1F
loop_1:
  ANDI r11, r13, 10
  ANDI r14, r8, 0x6EBD96
  LDI r12, 1926
  LDI r2, 0
  LDI r4, 980
  PSETI
  LDI r1, 1
  SUB r2, r2, r1
  JNZ r2, loop_1
  LDI r8, 10
loop_2:
  LDI r7, 2310
  LDI r1, 255
  LDI r3, 0x4811F1
  LDI r3, 3337
  CIRCLE r7, r1, r3, r3
  CMPI r12, r14, 127
  LDI r11, 1
  SUB r8, r8, r11
  JNZ r8, loop_2
  HALT
