; DESCRIPTION: Places a orange line segment connecting (270, 63) to (102, 183).
; PLAN: r0=270(x1), r1=63(y1), r2=102(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 63
LDI r2, 102
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
