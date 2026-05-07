; Synthetic GeOS Program
; initialization
LDI r1, 1006
LDI r24, 0xFFFFFF
LDI r6, 484
LDI r16, 132
LDI r1, 60
; main loop
loop_0:
  LDI r15, 255
  FILL r15
PSET r30, r0, r31
  FRAME
  JMP loop_0