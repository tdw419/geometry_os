; DESCRIPTION: Renders a purple line between points (466, 191) and (149, 78).
; PLAN: r0=466(x1), r1=191(y1), r2=149(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 191
LDI r2, 149
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
