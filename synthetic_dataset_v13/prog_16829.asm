; DESCRIPTION: Draws a purple rectangle at (323, 7) with width 79 and height 114.
; PLAN: r0=323(x), r1=7(y), r2=79(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 7
LDI r2, 79
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
