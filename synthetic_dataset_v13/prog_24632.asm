; DESCRIPTION: Renders a black line between points (494, 46) and (274, 181).
; PLAN: r0=494(x1), r1=46(y1), r2=274(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 46
LDI r2, 274
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
