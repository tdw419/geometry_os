; DESCRIPTION: Places a yellow line segment connecting (183, 105) to (139, 70).
; PLAN: r0=183(x1), r1=105(y1), r2=139(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 105
LDI r2, 139
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
