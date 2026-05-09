; DESCRIPTION: Draws a purple line from (43, 66) to (452, 129).
; PLAN: r0=43(x1), r1=66(y1), r2=452(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 66
LDI r2, 452
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
