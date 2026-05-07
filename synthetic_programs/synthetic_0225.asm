; Synthetic GeOS Program
; initialization
LDI r21, 0x00FFFF
LDI r11, 214
; main loop
loop_0:
  LDI r6, 16711935
  FILL r6
CIRCLE r6, r17, r13, r16
RECTF r6, r24, r9, r3, r22
  FRAME
  JMP loop_0