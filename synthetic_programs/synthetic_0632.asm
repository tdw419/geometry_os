; Synthetic GeOS Program
; initialization
LDI r23, 0xFF00FF
LDI r21, 207
LDI r4, 705
LDI r21, 831
LDI r4, 0x888888
LDI r30, 329
; arithmetic section
SUB r8, r29, r11
SUB r1, r25, r7
LDI r1, 847
ADD r11, r25, r27
LDI r1, 626
; main loop
loop_0:
  LDI r30, 16711935
  FILL r30
LINE r23, r12, r9, r14, r14
RECTF r28, r31, r19, r29, r30
PSET r27, r23, r9
  FRAME
  JMP loop_0