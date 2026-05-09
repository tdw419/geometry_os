; DESCRIPTION: Draws a purple line from (256, 52) to (484, 47).
; PLAN: r0=256(x1), r1=52(y1), r2=484(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 52
LDI r2, 484
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
