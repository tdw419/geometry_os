; DESCRIPTION: Renders a purple line between points (269, 158) and (467, 196).
; PLAN: r0=269(x1), r1=158(y1), r2=467(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 158
LDI r2, 467
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
