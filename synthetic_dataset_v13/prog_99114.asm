; DESCRIPTION: Draws a magenta rectangle at (389, 76) with width 95 and height 113.
; PLAN: r0=389(x), r1=76(y), r2=95(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 76
LDI r2, 95
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
