; Synthetic GeOS Program
; initialization
LDI r13, 369
LDI r18, 0xFFFF00
LDI r9, 384
LDI r21, 361
LDI r24, 582
LDI r0, 241
; main loop
loop_0:
  LDI r7, 16711935
  FILL r7
RECTF r3, r18, r8, r20, r13
PSET r1, r6, r26
PSET r31, r30, r2
  FRAME
  JMP loop_0