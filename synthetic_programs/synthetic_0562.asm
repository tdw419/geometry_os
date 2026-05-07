; Synthetic GeOS Program
; initialization
LDI r12, 0x888888
LDI r11, 158
; main loop
loop_0:
  LDI r2, 8947848
  FILL r2
RECTF r1, r8, r20, r0, r9
CIRCLE r0, r3, r18, r16
CIRCLE r6, r12, r20, r7
  FRAME
  JMP loop_0