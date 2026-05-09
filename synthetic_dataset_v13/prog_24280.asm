; DESCRIPTION: Places a purple line segment connecting (489, 14) to (265, 71).
; PLAN: r0=489(x1), r1=14(y1), r2=265(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 14
LDI r2, 265
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
