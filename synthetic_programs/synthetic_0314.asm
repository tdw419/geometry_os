; Synthetic GeOS Program
; initialization
LDI r4, 828
LDI r31, 589
LDI r1, 1004
; main loop
loop_0:
  LDI r31, 0
  FILL r31
LINE r19, r16, r27, r20, r25
PSET r20, r19, r8
PSET r0, r12, r2
  CMP r23, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0