; Synthetic GeOS Program
; initialization
LDI r18, 350
LDI r21, 267
LDI r28, 707
LDI r14, 0x888888
LDI r16, 971
LDI r22, 809
; main loop
loop_0:
  LDI r28, 16777215
  FILL r28
RECTF r4, r11, r22, r29, r15
  CMP r19, r20
  JZ r0, loop_0
  FRAME
  JMP loop_0