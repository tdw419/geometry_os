; DESCRIPTION: Renders a purple line between points (64, 117) and (155, 123).
; PLAN: r0=64(x1), r1=117(y1), r2=155(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 117
LDI r2, 155
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
