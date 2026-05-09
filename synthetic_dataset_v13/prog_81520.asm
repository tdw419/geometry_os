; DESCRIPTION: Renders a white line between points (249, 158) and (417, 106).
; PLAN: r0=249(x1), r1=158(y1), r2=417(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 158
LDI r2, 417
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
