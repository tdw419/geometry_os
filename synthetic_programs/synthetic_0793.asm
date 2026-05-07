; Synthetic GeOS Program
; initialization
LDI r2, 466
LDI r20, 442
LDI r26, 104
; main loop
loop_0:
  LDI r3, 16711680
  FILL r3
PSET r8, r10, r13
  FRAME
  JMP loop_0