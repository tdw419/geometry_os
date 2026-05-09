; DESCRIPTION: Places a orange line segment connecting (316, 169) to (200, 63).
; PLAN: r0=316(x1), r1=169(y1), r2=200(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 169
LDI r2, 200
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
