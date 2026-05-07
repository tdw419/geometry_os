; Synthetic GeOS Program
; initialization
LDI r25, 209
LDI r16, 106
LDI r24, 844
LDI r23, 446
; main loop
loop_0:
  LDI r1, 65535
  FILL r1
CIRCLE r21, r0, r5, r27
PSET r7, r1, r22
LINE r16, r27, r29, r26, r29
  FRAME
  JMP loop_0