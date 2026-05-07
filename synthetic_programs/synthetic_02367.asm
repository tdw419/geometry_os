; counted animation
; initialization
  LDI r0, 128
  LDI r17, 0
  LDI r9, 10
  LDI r13, 128
  LDI r20, 0x182737
loop_0:
  SUBI r9, r13, 9
  MUL r1, r2, r8
  DIV r3, r0, r11
  ANDI r9, r11, 255
  LDI r3, 1
  SUB r20, r20, r3
  JNZ r20, loop_0
  LDI r8, 2
loop_1:
  SUBI r14, r8, 148
  LDI r1, 1
  SUB r8, r8, r1
  JNZ r8, loop_1
  HALT
