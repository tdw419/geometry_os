; DESCRIPTION: Places a orange line segment connecting (199, 95) to (304, 149).
; PLAN: r0=199(x1), r1=95(y1), r2=304(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 95
LDI r2, 304
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
