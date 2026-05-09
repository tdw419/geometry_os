; DESCRIPTION: Places a white line segment connecting (364, 165) to (478, 119).
; PLAN: r0=364(x1), r1=165(y1), r2=478(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 165
LDI r2, 478
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
