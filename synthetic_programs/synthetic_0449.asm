; Synthetic GeOS Program
; initialization
LDI r17, 681
LDI r21, 0x0000FF
LDI r26, 541
LDI r10, 467
LDI r30, 436
; arithmetic section
LDI r1, 860
ADD r29, r26, r12
LDI r2, 118
SUB r15, r30, r3
ADD r30, r15, r9
ADD r8, r15, r25
LDI r9, 0x00FF00
LDI r17, 556
; main loop
loop_0:
  LDI r9, 16776960
  FILL r9
CIRCLE r3, r0, r23, r24
LINE r1, r10, r0, r31, r11
PSET r23, r10, r17
  FRAME
  JMP loop_0