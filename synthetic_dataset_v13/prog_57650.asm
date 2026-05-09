; DESCRIPTION: Renders a yellow line between points (451, 146) and (341, 123).
; PLAN: r0=451(x1), r1=146(y1), r2=341(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 146
LDI r2, 341
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
