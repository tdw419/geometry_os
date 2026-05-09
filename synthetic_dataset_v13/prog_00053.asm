; DESCRIPTION: Draws a magenta rectangle at (74, 43) with width 53 and height 14.
; PLAN: r0=74(x), r1=43(y), r2=53(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 43
LDI r2, 53
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
