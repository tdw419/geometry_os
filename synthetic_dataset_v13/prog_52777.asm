; DESCRIPTION: Draws a purple line from (283, 72) to (163, 122).
; PLAN: r0=283(x1), r1=72(y1), r2=163(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 72
LDI r2, 163
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
