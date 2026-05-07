; Synthetic GeOS Program
; initialization
LDI r24, 143
LDI r29, 598
LDI r10, 924
LDI r17, 417
; main loop
loop_0:
  LDI r11, 16711935
  FILL r11
PSET r2, r25, r20
LINE r31, r25, r26, r18, r17
LINE r20, r23, r0, r29, r1
  CMP r3, r20
  JZ r0, loop_0
  FRAME
  JMP loop_0