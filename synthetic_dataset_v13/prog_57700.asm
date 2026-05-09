; DESCRIPTION: Draws a magenta rectangle at (134, 178) with width 113 and height 33.
; PLAN: r0=134(x), r1=178(y), r2=113(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 178
LDI r2, 113
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
