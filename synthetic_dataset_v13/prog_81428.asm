; DESCRIPTION: Places a black line segment connecting (451, 29) to (74, 3).
; PLAN: r0=451(x1), r1=29(y1), r2=74(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 29
LDI r2, 74
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
