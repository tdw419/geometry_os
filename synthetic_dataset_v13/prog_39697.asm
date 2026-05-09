; DESCRIPTION: Places a white line segment connecting (461, 97) to (314, 49).
; PLAN: r0=461(x1), r1=97(y1), r2=314(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 97
LDI r2, 314
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
