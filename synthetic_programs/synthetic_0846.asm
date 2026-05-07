; Synthetic GeOS Program
; initialization
LDI r3, 599
LDI r19, 0xFFFF00
LDI r15, 0x00FF00
; main loop
loop_0:
  LDI r31, 8947848
  FILL r31
LINE r24, r13, r13, r8, r15
  FRAME
  JMP loop_0