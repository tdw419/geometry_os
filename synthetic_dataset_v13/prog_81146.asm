; DESCRIPTION: Renders a purple line between points (203, 203) and (506, 124).
; PLAN: r0=203(x1), r1=203(y1), r2=506(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 203
LDI r2, 506
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
