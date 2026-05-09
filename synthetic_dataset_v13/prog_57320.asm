; DESCRIPTION: Places a orange line segment connecting (461, 91) to (364, 106).
; PLAN: r0=461(x1), r1=91(y1), r2=364(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 91
LDI r2, 364
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
