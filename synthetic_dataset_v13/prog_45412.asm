; DESCRIPTION: Places a black line segment connecting (478, 174) to (153, 78).
; PLAN: r0=478(x1), r1=174(y1), r2=153(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 174
LDI r2, 153
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
