; DESCRIPTION: Places a orange line segment connecting (414, 188) to (90, 84).
; PLAN: r0=414(x1), r1=188(y1), r2=90(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 188
LDI r2, 90
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
