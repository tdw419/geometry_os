; Synthetic GeOS Program
; initialization
LDI r16, 0x0000FF
LDI r20, 473
LDI r3, 324
LDI r20, 931
LDI r4, 499
; main loop
loop_0:
  LDI r3, 8947848
  FILL r3
PSET r12, r22, r17
LINE r12, r1, r25, r4, r21
  FRAME
  JMP loop_0