; DESCRIPTION: Renders a yellow line between points (165, 138) and (478, 140).
; PLAN: r0=165(x1), r1=138(y1), r2=478(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 138
LDI r2, 478
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
