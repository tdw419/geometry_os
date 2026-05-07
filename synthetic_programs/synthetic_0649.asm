; Synthetic GeOS Program
; initialization
LDI r2, 235
LDI r31, 0xFF00FF
; main loop
loop_0:
  LDI r25, 65280
  FILL r25
PSET r0, r16, r16
PSET r21, r1, r3
  FRAME
  JMP loop_0