; DESCRIPTION: Draws a magenta rectangle at (233, 39) with width 114 and height 72.
; PLAN: r0=233(x), r1=39(y), r2=114(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 39
LDI r2, 114
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
