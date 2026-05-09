; DESCRIPTION: Renders a yellow line between points (388, 159) and (496, 189).
; PLAN: r0=388(x1), r1=159(y1), r2=496(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 159
LDI r2, 496
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
