; Synthetic GeOS Program
; initialization
LDI r1, 498
LDI r11, 892
LDI r8, 465
LDI r6, 0xFFFF00
LDI r12, 621
; arithmetic section
SUB r24, r25, r4
ADD r9, r9, r19
ADD r23, r12, r23
SUB r10, r6, r19
LDI r2, 685
LDI r6, 0x888888
; main loop
loop_0:
  LDI r27, 65280
  FILL r27
PSET r7, r18, r9
  FRAME
  JMP loop_0