; Synthetic GeOS Program
; initialization
LDI r7, 1019
LDI r28, 978
LDI r30, 160
LDI r6, 88
; main loop
loop_0:
  LDI r12, 16711680
  FILL r12
CIRCLE r11, r27, r25, r3
RECTF r5, r10, r5, r12, r24
  CMP r18, r30
  JZ r0, loop_0
  FRAME
  JMP loop_0