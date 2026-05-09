; DESCRIPTION: Places a yellow line segment connecting (134, 49) to (68, 211).
; PLAN: r0=134(x1), r1=49(y1), r2=68(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 49
LDI r2, 68
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
