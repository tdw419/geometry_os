; Synthetic GeOS Program
; initialization
LDI r4, 178
LDI r9, 864
LDI r28, 0xFFFFFF
LDI r19, 661
LDI r18, 0x0000FF
; main loop
loop_0:
  LDI r10, 16711680
  FILL r10
RECTF r16, r10, r7, r5, r4
PSET r15, r16, r13
CIRCLE r30, r8, r1, r5
  FRAME
  JMP loop_0