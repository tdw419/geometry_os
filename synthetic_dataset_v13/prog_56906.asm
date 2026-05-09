; DESCRIPTION: Renders a purple line between points (146, 26) and (35, 218).
; PLAN: r0=146(x1), r1=26(y1), r2=35(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 26
LDI r2, 35
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
