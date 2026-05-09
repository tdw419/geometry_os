; DESCRIPTION: Renders a purple line between points (414, 98) and (311, 64).
; PLAN: r0=414(x1), r1=98(y1), r2=311(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 98
LDI r2, 311
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
