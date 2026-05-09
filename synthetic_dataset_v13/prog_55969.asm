; DESCRIPTION: Renders a purple line between points (230, 23) and (145, 17).
; PLAN: r0=230(x1), r1=23(y1), r2=145(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 23
LDI r2, 145
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
