; DESCRIPTION: Draws a purple line from (325, 122) to (86, 237).
; PLAN: r0=325(x1), r1=122(y1), r2=86(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 122
LDI r2, 86
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
