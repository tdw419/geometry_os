; Synthetic GeOS Program
; initialization
LDI r13, 0x000000
LDI r9, 994
LDI r10, 292
LDI r30, 671
; main loop
loop_0:
  LDI r0, 65280
  FILL r0
PSET r20, r12, r7
  FRAME
  JMP loop_0