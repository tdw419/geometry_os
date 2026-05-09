; DESCRIPTION: Places a magenta line segment connecting (457, 151) to (451, 50).
; PLAN: r0=457(x1), r1=151(y1), r2=451(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 151
LDI r2, 451
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
