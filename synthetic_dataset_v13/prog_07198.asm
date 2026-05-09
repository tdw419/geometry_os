; DESCRIPTION: Renders a red line between points (142, 159) and (6, 64).
; PLAN: r0=142(x1), r1=159(y1), r2=6(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 159
LDI r2, 6
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
