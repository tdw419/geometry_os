; Synthetic GeOS Program
; initialization
LDI r6, 453
LDI r12, 940
; main loop
loop_0:
  LDI r10, 255
  FILL r10
PSET r26, r22, r16
RECTF r13, r10, r29, r7, r31
CIRCLE r21, r29, r14, r27
  CMP r6, r21
  JZ r0, loop_0
  FRAME
  JMP loop_0