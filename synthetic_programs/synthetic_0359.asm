; Synthetic GeOS Program
; initialization
LDI r7, 736
LDI r10, 144
; main loop
loop_0:
  LDI r24, 65280
  FILL r24
PSET r21, r17, r29
RECTF r0, r27, r10, r28, r30
PSET r4, r12, r22
  FRAME
  JMP loop_0