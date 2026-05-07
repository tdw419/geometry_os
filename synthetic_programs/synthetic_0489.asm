; Synthetic GeOS Program
; initialization
LDI r25, 560
LDI r23, 966
LDI r10, 940
LDI r25, 742
LDI r6, 634
; main loop
loop_0:
  LDI r4, 16711935
  FILL r4
PSET r25, r11, r12
LINE r11, r20, r3, r13, r15
LINE r9, r6, r18, r16, r1
  CMP r7, r24
  JZ r0, loop_0
  FRAME
  JMP loop_0