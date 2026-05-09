; DESCRIPTION: Renders a purple line between points (118, 68) and (498, 168).
; PLAN: r0=118(x1), r1=68(y1), r2=498(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 68
LDI r2, 498
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
