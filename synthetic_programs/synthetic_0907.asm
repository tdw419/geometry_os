; Synthetic GeOS Program
; initialization
LDI r25, 754
LDI r3, 0x888888
LDI r12, 245
LDI r18, 0x000000
LDI r23, 12
; main loop
loop_0:
  LDI r2, 65535
  FILL r2
CIRCLE r26, r26, r21, r26
LINE r1, r28, r30, r7, r22
  CMP r21, r12
  JZ r0, loop_0
  FRAME
  JMP loop_0