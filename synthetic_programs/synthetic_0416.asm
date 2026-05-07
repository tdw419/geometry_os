; Synthetic GeOS Program
; initialization
LDI r8, 433
LDI r8, 217
LDI r4, 749
; main loop
loop_0:
  LDI r12, 65535
  FILL r12
PSET r0, r5, r19
PSET r18, r10, r0
  CMP r10, r18
  JZ r0, loop_0
  FRAME
  JMP loop_0