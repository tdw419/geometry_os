; DESCRIPTION: Renders a purple line between points (194, 56) and (90, 180).
; PLAN: r0=194(x1), r1=56(y1), r2=90(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 56
LDI r2, 90
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
