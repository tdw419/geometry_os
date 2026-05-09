; DESCRIPTION: Renders a purple line between points (373, 88) and (67, 210).
; PLAN: r0=373(x1), r1=88(y1), r2=67(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 88
LDI r2, 67
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
