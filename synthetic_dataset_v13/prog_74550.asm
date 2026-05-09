; DESCRIPTION: Renders a purple line between points (246, 64) and (397, 135).
; PLAN: r0=246(x1), r1=64(y1), r2=397(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 64
LDI r2, 397
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
