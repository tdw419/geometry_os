; DESCRIPTION: Draws a purple line from (316, 149) to (145, 255).
; PLAN: r0=316(x1), r1=149(y1), r2=145(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 149
LDI r2, 145
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
