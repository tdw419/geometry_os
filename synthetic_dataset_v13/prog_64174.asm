; DESCRIPTION: Places a purple line segment connecting (181, 62) to (3, 225).
; PLAN: r0=181(x1), r1=62(y1), r2=3(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 62
LDI r2, 3
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
