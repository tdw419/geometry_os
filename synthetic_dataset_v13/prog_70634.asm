; DESCRIPTION: Renders a purple line between points (89, 184) and (245, 104).
; PLAN: r0=89(x1), r1=184(y1), r2=245(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 184
LDI r2, 245
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
