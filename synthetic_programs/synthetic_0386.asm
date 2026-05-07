; Synthetic GeOS Program
; initialization
LDI r16, 903
LDI r1, 69
LDI r2, 353
; main loop
loop_0:
  LDI r31, 8947848
  FILL r31
RECTF r2, r22, r18, r2, r11
  CMP r9, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0