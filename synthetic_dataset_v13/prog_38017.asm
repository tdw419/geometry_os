; DESCRIPTION: Renders a black line between points (312, 105) and (304, 230).
; PLAN: r0=312(x1), r1=105(y1), r2=304(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 105
LDI r2, 304
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
