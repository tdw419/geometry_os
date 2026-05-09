; DESCRIPTION: Places a orange line segment connecting (55, 89) to (309, 62).
; PLAN: r0=55(x1), r1=89(y1), r2=309(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 89
LDI r2, 309
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
