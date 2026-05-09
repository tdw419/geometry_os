; DESCRIPTION: Renders a purple line between points (324, 19) and (499, 105).
; PLAN: r0=324(x1), r1=19(y1), r2=499(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 19
LDI r2, 499
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
