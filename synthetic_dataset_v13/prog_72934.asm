; DESCRIPTION: Places a white line segment connecting (478, 78) to (423, 175).
; PLAN: r0=478(x1), r1=78(y1), r2=423(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 78
LDI r2, 423
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
