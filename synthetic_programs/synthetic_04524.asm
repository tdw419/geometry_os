; counted animation
; initialization
  LDI r14, 10
  LDI r10, 32
  LDI r12, 1
  LDI r11, 0xECD4A5
  LDI r7, 0x219AC5
loop_0:
  DIV r18, r9, r5
  LDI r6, 0xB25704
  LDI r6, 10
  LDI r15, 4
  LDI r2, 0xA5D1E5
  LDI r7, 0
  RECTF r6, r6, r15, r2, r7
  LDI r1, 1
  SUB r7, r7, r1
  JNZ r7, loop_0
  LDI r9, 24
loop_1:
  XOR r12, r9, r15
  LDI r3, 1
  SUB r9, r9, r3
  JNZ r9, loop_1
  HALT
