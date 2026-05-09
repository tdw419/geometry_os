; DESCRIPTION: Renders a purple line between points (372, 67) and (478, 56).
; PLAN: r0=372(x1), r1=67(y1), r2=478(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 67
LDI r2, 478
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
