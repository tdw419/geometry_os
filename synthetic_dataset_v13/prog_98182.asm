; DESCRIPTION: Renders a red line between points (351, 182) and (190, 255).
; PLAN: r0=351(x1), r1=182(y1), r2=190(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 182
LDI r2, 190
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
