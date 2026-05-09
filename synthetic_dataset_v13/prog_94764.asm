; DESCRIPTION: Renders a purple line between points (363, 180) and (511, 17).
; PLAN: r0=363(x1), r1=180(y1), r2=511(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 180
LDI r2, 511
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
