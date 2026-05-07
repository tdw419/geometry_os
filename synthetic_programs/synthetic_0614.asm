; Synthetic GeOS Program
; initialization
LDI r19, 552
LDI r6, 778
LDI r7, 0x000000
LDI r2, 315
; arithmetic section
LDI r1, 985
SUB r19, r28, r12
ADD r31, r16, r13
SUB r25, r7, r7
SUB r21, r28, r6
ADD r11, r17, r1
; main loop
loop_0:
  LDI r12, 65280
  FILL r12
LINE r22, r7, r19, r30, r11
PSET r15, r27, r8
RECTF r10, r1, r2, r12, r6
  FRAME
  JMP loop_0