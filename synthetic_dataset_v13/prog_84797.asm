; DESCRIPTION: Places a magenta line segment connecting (78, 40) to (94, 15).
; PLAN: r0=78(x1), r1=40(y1), r2=94(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 40
LDI r2, 94
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
