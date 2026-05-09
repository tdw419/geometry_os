; DESCRIPTION: Draws a magenta rectangle at (108, 67) with width 23 and height 84.
; PLAN: r0=108(x), r1=67(y), r2=23(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 67
LDI r2, 23
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
