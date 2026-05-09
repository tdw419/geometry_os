; DESCRIPTION: Places a orange line segment connecting (321, 87) to (378, 251).
; PLAN: r0=321(x1), r1=87(y1), r2=378(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 87
LDI r2, 378
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
