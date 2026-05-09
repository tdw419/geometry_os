; DESCRIPTION: Renders a purple line between points (110, 233) and (112, 240).
; PLAN: r0=110(x1), r1=233(y1), r2=112(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 233
LDI r2, 112
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
