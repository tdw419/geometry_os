; DESCRIPTION: Places a purple line segment connecting (310, 232) to (261, 61).
; PLAN: r0=310(x1), r1=232(y1), r2=261(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 232
LDI r2, 261
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
