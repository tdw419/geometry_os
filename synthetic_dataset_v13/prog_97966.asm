; DESCRIPTION: Places a yellow line segment connecting (2, 217) to (500, 66).
; PLAN: r0=2(x1), r1=217(y1), r2=500(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 217
LDI r2, 500
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
