; DESCRIPTION: Places a purple line segment connecting (60, 194) to (246, 155).
; PLAN: r0=60(x1), r1=194(y1), r2=246(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 194
LDI r2, 246
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
