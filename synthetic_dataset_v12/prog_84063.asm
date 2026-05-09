; DESCRIPTION: Places a magenta line segment connecting (451, 192) to (285, 65).
; PLAN: r0=451(x1), r1=192(y1), r2=285(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 192
LDI r2, 285
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
