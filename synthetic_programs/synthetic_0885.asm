; Synthetic GeOS Program
; initialization
LDI r9, 101
LDI r18, 0x000000
LDI r1, 95
LDI r11, 43
LDI r26, 295
LDI r31, 1014
; main loop
loop_0:
  LDI r7, 16776960
  FILL r7
RECTF r29, r1, r21, r23, r12
  CMP r6, r31
  JZ r0, loop_0
  FRAME
  JMP loop_0