; DESCRIPTION: Renders a purple line between points (361, 75) and (337, 148).
; PLAN: r0=361(x1), r1=75(y1), r2=337(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 75
LDI r2, 337
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
