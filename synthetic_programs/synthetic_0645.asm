; Synthetic GeOS Program
; initialization
LDI r17, 326
LDI r24, 130
LDI r4, 828
LDI r3, 323
; main loop
loop_0:
  LDI r15, 16776960
  FILL r15
LINE r1, r21, r11, r6, r22
PSET r21, r27, r20
  CMP r29, r11
  JZ r0, loop_0
  FRAME
  JMP loop_0