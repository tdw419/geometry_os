; DESCRIPTION: Renders a purple line between points (158, 126) and (457, 31).
; PLAN: r0=158(x1), r1=126(y1), r2=457(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 126
LDI r2, 457
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
