; Synthetic GeOS Program
; initialization
LDI r2, 0xFF0000
LDI r1, 923
LDI r14, 667
LDI r25, 627
; main loop
loop_0:
  LDI r13, 16776960
  FILL r13
RECTF r11, r2, r14, r20, r1
RECTF r15, r2, r9, r8, r7
  FRAME
  JMP loop_0