; Synthetic GeOS Program
; initialization
LDI r10, 302
LDI r6, 156
LDI r18, 475
LDI r19, 0xFFFFFF
LDI r27, 816
; main loop
loop_0:
  LDI r21, 65535
  FILL r21
RECTF r23, r15, r28, r2, r22
RECTF r15, r14, r10, r3, r25
  FRAME
  JMP loop_0