; Synthetic GeOS Program
; initialization
LDI r4, 0xFF0000
LDI r27, 0xFFFFFF
; main loop
loop_0:
  LDI r30, 16711935
  FILL r30
RECTF r23, r23, r3, r0, r29
LINE r4, r6, r9, r21, r17
PSET r30, r4, r30
  FRAME
  JMP loop_0