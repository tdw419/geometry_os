; DESCRIPTION: Places a purple line segment connecting (496, 212) to (47, 192).
; PLAN: r0=496(x1), r1=212(y1), r2=47(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 212
LDI r2, 47
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
