; Synthetic GeOS Program
; initialization
LDI r23, 280
LDI r20, 81
; main loop
loop_0:
  LDI r25, 16711935
  FILL r25
RECTF r3, r2, r23, r19, r16
  FRAME
  JMP loop_0