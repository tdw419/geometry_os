; DESCRIPTION: Draws a magenta rectangle at (299, 28) with width 22 and height 49.
; PLAN: r0=299(x), r1=28(y), r2=22(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 28
LDI r2, 22
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
