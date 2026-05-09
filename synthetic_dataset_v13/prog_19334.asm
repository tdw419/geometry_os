; DESCRIPTION: Renders a black line between points (336, 106) and (59, 85).
; PLAN: r0=336(x1), r1=106(y1), r2=59(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 106
LDI r2, 59
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
