; Synthetic GeOS Program
; initialization
LDI r0, 425
LDI r3, 728
; main loop
loop_0:
  LDI r1, 65280
  FILL r1
PSET r8, r4, r19
  FRAME
  JMP loop_0