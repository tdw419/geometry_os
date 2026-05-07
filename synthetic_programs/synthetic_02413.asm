; counted animation
; initialization
  LDI r1, 400
  LDI r4, 16
  LDI r6, 0x78383C
  LDI r2, 1911
  LDI r5, 716
  LDI r2, 34
loop_0:
  XOR r12, r4, r0
  ANDI r10, r3, 115
  MUL r12, r10, r15
  LDI r11, 1
  SUB r2, r2, r11
  JNZ r2, loop_0
  HALT
