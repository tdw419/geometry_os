; DESCRIPTION: Renders a black line between points (81, 179) and (358, 76).
; PLAN: r0=81(x1), r1=179(y1), r2=358(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 179
LDI r2, 358
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
