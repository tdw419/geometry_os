; DESCRIPTION: Draws a purple line from (14, 29) to (195, 49).
; PLAN: r0=14(x1), r1=29(y1), r2=195(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 29
LDI r2, 195
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
