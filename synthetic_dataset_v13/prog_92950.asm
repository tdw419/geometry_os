; DESCRIPTION: Places a magenta line segment connecting (219, 158) to (8, 78).
; PLAN: r0=219(x1), r1=158(y1), r2=8(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 158
LDI r2, 8
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
