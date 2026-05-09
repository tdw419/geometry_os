; DESCRIPTION: Draws a purple rectangle at (372, 49) with width 39 and height 24.
; PLAN: r0=372(x), r1=49(y), r2=39(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 49
LDI r2, 39
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
