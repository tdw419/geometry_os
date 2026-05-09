; DESCRIPTION: Renders a purple line between points (121, 67) and (331, 130).
; PLAN: r0=121(x1), r1=67(y1), r2=331(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 67
LDI r2, 331
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
