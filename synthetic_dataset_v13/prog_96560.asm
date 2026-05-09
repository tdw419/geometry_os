; DESCRIPTION: Draws a magenta rectangle at (28, 111) with width 113 and height 66.
; PLAN: r0=28(x), r1=111(y), r2=113(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 111
LDI r2, 113
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
