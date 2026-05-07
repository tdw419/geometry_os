; Synthetic GeOS Program
; initialization
LDI r19, 69
LDI r0, 331
LDI r25, 989
LDI r30, 395
LDI r0, 561
; main loop
loop_0:
  LDI r20, 0
  FILL r20
RECTF r26, r21, r22, r13, r0
RECTF r28, r14, r30, r2, r8
LINE r27, r1, r3, r4, r25
  CMP r14, r28
  JZ r0, loop_0
  FRAME
  JMP loop_0