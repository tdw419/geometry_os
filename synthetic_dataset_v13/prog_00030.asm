; DESCRIPTION: Places a purple line segment connecting (140, 197) to (0, 245).
; PLAN: r0=140(x1), r1=197(y1), r2=0(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 197
LDI r2, 0
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
