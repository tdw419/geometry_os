; DESCRIPTION: Renders a purple line between points (62, 146) and (78, 179).
; PLAN: r0=62(x1), r1=146(y1), r2=78(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 146
LDI r2, 78
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
