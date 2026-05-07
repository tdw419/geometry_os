; Synthetic GeOS Program
; initialization
LDI r21, 238
LDI r4, 386
LDI r11, 0x0000FF
; main loop
loop_0:
  LDI r23, 255
  FILL r23
PSET r28, r20, r20
RECTF r28, r24, r24, r5, r17
CIRCLE r4, r16, r22, r14
  FRAME
  JMP loop_0