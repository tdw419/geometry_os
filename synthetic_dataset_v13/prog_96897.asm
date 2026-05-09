; DESCRIPTION: Draws a magenta rectangle at (252, 39) with width 53 and height 99.
; PLAN: r0=252(x), r1=39(y), r2=53(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 39
LDI r2, 53
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
