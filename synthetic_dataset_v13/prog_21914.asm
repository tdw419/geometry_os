; DESCRIPTION: Places a purple line segment connecting (38, 26) to (322, 155).
; PLAN: r0=38(x1), r1=26(y1), r2=322(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 26
LDI r2, 322
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
