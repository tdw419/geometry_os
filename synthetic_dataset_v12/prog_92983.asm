; DESCRIPTION: Places a orange line segment connecting (483, 86) to (73, 78).
; PLAN: r0=483(x1), r1=86(y1), r2=73(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 86
LDI r2, 73
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
