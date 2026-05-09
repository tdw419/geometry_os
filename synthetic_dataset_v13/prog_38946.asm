; DESCRIPTION: Renders a purple line between points (482, 44) and (282, 155).
; PLAN: r0=482(x1), r1=44(y1), r2=282(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 44
LDI r2, 282
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
