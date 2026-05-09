; DESCRIPTION: Renders a orange line between points (374, 22) and (478, 139).
; PLAN: r0=374(x1), r1=22(y1), r2=478(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 22
LDI r2, 478
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
