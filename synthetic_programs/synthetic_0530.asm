; Synthetic GeOS Program
; initialization
LDI r22, 75
LDI r17, 669
LDI r8, 1014
; main loop
loop_0:
  LDI r4, 65280
  FILL r4
LINE r23, r10, r0, r21, r13
CIRCLE r30, r10, r23, r15
  CMP r3, r22
  JZ r0, loop_0
  FRAME
  JMP loop_0