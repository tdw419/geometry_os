; DESCRIPTION: Places a red line segment connecting (136, 204) to (478, 205).
; PLAN: r0=136(x1), r1=204(y1), r2=478(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 204
LDI r2, 478
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
