; DESCRIPTION: Places a orange line segment connecting (181, 54) to (496, 141).
; PLAN: r0=181(x1), r1=54(y1), r2=496(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 54
LDI r2, 496
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
