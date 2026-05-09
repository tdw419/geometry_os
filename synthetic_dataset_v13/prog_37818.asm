; DESCRIPTION: Places a magenta line segment connecting (451, 6) to (299, 208).
; PLAN: r0=451(x1), r1=6(y1), r2=299(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 6
LDI r2, 299
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
