; Synthetic GeOS Program
; initialization
LDI r3, 202
LDI r29, 969
LDI r5, 0xFFFF00
LDI r11, 0xFF0000
; main loop
loop_0:
  LDI r6, 0
  FILL r6
RECTF r31, r24, r6, r3, r13
  CMP r0, r29
  JZ r0, loop_0
  FRAME
  JMP loop_0