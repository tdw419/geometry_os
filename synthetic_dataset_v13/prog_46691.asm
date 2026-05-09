; DESCRIPTION: Renders a red line between points (159, 24) and (6, 24).
; PLAN: r0=159(x1), r1=24(y1), r2=6(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 24
LDI r2, 6
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
