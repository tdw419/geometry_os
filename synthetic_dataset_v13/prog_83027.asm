; DESCRIPTION: Places a orange line segment connecting (101, 112) to (156, 245).
; PLAN: r0=101(x1), r1=112(y1), r2=156(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 112
LDI r2, 156
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
