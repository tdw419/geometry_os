; DESCRIPTION: Places a purple line segment connecting (477, 156) to (433, 21).
; PLAN: r0=477(x1), r1=156(y1), r2=433(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 156
LDI r2, 433
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
