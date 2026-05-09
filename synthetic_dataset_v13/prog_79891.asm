; DESCRIPTION: Renders a yellow line between points (119, 92) and (444, 77).
; PLAN: r0=119(x1), r1=92(y1), r2=444(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 92
LDI r2, 444
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
