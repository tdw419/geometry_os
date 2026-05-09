; DESCRIPTION: Draws a purple line from (98, 88) to (136, 128).
; PLAN: r0=98(x1), r1=88(y1), r2=136(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 88
LDI r2, 136
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
