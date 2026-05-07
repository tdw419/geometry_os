; counted animation
; initialization
  LDI r7, 3783
  LDI r3, 3644
  LDI r2, 1555
  LDI r24, 2517
  LDI r1, 0xCC676E
loop_0:
  ADDI r14, r5, 32
  ANDI r13, r12, 10
  ANDI r1, r11, 10
  XOR r7, r4, r15
  LDI r7, 1
  SUB r1, r1, r7
  JNZ r1, loop_0
  HALT
