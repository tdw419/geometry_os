; DESCRIPTION: Draws a purple rectangle at (324, 63) with width 117 and height 100.
; PLAN: r0=324(x), r1=63(y), r2=117(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 63
LDI r2, 117
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
