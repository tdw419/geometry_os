; DESCRIPTION: Renders a black line between points (50, 147) and (343, 230).
; PLAN: r0=50(x1), r1=147(y1), r2=343(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 147
LDI r2, 343
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
