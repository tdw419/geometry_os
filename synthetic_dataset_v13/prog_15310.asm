; DESCRIPTION: Draws a orange line from (230, 49) to (144, 17).
; PLAN: r0=230(x1), r1=49(y1), r2=144(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 49
LDI r2, 144
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
