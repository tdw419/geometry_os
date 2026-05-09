; DESCRIPTION: Places a purple line segment connecting (312, 251) to (467, 199).
; PLAN: r0=312(x1), r1=251(y1), r2=467(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 251
LDI r2, 467
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
