; DESCRIPTION: Places a purple line segment connecting (35, 136) to (352, 122).
; PLAN: r0=35(x1), r1=136(y1), r2=352(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 136
LDI r2, 352
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
