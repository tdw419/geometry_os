; DESCRIPTION: Draws a magenta rectangle at (239, 181) with width 76 and height 56.
; PLAN: r0=239(x), r1=181(y), r2=76(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 181
LDI r2, 76
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
