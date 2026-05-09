; DESCRIPTION: Renders a purple line between points (490, 0) and (230, 159).
; PLAN: r0=490(x1), r1=0(y1), r2=230(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 0
LDI r2, 230
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
