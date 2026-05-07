; Synthetic GeOS Program
; initialization
LDI r25, 234
LDI r19, 738
LDI r13, 495
LDI r8, 0x0000FF
LDI r31, 171
LDI r2, 239
; main loop
loop_0:
  LDI r1, 16711935
  FILL r1
RECTF r4, r0, r20, r7, r27
  FRAME
  JMP loop_0