; Synthetic GeOS Program
; initialization
LDI r11, 78
LDI r31, 0xFF0000
LDI r11, 251
LDI r9, 504
LDI r18, 526
; main loop
loop_0:
  LDI r14, 16777215
  FILL r14
CIRCLE r16, r20, r20, r15
  FRAME
  JMP loop_0