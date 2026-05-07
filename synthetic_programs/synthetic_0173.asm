; Synthetic GeOS Program
; initialization
LDI r26, 0x00FF00
LDI r19, 123
LDI r29, 199
LDI r18, 0x00FF00
LDI r2, 658
; main loop
loop_0:
  LDI r21, 16711935
  FILL r21
RECTF r14, r19, r29, r20, r12
PSET r25, r21, r19
  CMP r18, r11
  JZ r0, loop_0
  FRAME
  JMP loop_0