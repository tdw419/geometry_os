; Synthetic GeOS Program
; initialization
LDI r7, 850
LDI r21, 0xFF00FF
LDI r24, 98
; main loop
loop_0:
  LDI r24, 16776960
  FILL r24
RECTF r4, r21, r11, r0, r16
LINE r14, r29, r21, r1, r16
CIRCLE r19, r26, r11, r10
  FRAME
  JMP loop_0