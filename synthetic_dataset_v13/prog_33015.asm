; DESCRIPTION: Places a black line segment connecting (204, 183) to (311, 119).
; PLAN: r0=204(x1), r1=183(y1), r2=311(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 183
LDI r2, 311
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
