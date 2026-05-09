; DESCRIPTION: Renders a white line between points (323, 182) and (16, 140).
; PLAN: r0=323(x1), r1=182(y1), r2=16(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 182
LDI r2, 16
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
