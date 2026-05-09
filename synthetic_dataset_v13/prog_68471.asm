; DESCRIPTION: Places a green line segment connecting (85, 227) to (35, 73).
; PLAN: r0=85(x1), r1=227(y1), r2=35(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 227
LDI r2, 35
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
