; DESCRIPTION: Renders a purple line between points (363, 17) and (47, 105).
; PLAN: r0=363(x1), r1=17(y1), r2=47(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 17
LDI r2, 47
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
