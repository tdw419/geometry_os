; Synthetic GeOS Program
; initialization
LDI r2, 176
LDI r19, 0x888888
LDI r1, 536
LDI r4, 778
LDI r2, 418
; main loop
loop_0:
  LDI r12, 16777215
  FILL r12
RECTF r26, r5, r22, r24, r30
  FRAME
  JMP loop_0