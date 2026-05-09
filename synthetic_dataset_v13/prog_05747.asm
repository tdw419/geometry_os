; DESCRIPTION: Renders a purple line between points (432, 183) and (409, 165).
; PLAN: r0=432(x1), r1=183(y1), r2=409(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 183
LDI r2, 409
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
