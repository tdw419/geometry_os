; DESCRIPTION: Renders a black line between points (369, 18) and (343, 185).
; PLAN: r0=369(x1), r1=18(y1), r2=343(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 18
LDI r2, 343
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
