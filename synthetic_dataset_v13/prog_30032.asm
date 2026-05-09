; DESCRIPTION: Places a blue line segment connecting (266, 252) to (25, 112).
; PLAN: r0=266(x1), r1=252(y1), r2=25(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 252
LDI r2, 25
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
