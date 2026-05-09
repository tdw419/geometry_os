; DESCRIPTION: Renders a black line between points (93, 92) and (490, 89).
; PLAN: r0=93(x1), r1=92(y1), r2=490(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 92
LDI r2, 490
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
