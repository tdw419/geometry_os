; DESCRIPTION: Renders a purple line between points (252, 252) and (227, 232).
; PLAN: r0=252(x1), r1=252(y1), r2=227(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 252
LDI r2, 227
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
