; DESCRIPTION: Renders a black line between points (274, 123) and (0, 129).
; PLAN: r0=274(x1), r1=123(y1), r2=0(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 123
LDI r2, 0
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
