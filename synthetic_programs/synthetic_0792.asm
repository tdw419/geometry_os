; Synthetic GeOS Program
; initialization
LDI r23, 822
LDI r22, 829
; main loop
loop_0:
  LDI r20, 16711935
  FILL r20
RECTF r12, r7, r21, r7, r29
CIRCLE r23, r22, r9, r16
  FRAME
  JMP loop_0