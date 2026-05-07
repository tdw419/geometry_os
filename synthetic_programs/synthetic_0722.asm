; Synthetic GeOS Program
; initialization
LDI r10, 0xFFFFFF
LDI r13, 578
; main loop
loop_0:
  LDI r5, 8947848
  FILL r5
PSET r25, r4, r13
LINE r8, r9, r22, r27, r9
  FRAME
  JMP loop_0