; DESCRIPTION: Places a white line segment connecting (93, 84) to (15, 157).
; PLAN: r0=93(x1), r1=84(y1), r2=15(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 84
LDI r2, 15
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
