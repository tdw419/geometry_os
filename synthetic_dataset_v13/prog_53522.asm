; DESCRIPTION: Places a orange line segment connecting (81, 156) to (308, 248).
; PLAN: r0=81(x1), r1=156(y1), r2=308(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 156
LDI r2, 308
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
