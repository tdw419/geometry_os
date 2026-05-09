; DESCRIPTION: Places a purple line segment connecting (238, 206) to (414, 149).
; PLAN: r0=238(x1), r1=206(y1), r2=414(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 206
LDI r2, 414
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
