; DESCRIPTION: Renders a purple line between points (100, 54) and (385, 248).
; PLAN: r0=100(x1), r1=54(y1), r2=385(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 54
LDI r2, 385
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
