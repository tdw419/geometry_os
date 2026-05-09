; DESCRIPTION: Places a white line segment connecting (314, 110) to (148, 159).
; PLAN: r0=314(x1), r1=110(y1), r2=148(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 110
LDI r2, 148
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
