; DESCRIPTION: Draws a magenta rectangle at (326, 100) with width 34 and height 28.
; PLAN: r0=326(x), r1=100(y), r2=34(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 100
LDI r2, 34
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
