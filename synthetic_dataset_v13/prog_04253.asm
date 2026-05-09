; DESCRIPTION: Places a purple line segment connecting (77, 174) to (10, 211).
; PLAN: r0=77(x1), r1=174(y1), r2=10(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 174
LDI r2, 10
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
