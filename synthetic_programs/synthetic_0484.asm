; Synthetic GeOS Program
; initialization
LDI r17, 393
LDI r19, 998
LDI r12, 829
; main loop
loop_0:
  LDI r28, 8947848
  FILL r28
PSET r28, r27, r8
PSET r0, r17, r30
  FRAME
  JMP loop_0