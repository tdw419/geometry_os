; DESCRIPTION: Places a orange line segment connecting (372, 202) to (78, 90).
; PLAN: r0=372(x1), r1=202(y1), r2=78(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 202
LDI r2, 78
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
