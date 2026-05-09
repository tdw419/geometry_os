; DESCRIPTION: Renders a purple line between points (14, 174) and (19, 159).
; PLAN: r0=14(x1), r1=174(y1), r2=19(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 174
LDI r2, 19
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
