; Synthetic GeOS Program
; initialization
LDI r21, 130
LDI r22, 604
; arithmetic section
ADD r5, r9, r23
LDI r25, 155
LDI r31, 619
SUB r7, r25, r2
ADD r4, r10, r3
; main loop
loop_0:
  LDI r10, 65280
  FILL r10
PSET r2, r20, r11
  FRAME
  JMP loop_0