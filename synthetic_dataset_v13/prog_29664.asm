; DESCRIPTION: Renders a orange line between points (476, 101) and (334, 84).
; PLAN: r0=476(x1), r1=101(y1), r2=334(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 101
LDI r2, 334
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
