; DESCRIPTION: Draws a purple line from (492, 81) to (10, 176).
; PLAN: r0=492(x1), r1=81(y1), r2=10(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 81
LDI r2, 10
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
