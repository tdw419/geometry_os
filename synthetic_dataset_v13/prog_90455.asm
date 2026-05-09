; DESCRIPTION: Places a blue line segment connecting (17, 77) to (505, 89).
; PLAN: r0=17(x1), r1=77(y1), r2=505(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 77
LDI r2, 505
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
