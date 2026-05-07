; Synthetic GeOS Program
; initialization
LDI r1, 0x000000
LDI r4, 915
LDI r5, 789
LDI r4, 905
LDI r22, 0xFFFF00
LDI r0, 555
; main loop
loop_0:
  LDI r15, 8947848
  FILL r15
LINE r31, r22, r30, r11, r24
  CMP r1, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0