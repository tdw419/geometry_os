; Synthetic GeOS Program
; initialization
LDI r21, 745
LDI r9, 185
LDI r16, 0x00FF00
; main loop
loop_0:
  LDI r2, 255
  FILL r2
RECTF r31, r23, r14, r2, r19
CIRCLE r24, r21, r3, r23
  CMP r26, r17
  JZ r0, loop_0
  FRAME
  JMP loop_0