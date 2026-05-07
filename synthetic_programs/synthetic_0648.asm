; Synthetic GeOS Program
; initialization
LDI r12, 0xFFFFFF
LDI r26, 262
; main loop
loop_0:
  LDI r7, 0
  FILL r7
CIRCLE r28, r15, r21, r23
PSET r1, r17, r7
  FRAME
  JMP loop_0