; Synthetic GeOS Program
; initialization
LDI r3, 617
LDI r22, 33
LDI r9, 449
; main loop
loop_0:
  LDI r27, 65280
  FILL r27
RECTF r29, r21, r21, r30, r12
PSET r18, r10, r16
  CMP r19, r6
  JZ r0, loop_0
  FRAME
  JMP loop_0