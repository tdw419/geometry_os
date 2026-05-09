; DESCRIPTION: Renders a white line between points (374, 184) and (139, 101).
; PLAN: r0=374(x1), r1=184(y1), r2=139(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 184
LDI r2, 139
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
