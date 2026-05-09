; DESCRIPTION: Places a purple line segment connecting (122, 233) to (54, 230).
; PLAN: r0=122(x1), r1=233(y1), r2=54(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 233
LDI r2, 54
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
