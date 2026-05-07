; Synthetic GeOS Program
; initialization
LDI r27, 563
LDI r8, 217
LDI r31, 324
LDI r22, 63
LDI r9, 610
; main loop
loop_0:
  LDI r4, 65535
  FILL r4
LINE r31, r27, r20, r11, r29
  CMP r21, r30
  JZ r0, loop_0
  FRAME
  JMP loop_0