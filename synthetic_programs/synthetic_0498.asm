; Synthetic GeOS Program
; initialization
LDI r22, 679
LDI r4, 783
LDI r0, 2
LDI r2, 976
LDI r26, 802
; main loop
loop_0:
  LDI r22, 16776960
  FILL r22
LINE r22, r30, r4, r8, r17
PSET r14, r19, r28
  FRAME
  JMP loop_0