; Synthetic GeOS Program
; initialization
LDI r31, 310
LDI r29, 297
LDI r22, 407
LDI r15, 262
; arithmetic section
LDI r31, 247
SUB r31, r17, r13
LDI r15, 496
; main loop
loop_0:
  LDI r9, 16711935
  FILL r9
LINE r28, r25, r14, r5, r6
CIRCLE r16, r4, r27, r0
  FRAME
  JMP loop_0