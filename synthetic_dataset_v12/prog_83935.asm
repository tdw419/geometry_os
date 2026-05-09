; DESCRIPTION: Places a yellow line segment connecting (6, 94) to (17, 217).
; PLAN: r0=6(x1), r1=94(y1), r2=17(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 94
LDI r2, 17
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
