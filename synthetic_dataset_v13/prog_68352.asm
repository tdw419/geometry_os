; DESCRIPTION: Places a orange line segment connecting (343, 83) to (360, 147).
; PLAN: r0=343(x1), r1=83(y1), r2=360(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 83
LDI r2, 360
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
