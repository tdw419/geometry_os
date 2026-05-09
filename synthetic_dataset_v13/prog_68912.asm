; DESCRIPTION: Draws a purple rectangle at (183, 56) with width 47 and height 18.
; PLAN: r0=183(x), r1=56(y), r2=47(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 56
LDI r2, 47
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
