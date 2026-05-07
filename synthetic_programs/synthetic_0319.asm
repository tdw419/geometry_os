; Synthetic GeOS Program
; initialization
LDI r24, 156
LDI r31, 444
LDI r8, 0xFFFFFF
LDI r15, 884
LDI r14, 0x00FF00
LDI r25, 396
; arithmetic section
SUB r19, r20, r6
ADD r2, r29, r17
LDI r7, 423
ADD r7, r11, r23
LDI r9, 792
LDI r1, 524
SUB r3, r9, r22
; main loop
loop_0:
  LDI r7, 16776960
  FILL r7
RECTF r8, r21, r22, r2, r20
PSET r12, r8, r30
LINE r12, r6, r14, r6, r30
  FRAME
  JMP loop_0