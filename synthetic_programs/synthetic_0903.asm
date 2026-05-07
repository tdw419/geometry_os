; Synthetic GeOS Program
; initialization
LDI r4, 595
LDI r27, 119
; main loop
loop_0:
  LDI r2, 16711680
  FILL r2
RECTF r25, r28, r29, r24, r27
RECTF r2, r1, r17, r1, r29
  FRAME
  JMP loop_0