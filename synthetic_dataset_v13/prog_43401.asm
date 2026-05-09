; DESCRIPTION: Draws a purple line from (475, 250) to (278, 122).
; PLAN: r0=475(x1), r1=250(y1), r2=278(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 250
LDI r2, 278
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
