; DESCRIPTION: Renders a red line between points (411, 53) and (119, 190).
; PLAN: r0=411(x1), r1=53(y1), r2=119(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 53
LDI r2, 119
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
