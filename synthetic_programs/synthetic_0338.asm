; Synthetic GeOS Program
; initialization
LDI r22, 395
LDI r26, 35
LDI r21, 153
LDI r2, 977
LDI r15, 174
LDI r25, 515
; main loop
loop_0:
  LDI r20, 8947848
  FILL r20
PSET r3, r29, r18
CIRCLE r0, r25, r18, r24
PSET r6, r14, r22
  CMP r13, r3
  JZ r0, loop_0
  FRAME
  JMP loop_0