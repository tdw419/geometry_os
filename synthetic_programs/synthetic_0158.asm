; Synthetic GeOS Program
; initialization
LDI r24, 725
LDI r1, 526
LDI r23, 0x000000
LDI r13, 742
; main loop
loop_0:
  LDI r7, 16711680
  FILL r7
CIRCLE r29, r15, r19, r7
  CMP r4, r7
  JZ r0, loop_0
  FRAME
  JMP loop_0