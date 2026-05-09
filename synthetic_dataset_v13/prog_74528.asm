; DESCRIPTION: Draws a magenta rectangle at (244, 39) with width 56 and height 92.
; PLAN: r0=244(x), r1=39(y), r2=56(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 39
LDI r2, 56
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
