; DESCRIPTION: Draws a purple line from (278, 39) to (459, 182).
; PLAN: r0=278(x1), r1=39(y1), r2=459(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 39
LDI r2, 459
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
