; Synthetic GeOS Program
; initialization
LDI r12, 605
LDI r17, 968
LDI r20, 943
LDI r5, 1018
LDI r5, 701
; main loop
loop_0:
  LDI r30, 0
  FILL r30
PSET r8, r1, r28
  FRAME
  JMP loop_0