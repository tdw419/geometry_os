; counted animation
; initialization
  LDI r9, 0
  LDI r8, 2368
  LDI r11, 393
  LDI r13, 8
loop_0:
  SUBI r12, r11, 2
  SUBI r0, r2, 0x354926
  LDI r11, 128
  FILL r11
  SHR r1, r8, r15
  LDI r12, 1
  SUB r13, r13, r12
  JNZ r13, loop_0
  LDI r6, 0x7EAB1E
loop_1:
  SHL r10, r12, r4
  SUBI r11, r9, 8
  LDI r4, 1
  SUB r6, r6, r4
  JNZ r6, loop_1
  LDI r24, 22
loop_2:
  LDI r13, 32
  LDI r1, 64
  LDI r15, 0x0561FD
  PSETI
  LDI r13, 1
  SUB r24, r24, r13
  JNZ r24, loop_2
  HALT
