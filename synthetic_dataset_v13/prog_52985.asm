; DESCRIPTION: Draws a purple line from (385, 22) to (497, 160).
; PLAN: r0=385(x1), r1=22(y1), r2=497(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 22
LDI r2, 497
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
