; Synthetic GeOS Program
; initialization
LDI r17, 432
LDI r8, 588
LDI r5, 329
LDI r22, 895
LDI r15, 487
LDI r22, 122
; main loop
loop_0:
  LDI r25, 65535
  FILL r25
CIRCLE r13, r2, r18, r20
  CMP r20, r0
  JZ r0, loop_0
  FRAME
  JMP loop_0