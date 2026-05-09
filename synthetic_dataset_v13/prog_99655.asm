; DESCRIPTION: Renders a yellow line between points (149, 55) and (155, 12).
; PLAN: r0=149(x1), r1=55(y1), r2=155(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 55
LDI r2, 155
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
