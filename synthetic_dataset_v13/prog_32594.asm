; DESCRIPTION: Renders a purple line between points (426, 145) and (337, 93).
; PLAN: r0=426(x1), r1=145(y1), r2=337(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 145
LDI r2, 337
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
