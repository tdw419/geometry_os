; DESCRIPTION: Renders a red line between points (135, 232) and (472, 99).
; PLAN: r0=135(x1), r1=232(y1), r2=472(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 232
LDI r2, 472
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
