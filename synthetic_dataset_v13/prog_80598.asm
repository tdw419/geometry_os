; DESCRIPTION: Renders a white line between points (190, 82) and (323, 201).
; PLAN: r0=190(x1), r1=82(y1), r2=323(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 82
LDI r2, 323
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
