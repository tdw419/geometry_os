; DESCRIPTION: Draws a purple line from (110, 181) to (239, 74).
; PLAN: r0=110(x1), r1=181(y1), r2=239(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 181
LDI r2, 239
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
