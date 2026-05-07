; counted animation
; initialization
  LDI r5, 10
  LDI r8, 0
  LDI r14, 128
loop_0:
  ANDI r12, r16, 1
  SUBI r1, r9, 255
  DIV r5, r11, r13
  LDI r8, 1
  SUB r14, r14, r8
  JNZ r14, loop_0
  HALT
