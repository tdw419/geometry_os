; DESCRIPTION: Renders a white line between points (94, 101) and (297, 245).
; PLAN: r0=94(x1), r1=101(y1), r2=297(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 101
LDI r2, 297
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
