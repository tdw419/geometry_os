; DESCRIPTION: Renders a red line between points (29, 2) and (93, 25).
; PLAN: r0=29(x1), r1=2(y1), r2=93(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 2
LDI r2, 93
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
