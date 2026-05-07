; Synthetic GeOS Program
; initialization
LDI r10, 604
LDI r13, 127
LDI r26, 108
LDI r27, 799
; arithmetic section
ADD r13, r19, r22
ADD r13, r28, r28
ADD r17, r17, r21
ADD r0, r28, r6
ADD r0, r11, r12
; main loop
loop_0:
  LDI r18, 0
  FILL r18
LINE r25, r7, r26, r16, r25
CIRCLE r13, r31, r20, r8
PSET r8, r12, r22
  FRAME
  JMP loop_0