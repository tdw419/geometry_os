; DESCRIPTION: Places a orange line segment connecting (156, 12) to (47, 178).
; PLAN: r0=156(x1), r1=12(y1), r2=47(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 12
LDI r2, 47
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
