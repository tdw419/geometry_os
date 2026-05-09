; DESCRIPTION: Renders a red line between points (451, 83) and (147, 238).
; PLAN: r0=451(x1), r1=83(y1), r2=147(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 83
LDI r2, 147
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
