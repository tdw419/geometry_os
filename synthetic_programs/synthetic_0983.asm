; Synthetic GeOS Program
; initialization
LDI r8, 427
LDI r7, 866
; main loop
loop_0:
  LDI r12, 0
  FILL r12
LINE r28, r22, r6, r25, r31
RECTF r12, r4, r27, r21, r12
  FRAME
  JMP loop_0