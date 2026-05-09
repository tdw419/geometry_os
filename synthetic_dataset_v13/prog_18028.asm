; DESCRIPTION: Renders a black line between points (62, 8) and (11, 96).
; PLAN: r0=62(x1), r1=8(y1), r2=11(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 8
LDI r2, 11
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
