; Synthetic GeOS Program
; initialization
LDI r18, 0x000000
LDI r9, 166
LDI r4, 66
LDI r28, 479
; main loop
loop_0:
  LDI r11, 255
  FILL r11
CIRCLE r30, r0, r19, r19
CIRCLE r6, r18, r31, r13
RECTF r23, r6, r20, r27, r21
  FRAME
  JMP loop_0