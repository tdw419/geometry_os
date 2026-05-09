; DESCRIPTION: Places a yellow line segment connecting (471, 40) to (134, 216).
; PLAN: r0=471(x1), r1=40(y1), r2=134(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 40
LDI r2, 134
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
