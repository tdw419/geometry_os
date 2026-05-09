; DESCRIPTION: Places a orange line segment connecting (73, 156) to (505, 83).
; PLAN: r0=73(x1), r1=156(y1), r2=505(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 156
LDI r2, 505
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
