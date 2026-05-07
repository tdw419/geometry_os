; Synthetic GeOS Program
; initialization
LDI r26, 97
LDI r28, 978
LDI r2, 724
LDI r25, 612
LDI r16, 674
LDI r26, 702
; main loop
loop_0:
  LDI r27, 255
  FILL r27
LINE r13, r9, r20, r6, r22
CIRCLE r8, r5, r28, r2
PSET r3, r6, r23
  CMP r21, r5
  JZ r0, loop_0
  FRAME
  JMP loop_0