; DESCRIPTION: Places a purple line segment connecting (236, 15) to (289, 122).
; PLAN: r0=236(x1), r1=15(y1), r2=289(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 15
LDI r2, 289
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
