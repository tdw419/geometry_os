; DESCRIPTION: Draws a magenta rectangle at (334, 16) with width 67 and height 78.
; PLAN: r0=334(x), r1=16(y), r2=67(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 16
LDI r2, 67
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
