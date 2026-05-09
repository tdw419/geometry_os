; DESCRIPTION: Draws a magenta rectangle at (299, 161) with width 39 and height 67.
; PLAN: r0=299(x), r1=161(y), r2=39(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 161
LDI r2, 39
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
