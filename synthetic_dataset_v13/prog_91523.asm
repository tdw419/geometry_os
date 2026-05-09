; DESCRIPTION: Places a black line segment connecting (106, 76) to (85, 232).
; PLAN: r0=106(x1), r1=76(y1), r2=85(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 76
LDI r2, 85
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
