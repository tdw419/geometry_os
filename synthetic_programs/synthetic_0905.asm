; Synthetic GeOS Program
; initialization
LDI r19, 0xFFFF00
LDI r5, 0xFFFFFF
LDI r18, 440
LDI r16, 611
LDI r1, 0x0000FF
; main loop
loop_0:
  LDI r0, 65280
  FILL r0
LINE r10, r19, r10, r7, r19
RECTF r30, r15, r7, r23, r0
PSET r11, r17, r9
  FRAME
  JMP loop_0