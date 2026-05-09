; DESCRIPTION: Draws a purple rectangle at (101, 27) with width 84 and height 79.
; PLAN: r0=101(x), r1=27(y), r2=84(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 27
LDI r2, 84
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
