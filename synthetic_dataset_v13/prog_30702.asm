; DESCRIPTION: Draws a purple rectangle at (291, 39) with width 28 and height 93.
; PLAN: r0=291(x), r1=39(y), r2=28(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 39
LDI r2, 28
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
