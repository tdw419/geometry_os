; DESCRIPTION: Renders a purple line between points (397, 184) and (67, 135).
; PLAN: r0=397(x1), r1=184(y1), r2=67(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 184
LDI r2, 67
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
