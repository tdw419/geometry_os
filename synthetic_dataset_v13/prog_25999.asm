; DESCRIPTION: Renders a purple line between points (249, 106) and (222, 63).
; PLAN: r0=249(x1), r1=106(y1), r2=222(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 106
LDI r2, 222
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
