; DESCRIPTION: Renders a purple line between points (227, 233) and (497, 80).
; PLAN: r0=227(x1), r1=233(y1), r2=497(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 233
LDI r2, 497
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
