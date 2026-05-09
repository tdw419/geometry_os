; DESCRIPTION: Places a purple line segment connecting (232, 222) to (184, 237).
; PLAN: r0=232(x1), r1=222(y1), r2=184(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 222
LDI r2, 184
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
