; DESCRIPTION: Draws a magenta rectangle at (122, 53) with width 57 and height 101.
; PLAN: r0=122(x), r1=53(y), r2=57(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 53
LDI r2, 57
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
