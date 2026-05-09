; DESCRIPTION: Places a magenta line segment connecting (259, 94) to (451, 232).
; PLAN: r0=259(x1), r1=94(y1), r2=451(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 94
LDI r2, 451
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
