; DESCRIPTION: Draws a purple line from (63, 219) to (306, 88).
; PLAN: r0=63(x1), r1=219(y1), r2=306(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 219
LDI r2, 306
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
