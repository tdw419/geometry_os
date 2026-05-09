; DESCRIPTION: Draws a purple line from (332, 29) to (472, 178).
; PLAN: r0=332(x1), r1=29(y1), r2=472(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 29
LDI r2, 472
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
