; DESCRIPTION: Draws a purple rectangle at (384, 49) with width 114 and height 99.
; PLAN: r0=384(x), r1=49(y), r2=114(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 49
LDI r2, 114
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
