; DESCRIPTION: Places a purple line segment connecting (37, 255) to (476, 253).
; PLAN: r0=37(x1), r1=255(y1), r2=476(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 255
LDI r2, 476
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
