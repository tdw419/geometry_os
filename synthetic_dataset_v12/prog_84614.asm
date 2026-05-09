; DESCRIPTION: Places a purple line segment connecting (50, 99) to (55, 130).
; PLAN: r0=50(x1), r1=99(y1), r2=55(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 99
LDI r2, 55
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
