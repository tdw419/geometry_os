; DESCRIPTION: Renders a purple line between points (67, 96) and (97, 148).
; PLAN: r0=67(x1), r1=96(y1), r2=97(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 96
LDI r2, 97
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
