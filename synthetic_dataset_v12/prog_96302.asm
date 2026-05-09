; DESCRIPTION: Places a orange line segment connecting (318, 109) to (389, 3).
; PLAN: r0=318(x1), r1=109(y1), r2=389(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 109
LDI r2, 389
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
