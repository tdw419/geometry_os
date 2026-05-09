; DESCRIPTION: Places a magenta line segment connecting (287, 94) to (138, 251).
; PLAN: r0=287(x1), r1=94(y1), r2=138(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 94
LDI r2, 138
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
