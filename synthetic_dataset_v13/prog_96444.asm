; DESCRIPTION: Renders a purple line between points (250, 43) and (67, 140).
; PLAN: r0=250(x1), r1=43(y1), r2=67(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 43
LDI r2, 67
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
