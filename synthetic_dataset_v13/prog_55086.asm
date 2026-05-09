; DESCRIPTION: Renders a white line between points (3, 97) and (323, 139).
; PLAN: r0=3(x1), r1=97(y1), r2=323(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 97
LDI r2, 323
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
