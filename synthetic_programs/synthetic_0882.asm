; Synthetic GeOS Program
; initialization
LDI r1, 0xFFFFFF
LDI r14, 109
LDI r27, 571
; main loop
loop_0:
  LDI r12, 65535
  FILL r12
CIRCLE r19, r18, r15, r15
RECTF r0, r0, r1, r3, r4
  FRAME
  JMP loop_0