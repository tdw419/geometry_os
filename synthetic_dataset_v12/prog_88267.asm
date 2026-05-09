; DESCRIPTION: Places a purple line segment connecting (483, 191) to (102, 159).
; PLAN: r0=483(x1), r1=191(y1), r2=102(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 191
LDI r2, 102
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
