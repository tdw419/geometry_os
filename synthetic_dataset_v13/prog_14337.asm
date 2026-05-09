; DESCRIPTION: Renders a yellow line between points (77, 184) and (315, 194).
; PLAN: r0=77(x1), r1=184(y1), r2=315(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 184
LDI r2, 315
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
