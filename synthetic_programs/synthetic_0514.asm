; Synthetic GeOS Program
; initialization
LDI r19, 545
LDI r18, 481
LDI r4, 0xFF0000
LDI r16, 431
LDI r20, 742
LDI r3, 407
; arithmetic section
ADD r31, r29, r24
LDI r24, 221
SUB r19, r0, r20
LDI r5, 483
; main loop
loop_0:
  LDI r14, 16711935
  FILL r14
PSET r11, r8, r5
LINE r19, r6, r3, r5, r23
  CMP r24, r25
  JZ r0, loop_0
  FRAME
  JMP loop_0