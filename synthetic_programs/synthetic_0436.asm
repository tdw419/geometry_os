; Synthetic GeOS Program
; initialization
LDI r1, 266
LDI r26, 357
LDI r20, 800
LDI r5, 730
LDI r15, 0x0000FF
LDI r9, 936
; main loop
loop_0:
  LDI r9, 8947848
  FILL r9
PSET r30, r14, r21
CIRCLE r18, r21, r2, r18
  CMP r14, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0