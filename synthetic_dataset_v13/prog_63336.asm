; DESCRIPTION: Draws a purple line from (127, 224) to (376, 96).
; PLAN: r0=127(x1), r1=224(y1), r2=376(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 224
LDI r2, 376
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
