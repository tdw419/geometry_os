; DESCRIPTION: Draws a purple line from (54, 32) to (110, 9).
; PLAN: r0=54(x1), r1=32(y1), r2=110(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 32
LDI r2, 110
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
