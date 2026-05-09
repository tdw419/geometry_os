; DESCRIPTION: Places a purple line segment connecting (396, 209) to (287, 190).
; PLAN: r0=396(x1), r1=209(y1), r2=287(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 209
LDI r2, 287
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
