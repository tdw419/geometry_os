; DESCRIPTION: Places a magenta line segment connecting (155, 13) to (23, 218).
; PLAN: r0=155(x1), r1=13(y1), r2=23(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 13
LDI r2, 23
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
