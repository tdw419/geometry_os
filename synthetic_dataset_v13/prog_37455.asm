; DESCRIPTION: Draws a purple line from (110, 101) to (128, 17).
; PLAN: r0=110(x1), r1=101(y1), r2=128(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 101
LDI r2, 128
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
