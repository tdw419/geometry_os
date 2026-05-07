; Synthetic GeOS Program
; initialization
LDI r29, 479
LDI r17, 633
LDI r18, 0x000000
LDI r24, 0xFFFFFF
LDI r5, 724
; main loop
loop_0:
  LDI r9, 16711680
  FILL r9
RECTF r19, r1, r22, r18, r18
  CMP r4, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0