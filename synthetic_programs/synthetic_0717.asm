; Synthetic GeOS Program
; initialization
LDI r21, 1012
LDI r12, 123
LDI r31, 763
; main loop
loop_0:
  LDI r30, 0
  FILL r30
PSET r28, r21, r31
  FRAME
  JMP loop_0