; DESCRIPTION: Renders a yellow line between points (105, 89) and (341, 81).
; PLAN: r0=105(x1), r1=89(y1), r2=341(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 89
LDI r2, 341
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
