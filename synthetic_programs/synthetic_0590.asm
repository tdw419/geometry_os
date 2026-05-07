; Synthetic GeOS Program
; initialization
LDI r13, 904
LDI r23, 808
LDI r15, 22
; main loop
loop_0:
  LDI r8, 65535
  FILL r8
PSET r25, r12, r28
CIRCLE r4, r10, r19, r8
  FRAME
  JMP loop_0