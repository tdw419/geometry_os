; DESCRIPTION: Places a purple line segment connecting (349, 52) to (53, 225).
; PLAN: r0=349(x1), r1=52(y1), r2=53(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 52
LDI r2, 53
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
