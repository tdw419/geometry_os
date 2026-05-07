; Synthetic GeOS Program
; initialization
LDI r23, 682
LDI r21, 750
LDI r19, 0xFF00FF
LDI r14, 693
; main loop
loop_0:
  LDI r10, 65535
  FILL r10
PSET r4, r31, r17
  FRAME
  JMP loop_0