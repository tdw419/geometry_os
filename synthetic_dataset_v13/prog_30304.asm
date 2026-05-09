; DESCRIPTION: Draws a purple line from (18, 207) to (384, 155).
; PLAN: r0=18(x1), r1=207(y1), r2=384(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 207
LDI r2, 384
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
