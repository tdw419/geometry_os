; Synthetic GeOS Program
; initialization
LDI r18, 578
LDI r15, 0x888888
LDI r20, 277
LDI r6, 411
LDI r22, 378
LDI r18, 81
; main loop
loop_0:
  LDI r20, 255
  FILL r20
RECTF r21, r22, r26, r6, r30
CIRCLE r5, r23, r17, r2
PSET r3, r7, r25
  FRAME
  JMP loop_0