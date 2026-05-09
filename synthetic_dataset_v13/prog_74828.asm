; DESCRIPTION: Places a purple line segment connecting (275, 19) to (358, 232).
; PLAN: r0=275(x1), r1=19(y1), r2=358(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 19
LDI r2, 358
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
