; Synthetic GeOS Program
; initialization
LDI r31, 516
LDI r21, 0xFF0000
LDI r27, 423
; main loop
loop_0:
  LDI r8, 65280
  FILL r8
LINE r15, r23, r11, r11, r18
  CMP r18, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0