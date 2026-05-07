; Synthetic GeOS Program
; initialization
LDI r10, 0xFFFFFF
LDI r30, 709
LDI r23, 408
LDI r2, 706
LDI r2, 438
; arithmetic section
LDI r19, 793
SUB r25, r1, r1
SUB r12, r17, r22
; main loop
loop_0:
  LDI r0, 16711935
  FILL r0
LINE r25, r11, r20, r7, r25
PSET r10, r10, r30
RECTF r3, r27, r13, r21, r15
  FRAME
  JMP loop_0