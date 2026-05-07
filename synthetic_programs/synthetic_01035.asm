; counted animation
; initialization
  LDI r12, 906
  LDI r9, 3650
  LDI r3, 0x90F1EA
loop_0:
  ANDI r3, r4, 49
  SHL r11, r3, r15
  SUBI r2, r0, 51
  LDI r5, 1
  SUB r3, r3, r5
  JNZ r3, loop_0
  LDI r14, 0
loop_1:
  MUL r11, r3, r14
  LDI r3, 64
  LDI r15, 2575
  LDI r16, 0
  WPIXEL
  LDI r3, 1
  SUB r14, r14, r3
  JNZ r14, loop_1
  HALT
