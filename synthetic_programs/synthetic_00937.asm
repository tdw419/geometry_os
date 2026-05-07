; counted animation
; initialization
  LDI r9, 255
  LDI r6, 16
  LDI r3, 3140
  LDI r0, 1142
  LDI r10, 0xDFD9F0
  LDI r1, 3412
  LDI r4, 256
loop_0:
  SHL r2, r0, r7
  LDI r9, 1
  SUB r4, r4, r9
  JNZ r4, loop_0
  LDI r14, 0
loop_1:
  MUL r12, r1, r0
  LDI r12, 3759
  LDI r8, 2225
  LDI r0, 10
  WPIXEL
  SUBI r14, r8, 0
  LDI r11, 1
  SUB r14, r14, r11
  JNZ r14, loop_1
  HALT
