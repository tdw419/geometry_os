; DESCRIPTION: Places a orange line segment connecting (156, 7) to (463, 18).
; PLAN: r0=156(x1), r1=7(y1), r2=463(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 7
LDI r2, 463
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
