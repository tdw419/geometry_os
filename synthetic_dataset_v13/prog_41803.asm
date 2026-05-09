; DESCRIPTION: Renders a purple line between points (420, 188) and (476, 203).
; PLAN: r0=420(x1), r1=188(y1), r2=476(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 188
LDI r2, 476
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
