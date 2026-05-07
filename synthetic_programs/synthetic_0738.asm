; Synthetic GeOS Program
; initialization
LDI r20, 122
LDI r2, 173
LDI r29, 668
LDI r25, 129
LDI r1, 14
LDI r25, 93
; main loop
loop_0:
  LDI r24, 16711935
  FILL r24
CIRCLE r9, r12, r22, r19
  CMP r26, r15
  JZ r0, loop_0
  FRAME
  JMP loop_0