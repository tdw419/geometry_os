; Synthetic GeOS Program
; initialization
LDI r7, 725
LDI r16, 265
LDI r24, 0x0000FF
; arithmetic section
SUB r6, r13, r19
LDI r11, 764
SUB r28, r1, r10
LDI r2, 767
ADD r30, r7, r9
LDI r20, 0xFF00FF
ADD r14, r1, r8
ADD r6, r17, r31
; main loop
loop_0:
  LDI r30, 0
  FILL r30
CIRCLE r21, r17, r30, r23
PSET r10, r8, r12
LINE r24, r4, r29, r9, r13
  CMP r14, r28
  JZ r0, loop_0
  FRAME
  JMP loop_0