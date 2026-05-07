; Synthetic GeOS Program
; initialization
LDI r17, 238
LDI r1, 760
LDI r18, 518
LDI r13, 518
LDI r22, 0x000000
LDI r26, 0xFFFF00
; main loop
loop_0:
  LDI r18, 16776960
  FILL r18
PSET r25, r31, r6
CIRCLE r13, r17, r19, r18
LINE r31, r25, r10, r16, r4
  FRAME
  JMP loop_0