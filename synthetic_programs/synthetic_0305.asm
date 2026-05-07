; Synthetic GeOS Program
; initialization
LDI r1, 0x00FF00
LDI r13, 214
LDI r29, 0x00FF00
LDI r11, 0x000000
; main loop
loop_0:
  LDI r28, 16711935
  FILL r28
CIRCLE r0, r30, r27, r18
  CMP r22, r18
  JZ r0, loop_0
  FRAME
  JMP loop_0