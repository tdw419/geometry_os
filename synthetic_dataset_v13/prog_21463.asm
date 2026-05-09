; DESCRIPTION: Renders a white line between points (190, 1) and (139, 34).
; PLAN: r0=190(x1), r1=1(y1), r2=139(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 1
LDI r2, 139
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
