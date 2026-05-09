; DESCRIPTION: Places a blue line segment connecting (378, 84) to (172, 130).
; PLAN: r0=378(x1), r1=84(y1), r2=172(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 84
LDI r2, 172
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
