; DESCRIPTION: Draws a purple line from (421, 111) to (312, 175).
; PLAN: r0=421(x1), r1=111(y1), r2=312(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 111
LDI r2, 312
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
