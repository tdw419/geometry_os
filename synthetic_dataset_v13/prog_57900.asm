; DESCRIPTION: Places a purple line segment connecting (184, 96) to (353, 4).
; PLAN: r0=184(x1), r1=96(y1), r2=353(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 96
LDI r2, 353
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
