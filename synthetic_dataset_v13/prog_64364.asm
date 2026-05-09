; DESCRIPTION: Places a purple line segment connecting (81, 72) to (107, 255).
; PLAN: r0=81(x1), r1=72(y1), r2=107(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 72
LDI r2, 107
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
