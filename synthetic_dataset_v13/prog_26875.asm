; DESCRIPTION: Draws a magenta rectangle at (100, 27) with width 78 and height 69.
; PLAN: r0=100(x), r1=27(y), r2=78(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 27
LDI r2, 78
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
