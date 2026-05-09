; DESCRIPTION: Renders a yellow line between points (409, 35) and (318, 102).
; PLAN: r0=409(x1), r1=35(y1), r2=318(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 35
LDI r2, 318
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
