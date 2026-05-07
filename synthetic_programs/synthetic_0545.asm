; Synthetic GeOS Program
; initialization
LDI r30, 716
LDI r6, 904
; main loop
loop_0:
  LDI r6, 255
  FILL r6
RECTF r3, r10, r21, r0, r4
PSET r30, r19, r13
RECTF r17, r28, r19, r9, r10
  CMP r31, r6
  JZ r0, loop_0
  FRAME
  JMP loop_0