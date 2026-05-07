; Synthetic GeOS Program
; initialization
LDI r1, 276
LDI r20, 712
LDI r30, 15
LDI r16, 922
; main loop
loop_0:
  LDI r10, 16711935
  FILL r10
CIRCLE r15, r10, r13, r19
RECTF r18, r15, r18, r2, r12
PSET r10, r3, r25
  CMP r24, r1
  JZ r0, loop_0
  FRAME
  JMP loop_0