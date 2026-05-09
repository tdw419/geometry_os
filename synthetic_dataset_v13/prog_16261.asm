; DESCRIPTION: Draws a purple line from (63, 155) to (331, 159).
; PLAN: r0=63(x1), r1=155(y1), r2=331(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 155
LDI r2, 331
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
