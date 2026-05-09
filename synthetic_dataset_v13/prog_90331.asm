; DESCRIPTION: Places a orange line segment connecting (17, 110) to (200, 90).
; PLAN: r0=17(x1), r1=110(y1), r2=200(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 110
LDI r2, 200
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
