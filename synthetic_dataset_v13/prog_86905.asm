; DESCRIPTION: Places a white line segment connecting (356, 122) to (192, 205).
; PLAN: r0=356(x1), r1=122(y1), r2=192(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 122
LDI r2, 192
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
