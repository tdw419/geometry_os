; Synthetic GeOS Program
; initialization
LDI r28, 0xFFFF00
LDI r12, 858
LDI r30, 648
LDI r16, 626
LDI r26, 1010
LDI r1, 729
; arithmetic section
LDI r25, 24
ADD r12, r11, r22
LDI r3, 0xFFFFFF
LDI r24, 333
ADD r27, r10, r0
; main loop
loop_0:
  LDI r28, 65280
  FILL r28
CIRCLE r18, r23, r21, r28
PSET r24, r0, r26
LINE r2, r25, r20, r25, r22
  FRAME
  JMP loop_0