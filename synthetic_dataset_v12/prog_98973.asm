; DESCRIPTION: Draws a purple rectangle at (310, 111) with width 96 and height 86.
; PLAN: r0=310(x), r1=111(y), r2=96(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 111
LDI r2, 96
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
