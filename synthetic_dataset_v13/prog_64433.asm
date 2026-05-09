; DESCRIPTION: Draws a magenta rectangle at (336, 183) with width 30 and height 53.
; PLAN: r0=336(x), r1=183(y), r2=30(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 183
LDI r2, 30
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
