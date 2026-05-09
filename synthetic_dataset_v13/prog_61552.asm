; DESCRIPTION: Places a purple line segment connecting (478, 246) to (236, 255).
; PLAN: r0=478(x1), r1=246(y1), r2=236(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 246
LDI r2, 236
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
