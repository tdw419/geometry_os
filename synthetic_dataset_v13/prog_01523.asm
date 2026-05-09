; DESCRIPTION: Renders a yellow line between points (478, 172) and (148, 58).
; PLAN: r0=478(x1), r1=172(y1), r2=148(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 172
LDI r2, 148
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
