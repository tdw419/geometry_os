; Synthetic GeOS Program
; initialization
LDI r30, 751
LDI r24, 461
LDI r12, 300
LDI r31, 371
LDI r10, 519
; main loop
loop_0:
  LDI r28, 65280
  FILL r28
LINE r24, r12, r2, r1, r27
  FRAME
  JMP loop_0