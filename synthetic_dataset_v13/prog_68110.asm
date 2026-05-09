; DESCRIPTION: Places a purple line segment connecting (107, 89) to (399, 56).
; PLAN: r0=107(x1), r1=89(y1), r2=399(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 89
LDI r2, 399
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
