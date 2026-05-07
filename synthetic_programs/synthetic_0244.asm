; Synthetic GeOS Program
; initialization
LDI r17, 462
LDI r0, 654
; main loop
loop_0:
  LDI r3, 16777215
  FILL r3
CIRCLE r5, r16, r22, r16
RECTF r18, r12, r27, r18, r6
PSET r14, r14, r2
  FRAME
  JMP loop_0