; DESCRIPTION: Draws a magenta rectangle at (449, 24) with width 43 and height 53.
; PLAN: r0=449(x), r1=24(y), r2=43(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 24
LDI r2, 43
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
