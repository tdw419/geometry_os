; DESCRIPTION: Draws a magenta rectangle at (334, 72) with width 57 and height 88.
; PLAN: r0=334(x), r1=72(y), r2=57(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 72
LDI r2, 57
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
