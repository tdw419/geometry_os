; DESCRIPTION: Renders a black line between points (431, 85) and (358, 101).
; PLAN: r0=431(x1), r1=85(y1), r2=358(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 85
LDI r2, 358
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
