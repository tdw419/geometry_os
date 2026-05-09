; DESCRIPTION: Draws a blue line from (325, 26) to (219, 203).
; PLAN: r0=325(x1), r1=26(y1), r2=219(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 26
LDI r2, 219
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
