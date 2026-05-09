; DESCRIPTION: Renders a black line between points (181, 19) and (194, 168).
; PLAN: r0=181(x1), r1=19(y1), r2=194(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 19
LDI r2, 194
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
