; DESCRIPTION: Places a purple line segment connecting (225, 184) to (57, 34).
; PLAN: r0=225(x1), r1=184(y1), r2=57(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 184
LDI r2, 57
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
