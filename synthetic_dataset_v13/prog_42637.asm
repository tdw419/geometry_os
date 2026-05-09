; DESCRIPTION: Renders a purple line between points (441, 203) and (462, 4).
; PLAN: r0=441(x1), r1=203(y1), r2=462(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 203
LDI r2, 462
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
