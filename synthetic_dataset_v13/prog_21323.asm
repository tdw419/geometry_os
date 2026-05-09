; DESCRIPTION: Renders a purple line between points (337, 35) and (332, 218).
; PLAN: r0=337(x1), r1=35(y1), r2=332(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 35
LDI r2, 332
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
