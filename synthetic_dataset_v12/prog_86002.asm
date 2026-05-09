; DESCRIPTION: Draws a purple line from (219, 10) to (418, 98).
; PLAN: r0=219(x1), r1=10(y1), r2=418(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 10
LDI r2, 418
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
