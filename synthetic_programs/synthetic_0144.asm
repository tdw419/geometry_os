; Synthetic GeOS Program
; initialization
LDI r30, 231
LDI r26, 64
LDI r19, 634
LDI r22, 210
LDI r6, 275
LDI r1, 448
; arithmetic section
SUB r2, r0, r22
ADD r13, r1, r23
LDI r8, 41
LDI r20, 117
LDI r11, 0xFF0000
ADD r11, r25, r28
ADD r19, r4, r23
; main loop
loop_0:
  LDI r7, 0
  FILL r7
PSET r23, r31, r2
  FRAME
  JMP loop_0