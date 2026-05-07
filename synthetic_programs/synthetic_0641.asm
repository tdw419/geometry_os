; Synthetic GeOS Program
; initialization
LDI r4, 701
LDI r25, 0xFF00FF
LDI r19, 0x0000FF
LDI r15, 807
LDI r10, 0xFFFFFF
; main loop
loop_0:
  LDI r14, 16777215
  FILL r14
PSET r31, r16, r12
LINE r22, r1, r4, r22, r17
  FRAME
  JMP loop_0