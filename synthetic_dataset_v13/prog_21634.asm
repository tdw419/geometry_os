; DESCRIPTION: Renders a purple line between points (67, 88) and (481, 225).
; PLAN: r0=67(x1), r1=88(y1), r2=481(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 88
LDI r2, 481
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
