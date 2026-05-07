; Synthetic GeOS Program
; initialization
LDI r0, 460
LDI r21, 0xFF00FF
LDI r19, 478
LDI r20, 0xFF00FF
; main loop
loop_0:
  LDI r28, 65280
  FILL r28
RECTF r19, r17, r27, r1, r5
CIRCLE r9, r30, r29, r25
LINE r11, r28, r21, r15, r26
  FRAME
  JMP loop_0