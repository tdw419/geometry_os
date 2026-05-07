; Synthetic GeOS Program
; initialization
LDI r11, 562
LDI r22, 382
LDI r31, 0x0000FF
LDI r21, 1013
LDI r24, 666
LDI r4, 924
; arithmetic section
SUB r26, r14, r4
ADD r19, r31, r26
SUB r0, r22, r3
LDI r29, 174
SUB r8, r2, r31
; main loop
loop_0:
  LDI r5, 65280
  FILL r5
LINE r21, r26, r6, r0, r12
CIRCLE r3, r4, r11, r7
  FRAME
  JMP loop_0