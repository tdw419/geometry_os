; DESCRIPTION: Places a orange line segment connecting (246, 78) to (105, 212).
; PLAN: r0=246(x1), r1=78(y1), r2=105(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 78
LDI r2, 105
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
