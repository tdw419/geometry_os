; Synthetic GeOS Program
; initialization
LDI r9, 415
LDI r4, 998
LDI r11, 646
; arithmetic section
LDI r23, 0x00FFFF
ADD r16, r15, r6
LDI r9, 819
; main loop
loop_0:
  LDI r10, 16711935
  FILL r10
LINE r27, r16, r25, r27, r30
CIRCLE r2, r25, r6, r0
CIRCLE r11, r1, r15, r31
  FRAME
  JMP loop_0