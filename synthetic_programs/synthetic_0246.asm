; Synthetic GeOS Program
; initialization
LDI r31, 644
LDI r5, 236
LDI r25, 0xFF00FF
LDI r14, 889
LDI r21, 215
; main loop
loop_0:
  LDI r15, 0
  FILL r15
LINE r15, r18, r19, r18, r22
RECTF r31, r6, r12, r26, r26
LINE r4, r1, r26, r4, r6
  CMP r23, r25
  JZ r0, loop_0
  FRAME
  JMP loop_0