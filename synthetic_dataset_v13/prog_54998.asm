; DESCRIPTION: Renders a purple line between points (385, 112) and (203, 240).
; PLAN: r0=385(x1), r1=112(y1), r2=203(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 112
LDI r2, 203
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
