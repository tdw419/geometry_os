; Synthetic GeOS Program
; initialization
LDI r0, 253
LDI r31, 17
LDI r31, 295
LDI r20, 815
LDI r2, 1012
; main loop
loop_0:
  LDI r3, 65535
  FILL r3
PSET r15, r21, r10
  FRAME
  JMP loop_0