; DESCRIPTION: Renders a yellow line between points (169, 73) and (318, 96).
; PLAN: r0=169(x1), r1=73(y1), r2=318(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 73
LDI r2, 318
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
