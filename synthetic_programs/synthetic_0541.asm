; Synthetic GeOS Program
; initialization
LDI r10, 712
LDI r26, 323
LDI r13, 386
; main loop
loop_0:
  LDI r26, 16776960
  FILL r26
PSET r29, r22, r2
  FRAME
  JMP loop_0