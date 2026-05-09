; DESCRIPTION: Renders a black line between points (157, 219) and (169, 118).
; PLAN: r0=157(x1), r1=219(y1), r2=169(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 219
LDI r2, 169
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
