; DESCRIPTION: Places a purple line segment connecting (66, 194) to (486, 130).
; PLAN: r0=66(x1), r1=194(y1), r2=486(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 194
LDI r2, 486
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
