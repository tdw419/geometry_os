; DESCRIPTION: Places a orange line segment connecting (74, 94) to (388, 145).
; PLAN: r0=74(x1), r1=94(y1), r2=388(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 94
LDI r2, 388
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
