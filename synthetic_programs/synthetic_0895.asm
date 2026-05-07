; Synthetic GeOS Program
; initialization
LDI r11, 644
LDI r26, 0x0000FF
LDI r9, 562
LDI r4, 1012
; main loop
loop_0:
  LDI r21, 8947848
  FILL r21
CIRCLE r3, r15, r0, r26
RECTF r16, r7, r12, r22, r14
LINE r24, r25, r22, r27, r15
  FRAME
  JMP loop_0