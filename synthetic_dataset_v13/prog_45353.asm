; DESCRIPTION: Draws a magenta rectangle at (108, 127) with width 69 and height 113.
; PLAN: r0=108(x), r1=127(y), r2=69(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 127
LDI r2, 69
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
