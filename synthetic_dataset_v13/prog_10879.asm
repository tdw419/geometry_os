; DESCRIPTION: Renders a red line between points (68, 6) and (323, 190).
; PLAN: r0=68(x1), r1=6(y1), r2=323(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 6
LDI r2, 323
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
