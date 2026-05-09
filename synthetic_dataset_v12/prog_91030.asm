; DESCRIPTION: Places a blue line segment connecting (471, 75) to (232, 112).
; PLAN: r0=471(x1), r1=75(y1), r2=232(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 75
LDI r2, 232
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
