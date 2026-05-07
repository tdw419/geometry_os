; counted animation
; initialization
  LDI r3, 0x81A8E6
  LDI r10, 143
  LDI r13, 3069
  LDI r12, 10
  LDI r4, 1597
  LDI r14, 0x6EC62B
  LDI r1, 0x0A42E8
  LDI r11, 0
  LDI r14, 37
loop_0:
  SUBI r14, r6, 0x14FEA3
  SUBI r12, r14, 34
  ANDI r12, r5, 0
  LDI r15, 1
  SUB r14, r14, r15
  JNZ r14, loop_0
  HALT
