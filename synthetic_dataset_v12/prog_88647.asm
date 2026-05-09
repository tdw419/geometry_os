; DESCRIPTION: Places a orange line segment connecting (302, 75) to (339, 147).
; PLAN: r0=302(x1), r1=75(y1), r2=339(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 75
LDI r2, 339
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
