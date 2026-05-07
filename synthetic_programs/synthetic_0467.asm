; Synthetic GeOS Program
; initialization
LDI r25, 744
LDI r1, 882
LDI r10, 0x00FF00
LDI r20, 678
; main loop
loop_0:
  LDI r10, 16776960
  FILL r10
CIRCLE r19, r2, r19, r6
PSET r12, r8, r21
LINE r0, r15, r18, r26, r3
  CMP r16, r22
  JZ r0, loop_0
  FRAME
  JMP loop_0