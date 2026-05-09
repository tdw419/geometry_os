; DESCRIPTION: Places a magenta line segment connecting (451, 91) to (360, 90).
; PLAN: r0=451(x1), r1=91(y1), r2=360(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 91
LDI r2, 360
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
