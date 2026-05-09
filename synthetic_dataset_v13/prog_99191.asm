; DESCRIPTION: Draws a white line from (478, 110) to (119, 170).
; PLAN: r0=478(x1), r1=110(y1), r2=119(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 110
LDI r2, 119
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
