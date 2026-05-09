; DESCRIPTION: Renders a purple line between points (226, 4) and (325, 157).
; PLAN: r0=226(x1), r1=4(y1), r2=325(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 4
LDI r2, 325
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
