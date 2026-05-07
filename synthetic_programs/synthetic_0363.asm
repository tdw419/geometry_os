; Synthetic GeOS Program
; initialization
LDI r9, 464
LDI r6, 62
LDI r1, 279
LDI r1, 574
LDI r23, 421
LDI r8, 0x00FF00
; main loop
loop_0:
  LDI r7, 65280
  FILL r7
LINE r3, r17, r18, r3, r0
PSET r22, r14, r9
  CMP r3, r22
  JZ r0, loop_0
  FRAME
  JMP loop_0