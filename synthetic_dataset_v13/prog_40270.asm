; DESCRIPTION: Renders a purple line between points (409, 54) and (49, 112).
; PLAN: r0=409(x1), r1=54(y1), r2=49(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 54
LDI r2, 49
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
