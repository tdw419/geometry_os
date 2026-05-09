; DESCRIPTION: Draws a magenta rectangle at (67, 34) with width 63 and height 47.
; PLAN: r0=67(x), r1=34(y), r2=63(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 34
LDI r2, 63
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
