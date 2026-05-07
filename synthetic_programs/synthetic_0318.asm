; Synthetic GeOS Program
; initialization
LDI r24, 561
LDI r11, 0x888888
; main loop
loop_0:
  LDI r15, 16776960
  FILL r15
RECTF r7, r16, r10, r13, r21
  CMP r3, r11
  JZ r0, loop_0
  FRAME
  JMP loop_0