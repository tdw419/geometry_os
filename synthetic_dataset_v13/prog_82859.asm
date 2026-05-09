; DESCRIPTION: Renders a red line between points (101, 194) and (112, 245).
; PLAN: r0=101(x1), r1=194(y1), r2=112(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 194
LDI r2, 112
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
