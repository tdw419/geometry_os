; DESCRIPTION: Renders a black line between points (373, 29) and (155, 183).
; PLAN: r0=373(x1), r1=29(y1), r2=155(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 29
LDI r2, 155
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
