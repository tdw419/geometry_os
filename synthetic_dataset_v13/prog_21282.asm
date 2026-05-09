; DESCRIPTION: Renders a purple line between points (198, 43) and (312, 52).
; PLAN: r0=198(x1), r1=43(y1), r2=312(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 43
LDI r2, 312
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
