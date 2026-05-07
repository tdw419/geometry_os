; counted animation
; initialization
  LDI r6, 34
  LDI r11, 0xF6FA7E
  LDI r7, 255
loop_0:
  LDI r4, 0x530B67
  LDI r5, 2586
  LDI r5, 255
  PSETI
  DIV r6, r13, r7
  MUL r2, r11, r6
  MUL r15, r12, r3
  LDI r22, 1
  SUB r7, r7, r22
  JNZ r7, loop_0
  HALT
