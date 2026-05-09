; DESCRIPTION: Renders a purple line between points (141, 86) and (461, 253).
; PLAN: r0=141(x1), r1=86(y1), r2=461(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 86
LDI r2, 461
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
