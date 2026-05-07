; Synthetic GeOS Program
; initialization
LDI r29, 747
LDI r18, 58
LDI r21, 590
LDI r25, 0x000000
LDI r0, 0x0000FF
; main loop
loop_0:
  LDI r21, 8947848
  FILL r21
RECTF r28, r21, r31, r29, r8
  CMP r17, r29
  JZ r0, loop_0
  FRAME
  JMP loop_0