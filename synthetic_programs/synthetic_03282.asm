; counted animation
; initialization
  LDI r7, 4
  LDI r4, 3166
  LDI r1, 0xB01480
  LDI r10, 995
  LDI r11, 255
  LDI r5, 1215
  LDI r6, 10
  LDI r10, 33
loop_0:
  LDI r2, 1026
  LDI r13, 32
  LDI r1, 0x8251DF
  LDI r15, 430
  LDI r15, 0x7C14B3
  LINE r2, r13, r1, r15, r15
  LDI r15, 1
  SUB r10, r10, r15
  JNZ r10, loop_0
  LDI r1, 4
loop_1:
  LDI r1, 0x5ABC27
  LDI r2, 2667
  LDI r13, 128
  LDI r1, 1369
  LDI r15, 4
  LINE r1, r2, r13, r1, r15
  LDI r22, 1
  SUB r1, r1, r22
  JNZ r1, loop_1
  HALT
