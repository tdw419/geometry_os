; DESCRIPTION: Places a orange line segment connecting (378, 250) to (3, 108).
; PLAN: r0=378(x1), r1=250(y1), r2=3(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 250
LDI r2, 3
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
