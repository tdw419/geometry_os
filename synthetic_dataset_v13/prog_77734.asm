; DESCRIPTION: Renders a purple line between points (462, 44) and (67, 232).
; PLAN: r0=462(x1), r1=44(y1), r2=67(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 44
LDI r2, 67
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
