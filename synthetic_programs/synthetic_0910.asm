; Synthetic GeOS Program
; initialization
LDI r19, 899
LDI r18, 528
; main loop
loop_0:
  LDI r17, 255
  FILL r17
RECTF r16, r15, r25, r11, r8
  CMP r28, r3
  JZ r0, loop_0
  FRAME
  JMP loop_0