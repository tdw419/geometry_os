; DESCRIPTION: Places a purple line segment connecting (411, 68) to (62, 225).
; PLAN: r0=411(x1), r1=68(y1), r2=62(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 68
LDI r2, 62
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
