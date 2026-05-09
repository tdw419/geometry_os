; DESCRIPTION: Renders a green line between points (177, 190) and (85, 190).
; PLAN: r0=177(x1), r1=190(y1), r2=85(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 190
LDI r2, 85
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
