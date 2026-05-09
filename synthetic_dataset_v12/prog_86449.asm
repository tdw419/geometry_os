; DESCRIPTION: Renders a yellow line between points (232, 155) and (278, 100).
; PLAN: r0=232(x1), r1=155(y1), r2=278(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 155
LDI r2, 278
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
