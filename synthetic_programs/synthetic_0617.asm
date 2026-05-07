; Synthetic GeOS Program
; initialization
LDI r7, 1009
LDI r11, 910
LDI r16, 0x00FFFF
LDI r17, 731
; main loop
loop_0:
  LDI r28, 16711680
  FILL r28
CIRCLE r17, r12, r14, r16
  FRAME
  JMP loop_0