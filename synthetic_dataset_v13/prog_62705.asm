; DESCRIPTION: Renders a purple line between points (61, 96) and (227, 241).
; PLAN: r0=61(x1), r1=96(y1), r2=227(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 96
LDI r2, 227
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
