; DESCRIPTION: Draws a purple line from (19, 222) to (268, 25).
; PLAN: r0=19(x1), r1=222(y1), r2=268(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 222
LDI r2, 268
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
