; DESCRIPTION: Places a orange line segment connecting (428, 199) to (266, 24).
; PLAN: r0=428(x1), r1=199(y1), r2=266(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 199
LDI r2, 266
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
