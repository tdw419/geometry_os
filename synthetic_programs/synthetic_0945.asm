; Synthetic GeOS Program
; initialization
LDI r1, 91
LDI r22, 288
LDI r12, 93
LDI r6, 938
LDI r23, 469
LDI r6, 877
; main loop
loop_0:
  LDI r16, 16711935
  FILL r16
LINE r28, r15, r22, r15, r1
RECTF r12, r29, r30, r6, r9
  CMP r25, r26
  JZ r0, loop_0
  FRAME
  JMP loop_0