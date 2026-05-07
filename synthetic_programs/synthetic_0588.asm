; Synthetic GeOS Program
; initialization
LDI r24, 977
LDI r23, 0x00FFFF
LDI r27, 900
LDI r16, 711
LDI r21, 938
LDI r2, 371
; main loop
loop_0:
  LDI r16, 255
  FILL r16
LINE r24, r31, r9, r1, r7
RECTF r4, r16, r19, r2, r11
CIRCLE r14, r4, r20, r8
  FRAME
  JMP loop_0