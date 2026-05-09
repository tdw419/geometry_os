; DESCRIPTION: Places a purple line segment connecting (496, 137) to (41, 199).
; PLAN: r0=496(x1), r1=137(y1), r2=41(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 137
LDI r2, 41
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
