; DESCRIPTION: Renders a purple line between points (77, 175) and (466, 149).
; PLAN: r0=77(x1), r1=175(y1), r2=466(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 175
LDI r2, 466
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
