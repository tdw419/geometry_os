; Synthetic GeOS Program
; initialization
LDI r12, 1019
LDI r1, 0x00FF00
LDI r21, 0xFF00FF
LDI r22, 138
LDI r12, 684
LDI r15, 572
; arithmetic section
LDI r13, 971
LDI r21, 387
LDI r17, 0xFF00FF
SUB r26, r9, r12
ADD r12, r22, r26
SUB r29, r22, r7
; main loop
loop_0:
  LDI r22, 8947848
  FILL r22
LINE r7, r21, r17, r28, r8
  CMP r30, r7
  JZ r0, loop_0
  FRAME
  JMP loop_0