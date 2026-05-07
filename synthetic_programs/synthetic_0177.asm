; Synthetic GeOS Program
; initialization
LDI r27, 645
LDI r19, 685
LDI r0, 690
LDI r9, 963
; main loop
loop_0:
  LDI r3, 255
  FILL r3
RECTF r1, r5, r8, r2, r21
LINE r9, r23, r19, r19, r29
  FRAME
  JMP loop_0