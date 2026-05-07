; Synthetic GeOS Program
; initialization
LDI r18, 26
LDI r28, 895
LDI r24, 372
; main loop
loop_0:
  LDI r10, 16777215
  FILL r10
PSET r30, r0, r29
RECTF r28, r22, r12, r17, r18
LINE r30, r28, r0, r8, r21
  CMP r2, r30
  JZ r0, loop_0
  FRAME
  JMP loop_0