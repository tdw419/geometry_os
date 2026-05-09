; DESCRIPTION: Renders a purple line between points (340, 155) and (26, 36).
; PLAN: r0=340(x1), r1=155(y1), r2=26(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 155
LDI r2, 26
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
