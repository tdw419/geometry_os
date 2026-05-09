; DESCRIPTION: Renders a red line between points (435, 238) and (93, 68).
; PLAN: r0=435(x1), r1=238(y1), r2=93(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 238
LDI r2, 93
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
