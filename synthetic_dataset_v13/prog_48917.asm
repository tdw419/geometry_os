; DESCRIPTION: Draws a purple line from (184, 181) to (182, 170).
; PLAN: r0=184(x1), r1=181(y1), r2=182(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 181
LDI r2, 182
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
