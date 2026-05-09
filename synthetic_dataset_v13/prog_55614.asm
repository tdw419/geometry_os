; DESCRIPTION: Places a orange line segment connecting (331, 159) to (200, 85).
; PLAN: r0=331(x1), r1=159(y1), r2=200(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 159
LDI r2, 200
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
