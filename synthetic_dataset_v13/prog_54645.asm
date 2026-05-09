; DESCRIPTION: Draws a purple rectangle at (121, 17) with width 93 and height 62.
; PLAN: r0=121(x), r1=17(y), r2=93(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 17
LDI r2, 93
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
