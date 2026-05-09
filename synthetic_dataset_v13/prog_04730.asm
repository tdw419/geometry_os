; DESCRIPTION: Places a yellow line segment connecting (6, 113) to (89, 73).
; PLAN: r0=6(x1), r1=113(y1), r2=89(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 113
LDI r2, 89
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
