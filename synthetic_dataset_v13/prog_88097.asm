; DESCRIPTION: Draws a purple line from (62, 132) to (375, 31).
; PLAN: r0=62(x1), r1=132(y1), r2=375(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 132
LDI r2, 375
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
