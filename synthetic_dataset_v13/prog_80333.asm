; DESCRIPTION: Draws a purple rectangle at (183, 64) with width 28 and height 75.
; PLAN: r0=183(x), r1=64(y), r2=28(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 64
LDI r2, 28
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
