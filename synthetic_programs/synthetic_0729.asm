; Synthetic GeOS Program
; initialization
LDI r26, 764
LDI r0, 466
LDI r29, 791
LDI r25, 0xFF0000
; main loop
loop_0:
  LDI r0, 16711935
  FILL r0
RECTF r10, r15, r31, r15, r10
PSET r29, r29, r28
PSET r29, r22, r14
  FRAME
  JMP loop_0