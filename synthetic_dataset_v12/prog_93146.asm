; DESCRIPTION: Renders a purple line between points (22, 241) and (467, 184).
; PLAN: r0=22(x1), r1=241(y1), r2=467(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 241
LDI r2, 467
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
