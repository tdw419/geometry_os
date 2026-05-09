; DESCRIPTION: Places a purple line segment connecting (436, 234) to (155, 191).
; PLAN: r0=436(x1), r1=234(y1), r2=155(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 234
LDI r2, 155
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
