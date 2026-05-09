; DESCRIPTION: Draws a purple line from (418, 63) to (41, 222).
; PLAN: r0=418(x1), r1=63(y1), r2=41(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 63
LDI r2, 41
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
