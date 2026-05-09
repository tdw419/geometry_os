; DESCRIPTION: Renders a yellow line between points (138, 120) and (318, 49).
; PLAN: r0=138(x1), r1=120(y1), r2=318(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 120
LDI r2, 318
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
