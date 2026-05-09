; DESCRIPTION: Renders a black line between points (451, 184) and (158, 169).
; PLAN: r0=451(x1), r1=184(y1), r2=158(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 184
LDI r2, 158
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
