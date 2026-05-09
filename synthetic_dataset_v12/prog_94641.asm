; DESCRIPTION: Places a purple line segment connecting (66, 137) to (77, 160).
; PLAN: r0=66(x1), r1=137(y1), r2=77(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 137
LDI r2, 77
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
