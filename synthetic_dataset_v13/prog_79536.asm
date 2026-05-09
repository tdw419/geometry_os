; DESCRIPTION: Draws a purple rectangle at (310, 64) with width 38 and height 30.
; PLAN: r0=310(x), r1=64(y), r2=38(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 64
LDI r2, 38
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
