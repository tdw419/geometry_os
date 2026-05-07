; counted animation
; initialization
  LDI r3, 1992
  LDI r12, 0xB4BA56
  LDI r2, 189
  LDI r4, 0xC00AB8
  LDI r7, 10
loop_0:
  CMPI r13, r12, 2
  LDI r11, 1
  SUB r7, r7, r11
  JNZ r7, loop_0
  LDI r11, 8
loop_1:
  LDI r8, 171
  LDI r1, 255
  LDI r4, 1115
  LDI r14, 0xCE3911
  CIRCLE r8, r1, r4, r14
  CMPI r2, r11, 202
  SHL r9, r24, r2
  LDI r10, 1
  SUB r11, r11, r10
  JNZ r11, loop_1
  HALT
