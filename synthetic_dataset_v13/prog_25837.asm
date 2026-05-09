; DESCRIPTION: Draws a purple line from (341, 86) to (137, 241).
; PLAN: r0=341(x1), r1=86(y1), r2=137(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 86
LDI r2, 137
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
