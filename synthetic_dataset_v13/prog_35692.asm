; DESCRIPTION: Places a yellow line segment connecting (287, 59) to (343, 119).
; PLAN: r0=287(x1), r1=59(y1), r2=343(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 59
LDI r2, 343
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
