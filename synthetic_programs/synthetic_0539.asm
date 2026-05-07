; Synthetic GeOS Program
; initialization
LDI r11, 691
LDI r26, 0x888888
LDI r23, 587
; arithmetic section
ADD r15, r31, r8
ADD r23, r26, r4
SUB r17, r13, r31
LDI r0, 950
ADD r11, r31, r4
; main loop
loop_0:
  LDI r5, 16711680
  FILL r5
LINE r18, r16, r21, r17, r13
LINE r23, r16, r24, r17, r10
PSET r18, r8, r7
  FRAME
  JMP loop_0