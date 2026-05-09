; DESCRIPTION: Renders a red line between points (106, 221) and (189, 190).
; PLAN: r0=106(x1), r1=221(y1), r2=189(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 221
LDI r2, 189
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
