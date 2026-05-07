; Synthetic GeOS Program
; initialization
LDI r2, 524
LDI r25, 0xFF00FF
LDI r5, 285
LDI r14, 249
LDI r20, 915
LDI r3, 578
; main loop
loop_0:
  LDI r26, 0
  FILL r26
LINE r19, r5, r22, r18, r25
  FRAME
  JMP loop_0