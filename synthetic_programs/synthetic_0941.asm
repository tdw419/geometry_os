; Synthetic GeOS Program
; initialization
LDI r16, 165
LDI r17, 0xFF0000
LDI r2, 186
LDI r27, 774
; main loop
loop_0:
  LDI r15, 16711935
  FILL r15
RECTF r12, r0, r2, r27, r2
CIRCLE r3, r21, r19, r21
  FRAME
  JMP loop_0