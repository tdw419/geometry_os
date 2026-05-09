; DESCRIPTION: Renders a red line between points (194, 193) and (74, 58).
; PLAN: r0=194(x1), r1=193(y1), r2=74(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 193
LDI r2, 74
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
