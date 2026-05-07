; Synthetic GeOS Program
; initialization
LDI r5, 855
LDI r30, 930
LDI r10, 0x888888
LDI r1, 321
; arithmetic section
LDI r6, 533
LDI r6, 743
ADD r17, r4, r28
SUB r15, r7, r2
; main loop
loop_0:
  LDI r6, 0
  FILL r6
LINE r7, r12, r10, r17, r26
PSET r9, r25, r31
  CMP r20, r6
  JZ r0, loop_0
  FRAME
  JMP loop_0