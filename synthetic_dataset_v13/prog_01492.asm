; DESCRIPTION: Renders a yellow line between points (395, 199) and (109, 217).
; PLAN: r0=395(x1), r1=199(y1), r2=109(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 199
LDI r2, 109
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
