; Synthetic GeOS Program
; initialization
LDI r4, 289
LDI r2, 532
LDI r5, 212
LDI r19, 997
LDI r7, 560
LDI r7, 0x0000FF
; main loop
loop_0:
  LDI r9, 16777215
  FILL r9
RECTF r13, r14, r21, r1, r0
CIRCLE r10, r31, r15, r0
  FRAME
  JMP loop_0