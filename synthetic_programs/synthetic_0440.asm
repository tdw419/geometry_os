; Synthetic GeOS Program
; initialization
LDI r24, 119
LDI r31, 0x000000
LDI r9, 0xFFFF00
LDI r28, 694
; main loop
loop_0:
  LDI r21, 16711680
  FILL r21
RECTF r3, r13, r15, r20, r8
RECTF r24, r1, r2, r21, r11
  CMP r12, r30
  JZ r0, loop_0
  FRAME
  JMP loop_0