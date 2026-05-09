; DESCRIPTION: Places a orange line segment connecting (179, 194) to (78, 156).
; PLAN: r0=179(x1), r1=194(y1), r2=78(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 194
LDI r2, 78
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
