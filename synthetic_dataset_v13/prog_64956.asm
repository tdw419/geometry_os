; DESCRIPTION: Draws a purple line from (352, 193) to (310, 122).
; PLAN: r0=352(x1), r1=193(y1), r2=310(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 193
LDI r2, 310
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
