; Synthetic GeOS Program
; initialization
LDI r30, 663
LDI r15, 273
LDI r29, 958
LDI r20, 0xFFFF00
LDI r22, 479
; main loop
loop_0:
  LDI r0, 65280
  FILL r0
CIRCLE r20, r26, r27, r2
LINE r20, r20, r3, r14, r1
  FRAME
  JMP loop_0