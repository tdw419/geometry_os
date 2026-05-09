; DESCRIPTION: Renders a purple line between points (484, 223) and (444, 248).
; PLAN: r0=484(x1), r1=223(y1), r2=444(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 223
LDI r2, 444
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
