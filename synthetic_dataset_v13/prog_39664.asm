; DESCRIPTION: Places a yellow line segment connecting (141, 15) to (112, 34).
; PLAN: r0=141(x1), r1=15(y1), r2=112(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 15
LDI r2, 112
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
