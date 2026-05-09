; DESCRIPTION: Renders a orange line between points (414, 56) and (334, 4).
; PLAN: r0=414(x1), r1=56(y1), r2=334(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 56
LDI r2, 334
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
