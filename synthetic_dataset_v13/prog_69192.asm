; DESCRIPTION: Places a magenta line segment connecting (97, 247) to (396, 147).
; PLAN: r0=97(x1), r1=247(y1), r2=396(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 247
LDI r2, 396
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
