; DESCRIPTION: Places a purple line segment connecting (45, 246) to (8, 185).
; PLAN: r0=45(x1), r1=246(y1), r2=8(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 246
LDI r2, 8
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
