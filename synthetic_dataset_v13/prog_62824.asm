; DESCRIPTION: Places a purple line segment connecting (492, 219) to (497, 79).
; PLAN: r0=492(x1), r1=219(y1), r2=497(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 219
LDI r2, 497
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
