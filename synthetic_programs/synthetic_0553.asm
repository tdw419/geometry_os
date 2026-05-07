; Synthetic GeOS Program
; initialization
LDI r5, 0x00FF00
LDI r2, 731
LDI r19, 714
LDI r7, 665
LDI r27, 0x000000
LDI r11, 74
; main loop
loop_0:
  LDI r18, 65280
  FILL r18
CIRCLE r26, r15, r18, r8
LINE r5, r0, r24, r18, r21
PSET r2, r30, r21
  CMP r29, r18
  JZ r0, loop_0
  FRAME
  JMP loop_0