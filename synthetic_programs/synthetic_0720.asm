; Synthetic GeOS Program
; initialization
LDI r15, 820
LDI r7, 4
LDI r1, 194
LDI r30, 1000
; main loop
loop_0:
  LDI r8, 65535
  FILL r8
LINE r17, r11, r30, r14, r11
  FRAME
  JMP loop_0