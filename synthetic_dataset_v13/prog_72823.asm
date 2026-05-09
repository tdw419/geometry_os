; DESCRIPTION: Places a purple line segment connecting (436, 106) to (265, 36).
; PLAN: r0=436(x1), r1=106(y1), r2=265(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 106
LDI r2, 265
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
