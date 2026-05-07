; Synthetic GeOS Program
; initialization
LDI r11, 259
LDI r2, 0x888888
LDI r0, 1017
LDI r9, 680
; main loop
loop_0:
  LDI r9, 16777215
  FILL r9
RECTF r18, r19, r15, r29, r27
  FRAME
  JMP loop_0