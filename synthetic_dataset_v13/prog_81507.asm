; DESCRIPTION: Renders a purple line between points (11, 230) and (11, 94).
; PLAN: r0=11(x1), r1=230(y1), r2=11(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 230
LDI r2, 11
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
