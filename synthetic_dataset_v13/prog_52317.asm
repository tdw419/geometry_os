; DESCRIPTION: Draws a magenta rectangle at (184, 21) with width 53 and height 33.
; PLAN: r0=184(x), r1=21(y), r2=53(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 21
LDI r2, 53
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
