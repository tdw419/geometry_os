; DESCRIPTION: Places a orange line segment connecting (302, 123) to (506, 57).
; PLAN: r0=302(x1), r1=123(y1), r2=506(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 123
LDI r2, 506
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
