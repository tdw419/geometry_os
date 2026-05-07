; Synthetic GeOS Program
; initialization
LDI r12, 364
LDI r4, 991
LDI r29, 261
LDI r17, 138
LDI r8, 0xFF00FF
LDI r9, 0xFFFFFF
; arithmetic section
LDI r7, 822
ADD r7, r6, r9
LDI r8, 16
LDI r24, 688
SUB r22, r2, r26
SUB r8, r1, r31
LDI r12, 874
; main loop
loop_0:
  LDI r11, 65280
  FILL r11
PSET r7, r15, r22
  FRAME
  JMP loop_0