; DESCRIPTION: Places a purple line segment connecting (246, 85) to (98, 232).
; PLAN: r0=246(x1), r1=85(y1), r2=98(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 85
LDI r2, 98
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
