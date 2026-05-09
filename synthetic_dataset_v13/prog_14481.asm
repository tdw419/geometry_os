; DESCRIPTION: Renders a black line between points (484, 92) and (253, 73).
; PLAN: r0=484(x1), r1=92(y1), r2=253(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 92
LDI r2, 253
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
