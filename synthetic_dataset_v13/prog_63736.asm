; DESCRIPTION: Places a orange line segment connecting (76, 179) to (119, 82).
; PLAN: r0=76(x1), r1=179(y1), r2=119(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 179
LDI r2, 119
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
