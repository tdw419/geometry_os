; DESCRIPTION: Renders a purple line between points (109, 150) and (311, 35).
; PLAN: r0=109(x1), r1=150(y1), r2=311(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 150
LDI r2, 311
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
