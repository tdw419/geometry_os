; DESCRIPTION: Draws a purple line from (336, 37) to (427, 93).
; PLAN: r0=336(x1), r1=37(y1), r2=427(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 37
LDI r2, 427
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
