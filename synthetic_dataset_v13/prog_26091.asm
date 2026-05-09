; DESCRIPTION: Renders a purple line between points (203, 56) and (390, 43).
; PLAN: r0=203(x1), r1=56(y1), r2=390(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 56
LDI r2, 390
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
