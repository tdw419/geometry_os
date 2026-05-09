; DESCRIPTION: Renders a purple line between points (274, 117) and (179, 36).
; PLAN: r0=274(x1), r1=117(y1), r2=179(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 117
LDI r2, 179
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
