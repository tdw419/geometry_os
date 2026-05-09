; DESCRIPTION: Places a purple line segment connecting (343, 245) to (211, 98).
; PLAN: r0=343(x1), r1=245(y1), r2=211(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 245
LDI r2, 211
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
