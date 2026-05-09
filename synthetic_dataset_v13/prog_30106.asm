; DESCRIPTION: Draws a blue line from (195, 97) to (219, 97).
; PLAN: r0=195(x1), r1=97(y1), r2=219(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 97
LDI r2, 219
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
