; DESCRIPTION: Draws a purple line from (301, 175) to (341, 232).
; PLAN: r0=301(x1), r1=175(y1), r2=341(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 175
LDI r2, 341
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
