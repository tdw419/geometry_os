; DESCRIPTION: Renders a black line between points (131, 183) and (318, 72).
; PLAN: r0=131(x1), r1=183(y1), r2=318(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 183
LDI r2, 318
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
