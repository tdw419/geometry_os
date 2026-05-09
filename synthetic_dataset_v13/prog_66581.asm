; DESCRIPTION: Renders a purple line between points (245, 238) and (311, 4).
; PLAN: r0=245(x1), r1=238(y1), r2=311(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 238
LDI r2, 311
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
