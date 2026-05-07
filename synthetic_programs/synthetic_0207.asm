; Synthetic GeOS Program
; initialization
LDI r10, 773
LDI r29, 0x00FF00
; main loop
loop_0:
  LDI r5, 8947848
  FILL r5
RECTF r19, r24, r24, r14, r5
  CMP r21, r15
  JZ r0, loop_0
  FRAME
  JMP loop_0