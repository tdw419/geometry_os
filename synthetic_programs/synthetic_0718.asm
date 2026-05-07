; Synthetic GeOS Program
; initialization
LDI r19, 0xFF0000
LDI r0, 433
LDI r15, 0xFF0000
LDI r6, 591
; main loop
loop_0:
  LDI r4, 16711935
  FILL r4
LINE r14, r15, r21, r11, r6
PSET r17, r6, r15
  CMP r6, r28
  JZ r0, loop_0
  FRAME
  JMP loop_0