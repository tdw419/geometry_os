; DESCRIPTION: Places a blue line segment connecting (414, 176) to (451, 118).
; PLAN: r0=414(x1), r1=176(y1), r2=451(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 176
LDI r2, 451
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
