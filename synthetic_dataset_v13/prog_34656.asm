; DESCRIPTION: Places a yellow line segment connecting (478, 248) to (105, 34).
; PLAN: r0=478(x1), r1=248(y1), r2=105(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 248
LDI r2, 105
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
