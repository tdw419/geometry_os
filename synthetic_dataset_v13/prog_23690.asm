; DESCRIPTION: Places a purple line segment connecting (341, 180) to (478, 252).
; PLAN: r0=341(x1), r1=180(y1), r2=478(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 180
LDI r2, 478
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
