; Synthetic GeOS Program
; initialization
LDI r26, 553
LDI r31, 0x0000FF
; arithmetic section
ADD r20, r28, r10
SUB r17, r12, r30
LDI r11, 613
LDI r25, 382
LDI r0, 611
; main loop
loop_0:
  LDI r25, 65280
  FILL r25
PSET r13, r7, r6
PSET r23, r25, r16
CIRCLE r18, r30, r31, r22
  FRAME
  JMP loop_0