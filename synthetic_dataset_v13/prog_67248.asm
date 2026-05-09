; DESCRIPTION: Renders a purple line between points (181, 19) and (222, 43).
; PLAN: r0=181(x1), r1=19(y1), r2=222(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 19
LDI r2, 222
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
