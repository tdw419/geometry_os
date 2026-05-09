; DESCRIPTION: Places a orange line segment connecting (427, 40) to (378, 60).
; PLAN: r0=427(x1), r1=40(y1), r2=378(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 40
LDI r2, 378
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
